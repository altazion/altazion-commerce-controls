using System;
using System.Linq;
using System.Collections.Generic;
using System.ComponentModel;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CPointSoftware.Equihira.Business.Catalogue.Data;
using CPointSoftware.Equihira.Business.ECommerce.Data;
using System.Globalization;
using CPointSoftware.Framework.Errors;
using System.Text.RegularExpressions;
using CPointSoftware.ECommerce.Tools;


namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec le libellé du produit
    /// </summary>
    /// <remarks>
    /// <para>Le controle s'affiche sous la forme d'un span: 
    /// <code>&lt;span&gt;[Le libellé du produit]&lt;span&gt;</code></para>
    /// <para>Si vous avez activé RDFa, le span sera modifié
    /// pour ajouter une attribut itemprop="name".</para></remarks>
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ProduitLibelle runat=server></{0}:ProduitLibelle>")]
    public class ProduitLibelle : Label, IEquihiraBindable
    {
        /// <summary>
        /// Construteur du type
        /// </summary>
        public ProduitLibelle()
        {
            MaxLength = int.MaxValue;
        }


        /// <summary>
        /// Taille maximale (en caractères) affichée
        /// </summary>
        /// <remarks><para>Si le libellé dépasse cette taille, il sera tronqué et 
        /// terminé par ....</para>
        /// <para>Valeur par défaut : pas de limite</para></remarks>
        public int MaxLength { get; set; }


        /// <summary>
        /// Effectue le binding sur l'objet de donnée
        /// </summary>
        /// <param name="o"></param>
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
            if (o is PromotionsLotsRepeater.ProduitLotRepeaterItemData)
            {
                PromotionsLotsRepeater.ProduitLotRepeaterItemData res = o as PromotionsLotsRepeater.ProduitLotRepeaterItemData;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.ArticleLot;
                BindTo(r);
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = (o as VueArticlesWebDS.ecommerce_articles_webRow);
                if (r.arw_libelle.Length > MaxLength)
                {
                    string t = r.arw_libelle.Substring(0, MaxLength);
                    t += "...";
                    this.Text = t;
                }
                else
                    this.Text = r.arw_libelle;
            }

            if (ProductPanel.FindParentRDFa(this).GetValueOrDefault())
                this.Attributes.Add("itemprop", "name");
        }

    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit :
    /// affiche la valeur du premier attribut différentiant dans le
    /// cadre de l'affichage de versions
    /// </summary>
    /// <remarks>
    /// <para>Le controle s'affiche sous la forme d'un span: 
    /// <code>&lt;span&gt;[Le valeur de l'attribut différentiant]&lt;span&gt;</code></para>
    public class ProduitInstanceDifferentiant1 : Label, IEquihiraBindable
    {

        /// <summary>
        /// Constructeur par défaut
        /// </summary>
        public ProduitInstanceDifferentiant1()
        {
            MaxLength = int.MaxValue;
        }


        /// <summary>
        /// Taille maximale (en caractères) affichée
        /// </summary>
        /// <remarks><para>Si le libellé dépasse cette taille, il sera tronqué et 
        /// terminé par ....</para>
        /// <para>Valeur par défaut : pas de limite</para></remarks>
        public int MaxLength { get; set; }


        /// <summary>
        /// Effectue le databinding sur l'objet de données
        /// </summary>
        /// <param name="o"></param>
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
                if (!r.Table.Columns.Contains("dif1_valeur_texte"))
                {
                    this.Visible = false;
                    return;
                }
                if (r.IsNull("dif1_valeur_texte"))
                {
                    this.Visible = false;
                    return;
                }

                string value = r["dif1_valeur_texte"] as string;
                if (value.Length > MaxLength)
                {
                    string t = value.Substring(0, MaxLength);
                    t += "...";
                    this.Text = t;
                }
                else
                    this.Text = value;
            }
        }

    }


    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec le code EAN13 principal du produit
    /// </summary>
    /// <remarks>
    /// <para>Le controle s'affiche sous la forme d'un span: 
    /// <code>&lt;span&gt;[La référence EAN13]&lt;span&gt;</code></para>
    /// <para>Si vous avez activé RDFa, le span sera modifié
    /// pour ajouter une attribut itemprop="gtin13".</para></remarks>
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ProduitEan13 runat=server></{0}:ProduitLibelle>")]
    public class ProduitEan13 : Label, IEquihiraBindable
    {

        /// <summary>
        /// Constructeur par défaut
        /// </summary>
        public ProduitEan13()
        {
            Format = "{0}";
        }

        /// <summary>
        /// Format d'affichage de l'EAN, sous la forme {0}
        /// </summary>
        public string Format { get; set; }


        /// <summary>
        /// Effectue le binding sur l'objet de données
        /// </summary>
        /// <param name="o"></param>
        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                if (res.References != null)
                {
                    var ean13 = (from z in res.References.catalog_articles_references
                                 where z.rar_type.Equals("EAN13") && z.rar_est_principal
                                 select z).FirstOrDefault();
                    if (ean13 != null)
                        this.Text = string.Format(Format, ean13.rar_reference);
                }
            }
            else if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                //this.Visible = false;
            }

            if (ProductPanel.FindParentRDFa(this).GetValueOrDefault())
                this.Attributes.Add("itemprop", "gtin13");
        }

    }



    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec la référence du produit
    /// </summary>
    /// <remarks>
    /// <para>Le controle s'affiche sous la forme d'un span: 
    /// <code>&lt;span&gt;[La ref du produit]&lt;span&gt;</code></para>
    /// <para>Si vous avez activé RDFa, le span sera modifié
    /// pour ajouter une attribut itemprop="identifier" et un content="mnp:[La ref}".</para></remarks>    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ProduitReference runat=server></{0}:ProduitReference>")]
    public class ProduitReference : Label, IEquihiraBindable
    {
        /// <summary>
        /// Effectue le databinding
        /// </summary>
        /// <param name="o"></param>
        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.Article.ecommerce_articles_web[0];
                this.Text = r.art_ref;
            }
            if (o is PromotionsLotsRepeater.ProduitLotRepeaterItemData)
            {
                PromotionsLotsRepeater.ProduitLotRepeaterItemData res = o as PromotionsLotsRepeater.ProduitLotRepeaterItemData;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.ArticleLot;
                this.Text = r.art_ref;
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = (o as VueArticlesWebDS.ecommerce_articles_webRow);
                this.Text = r.art_ref;
            }

            if (ProductPanel.FindParentRDFa(this).GetValueOrDefault() && !string.IsNullOrEmpty(this.Text))
            {
                this.Attributes.Add("itemprop", "identifier");
                this.Attributes.Add("content", "mnp:" + this.Text);
            }

        }

    }



    public class ProduitPreparationSpecifiquePanel : Panel
    {
        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                if (res.Logistique == null || res.Logistique.logistique_articles_specificites.Count == 0)
                    this.Visible = false;
                else
                {
                    var r = res.Logistique.logistique_articles_specificites[0];
                    if (!r.Islog_type_prepaNull())
                    {
                        this.Visible = false;
                    }
                    else
                    {
                        var tsds = ECommerceServer.DataCache.TypesPreparation;

                        var tpr = (from z in tsds.params_types_preparation
                                   where z.tpr_code.Equals(r.log_type_prepa)
                                   select z).FirstOrDefault();
                        if (tpr == null || tpr.tpr_est_interne)
                        {
                            this.Visible = false;
                        }
                        else
                        {
                            this.Visible = true;
                        }
                    }
                }
            }
        }
    }

    public class ProduitPreparationInternePanel : Panel
    {
        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                if (res.Logistique == null || res.Logistique.logistique_articles_specificites.Count == 0)
                    this.Visible = false;
                else
                {
                    var r = res.Logistique.logistique_articles_specificites[0];
                    if (!r.Islog_type_prepaNull())
                    {
                        this.Visible = true;
                    }
                    else
                    {
                        var tsds = ECommerceServer.DataCache.TypesPreparation;

                        var tpr = (from z in tsds.params_types_preparation
                                   where z.tpr_code.Equals(r.log_type_prepa)
                                   select z).FirstOrDefault();
                        if (tpr == null || tpr.tpr_est_interne)
                        {
                            this.Visible = true;
                        }
                        else
                        {
                            this.Visible = false;
                        }
                    }
                }
            }
        }
    }


    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec la référence du produit
    /// </summary>
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ProduitReference runat=server></{0}:ProduitReference>")]
    public class ProduitPreparationLibelle : Label, IEquihiraBindable
    {
        public bool UtiliserTypeCommeCssClass { get; set; }
        public string PrefixeCssClass { get; set; }

        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                if (res.Logistique == null || res.Logistique.logistique_articles_specificites.Count == 0)
                    this.Visible = false;
                else
                {
                    var r = res.Logistique.logistique_articles_specificites[0];
                    if (!r.Islog_type_prepaNull())
                    {
                        var tsds = ECommerceServer.DataCache.TypesPreparation;

                        var tpr = (from z in tsds.params_types_preparation
                                   where z.tpr_code.Equals(r.log_type_prepa)
                                   select z).FirstOrDefault();
                        if (tpr == null || tpr.Istpr_libelle_publicNull())
                            this.Visible = false;
                        else
                        {

                            string pay = ECommerceServer.Panier.AdresseLivraisonCodePays;

                            string lib = "";
                            lib = tpr.Istpr_libelle_publicNull() ? "" : tpr.tpr_libelle_public;

                            if (!string.IsNullOrEmpty(lib))
                            {
                                if (lib.Contains("{date:"))
                                    lib = lib.Replace("{date:", "{0:");
                                if (lib.Contains("{0:"))
                                    lib = lib = string.Format(lib, CPointSoftware.Equihira.Business.Logistique.ExpeditionsBll.CalculerLivraisonPrevuPrepaExterne(tpr.tpr_rjs_id, tpr, pay, DateTime.Now));
                                this.Text = lib;
                            }
                            else
                                this.Visible = false;
                        }


                        if (UtiliserTypeCommeCssClass)
                        {
                            string cls = this.CssClass;
                            if (!string.IsNullOrEmpty(cls))
                                cls += $" {PrefixeCssClass}{r.log_type_prepa}";
                            else
                                cls = $"{PrefixeCssClass}{r.log_type_prepa}";
                            cls = cls.Replace($"{PrefixeCssClass}{r.log_type_prepa} {PrefixeCssClass}{r.log_type_prepa}", $"{PrefixeCssClass}{r.log_type_prepa}");
                            this.CssClass = cls;
                        }
                    }
                }
            }
        }
    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec le segment principal du produit
    /// </summary>
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ProduitSegment runat=server></{0}:ProduitSegment>")]
    public class ProduitSegment : Label, IEquihiraBindable
    {


        public int NiveauSegmentation { get; set; }

        void TryUseBinder()
        {
            object o = DataBinder.GetDataItem(this.NamingContainer);
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
                BindTo(r);
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = (o as VueArticlesWebDS.ecommerce_articles_webRow);
                if (r.Isarw_seg_pk_principaleNull())
                    this.Visible = false;
                else
                {
                    SegmentationWebDS ds = ECommerceServer.DataCache.Segmentation;
                    SegmentationWebDS.ecommerce_segmentationRow rS = ds.ecommerce_segmentation.FindByseg_pk(r.arw_seg_pk_principale);
                    if (rS == null)
                        this.Visible = false;
                    else
                    {
                        if (NiveauSegmentation > 0 && rS.seg_level > NiveauSegmentation)
                        {
                            switch (NiveauSegmentation)
                            {
                                case 1:
                                    rS = ds.ecommerce_segmentation.FindByseg_pk(rS.level_1_seg_pk);
                                    break;
                                case 2:
                                    rS = ds.ecommerce_segmentation.FindByseg_pk(rS.level_2_seg_pk);
                                    break;
                                case 3:
                                    rS = ds.ecommerce_segmentation.FindByseg_pk(rS.level_3_seg_pk);
                                    break;
                            }
                        }

                        if (rS == null)
                            this.Visible = false;
                        else
                            this.Text = rS.seg_libelle;
                    }
                }
            }
        }

    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec la marque du produit
    /// </summary>
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ProduitMarque runat=server></{0}:ProduitMarque>")]
    public class ProduitMarque : Label, IEquihiraBindable
    {


        void IEquihiraBindable.BindTo(object o)
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
                    this.Text = r2.mar_libelle;
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
                        this.Text = r2.mar_libelle;

                }
                else
                    this.Text = "";
            }

            if (ProductPanel.FindParentRDFa(this).GetValueOrDefault())
                this.Attributes.Add("itemprop", "brand");

        }


    }

    public class ProduitAttributRepeater : Repeater, IEquihiraBindable
    {
        internal class ProduitAttributRepeaterItemData
        {
            public string Nom { get; set; }
            public string Valeur { get; set; }
            public string ValeurKind { get; set; }
        }

        void IEquihiraBindable.BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                List<ProduitAttributRepeaterItemData> atts = new List<ProduitAttributRepeaterItemData>();
                var dsAttr = ECommerceServer.DataCache.Attributs;
                if (res.Attributs != null)
                {
                    foreach (var rat in res.Attributs.catalog_articles_attributs)
                    {
                        var rDef = dsAttr.catalog_attributsdefinitions.FindByatd_pk(rat.att_atd_pk);
                        if (rDef == null) continue;
                        if (!rDef.atd_est_publique) continue;
                        var newAtt = new ProduitAttributRepeaterItemData()
                        {
                            Nom = rDef.atd_libelle,
                            ValeurKind = "attr-type-" + rDef.atd_type,
                        };
                        if (!rat.Isatt_valeur_texteNull())
                            newAtt.Valeur = rat.att_valeur_texte;
                        else if (!rat.Isatt_valeur_texte_longNull())
                            newAtt.Valeur = rat.att_valeur_texte_long;
                        else if (!rat.Isatt_valeur_numNull())
                            newAtt.Valeur = rat.att_valeur_num.ToString("0.00");
                        else
                            continue;

                        atts.Add(newAtt);
                    }
                }
                atts.Sort((a, b) => a.Nom.CompareTo(b.Nom));
                this.DataSource = atts;
                this.DataBind();
            }
        }
    }
    public class ProduitAttributRepeaterItemField : Label
    {
        public enum ProduitAttributRepeaterItemFieldKind
        {
            Nom, Valeur
        }

        public ProduitAttributRepeaterItemFieldKind DataKind { get; set; }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            ProduitAttributRepeater.ProduitAttributRepeaterItemData val = this.GetBoundObject() as ProduitAttributRepeater.ProduitAttributRepeaterItemData;
            if (val == null)
                return;
            if (this.CssClass == null)
                this.CssClass = val.ValeurKind;
            else
                this.CssClass += " " + val.ValeurKind;
            switch (DataKind)
            {
                case ProduitAttributRepeaterItemFieldKind.Nom:
                    this.Text = val.Nom;
                    break;
                case ProduitAttributRepeaterItemFieldKind.Valeur:
                    this.Text = val.Valeur;
                    break;
            }
        }
    }


    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec la valeur d'un attribut personnalisé pour ce produit
    /// </summary>
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ProduitAttributValeur runat=server></{0}:ProduitAttributValeur>")]
    public class ProduitAttributValeurTexte : Label, IEquihiraBindable
    {
        public ProduitAttributValeurTexte()
        {
            this.Format = "{0}";
        }

        public Guid AttributeGuid { get; set; }
        public string Format { get; set; }
        public string TexteSiVide { get; set; }

        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                this.Text = TexteSiVide;
                foreach (ArticlesAttributsDS.catalog_articles_attributsRow r in res.Attributs.catalog_articles_attributs)
                {
                    if (r.att_atd_pk.Equals(AttributeGuid))
                    {
                        if (!r.Isatt_valeur_texteNull() && !string.IsNullOrEmpty(r.att_valeur_texte))
                            this.Text = string.Format(this.Format, r.att_valeur_texte);
                        else if (!r.Isatt_valeur_texte_longNull() && !string.IsNullOrEmpty(r.att_valeur_texte_long))
                            this.Text = string.Format(this.Format, r.att_valeur_texte_long);
                    }
                }
            }
        }
    }


    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec la valeur d'un attribut personnalisé pour ce produit
    /// </summary>
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ProduitAttributValeur runat=server></{0}:ProduitAttributValeur>")]
    public class ProduitAttributValeur : Label, IEquihiraBindable
    {
        public ProduitAttributValeur()
        {
            this.Format = "{0}";
        }

        public Guid AttributeGuid { get; set; }
        public string Format { get; set; }
        public string TexteSiVide { get; set; }

        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                this.Text = TexteSiVide;
                foreach (ArticlesAttributsDS.catalog_articles_attributsRow r in res.Attributs.catalog_articles_attributs)
                {
                    if (r.att_atd_pk.Equals(AttributeGuid))
                    {
                        if (!r.Isatt_valeur_numNull())
                            this.Text = string.Format(this.Format, r.att_valeur_num);
                        else if (!r.Isatt_valeur_dateNull())
                            this.Text = string.Format(this.Format, r.att_valeur_date);
                        else if (!r.Isatt_valeur_texteNull() && !string.IsNullOrEmpty(r.att_valeur_texte))
                            this.Text = string.Format(this.Format, r.att_valeur_texte);
                        else if (!r.Isatt_valeur_texte_longNull() && !string.IsNullOrEmpty(r.att_valeur_texte_long))
                            this.Text = string.Format(this.Format, r.att_valeur_texte_long);
                    }
                }
            }
        }
    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec la valeur d'un attribut personnalisé pour ce produit
    /// </summary>
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:ProduitAttributLiteralValeur runat=server></{0}:ProduitAttributLiteralValeur>")]
    public class ProduitAttributLiteralValeur : Literal, IEquihiraBindable
    {
        public ProduitAttributLiteralValeur()
        {
            this.Format = "{0}";
        }

        public Guid AttributeGuid { get; set; }
        public string Format { get; set; }
        public string TexteSiVide { get; set; }

        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                this.Text = TexteSiVide;
                foreach (ArticlesAttributsDS.catalog_articles_attributsRow r in res.Attributs.catalog_articles_attributs)
                {
                    if (r.att_atd_pk.Equals(AttributeGuid))
                    {
                        if (!r.Isatt_valeur_numNull())
                            this.Text = string.Format(this.Format, r.att_valeur_num);
                        else if (!r.Isatt_valeur_dateNull())
                            this.Text = string.Format(this.Format, r.att_valeur_date);
                        else if (!r.Isatt_valeur_texteNull() && !string.IsNullOrEmpty(r.att_valeur_texte))
                            this.Text = string.Format(this.Format, r.att_valeur_texte);
                        else if (!r.Isatt_valeur_texte_longNull() && !string.IsNullOrEmpty(r.att_valeur_texte_long))
                            this.Text = string.Format(this.Format, r.att_valeur_texte_long);
                    }
                }
            }
        }
    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec la valeur d'un attribut personnalisé pour ce produit
    /// </summary>
    [DefaultProperty("Template")]
    [ToolboxData("<{0}:ProduitAttributTemplate runat=server></{0}:ProduitAttributTemplate>")]
    public class ProduitAttributTemplate : WebControl, IEquihiraBindable
    {
        public ProduitAttributTemplate()
        {
            this.Template = "{0}";
        }

        public Guid AttributeGuid { get; set; }
        public string TemplateSiVide { get; set; }

        [PersistenceMode(PersistenceMode.InnerDefaultProperty)]
        public string Template { get; set; }

        private string Text { get; set; }

        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                this.Text = TemplateSiVide;
                foreach (ArticlesAttributsDS.catalog_articles_attributsRow r in res.Attributs.catalog_articles_attributs)
                {
                    if (r.att_atd_pk.Equals(AttributeGuid))
                    {
                        if (!r.Isatt_valeur_numNull())
                            this.Text = string.Format(this.Template, r.att_valeur_num);
                        else if (!r.Isatt_valeur_dateNull())
                            this.Text = string.Format(this.Template, r.att_valeur_date);
                        else if (!r.Isatt_valeur_texteNull() && !string.IsNullOrEmpty(r.att_valeur_texte))
                            this.Text = string.Format(this.Template, r.att_valeur_texte);
                        else if (!r.Isatt_valeur_texte_longNull() && !string.IsNullOrEmpty(r.att_valeur_texte_long))
                            this.Text = string.Format(this.Template, r.att_valeur_texte_long);
                    }
                }
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            writer.Write(Text);
        }
    }


    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un div
    /// avec le rendu d'un tag pour un produit. Si le tag est en html, celui-ci 
    /// est placé dans le div, sinon c'est un span avec le libellé du tag.
    /// </summary>
    public class ProduitTagsEtLabels : Panel, IEquihiraBindable
    {
        public string TagContainerCssClass
        {
            get;
            set;
        }
        #region IEquihiraBindable Membres

        public void BindTo(object o)
        {
            if (o == null)
                return;

            foreach (Control c in Controls)
            {
                if (c is IEquihiraBindable)
                    (c as IEquihiraBindable).BindTo(o);
            }


            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;

                foreach (VueArticlesTagsDS.ecommerce_articles_tags_visuRow r in res.Tags.ecommerce_articles_tags_visu)
                {
                    if (!r.Istag_htmlNull())
                    {
                        LiteralControl ctl = new LiteralControl(r.tag_html);
                        this.Controls.Add(ctl);
                    }
                    else
                    {
                        Label lbl = new Label();
                        lbl.CssClass = TagContainerCssClass;
                        lbl.Text = r.tag_libelle;
                        this.Controls.Add(lbl);
                    }

                }
            }
        }

        #endregion
    }

    /// <summary>
    /// Affiche un div si l'attribut personnalisé booléén d'un 
    /// produit est à <c>true</c>
    /// </summary>
    public class ProduitAttributBoolPanel : Panel, IEquihiraBindable
    {


        public Guid AttributeGuid { get; set; }
        public bool VisibleSiVide { get; set; }
        public bool ShowIfFalse { get; set; }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            //if (AttributeGuid.Equals(new Guid("8d305bdf-917c-40a2-82f9-7e1aa79e5bb3")))
            //    System.Diagnostics.Debugger.Break();

            this.Visible = VisibleSiVide;
        }

        public void BindTo(object o)
        {
            if (o == null)
                return;

            foreach (Control c in Controls)
            {
                if (c is IEquihiraBindable)
                    (c as IEquihiraBindable).BindTo(o);
            }

            foreach (Control c in Controls)
            {
                if (c is IEquihiraBindable)
                    (c as IEquihiraBindable).BindTo(o);
            }

            //if (AttributeGuid.Equals(new Guid("8d305bdf-917c-40a2-82f9-7e1aa79e5bb3")))
            //    System.Diagnostics.Debugger.Break();

            if (o is ArticlesDataSourceResult)
            {

                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                foreach (ArticlesAttributsDS.catalog_articles_attributsRow r in res.Attributs.catalog_articles_attributs)
                {
                    if (r.att_atd_pk.Equals(AttributeGuid))
                    {
                        if (!r.Isatt_valeur_boolNull())
                        {
                            if (ShowIfFalse)
                                this.Visible = !r.att_valeur_bool;
                            else
                                this.Visible = r.att_valeur_bool;
                        }
                        else
                            this.Visible = VisibleSiVide;
                    }
                }
            }
        }
    }

    [Obsolete("Veuillez utiliser ProduitAttributsPanel")]
    /// <summary>
    /// Affiche un div si l'attribut personnalisé d'un 
    /// produit est non null (utilisez <see cref="VisibleSiVide" /> pour inverser le comportement)
    /// </summary>
    public class ProduitAttributPanel : Panel, IEquihiraBindable
    {

        public Guid AttributeGuid { get; set; }
        public bool VisibleSiVide { get; set; }

        public void BindTo(object o)
        {
            if (o == null)
                return;

            foreach (Control c in Controls)
            {
                if (c is IEquihiraBindable)
                    (c as IEquihiraBindable).BindTo(o);
            }

            this.Visible = VisibleSiVide;

            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                foreach (ArticlesAttributsDS.catalog_articles_attributsRow r in res.Attributs.catalog_articles_attributs)
                {
                    if (r.att_atd_pk.Equals(AttributeGuid) && !
                            (r.Isatt_atv_valeurNull()
                            && r.Isatt_valeur_texteNull()
                            && r.Isatt_valeur_numNull()
                            && r.Isatt_valeur_dateNull()
                            && r.Isatt_valeur_boolNull())
                        )
                    {
                        this.Visible = !VisibleSiVide;
                    }
                }
            }
        }
    }

    /// <summary>
    /// Affiche un div si l'attribut personnalisé d'un 
    /// produit est non null (utilisez <see cref="VisibleSiVide" /> pour inverser le comportement)
    /// </summary>
    public class ProduitAttributsPanel : Panel, IEquihiraBindable
    {
        public ProduitAttributsPanel()
        {
            AttributeGuid = new Guid[0];
        }

        [TypeConverter(typeof(GuidArrayConverter))]
        public Guid[] AttributeGuid { get; set; }
        public bool VisibleSiVide { get; set; }

        public void BindTo(object o)
        {
            if (o == null)
                return;

            foreach (Control c in Controls)
            {
                if (c is IEquihiraBindable)
                    (c as IEquihiraBindable).BindTo(o);
            }

            this.Visible = VisibleSiVide;
            if (AttributeGuid == null || AttributeGuid.Length == 0)
                return;

            if (o is ArticlesDataSourceResult)
            {
                bool found = false;
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                foreach (ArticlesAttributsDS.catalog_articles_attributsRow r in res.Attributs.catalog_articles_attributs)
                {
                    foreach (var att in AttributeGuid)
                    {
                        if (r.att_atd_pk.Equals(att) && !
                                (r.Isatt_atv_valeurNull()
                                && r.Isatt_valeur_texteNull()
                                && r.Isatt_valeur_numNull()
                                && r.Isatt_valeur_dateNull()
                                && r.Isatt_valeur_boolNull()))
                        {
                            found = true;
                            break;
                        }
                    }
                }
                if (found)
                    this.Visible = !VisibleSiVide;
            }
        }
    }


    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec le prix du produit
    /// </summary>
    [ToolboxData("<{0}:ProduitPrix runat=server></{0}:ProduitPrix>")]
    public class ProduitPrix : Label, IEquihiraBindable
    {
        public bool AssocierAuMagasin { get; set; }
        private string _priceFormat = "{0}€";
        [Browsable(true)]
        public string FormatPrix
        {
            get { return _priceFormat; }
            set { _priceFormat = value; }
        }

        private bool _showWithoutVAT = false;

        [Browsable(true)]
        public bool AfficheHT
        {
            get { return _showWithoutVAT; }
            set { _showWithoutVAT = value; }
        }

        private string _priceRangeFormat = "de {0}€ à {1}€";
        [Browsable(true)]
        public string FormatGammePrix
        {
            get { return _priceRangeFormat; }
            set { _priceRangeFormat = value; }
        }

        public string FormatSiMultiTarif { get; set; }

        public string CssClassSiPromo { get; set; }

        public void BindTo(object o)
        {
            if (o == null)
                return;

            decimal? pu = null;

            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.Article.ecommerce_articles_web[0];
                BindTo(r);
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
                //r.Table.WriteXml(@"c:\logs\" + r.art_ref + ".xml");
                if (AssocierAuMagasin)
                {
                    if (!ECommerceServer.Magasins.CurrentMagasinGuid.HasValue)
                        this.Visible = false;
                    else
                        this.Text = r.Isppm_pu_ttcNull() ? "-" : string.Format(_priceFormat, r.ppm_pu_ttc);
                }
                else
                {
                    if (ECommerceServer.Animation.Promotions.EstEnPromo(r))
                    {
                        this.CssClass = CssClassSiPromo;
                        if (r.art_est_multi_tarif && !string.IsNullOrEmpty(FormatSiMultiTarif))
                        {
                            this.Text = string.Format(FormatSiMultiTarif, r.arw_pu_promo_ttc);
                        }
                        else
                        {
                            pu = r.arw_pu_promo_ttc;
                            this.Text = string.Format(_priceFormat, r.arw_pu_promo_ttc);
                        }
                    }
                    else
                    {
                        if (r.art_est_multi_tarif && !string.IsNullOrEmpty(FormatSiMultiTarif))
                        {
                            this.Text = string.Format(FormatSiMultiTarif, r.arw_pu_ttc);
                        }
                        else
                        {
                            pu = r.arw_pu_ttc;
                            this.Text = string.Format(_priceFormat, r.arw_pu_ttc);
                        }
                    }
                }
            }

            if (ProductPanel.FindParentRDFa(this).GetValueOrDefault() && pu.HasValue)
            {
                this.Attributes.Add("itemprop", "price");
                this.Attributes.Add("content", pu.Value.ToString(CultureInfo.InvariantCulture));
            }
        }
    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec le prix promo du produit
    /// </summary>
    [ToolboxData("<{0}:ProduitPrixPromo runat=server></{0}:ProduitPrixPromo>")]
    public class ProduitPrixPromo : Label, IEquihiraBindable
    {
        public bool AssocierAuMagasin { get; set; }

        private string _priceFormat = "{0}€";
        [Browsable(true)]
        public string FormatPrix
        {
            get { return _priceFormat; }
            set { _priceFormat = value; }
        }

        private bool _showWithoutVAT = false;

        [Browsable(true)]
        public bool AfficheHT
        {
            get { return _showWithoutVAT; }
            set { _showWithoutVAT = value; }
        }

        private string _priceRangeFormat = "de {0}€ à {1}€";
        [Browsable(true)]
        public string FormatGammePrix
        {
            get { return _priceRangeFormat; }
            set { _priceRangeFormat = value; }
        }

        public bool CacherSiNonPromo { get; set; }

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
            if (o is PromotionsLotsRepeater.ProduitLotRepeaterItemData)
            {
                PromotionsLotsRepeater.ProduitLotRepeaterItemData res = o as PromotionsLotsRepeater.ProduitLotRepeaterItemData;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.ArticleLot;
                BindTo(r);
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;
                if (AssocierAuMagasin)
                {
                    if (!ECommerceServer.Magasins.CurrentMagasinGuid.HasValue)
                        this.Visible = false;
                    else if (ECommerceServer.Animation.Promotions.EstEnPromo(r, true))
                    {
                        this.Text = r.Isppm_pu_ttcNull() ? "-" : string.Format(_priceFormat, r.ppm_pu_ttc);
                    }
                    else
                    {
                        if (CacherSiNonPromo)
                            this.Visible = false;
                        this.Text = r.Isppm_pu_ttcNull() ? "-" : string.Format(_priceFormat, r.ppm_pu_ttc);
                    }
                }
                else
                {
                    if (ECommerceServer.Animation.Promotions.EstEnPromo(r))
                    {
                        this.Text = string.Format(_priceFormat, r.arw_pu_promo_ttc);
                    }
                    else
                    {
                        if (CacherSiNonPromo)
                            this.Visible = false;
                        this.Text = string.Format(_priceFormat, r.arw_pu_ttc);
                    }
                }
            }
        }

    }


    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec le prix conseillé du produit
    /// </summary>
    [ToolboxData("<{0}:ProduitPrix runat=server></{0}:ProduitPrix>")]
    public class ProduitPrixConseille : Label, IEquihiraBindable
    {
        private string _priceFormat = "{0}€";
        [Browsable(true)]
        public string FormatPrix
        {
            get { return _priceFormat; }
            set { _priceFormat = value; }
        }

        public bool AfficherSiInferieurPrixVente { get; set; }

        private bool _showWithoutVAT = false;

        [Browsable(true)]
        public bool AfficheHT
        {
            get { return _showWithoutVAT; }
            set { _showWithoutVAT = value; }
        }

        private string _priceRangeFormat = "de {0}€ à {1}€";
        [Browsable(true)]
        public string FormatGammePrix
        {
            get { return _priceRangeFormat; }
            set { _priceRangeFormat = value; }
        }

        public string CssClassSiPromo { get; set; }

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
            if (o is PromotionsLotsRepeater.ProduitLotRepeaterItemData)
            {
                PromotionsLotsRepeater.ProduitLotRepeaterItemData res = o as PromotionsLotsRepeater.ProduitLotRepeaterItemData;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.ArticleLot;
                BindTo(r);
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;
                decimal prixreel = r.arw_pu_ttc;
                if (ECommerceServer.Animation.Promotions.EstEnPromo(r))
                    prixreel = r.arw_pu_promo_ttc;
                if (!r.Isart_pu_conseille_ttcNull())
                {
                    if (prixreel < r.art_pu_conseille_ttc || AfficherSiInferieurPrixVente)
                        this.Text = string.Format(_priceFormat, r.art_pu_conseille_ttc);
                    else
                        this.Text = "";
                }
                else
                    this.Text = "";
            }
        }


    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec le prix hors promo, si il y en a une en cours, du produit ou rien
    /// si le produit n'est pas en promo
    /// </summary>
    [ToolboxData("<{0}:ProduitPrixHorsPromo runat=server></{0}:ProduitPrixHorsPromo>")]
    public class ProduitPrixHorsPromo : Label, IEquihiraBindable
    {
        public bool AssocierAuMagasin { get; set; }
        private string _priceFormat = "{0}€";
        [Browsable(true)]
        public string FormatPrix
        {
            get { return _priceFormat; }
            set { _priceFormat = value; }
        }

        private bool _showWithoutVAT = false;

        [Browsable(true)]
        public bool AfficheHT
        {
            get { return _showWithoutVAT; }
            set { _showWithoutVAT = value; }
        }

        public string FormatSiMultiTarif { get; set; }



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
            if (o is PromotionsLotsRepeater.ProduitLotRepeaterItemData)
            {
                PromotionsLotsRepeater.ProduitLotRepeaterItemData res = o as PromotionsLotsRepeater.ProduitLotRepeaterItemData;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.ArticleLot;
                BindTo(r);
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;
                if (AssocierAuMagasin)
                {
                    if (!ECommerceServer.Magasins.CurrentMagasinGuid.HasValue)
                        this.Visible = false;
                    else if (ECommerceServer.Animation.Promotions.EstEnPromo(r, true))
                    {
                        this.Text = r.Isppm_pu_reference_ttcNull() ? "" : string.Format(_priceFormat, r.ppm_pu_reference_ttc);

                    }
                    else
                        this.Text = "";
                }
                else
                {
                    if (ECommerceServer.Animation.Promotions.EstEnPromo(r))
                    {
                        if (r.art_est_multi_tarif && !string.IsNullOrEmpty(FormatSiMultiTarif))
                            this.Text = FormatSiMultiTarif;
                        else
                            this.Text = string.Format(_priceFormat, r.arw_pu_ttc);

                    }
                    else
                        this.Text = "";
                }
            }
        }

    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec le valeur ou le pourcentage de la promo 
    /// </summary>
    [ToolboxData("<{0}:ProduitPrixValeurPromo runat=server></{0}:ProduitPrixValeurPromo>")]
    public class ProduitPrixValeurPromo : Label, IEquihiraBindable
    {
        public bool AssocierAuMagasin { get; set; }

        public enum TypeAffichePromo
        {
            EnValeur,
            EnPourcentage,
            EnPourcentageSiInferieurA
        }

        private string _priceFormat = "{0} € de réduction";
        [Browsable(true)]
        public string FormatPrix
        {
            get { return _priceFormat; }
            set { _priceFormat = value; }
        }

        public string FormatSiMultiTarif { get; set; }

        private string _pctFormat = "{0}% de réduction";
        [Browsable(true)]
        public string FormatPourcentage
        {
            get { return _pctFormat; }
            set { _pctFormat = value; }
        }

        private TypeAffichePromo _affichePourcentage = TypeAffichePromo.EnValeur;
        [Browsable(true)]
        public TypeAffichePromo TypeAffichage
        {
            get { return _affichePourcentage; }
            set { _affichePourcentage = value; }
        }

        private bool _showWithoutVAT = false;

        [Browsable(true)]
        public bool AfficheHT
        {
            get { return _showWithoutVAT; }
            set { _showWithoutVAT = value; }
        }

        decimal _prixMaxiPct = 10M;
        [Browsable(true)]
        public decimal PrixMaxiPourPourcentage
        {
            get { return _prixMaxiPct; }
            set { _prixMaxiPct = value; }
        }

        public bool CacherSiHorsPromo { get; set; }


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
            if (o is PromotionsLotsRepeater.ProduitLotRepeaterItemData)
            {
                PromotionsLotsRepeater.ProduitLotRepeaterItemData res = o as PromotionsLotsRepeater.ProduitLotRepeaterItemData;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.ArticleLot;
                BindTo(r);
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;
                if (AssocierAuMagasin)
                {
                    if (!ECommerceServer.Magasins.CurrentMagasinGuid.HasValue)
                        this.Visible = false;
                    else if (ECommerceServer.Animation.Promotions.EstEnPromo(r, true))
                    {

                        decimal d = 0, red = 0, pct = 0, z = 0;
                        d = r.Isppm_pu_reference_ttcNull() ? 1 : r.ppm_pu_reference_ttc;
                        if (d == 0) d = 1;
                        z = r.Isppm_pu_ttcNull() ? 1 : r.ppm_pu_ttc;
                        if (z == 0) z = 1;
                        red = (d - z);
                        pct = ((d - z) / d) * 100;
                        switch (TypeAffichage)
                        {
                            case TypeAffichePromo.EnValeur:
                                this.Text = string.Format(_priceFormat, red);
                                break;
                            case TypeAffichePromo.EnPourcentage:
                                if (pct < 1)
                                    this.Visible = false;
                                else
                                    this.Text = string.Format(_pctFormat, pct);
                                break;
                            case TypeAffichePromo.EnPourcentageSiInferieurA:
                                if (pct < 1)
                                    this.Visible = false;
                                else
                                {
                                    if (r.arw_pu_ttc > _prixMaxiPct)
                                        this.Text = string.Format(_priceFormat, red);
                                    else
                                        this.Text = string.Format(_pctFormat, pct);
                                }
                                break;
                        }
                    }
                    else
                    {
                        if (CacherSiHorsPromo) this.Visible = false;
                        else
                        {
                            if (r.art_est_multi_tarif && !string.IsNullOrEmpty(FormatSiMultiTarif))
                            {
                                this.Text = FormatSiMultiTarif;
                            }
                            else
                                this.Text = "";
                        }
                    }
                }
                else
                {
                    if (ECommerceServer.Animation.Promotions.EstEnPromo(r))
                    {
                        if (r.art_est_multi_tarif)
                        {
                            if (string.IsNullOrEmpty(FormatSiMultiTarif))
                                this.Text = "";
                            else
                                this.Text = FormatSiMultiTarif;
                        }
                        else
                        {

                            decimal d = 0, red = 0, pct = 0;
                            d = r.arw_pu_ttc;
                            red = (d - r.arw_pu_promo_ttc);
                            pct = ((d - r.arw_pu_promo_ttc) / d) * 100;
                            switch (TypeAffichage)
                            {
                                case TypeAffichePromo.EnValeur:
                                    this.Text = string.Format(_priceFormat, red);
                                    break;
                                case TypeAffichePromo.EnPourcentage:
                                    if (pct < 1)
                                        this.Visible = false;
                                    else
                                        this.Text = string.Format(_pctFormat, pct);
                                    break;
                                case TypeAffichePromo.EnPourcentageSiInferieurA:
                                    if (pct < 1)
                                        this.Visible = false;
                                    else
                                    {
                                        if (r.arw_pu_ttc > _prixMaxiPct)
                                            this.Text = string.Format(_priceFormat, red);
                                        else
                                            this.Text = string.Format(_pctFormat, pct);
                                    }
                                    break;
                            }
                        }
                    }
                    else
                    {
                        if (CacherSiHorsPromo) this.Visible = false;
                        else
                        {
                            if (r.art_est_multi_tarif && !string.IsNullOrEmpty(FormatSiMultiTarif))
                            {
                                this.Text = FormatSiMultiTarif;
                            }
                            else
                                this.Text = "";
                        }
                    }
                }
            }
        }
    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec la différence entre le prix de vente et le prix conseillé
    /// </summary>
    public class ProduitPrixValeurRemiseSurConseille : Label, IEquihiraBindable
    {
        /// <summary>
        /// Type d'affichage des promotions
        /// </summary>
        public enum TypeAffichePromo
        {
            /// <summary>
            /// Toujours affiché en valeur (ex : - 17.50€)
            /// </summary>
            EnValeur,
            /// <summary>
            /// Toujours affiché en pourcentage (ex : -20%)
            /// </summary>
            EnPourcentage,
            /// <summary>
            /// Afficher en pourcentage si le montant
            /// effectif est inférieur à <see cref="PrixMaxiPourPourcentage"/>
            /// </summary>
            EnPourcentageSiInferieurA
        }

        private string _priceFormat = "{0} € de réduction";

        /// <summary>
        /// Obtient ou définit le format d'affichage du montant, sous la forme {0:0.00}
        /// </summary>
        /// <remarks>Valeur par défaut : {0} € de réduction</remarks>
        [Browsable(true)]
        public string FormatPrix
        {
            get { return _priceFormat; }
            set { _priceFormat = value; }
        }

        private string _pctFormat = "{0}% de réduction";

        /// <summary>
        /// Obtient ou définit le format d'affichage du pourcentage, sous la forme {0:0}
        /// </summary>
        /// <remarks>Valeur par défaut : {0}% de réduction</remarks>
        [Browsable(true)]
        public string FormatPourcentage
        {
            get { return _pctFormat; }
            set { _pctFormat = value; }
        }

        private TypeAffichePromo _affichePourcentage = TypeAffichePromo.EnValeur;
        /// <summary>
        /// Obtient ou définit le format d'affichage de la promotion
        /// </summary>
        [Browsable(true)]
        public TypeAffichePromo TypeAffichage
        {
            get { return _affichePourcentage; }
            set { _affichePourcentage = value; }
        }

        private bool _showWithoutVAT = false;

        /// <summary>
        /// Obtient ou définit un booléen précisant si le montant affichés est HT
        /// </summary>
        [Browsable(true)]
        public bool AfficheHT
        {
            get { return _showWithoutVAT; }
            set { _showWithoutVAT = value; }
        }

        decimal _prixMaxiPct = 10M;
        /// <summary>
        /// Obtient ou définit le prix maximal pour un affichage en pourcentage
        /// lorsque <see cref="TypeAffichage"/> = <see cref="TypeAffichePromo.EnPourcentageSiInferieurA"/>
        /// </summary>
        [Browsable(true)]
        public decimal PrixMaxiPourPourcentage
        {
            get { return _prixMaxiPct; }
            set { _prixMaxiPct = value; }
        }

        /// <summary>
        /// Databind sur l'objet de donné
        /// </summary>
        /// <param name="o"></param>
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
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;
                if (!r.Isart_pu_conseille_ttcNull())
                {

                    decimal red = 0;
                    decimal pct = 0;
                    if (ECommerceServer.Animation.Promotions.EstEnPromo(r))
                    {
                        red = (r.art_pu_conseille_ttc - r.arw_pu_ttc);
                        pct = ((r.art_pu_conseille_ttc - r.arw_pu_ttc) / r.art_pu_conseille_ttc) * 100;
                    }
                    else
                    {
                        red = (r.art_pu_conseille_ttc - r.arw_pu_promo_ttc);
                        pct = ((r.art_pu_conseille_ttc - r.arw_pu_promo_ttc) / r.art_pu_conseille_ttc) * 100;
                    }
                    if (pct < 10)
                    {
                        this.Text = "Prix mini";
                    }
                    else
                    {
                        switch (TypeAffichage)
                        {
                            case TypeAffichePromo.EnValeur:
                                this.Text = string.Format(_priceFormat, red);
                                break;
                            case TypeAffichePromo.EnPourcentage:
                                if (pct < 1)
                                    this.Visible = false;
                                else
                                    this.Text = string.Format(_pctFormat, pct);
                                break;
                            case TypeAffichePromo.EnPourcentageSiInferieurA:
                                if (pct < 1)
                                    this.Visible = false;
                                else
                                {
                                    if (r.arw_pu_ttc > _prixMaxiPct)
                                        this.Text = string.Format(_priceFormat, red);
                                    else
                                        this.Text = string.Format(_pctFormat, pct);
                                }
                                break;
                        }
                    }
                }
                else
                    this.Text = "";
            }
        }
    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche 
    /// le descriptif du produit tel quel
    /// </summary>
    [ToolboxData("<{0}:ProduitDescriptif runat=server></{0}:ProduitDescriptif>")]
    public class ProduitDescriptif : WebControl, IEquihiraBindable
    {
        [Category("Behavior")]
        [DefaultValue("")]
        public String Data
        {
            get
            {
                object o = ViewState["Data"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (Data != value)
                {
                    ViewState["Data"] = value;
                }
            }
        }

        [Category("Behavior")]
        [DefaultValue(false)]
        public bool ForcerText { get; set; }


        [Category("Behavior")]
        [DefaultValue(int.MaxValue)]
        public int MaxLength
        {
            get
            {
                object o = ViewState["MaxLength"];
                if (o == null)
                    return int.MaxValue;
                return (int)o;
            }
            set
            {
                if (MaxLength != value)
                {
                    ViewState["MaxLength"] = value;
                }
            }
        }

        private void TryUseBinder()
        {
            object o = this.GetBoundObject();
            BindTo(o);
        }

        public void BindTo(object o)
        {
            if (o == null) return;
            if (o != null && o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.Article.ecommerce_articles_web[0];
                this.Data = r.Isarw_description_htmlNull() ? "" : r.arw_description_html;
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;
                this.Data = r.Isarw_description_htmlNull() ? "" : r.arw_description_html;
            }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            writer.Write("<DIV");
            if (!string.IsNullOrEmpty(CssClass))
                writer.WriteAttribute("class", CssClass);

            if (ProductPanel.FindParentRDFa(this).GetValueOrDefault())
                this.Attributes.Add("itemprop", "description");

            if (Style != null && Style.Count > 0)
                writer.WriteAttribute("style", Style.ToString());
            writer.Write(">");
            if (!string.IsNullOrEmpty(Data))
            {
                var pattern = @"<[^>]+>\s+(?=<)|<[^>]+>";
                var regex = new Regex(pattern);
                var m = regex.Match(Data);


                if (!m.Success || ForcerText)
                {
                    int i = MaxLength;
                    if (Data.Length > i)
                    {
                        string t = Data.Substring(0, i);
                        t += "...";
                        writer.Write(t.Replace("\n", "<br />"));
                    }
                    else
                        writer.Write(Data.Replace("\n", "<br />"));
                }
                else
                {
                    writer.Write(Data);
                }
            }

            writer.WriteEndTag("DIV");
        }
    }


    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec le montant total de toutes les taxes (sauf TVA) du produit
    /// </summary>
    [ToolboxData("<{0}:ProduitTotalTaxes runat=server></{0}:ProduitTotalTaxes>")]
    public class ProduitTotalTaxes : Label, IEquihiraBindable
    {
        private string _priceFormat = "{0}€";
        [Browsable(true)]
        public string FormatPrix
        {
            get { return _priceFormat; }
            set { _priceFormat = value; }
        }

        private bool _showWithoutVAT = false;

        [Browsable(true)]
        public bool AfficheHT
        {
            get { return _showWithoutVAT; }
            set { _showWithoutVAT = value; }
        }

        private string _priceRangeFormat = "de {0}€ à {1}€";
        [Browsable(true)]
        public string FormatGammePrix
        {
            get { return _priceRangeFormat; }
            set { _priceRangeFormat = value; }
        }

        public string CssClassSiPromo { get; set; }

        public override void DataBind()
        {
            base.DataBind();
            object o = this.GetBoundObject();
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
                decimal mnt = 0M;
                if (res.Taxes != null && res.Taxes.catalog_articles_taxes != null)
                {
                    foreach (ArticlesTaxesDS.catalog_articles_taxesRow rT in res.Taxes.catalog_articles_taxes)
                    {
                        mnt += rT.atx_montant;
                    }
                }
                this.Text = string.Format(_priceFormat, mnt);
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                this.Text = "";
            }
        }

    }

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : affiche un span
    /// avec l'une des dimensions du produit
    /// </summary>
    public class ProduitDimensions : Label, IEquihiraBindable
    {
        public enum Dimension
        {
            Largeur,
            Hauteur,
            Profondeur,
            PoidsEnKg,
            PoidsEnG
        }

        public string Format { get; set; }

        [Bindable(true), Browsable(true), Category("Appearance")]
        public Dimension DimensionAffichee { get; set; }

        public ProduitDimensions()
        {
            DimensionAffichee = Dimension.Largeur;
            Format = "{0}";
        }



        #region IEquihiraBindable Members

        public void BindTo(object o)
        {
            if (o == null) return;
            ArticlesDimensionsDS.catalog_articles_dimensionsRow r = null;

            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                if (res.Dimensions.catalog_articles_dimensions.Count == 1)
                    r = res.Dimensions.catalog_articles_dimensions[0];
                if (r != null)
                {
                    BindTo(r);
                }
            }
            else if (o is ArticlesDimensionsDS.catalog_articles_dimensionsRow)
            {
                r = o as ArticlesDimensionsDS.catalog_articles_dimensionsRow;
                switch (DimensionAffichee)
                {
                    case Dimension.Largeur:
                        this.Text = string.Format(Format, (r.Isart_largeur_netNull() ? r.art_largeur_brut : r.art_largeur_net));
                        break;
                    case Dimension.Profondeur:
                        this.Text = string.Format(Format, (r.Isart_profondeur_netNull() ? r.art_profondeur_brut : r.art_profondeur_net));
                        break;
                    case Dimension.Hauteur:
                        this.Text = string.Format(Format, (r.Isart_longueur_netNull() ? r.art_longueur_brut : r.art_longueur_net));
                        break;
                    case Dimension.PoidsEnKg:
                        this.Text = string.Format(Format, ((r.Isart_poids_netNull() ? r.art_poids_brut : r.art_poids_net) / 1000M));
                        break;
                    case Dimension.PoidsEnG:
                        this.Text = string.Format(Format, (r.Isart_poids_netNull() ? r.art_poids_brut : r.art_poids_net));
                        break;
                }
            }
        }

        #endregion
    }
}
