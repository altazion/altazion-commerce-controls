using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CPointSoftware.Equihira.Business.ECommerce;
using CPointSoftware.Equihira.Business.ECommerce.Data;
using CPointSoftware.Equihira.Common.Sys;
using CPointSoftware.Equihira.Business.Common;
using CPointSoftware.Equihira.Common;
using CPointSoftware.ECommerce.Tools;


namespace Altazion.ECommerce.Controls
{

    /// <summary>
    /// affiche un lien (pointant sur la fiche produit par défaut) avec l'image
    /// du produit
    /// </summary>
    /// <remarks>
    /// <para>Pour afficher l'image d'un produit, ce contrôle doit être dans un <see cref="ProductPanel"/>. 
    /// Il s'utilise comme ceci :</para>
    /// <para><code>
    /// &lt;ecom:ProductPanel runat="server"&gt;
    ///   &lt;ecom:ProduitImageLink runat="server" 
    ///      LinkType="Detail" ImageType="Intermediaire" /&gt;
    /// &lt;/ecom:ProductPanel&gt;
    /// </code></para>
    /// </remarks>

    [ToolboxData("<{0}:ProduitImageLink runat=server></{0}:ProduitImageLink>")]
    public class ProduitImageLink : MouseOverHyperlink, IEquihiraBindable
    {
#pragma warning disable 0618

        /// <summary>
        /// Obtient ou définit un booléen précisant si ce contrôles est destiné à 
        /// être sur une de type AMP
        /// </summary>
        public bool PourPageAmp { get; set; }

        TypeLienProduit _linkType = TypeLienProduit.Detail;

        public bool RenderAsText
        {
            get;
            set;
        }

        public bool CacherSiAucunZoom { get; set; }

        public TypeLienProduit LinkType
        {
            get { return _linkType; }
            set { _linkType = value; }
        }

        TypeProduitImage _typeImage = TypeProduitImage.Petite;

        /// <summary>
        /// Obtient ou définit le type d'image à afficher (cf. <see cref="TypeProduitImage"/>)
        /// </summary>
        public TypeProduitImage ImageType
        {
            get { return _typeImage; }
            set { _typeImage = value; }
        }

        /// <summary>
        /// Obtient ou définit l'url de l'image "vide"
        /// (affichée quand il n'y a pas d'image sur le produit)
        /// </summary>
        public string ImageUrlIfNone { get; set; }


        protected virtual string GetResourceUrl(string url)
        {
            return ECommerceServer.ResolveResourceUrl(url);
        }

        internal string _GetResourceUrl(string url)
        {
            if (Page == null)
            {
                try
                {
                    return GetResourceUrl(url);
                }
                catch
                {
                    return url;
                }
            }

            try
            {
                return GetResourceUrl(url);
            }
            catch
            {
                try
                {
                    if (!string.IsNullOrEmpty(url))
                        return Page.ResolveUrl(url);
                    return null;
                }
                catch
                {
                    return null;
                }
            }
        }



        #region IEquihiraBindable Members

        protected virtual bool IsZoomable()
        {
            return true;
        }

        public void BindTo(object o)
        {
            if (o == null)
                return;
            int sit_pk = ECommerceServer.SiteId;

            ServerConfigSection config = EConfigurationManager.GetConfig(ECommerceServer.CurrentSite);


            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.Article.ecommerce_articles_web[0];
                BindTo(r);
            }
            else if (o is PromotionsLotsRepeater.ProduitLotRepeaterItemData)
            {
                PromotionsLotsRepeater.ProduitLotRepeaterItemData res = o as PromotionsLotsRepeater.ProduitLotRepeaterItemData;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.ArticleLot;
                BindTo(r);
            }
            else if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;
                if (string.IsNullOrEmpty(ImageUrl) && !RenderAsText)
                {
                    if (config.ECommerce.DocumentBase.ProductImages.UseDocumentBase)
                    {
                        string code = config.ECommerce.DocumentBase.ProductImages.CodeForTiny;
                        switch (_typeImage)
                        {
                            case TypeProduitImage.Petite:
                                code = config.ECommerce.DocumentBase.ProductImages.CodeForSmall;
                                break;
                            case TypeProduitImage.Intermediaire:
                                code = config.ECommerce.DocumentBase.ProductImages.CodeForIntermediate;
                                break;
                            case TypeProduitImage.Tiny:
                                code = config.ECommerce.DocumentBase.ProductImages.CodeForTiny;
                                break;
                            case TypeProduitImage.Thumb:
                                code = config.ECommerce.DocumentBase.ProductImages.CodeForThumb;
                                break;
                            case TypeProduitImage.Detail:
                                code = config.ECommerce.DocumentBase.ProductImages.CodeForDetails;
                                break;
                            case TypeProduitImage.Aucune:
                                this.ImageUrl = _GetResourceUrl(this.ImageUrl);
                                break;
                        }

                        //if (string.IsNullOrEmpty(this.ImageUrl))
                        //{
                        //    this.ImageUrl = _GetResourceUrl(DocBaseHelper.(config.ECommerce.DocumentBase.ProductImages.MainDocumentType,
                        //                            r.art_guid,
                        //                            code));
                        //}

                    }
                    else
                    {

                        switch (_typeImage)
                        {
                            case TypeProduitImage.Petite:
                                this.ImageUrl = _GetResourceUrl(r.Isarw_url_img_smallNull() ? null : r.arw_url_img_small);
                                break;
                            case TypeProduitImage.Intermediaire:
                                this.ImageUrl = _GetResourceUrl(r.Isarw_url_img_intermediateNull() ? (r.Isarw_url_img_imagetteNull() ? null : r.arw_url_img_imagette) : r.arw_url_img_intermediate);
                                break;
                            case TypeProduitImage.Tiny:
                                this.ImageUrl = _GetResourceUrl(r.Isarw_url_img_tinyNull() ? null : r.arw_url_img_tiny);
                                break;
                            case TypeProduitImage.Thumb:
                                this.ImageUrl = _GetResourceUrl(r.Isarw_url_img_imagetteNull() ? null : r.arw_url_img_imagette);
                                break;
                            case TypeProduitImage.Detail:
                                this.ImageUrl = _GetResourceUrl(r.Isarw_url_img_bigNull() ? null : r.arw_url_img_big);
                                break;
                            case TypeProduitImage.Aucune:
                                this.ImageUrl = _GetResourceUrl(this.ImageUrl);
                                break;
                        }
                    }
                }

                if (string.IsNullOrEmpty(this.ImageUrl))
                    this.ImageUrl = _GetResourceUrl(ImageUrlIfNone);

                switch (LinkType)
                {
                    case TypeLienProduit.Detail:
                        string url = ECommerceServer.Contexte.GetProductPage(r.arw_sit_pk, r.art_guid, r.art_pk,
                            r.art_ref,
                            r.Isarw_url_persoNull() ? null : r.arw_url_perso,
                            (int)r.arw_seg_pk_principale);
                        if (PourPageAmp)
                            url = System.IO.Path.ChangeExtension(url, ".amp");
                        this.NavigateUrl = url;
                        break;
                    case TypeLienProduit.Image:
                        this.NavigateUrl = _GetResourceUrl(r.Isarw_url_img_bigNull() ? null : r.arw_url_img_big);
                        if (this.NavigateUrl.Equals(this.ImageUrl, StringComparison.InvariantCultureIgnoreCase))
                        {
                            if (CacherSiAucunZoom) this.Visible = false;
                        }
                        if (!IsZoomable())
                            break;
                        this.ToolTip = r.arw_libelle;
                        break;
                }

                this.ToolTip = r.arw_libelle;
                this.Text = r.arw_libelle;
            }

        }

        #endregion
    }


    /// <summary>
    /// affiche l'image du produit
    /// </summary>

    [ToolboxData("<{0}:ProduitImage runat=server></{0}:ProduitImage>")]
    public class ProduitImage : Image, IEquihiraBindable
    {
#pragma warning disable 0618

        TypeProduitImage _typeImage = TypeProduitImage.Petite;
        public TypeProduitImage ImageType
        {
            get { return _typeImage; }
            set { _typeImage = value; }
        }

        public string ImageUrlIfNone { get; set; }

        //protected override void OnPreRender(EventArgs e)
        //{
        //    if (this.Parent is ProductItemTemplate)
        //    {
        //        ProductItemTemplate p = Parent as ProductItemTemplate;
        //        ProductControl prod = p._parent;
        //        BindTo(prod);
        //    }
        //    else
        //        BindTo(ProductControl.GetBoundObject(this));

        //    base.OnPreRender(e);
        //}


        #region IEquihiraBindable Members

        protected virtual bool IsZoomable()
        {
            return true;
        }

        public void BindTo(object o)
        {
            if (o == null)
                return;
            int sit_pk = ECommerceServer.SiteId;

            ServerConfigSection config = EConfigurationManager.GetConfig(ECommerceServer.CurrentSite);


            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.Article.ecommerce_articles_web[0];
                BindTo(r);
            }
            else if (o is PromotionsLotsRepeater.ProduitLotRepeaterItemData)
            {
                PromotionsLotsRepeater.ProduitLotRepeaterItemData res = o as PromotionsLotsRepeater.ProduitLotRepeaterItemData;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.ArticleLot;
                BindTo(r);
            }
            else if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;
                if (string.IsNullOrEmpty(ImageUrl))
                {
                    if (config.ECommerce.DocumentBase.ProductImages.UseDocumentBase)
                    {
                        string code = config.ECommerce.DocumentBase.ProductImages.CodeForTiny;
                        switch (_typeImage)
                        {
                            case TypeProduitImage.Petite:
                                code = config.ECommerce.DocumentBase.ProductImages.CodeForSmall;
                                break;
                            case TypeProduitImage.Intermediaire:
                                code = config.ECommerce.DocumentBase.ProductImages.CodeForIntermediate;
                                break;
                            case TypeProduitImage.Tiny:
                                code = config.ECommerce.DocumentBase.ProductImages.CodeForTiny;
                                break;
                            case TypeProduitImage.Thumb:
                                code = config.ECommerce.DocumentBase.ProductImages.CodeForThumb;
                                break;
                            case TypeProduitImage.Detail:
                                code = config.ECommerce.DocumentBase.ProductImages.CodeForDetails;
                                break;
                            case TypeProduitImage.Aucune:
                                this.ImageUrl = ECommerceServer.ResolveResourceUrl(this.ImageUrl);
                                break;
                        }

                        //if (string.IsNullOrEmpty(this.ImageUrl))
                        //{
                        //    this.ImageUrl = _GetResourceUrl(DocBaseHelper.(config.ECommerce.DocumentBase.ProductImages.MainDocumentType,
                        //                            r.art_guid,
                        //                            code));
                        //}

                    }
                    else
                    {

                        switch (_typeImage)
                        {
                            case TypeProduitImage.Petite:
                                this.ImageUrl = ECommerceServer.ResolveResourceUrl(r.Isarw_url_img_smallNull() ? null : r.arw_url_img_small);
                                break;
                            case TypeProduitImage.Intermediaire:
                                this.ImageUrl = ECommerceServer.ResolveResourceUrl(r.Isarw_url_img_intermediateNull() ? (r.Isarw_url_img_imagetteNull() ? null : r.arw_url_img_imagette) : r.arw_url_img_intermediate);
                                break;
                            case TypeProduitImage.Tiny:
                                this.ImageUrl = ECommerceServer.ResolveResourceUrl(r.Isarw_url_img_tinyNull() ? null : r.arw_url_img_tiny);
                                break;
                            case TypeProduitImage.Thumb:
                                this.ImageUrl = ECommerceServer.ResolveResourceUrl(r.Isarw_url_img_imagetteNull() ? null : r.arw_url_img_imagette);
                                break;
                            case TypeProduitImage.Detail:
                                this.ImageUrl = ECommerceServer.ResolveResourceUrl(r.Isarw_url_img_bigNull() ? null : r.arw_url_img_big);
                                break;
                            case TypeProduitImage.Aucune:
                                this.ImageUrl = ECommerceServer.ResolveResourceUrl(this.ImageUrl);
                                break;
                        }
                    }
                }

                if (string.IsNullOrEmpty(this.ImageUrl))
                    this.ImageUrl = ECommerceServer.ResolveResourceUrl(ImageUrlIfNone);

                this.ToolTip = r.arw_libelle;
                this.AlternateText = r.arw_libelle;
            }

        }

        #endregion
    }

}
