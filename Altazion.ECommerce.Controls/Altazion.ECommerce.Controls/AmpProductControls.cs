using CPointSoftware.Equihira.Business.Catalogue.Data;
using CPointSoftware.Equihira.Business.Common;
using CPointSoftware.Equihira.Business.ECommerce.Data;
using CPointSoftware.Equihira.Common.Sys;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Controle d'affichage AMP des images produits sous
    /// forme d'un carousel
    /// </summary>

    public class AmpProductImagesCarousel : WebControl, IEquihiraBindable
    {
        /// <summary>
        /// Initialise une nouvelle instance de la classe
        /// </summary>
        public AmpProductImagesCarousel()
        {
            Interval = 3000;
        }

        ArticlesDocumentsDS _data = null;
        VueArticlesWebDS _prd = null;

        /// <summary>
        /// Obtient ou définit la classe CSS appliquée au carousel
        /// </summary>
        public int Interval { get; set; }

        /// <summary>
        /// Obtient ou définit la largeur du carousel
        /// </summary>
        public new int? Width { get; set; }

        /// <summary>
        /// Obtient ou définit la hauteur du carousel
        /// </summary>
        public new int? Height { get; set; }

        void IEquihiraBindable.BindTo(object o)
        {
            if (o == null) return;

            if (o is ArticlesDataSourceResult)
            {
                _data = (o as ArticlesDataSourceResult).ImagesSupplementaires;
                _prd = (o as ArticlesDataSourceResult).Article;
            }
        }


        /// <summary>
        /// Effectue le rendu du contrôle
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            if (_data == null)
                return;

            List<string> images = (from z in _data.catalog_articles_documents
                                   select z.doa_url_document).ToList();
            if (!_prd.ecommerce_articles_web[0].Isarw_url_img_bigNull())
                images.Insert(0, _prd.ecommerce_articles_web[0].arw_url_img_big);

            writer.Write("<amp-carousel layout='responsive' type='slides' ");
            if (Height.HasValue)
            {
                writer.Write(" height='");
                writer.Write(Height.Value.ToString("0"));
                writer.Write("'");
            }
            if (Width.HasValue)
            {
                writer.Write(" width='");
                writer.Write(Width.Value.ToString("0"));
                writer.Write("'");
            }
            if (!string.IsNullOrEmpty(CssClass))
            {
                writer.Write(" class='");
                writer.Write(CssClass.Replace("'", "-"));
                writer.Write("'");
            }

            writer.WriteLine(">");
            foreach (var i in images)
            {
                writer.Write("<amp-img src='");
                writer.Write(i);
                if (Height.HasValue)
                {
                    writer.Write("' height='");
                    writer.Write(Height.Value.ToString("0"));
                }
                if (Width.HasValue)
                {
                    writer.Write("' width='");
                    writer.Write(Width.Value.ToString("0"));
                }
                writer.WriteLine("' layout='responsive'></amp-img>");
            }
            writer.WriteLine("</amp-carousel>");

        }
    }




    /// <summary>
    /// Affiche l'image du produit dans une page AMP
    /// </summary>
    [ToolboxData("<{0}:AmpProduitImage runat=server></{0}:AmpProduitImage>")]

    public class AmpProduitImage : WebControl, IEquihiraBindable
    {
#pragma warning disable 0618

        TypeProduitImage _typeImage = TypeProduitImage.Petite;
        /// <summary>
        /// Obtient ou définit le type d'image à afficher
        /// </summary>
        public TypeProduitImage ImageType
        {
            get { return _typeImage; }
            set { _typeImage = value; }
        }
        TypeLienProduit _linkType = TypeLienProduit.Detail;
        /// <summary>
        /// Obtient ou définit le type de lien (vers la fiche produit, vers l'image grand format)
        /// </summary>
        public TypeLienProduit LinkType
        {
            get { return _linkType; }
            set { _linkType = value; }
        }

        /// <summary>
        /// Obtient ou définit la largeur de l'image
        /// </summary>
        public new int? Width { get; set; }

        /// <summary>
        /// Obtient ou définit la hauteur de l'image
        /// </summary>
        public new int? Height { get; set; }

        /// <summary>
        /// Obtient ou définit l'url de l'image "par défaut" si le produit
        /// n'a pas d'image
        /// </summary>
        public string ImageUrlIfNone { get; set; }

        /// <summary>
        /// Effectue le rendu du contrôle
        /// </summary>
        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            if (string.IsNullOrEmpty(ImageUrl))
                return;
            switch(_linkType)
            {
                case TypeLienProduit.Detail:
                    writer.Write("<a href='");
                    writer.Write(ProductUrl);
                    writer.WriteLine("'>");
                    break;
            }
            writer.Write("<amp-img src='");
            writer.Write(ImageUrl);
            if (Height.HasValue)
            {
                writer.Write("' height='");
                writer.Write(Height.Value.ToString("0"));
            }
            if (Width.HasValue)
            {
                writer.Write("' width='");
                writer.Write(Width.Value.ToString("0"));
            }
            writer.WriteLine("' layout='responsive'></amp-img>");

            switch (_linkType)
            {
                case TypeLienProduit.Detail:
                    writer.Write("</a>");
                    break;
            }

        }


        #region IEquihiraBindable Members

        private string ImageUrl;
        private string ProductUrl;


        void IEquihiraBindable.BindTo(object o)
        {
            if (o == null)
                return;
            int sit_pk = ECommerceServer.SiteId;

            ServerConfigSection config = EConfigurationManager.GetConfig(ECommerceServer.CurrentSite);


            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.Article.ecommerce_articles_web[0];
                (this as IEquihiraBindable).BindTo(r);
            }
            else if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;

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
                    }
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

                string url = ECommerceServer.Contexte.GetProductPage(r.arw_sit_pk, r.art_guid, r.art_pk,
                       r.art_ref,
                       r.Isarw_url_persoNull()?null:r.arw_url_perso,
                       (int)r.arw_seg_pk_principale);
                url = System.IO.Path.ChangeExtension(url, ".amp");
                ProductUrl = Page.ResolveUrl(url);

                if (string.IsNullOrEmpty(this.ImageUrl))
                    this.ImageUrl = ECommerceServer.ResolveResourceUrl(ImageUrlIfNone);

                this.ToolTip = r.arw_libelle;
            }

        }

        #endregion
    }
}
