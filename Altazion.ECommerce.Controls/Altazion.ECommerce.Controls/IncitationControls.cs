using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.Equihira.Business.ECommerce;
using System.ComponentModel;
using CPointSoftware.Equihira.Business.ECommerce.Data;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche un span avec le texte de l'incitation
    /// </summary>
    public class IncitationTitre : Label
    {
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            PanierProvider prv = ECommerceServer.Panier;
            IncitationAvantage inc = prv.GetIncitation();
            if (inc == null)
                this.Text = "";
            else
                this.Text = inc.Message;
        }
    }

    /// <summary>
    /// Affiche un img avec l'image associé à l'incitation
    /// </summary>
    public class IncitationImage : RewrittenImage
    {
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            PanierProvider prv = ECommerceServer.Panier;
            IncitationAvantage inc = prv.GetIncitation();

            if (inc == null)
                return;

            VueArticlesWebDS.ecommerce_articles_webRow r;
            r = ECommerceServer.DataCache.GetArticle(inc.ArticleResultatGuid);
            if (r == null)
                return;
            if (!r.Isarw_url_img_imagetteNull())
            {
                string url = r.arw_url_img_imagette;
                ImageUrl = url;
            }
        }
    }

    /// <summary>
    /// Affiche le libellé de l'article associé à l'incitation
    /// </summary>
    public class IncitationLibelle : Label
    {
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            PanierProvider prv = ECommerceServer.Panier;
            IncitationAvantage inc = prv.GetIncitation();
            if (inc == null)
                return;
            VueArticlesWebDS.ecommerce_articles_webRow r;
            r = ECommerceServer.DataCache.GetArticle(inc.ArticleResultatGuid);
            if (r == null)
                this.Text = "";
            else
                this.Text = r.arw_libelle;
        }
    }

    /// <summary>
    /// Affiche un span avec l'une des informations
    /// produit pour celui associé à l'incitation
    /// </summary>
    public class IncitationProduitField : Label
    {
        public enum ProduitField
        {
            Reference,
            Quantite,
            PrixUnitaireHt,
            PrixUnitaireTtc,
            Libelle,
            MontantHt,
            MontantTtc
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String Format
        {
            get
            {
                object o = ViewState["Format"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (Format != value)
                {
                    ViewState["Format"] = value;
                }
            }
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String TextePrixZero
        {
            get
            {
                object o = ViewState["TextePrixZero"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (TextePrixZero != value)
                {
                    ViewState["TextePrixZero"] = value;
                }
            }
        }

        [DefaultValue("")]
        public ProduitField Field
        {
            get
            {
                object o = ViewState["Field"];
                if (o == null)
                    return ProduitField.Reference;
                return (ProduitField)o;
            }
            set
            {
                if (Field != value)
                {
                    ViewState["Field"] = value;
                }
            }
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String CssClassSiPromo
        {
            get
            {
                object o = ViewState["CssClassSiPromo"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (CssClassSiPromo != value)
                {
                    ViewState["CssClassSiPromo"] = value;
                }
            }
        }


        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            PanierProvider prv = ECommerceServer.Panier;
            IncitationAvantage inc = prv.GetIncitation();
            if (inc == null)
                return;
            VueArticlesWebDS.ecommerce_articles_webRow r;
            r = ECommerceServer.DataCache.GetArticle(inc.ArticleResultatGuid);
            if (r == null)
                this.Text = "";
            else
            {
                switch (Field)
                {
                    case ProduitField.Reference:
                        this.Text = r.Isart_refNull()?"":r.art_ref;
                        break;
                    case ProduitField.Libelle:
                        this.Text = r.arw_libelle;
                        break;
                    case ProduitField.PrixUnitaireHt:
                        if (r.arw_pu_ht == 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            if (!string.IsNullOrEmpty(TextePrixZero))
                            {
                                this.Text = TextePrixZero;
                                break;
                            }

                        }
                        this.Text = string.IsNullOrEmpty(Format) ? r.arw_pu_ht.ToString("###,##0.00") : r.arw_pu_ht.ToString(Format);
                        break;
                    case ProduitField.PrixUnitaireTtc:
                        if (r.arw_pu_ttc == 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            if (!string.IsNullOrEmpty(TextePrixZero))
                            {
                                this.Text = TextePrixZero;
                                break;
                            }

                        }
                        this.Text = string.IsNullOrEmpty(Format) ? r.arw_pu_ttc.ToString("###,##0.00") : r.arw_pu_ttc.ToString(Format);
                        break;
                    case ProduitField.Quantite:
                        this.Text = string.IsNullOrEmpty(Format) ? inc.QteArticle.ToString("###,##0") : inc.QteArticle.ToString(Format);
                        break;
                    case ProduitField.MontantHt:
                        if (r.arw_pu_ht == 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            if (!string.IsNullOrEmpty(TextePrixZero))
                            {
                                this.Text = TextePrixZero;
                                break;
                            }

                        }

                        this.Text = string.IsNullOrEmpty(Format) ? (inc.QteArticle * r.arw_pu_ht).ToString("###,##0.00") : (inc.QteArticle * r.arw_pu_ht).ToString(Format);
                        break;
                    case ProduitField.MontantTtc:
                        if (r.arw_pu_ttc == 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            if (!string.IsNullOrEmpty(TextePrixZero))
                            {
                                this.Text = TextePrixZero;
                                break;
                            }

                        }
                        this.Text = string.IsNullOrEmpty(Format) ? (inc.QteArticle * r.arw_pu_ttc).ToString("###,##0.00") : (inc.QteArticle * r.arw_pu_ttc).ToString(Format);
                        break;
                }
            }
        }
    }

}
