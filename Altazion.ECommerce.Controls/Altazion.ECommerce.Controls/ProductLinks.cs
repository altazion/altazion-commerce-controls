using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CPointSoftware.Equihira.Business.ECommerce;
using CPointSoftware.Equihira.Business.ECommerce.Data;
using CPointSoftware.Equihira.Business.Catalogue.Data;
using CPointSoftware.Equihira.Business.Catalogue;
using CPointSoftware.Equihira.Extensibility;
using CPointSoftware.ECommerce.Tools;


namespace Altazion.ECommerce.Controls
{
#pragma warning disable 0618

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un lien
    /// avec le libellé du produit pointant sur la fiche produit
    /// </summary>
    [ToolboxData("<{0}:ProduitLibelleLink runat=server></{0}:ProduitLibelleLink>")]
    public class ProduitLibelleLink : ProduitLink
    {
        public ProduitLibelleLink()
        {
            MaxLength = int.MaxValue;
            Format = "{0}";
        }

        public string Format { get; set; }

        public int MaxLength { get; set; }

        //protected override void OnPreRender(EventArgs e)
        //{
        //    if (this.Parent is ProductItemTemplate)
        //    {
        //        this.Text = (this.Parent as ProductItemTemplate)._parent.Libelle;
        //    }
        //    base.OnPreRender(e);
        //}

        public override void BindTo(object o)
        {
            base.BindTo(o);

            foreach (Control c in Controls)
            {
                if (c is IEquihiraBindable)
                    (c as IEquihiraBindable).BindTo(o);
            }

            if (o == null) return;
            if (o != null && o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.Article.ecommerce_articles_web[0];
                BindTo(o);
            }
            if (o is PromotionsLotsRepeater.ProduitLotRepeaterItemData)
            {
                PromotionsLotsRepeater.ProduitLotRepeaterItemData res = o as PromotionsLotsRepeater.ProduitLotRepeaterItemData;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.ArticleLot;
                BindTo(r);
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;
                if (r.arw_libelle.Length > MaxLength)
                {
                    string t = r.arw_libelle.Substring(0, MaxLength);
                    t += "...";
                    this.Text = string.Format(Format, t);
                }
                else
                    this.Text = string.Format(Format, r.arw_libelle);
                this.ToolTip = this.Text;
            }
        }

        public override void DataBind()
        {
            object o = this.GetBoundObject();
            BindTo(o);
        }
    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un lien
    /// pointant sur la fiche produit
    /// </summary>
    [ToolboxData("<{0}:ProduitLink runat=server></{0}:ProduitLink>")]
    public class ProduitLink : HyperLink, IEquihiraBindable
    {
        public bool PourPageAmp { get; set; }

        TypeLienProduit _linkType = TypeLienProduit.Detail;

        public TypeLienProduit LinkType
        {
            get { return _linkType; }
            set { _linkType = value; }
        }

        protected override void OnPreRender(EventArgs e)
        {
            if (!string.IsNullOrEmpty(ImageUrl))
                ImageUrl = ResolveUrl(ImageUrl);

            //if (this.Parent is ProductItemTemplate)
            //    BindTo((Parent as ProductItemTemplate)._parent);
            //else
            //    BindTo(ProductControl.GetBoundObject(this));

            base.OnPreRender(e);
        }

        #region IEquihiraBindable Members

        public virtual void BindTo(object o)
        {
            if (o == null) return;

            foreach (Control c in Controls)
            {
                if (c is IEquihiraBindable)
                    (c as IEquihiraBindable).BindTo(o);
            }

            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.Article.ecommerce_articles_web[0];
                string url = ECommerceServer.Contexte.GetProductPage(r.arw_sit_pk, r.art_guid, r.art_pk,
                        r.art_ref,
                        r.arw_url_perso,
                        (int)r.arw_seg_pk_principale);
                if (PourPageAmp)
                    url = System.IO.Path.ChangeExtension(url, ".amp");
                this.NavigateUrl = url;
                this.ToolTip = r.arw_libelle;
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;
                string url = ECommerceServer.Contexte.GetProductPage(r.arw_sit_pk, r.art_guid, r.art_pk,
                        r.art_ref,
                        r.Isarw_url_persoNull()?null:r.arw_url_perso,
                        (int)r.arw_seg_pk_principale);
                if (PourPageAmp)
                    url = System.IO.Path.ChangeExtension(url, ".amp");
                this.NavigateUrl = url;
                this.ToolTip = r.arw_libelle;
            }
        }

        #endregion
    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un lien
    /// mailto avec l'url du produit
    /// </summary>
    [ToolboxData("<{0}:ProduitLink runat=server></{0}:ProduitLink>")]
    public class ProduitMailToLink : HyperLink, IEquihiraBindable
    {
        //protected override void OnPreRender(EventArgs e)
        //{
        //    if (this.Parent is ProductItemTemplate)
        //        BindTo((Parent as ProductItemTemplate)._parent);
        //    else
        //        BindTo(ProductControl.GetBoundObject(this));

        //    base.OnPreRender(e);
        //}

        public string Content { get; set; }
        public string Subject { get; set; }

        public ProduitMailToLink()
        {
            Subject = "{arw_libelle} sur {sit_libelle}";
            Content = "Découvrez {arw_libelle} : {arw_url}";
        }

        public virtual void BindTo(object o)
        {
            if (o == null) return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.Article.ecommerce_articles_web[0];
                BindTo(r);

            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;
                string url = ECommerceServer.Contexte.GetProductPage(r.arw_sit_pk, r.art_guid, r.art_pk,
                        r.art_ref,
                        r.Isarw_url_persoNull() ? "" : r.arw_url_perso,
                        (int)r.arw_seg_pk_principale);

                StringBuilder blr = new StringBuilder();
                blr.Append(Page.Request.Url.Scheme);
                blr.Append("://");
                blr.Append(Page.Request.Url.Host);
                blr.Append(VirtualPathUtility.ToAbsolute(url));
                url = blr.ToString();

                blr = new StringBuilder();
                blr.Append("mailto:");
                blr.Append("?subject=");
                blr.Append(Prepare(Subject, r, url));
                blr.Append("&");
                blr.Append("body=");
                blr.Append(Prepare(Content, r, url));

                this.NavigateUrl = blr.ToString();
            }
        }

        private string Prepare(string data, VueArticlesWebDS.ecommerce_articles_webRow r, string url)
        {
            string str = data.Replace("\\r\\n", "\r\n");
            str = str.Replace("\r", "%0D");
            str = str.Replace("\n", "%0A");
            str = str.Replace("{arw_libelle}", r.arw_libelle);
            str = str.Replace("{arw_url}", url);
            str = str.Replace("{sit_libelle}", ECommerceServer.CurrentSite.Libelle);

            return str;
        }

    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un lien
    /// avec la marque du produit pointant sur la page de recherche correspondant
    /// à cette marque
    /// </summary>
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ProduitMarqueLink runat=server></{0}:ProduitMarqueLink>")]
    public class ProduitMarqueLink : HyperLink, IEquihiraBindable
    {
        //protected override void OnPreRender(EventArgs e)
        //{
        //    if (this.Parent is ProductItemTemplate)
        //        BindToProductControl();
        //    else
        //        TryUseBinder();

        //    base.OnPreRender(e);
        //}

        void TryUseBinder()
        {
            object o = DataBinder.GetDataItem(this);
            BindTo(o);
        }

        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.Article.ecommerce_articles_web[0];

                MarquesDS.catalog_marquesRow r2 = null;
                if (!r.Isart_mar_pkNull())
                    r2 = ECommerceServer.DataCache.Marques.catalog_marques.FindBymar_pk(r.art_mar_pk);
                if (r2 != null)
                {
                    this.Text = r2.mar_libelle;

                    if (r2.Table.Columns.Contains("mar_url_redirection") && !r2.IsNull("mar_url_redirection"))
                    {
                        this.NavigateUrl = ResolveUrl(r2["mar_url_redirection"] as string);
                    }
                    else
                        this.NavigateUrl = ECommerceServer.Contexte.GetSearchPagePath(-1, Guid.Empty, r2.mar_pk, null, null, true);
                }
                else
                    this.Text = "";
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = (o as VueArticlesWebDS.ecommerce_articles_webRow);
                this.Text = "";

                if (!r.Isart_mar_pkNull())
                {
                    MarquesDS.catalog_marquesRow r2 = ECommerceServer.DataCache.Marques.catalog_marques.FindBymar_pk(r.art_mar_pk);
                    if (r2 != null)
                    {
                        this.Text = r2.mar_libelle;
                        this.NavigateUrl = ECommerceServer.Contexte.GetSearchPagePath(-1, Guid.Empty, r2.mar_pk, null, null, true);
                    }
                }
                else
                    this.Text = "";
            }
        }

        //private void BindToProductControl()
        //{
        //    ProductItemTemplate p = Parent as ProductItemTemplate;
        //    int mar_pk = p._parent.MarqueId;
        //    MarquesDS.catalog_marquesRow r = ECommerceServer.DataCache.Marques.catalog_marques.FindBymar_pk(mar_pk);
        //    if (r != null)
        //        this.Text = r.mar_libelle;
        //}
    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un lien
    /// avec le segment du produit pointant sur la page de recherche correspondant
    /// à ce segment
    /// </summary>

    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ProduitSegmentLink runat=server></{0}:ProduitSegmentLink>")]
    public class ProduitSegmentLink : Hyperlink, IEquihiraBindable
    {
        //protected override void OnPreRender(EventArgs e)
        //{
        //    if (this.Parent is ProductItemTemplate)
        //        BindToProductControl();
        //    else
        //        TryUseBinder();

        //    base.OnPreRender(e);
        //}

        void TryUseBinder()
        {
            object o = DataBinder.GetDataItem(this);
            BindTo(o);
        }

        public string TextIfEmpty { get; set; }

        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.Article.ecommerce_articles_web[0];
                BindTo(r);
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = (o as VueArticlesWebDS.ecommerce_articles_webRow);
                this.Text = "";

                decimal seg_pk = r.arw_seg_pk_principale;
                
                SegmentationWebDS.ecommerce_segmentationRow r2 = ECommerceServer.DataCache.Segmentation.ecommerce_segmentation.FindByseg_pk(seg_pk);
                if (r2 != null)
                {
                    this.Text = r2.seg_libelle;
                    this.NavigateUrl = ECommerceServer.Contexte.GetSearchPagePath(seg_pk, Guid.Empty, -1, null, null, true);
                }
                else
                {
                    this.Text = TextIfEmpty;
                    this.NavigateUrl = ECommerceServer.Contexte.GetSearchPagePath(-1, Guid.Empty, -1, null, null, true);
                }
            }
        }

        //private void BindToProductControl()
        //{
        //    ProductItemTemplate p = Parent as ProductItemTemplate;
        //    int mar_pk = p._parent.MarqueId;
        //    MarquesDS.catalog_marquesRow r = ECommerceServer.DataCache.Marques.catalog_marques.FindBymar_pk(mar_pk);
        //    if (r != null)
        //        this.Text = r.mar_libelle;
        //}
    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un lien
    /// avec la valeur d'un attribut personnalisé du produit pointant sur 
    /// la page de recherche correspondante
    /// </summary>
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ProduitMarqueLink runat=server></{0}:ProduitMarqueLink>")]
    public class ProduitAttributLink : Hyperlink, IEquihiraBindable
    {
        //protected override void OnPreRender(EventArgs e)
        //{
        //    if (this.Parent is ProductItemTemplate)
        //        BindToProductControl();
        //    else
        //        TryUseBinder();

        //    base.OnPreRender(e);
        //}

        public Guid AttributeGuid { get; set; }
        public string Format { get; set; }

        void TryUseBinder()
        {
            object o = DataBinder.GetDataItem(this);
            BindTo(o);
        }

        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                this.Text = "";
                foreach (ArticlesAttributsDS.catalog_articles_attributsRow r in res.Attributs.catalog_articles_attributs)
                {
                    if (r.att_atd_pk.Equals(AttributeGuid))
                    {
                        AttributsValeursDS.catalog_attributsvaleursRow rAtt = null;

                        if (!r.Isatt_valeur_texteNull())
                            this.Text = r.att_valeur_texte;
                        else if (!r.Isatt_valeur_texte_longNull())
                            this.Text = r.att_valeur_texte_long;
                        else if (!r.Isatt_valeur_numNull())
                            this.Text = r.att_valeur_num.ToString(Format);
                        else if (!r.Isatt_valeur_dateNull())
                            this.Text = r.att_valeur_date.ToString(Format);
                        
                        if(!r.Isatt_atv_valeurNull())
                        {
                            rAtt = ECommerceServer.DataCache.GetAttributsValeurs(r.att_atd_pk).catalog_attributsvaleurs.FindByatv_atd_pkatv_valeur(r.att_atd_pk, r.att_atv_valeur);
                            if(rAtt!=null)
                            {
                                if (rAtt.Table.Columns.Contains("atv_url_redirection") && !rAtt.IsNull("atv_url_redirection"))
                                {
                                    this.NavigateUrl = ResolveUrl(rAtt["atv_url_redirection"] as string);
                                    return;
                                }
                            }
                        }

                        CriteresDS.catalog_criteresRow crit;
                        crit = ECommerceServer.DataCache.Criteres.catalog_criteres.FindBycri_guidcri_rjs_id(r.att_atd_pk, ECommerceServer.RjsId);

                        if (crit == null)
                        {
                            this.Visible = false;
                            return;
                        }

                        

                        foreach (CriteresDS.catalog_criteresvaleursRow v in crit.Getcatalog_criteresvaleursRows())
                        {
                            if (!r.Isatt_valeur_texteNull()
                                && v.crv_label.Equals(r.att_valeur_texte))
                            {
                                RechercheCritereValeur rec = new RechercheCritereValeur();
                                rec.CritereGuid = AttributeGuid;
                                rec.ValueText = r.Isatt_valeur_texteNull() ? "" : r.att_valeur_texte;
                                rec.ValueGuid = v.crv_guid;

                                this.NavigateUrl = ECommerceServer.Contexte.GetSearchPagePath(-1, Guid.Empty, -1, null, new RechercheCritereValeur[] 
                            {
                                rec
                            }, true);
                                break;
                            }
                        }
                    }
                }
            }
        }

        private void BindToProductControl()
        {
        }
    }
}
