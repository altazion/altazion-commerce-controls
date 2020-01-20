using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using System.Web.UI;
using System.ComponentModel;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// A utiliser dans un <see cref="PanierProduitsGrid" /> pour 
    /// afficher un td avec un libellé fixe
    /// </summary>
    public class PanierLabelField : EDataControlField
    {
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String Text
        {
            get
            {
                object o = ViewState["Text"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (Text != value)
                {
                    ViewState["Text"] = value;
                }
            }
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String CssClass
        {
            get
            {
                object o = ViewState["CssClass"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (CssClass != value)
                {
                    ViewState["CssClass"] = value;
                }
            }
        }
        protected override DataControlField CreateField()
        {
            return new PanierLabelField();
        }
        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            cell.Text = Text;
            cell.CssClass = CssClass;
        }


    }

    public class PanierProduitPanel : Panel
    {
        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);

            var prv = ECommerceServer.Panier;

            object o = this.GetBoundObject();
            if (o != null && o is ElementPanier)
            {
                var elm = o as ElementPanier;
                string cssclass = "panier-ligne-type-" + elm.TypeArticle;

                if(elm.ParentItemLigneGuid.HasValue)
                {
                    cssclass += " panier-ligne-enfant";
                    var prn = (from z in prv.Contenu where z.LigneGuid.Equals(elm.ParentItemLigneGuid) select z).FirstOrDefault();
                    if(prn!=null)
                    {
                        cssclass += " panier-ligne-enfant-pour-type" + prn.TypeArticle;
                    }


                }
                this.CssClass = cssclass;
            }
        }
    }



    /// <summary>
    /// A utiliser dans un <see cref="PanierProduitsGrid" /> pour 
    /// afficher un td avec un champ de la ligne, défini par <see cref="Field"/>
    /// </summary>
    public class PanierProduitField : EDataControlField
    {
        public enum ProduitField
        {
            Reference,
            Quantite,
            PrixUnitaire,
            PrixUnitaireHt,
            PrixUnitaireTtc,
            Libelle,
            MontantHt,
            MontantTtc,
            PrixUnitaireHtHorsPromo,
            PrixUnitaireTtcHorsPromo,
            PrixUnitaireTtcHorsRemise,
            PrixUnitaireHtHorsRemise,
            PrixUnitaireTtcEtTtcHorsPromo,
            PrixUnitaireHtEtHtHorsPromo,
            PctPromo,
            Montant,
            PrixUnitaireHorsPromo,
            PrixUnitaireHorsRemise,
            PrixUnitaireEtHorsPromo,

        }

        protected override DataControlField CreateField()
        {
            return new PanierProduitField();
        }
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String CssClass
        {
            get
            {
                object o = ViewState["CssClass"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (CssClass != value)
                {
                    ViewState["CssClass"] = value;
                }
            }
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

        [DefaultValue(1)]
        public new int ColumnSpan
        {
            get
            {
                object o = ViewState["ColumnSpan"];
                if (o == null)
                    return 1;
                return (int)o;
            }
            set
            {
                if (ColumnSpan != value)
                {
                    ViewState["ColumnSpan"] = value;
                }
            }
        }

        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);
            cell.CssClass = CssClass;
            if (cellType == DataControlCellType.DataCell)
            {
                if (this.Visible)
                {
                    if (ColumnSpan > 1)
                        cell.ColumnSpan = ColumnSpan;
                    cell.DataBinding += new EventHandler(cell_DataBinding);
                }
            }
        }

        void cell_DataBinding(object sender, EventArgs e)
        {
            if (sender is TableCell)
            {
                TableCell cell = sender as TableCell;

                object o = DataBinder.GetDataItem(cell.NamingContainer);
                if (o != null && o is ElementPanier)
                {
                    ElementPanier elm = o as ElementPanier;
                    var prv = ECommerceServer.Panier;
                    switch (Field)
                    {
                        case ProduitField.Reference:
                            cell.Text = elm.Reference;
                            break;
                        case ProduitField.Libelle:
                            cell.Text = elm.Libelle;
                            break;
                        case ProduitField.PctPromo:

                            if ((elm.PuTTCHorsPromo.HasValue && elm.PuHTHorsPromo.Value != elm.PuHT) || elm.RemiseTTC != 0)
                            {
                                if (!string.IsNullOrEmpty(CssClassSiPromo))
                                    cell.CssClass = CssClassSiPromo;

                                decimal d = elm.PuTTCHorsPromo.HasValue ? elm.PuTTCHorsPromo.Value : elm.PuHorsRemiseTTC;
                                decimal red = (d - elm.PuTTC);
                                decimal pct = ((d - elm.PuTTC) / d) * 100;

                                cell.Text = "<span>" + (string.IsNullOrEmpty(Format) ? pct.ToString("0") : pct.ToString(Format)) + "</span>";
                            }
                            break;
                        case ProduitField.PrixUnitaireHtHorsRemise:
                            if (elm.RemiseHT != 0)
                                cell.Text = string.IsNullOrEmpty(Format) ? elm.PuHorsRemiseHT.ToString("###,##0.00") : elm.PuHorsRemiseHT.ToString(Format);
                            break;
                        case ProduitField.PrixUnitaireTtcHorsRemise:
                            if (elm.RemiseTTC != 0)
                                cell.Text = string.IsNullOrEmpty(Format) ? elm.PuHorsRemiseTTC.ToString("###,##0.00") : elm.PuHorsRemiseTTC.ToString(Format);
                            break;
                        case ProduitField.PrixUnitaireHtHorsPromo:
                            if (elm.PuHTHorsPromo.HasValue && elm.PuHTHorsPromo.Value != elm.PuHT)
                            {
                                if (!string.IsNullOrEmpty(CssClassSiPromo))
                                    cell.CssClass = CssClassSiPromo;
                                cell.Text = string.IsNullOrEmpty(Format) ? elm.PuHTHorsPromo.Value.ToString("###,##0.00") : elm.PuHTHorsPromo.Value.ToString(Format);
                            }
                            break;
                        case ProduitField.PrixUnitaireTtcHorsPromo:
                            if (elm.PuTTCHorsPromo.HasValue && elm.PuTTCHorsPromo.Value != elm.PuHT)
                            {
                                if (!string.IsNullOrEmpty(CssClassSiPromo))
                                    cell.CssClass = CssClassSiPromo;
                                cell.Text = string.IsNullOrEmpty(Format) ? elm.PuTTCHorsPromo.Value.ToString("###,##0.00") : elm.PuTTCHorsPromo.Value.ToString(Format);
                            }
                            break;
                        case ProduitField.PrixUnitaireHtEtHtHorsPromo:
                            string txtHt = null;

                            if (elm.PuHT == 0)
                            {
                                if (!string.IsNullOrEmpty(CssClassSiPromo))
                                    cell.CssClass = CssClassSiPromo;
                                if (!string.IsNullOrEmpty(TextePrixZero))
                                {
                                    cell.Text = TextePrixZero;
                                }
                            }
                            else
                            {
                                if (elm.PuHTHorsPromo.HasValue && elm.PuHTHorsPromo.Value != elm.PuHT)
                                {
                                    if (!string.IsNullOrEmpty(CssClassSiPromo))
                                        cell.CssClass = CssClassSiPromo;
                                    txtHt = "<span class='orig'>";
                                    txtHt += string.IsNullOrEmpty(Format) ? elm.PuHTHorsPromo.Value.ToString("###,##0.00") : elm.PuHTHorsPromo.Value.ToString(Format);
                                    txtHt += "</span>";
                                }
                                else if (elm.RemiseHT != 0)
                                {
                                    if (!string.IsNullOrEmpty(CssClassSiPromo))
                                        cell.CssClass = CssClassSiPromo;
                                    txtHt = "<span class='orig'>";
                                    txtHt += string.IsNullOrEmpty(Format) ? elm.PuHorsRemiseHT.ToString("###,##0.00") : elm.PuHorsRemiseHT.ToString(Format);
                                    txtHt += "</span>";
                                }
                                cell.Text = txtHt + (string.IsNullOrEmpty(Format) ? elm.PuHT.ToString("###,##0.00") : elm.PuHT.ToString(Format));
                            }
                            break;

                        case ProduitField.PrixUnitaireTtcEtTtcHorsPromo:
                            string txtTtc = null;

                            if (elm.PuTTC == 0)
                            {
                                if (!string.IsNullOrEmpty(CssClassSiPromo))
                                    cell.CssClass = CssClassSiPromo;
                                if (!string.IsNullOrEmpty(TextePrixZero))
                                {
                                    cell.Text = TextePrixZero;
                                }
                            }
                            else
                            {
                                if ((elm.PuTTCHorsPromo.HasValue && elm.PuTTCHorsPromo.Value != elm.PuTTC))
                                {
                                    if (!string.IsNullOrEmpty(CssClassSiPromo))
                                        cell.CssClass = CssClassSiPromo;
                                    txtTtc = "<span class='orig'>";
                                    txtTtc += string.IsNullOrEmpty(Format) ? elm.PuTTCHorsPromo.Value.ToString("###,##0.00") : elm.PuTTCHorsPromo.Value.ToString(Format);
                                    txtTtc += "</span>";
                                }
                                else if (elm.RemiseTTC != 0)
                                {
                                    if (!string.IsNullOrEmpty(CssClassSiPromo))
                                        cell.CssClass = CssClassSiPromo;
                                    txtTtc = "<span class='orig'>";
                                    txtTtc += string.IsNullOrEmpty(Format) ? elm.PuHorsRemiseTTC.ToString("###,##0.00") : elm.PuHorsRemiseTTC.ToString(Format);
                                    txtTtc += "</span>";
                                }
                                cell.Text = txtTtc + (string.IsNullOrEmpty(Format) ? elm.PuTTC.ToString("###,##0.00") : elm.PuTTC.ToString(Format));
                            }
                            break;
                        case ProduitField.PrixUnitaire:
                            if (prv.EstEnHT)
                                goto case ProduitField.PrixUnitaireHt;
                            else
                                goto case ProduitField.PrixUnitaireTtc;
                        case ProduitField.PrixUnitaireHt:
                            if (elm.PuHT == 0)
                            {
                                if (!string.IsNullOrEmpty(CssClassSiPromo))
                                    cell.CssClass = CssClassSiPromo;
                                if (!string.IsNullOrEmpty(TextePrixZero))
                                {
                                    cell.Text = TextePrixZero;
                                    break;
                                }
                            }
                            cell.Text = string.IsNullOrEmpty(Format) ? elm.PuHT.ToString("###,##0.00") : elm.PuHT.ToString(Format);
                            break;
                        case ProduitField.PrixUnitaireTtc:
                            if (elm.PuTTC == 0)
                            {
                                if (!string.IsNullOrEmpty(CssClassSiPromo))
                                    cell.CssClass = CssClassSiPromo;
                                if (!string.IsNullOrEmpty(TextePrixZero))
                                {
                                    cell.Text = TextePrixZero;
                                    break;
                                }
                            }
                            cell.Text = string.IsNullOrEmpty(Format) ? elm.PuTTC.ToString("###,##0.00") : elm.PuTTC.ToString(Format);
                            break;
                        case ProduitField.Quantite:
                            cell.Text = string.IsNullOrEmpty(Format) ? elm.Quantite.ToString("###,##0") : elm.Quantite.ToString(Format);
                            break;
                        case ProduitField.MontantHt:
                            if (elm.MontantHT == 0)
                            {
                                if (!string.IsNullOrEmpty(CssClassSiPromo))
                                    cell.CssClass = CssClassSiPromo;
                                if (!string.IsNullOrEmpty(TextePrixZero))
                                {
                                    cell.Text = TextePrixZero;
                                    break;
                                }
                            }

                            cell.Text = string.IsNullOrEmpty(Format) ? elm.MontantHT.ToString("###,##0.00") : elm.MontantHT.ToString(Format);
                            break;

                        case ProduitField.Montant:
                            if (prv.EstEnHT)
                                goto case ProduitField.MontantHt;
                            else
                                goto case ProduitField.MontantTtc;
                        case ProduitField.MontantTtc:
                            if (elm.MontantTTC == 0)
                            {
                                if (!string.IsNullOrEmpty(CssClassSiPromo))
                                    cell.CssClass = CssClassSiPromo;
                                if (!string.IsNullOrEmpty(TextePrixZero))
                                {
                                    cell.Text = TextePrixZero;
                                    break;
                                }
                            }
                            cell.Text = string.IsNullOrEmpty(Format) ? elm.MontantTTC.ToString("###,##0.00") : elm.MontantTTC.ToString(Format);
                            break;

                        case ProduitField.PrixUnitaireHorsPromo:
                            if (prv.EstEnHT)
                                goto case ProduitField.PrixUnitaireHtHorsPromo;
                            else
                                goto case ProduitField.PrixUnitaireTtcHorsPromo;
                        case ProduitField.PrixUnitaireHorsRemise:
                            if (prv.EstEnHT)
                                goto case ProduitField.PrixUnitaireHtHorsRemise;
                            else
                                goto case ProduitField.PrixUnitaireTtcHorsRemise;
                        case ProduitField.PrixUnitaireEtHorsPromo:
                            if (prv.EstEnHT)
                                goto case ProduitField.PrixUnitaireHtEtHtHorsPromo;
                            else
                                goto case ProduitField.PrixUnitaireTtcEtTtcHorsPromo;

                    }
                }
            }
        }

    }

    /// <summary>
    /// A utiliser dans un <see cref="PanierProduitsDataList" /> pour 
    /// afficher un span avec un champ de la ligne, défini par <see cref="Field"/>
    /// </summary>

    public class PanierProduitLabel : Label
    {
        public enum ProduitField
        {
            Reference,
            Quantite,
            PrixUnitaire,
            PrixUnitaireHt,
            PrixUnitaireTtc,
            Libelle,
            MontantHt,
            MontantTtc,
            PrixUnitaireHtHorsPromo,
            PrixUnitaireTtcHorsPromo,
            PrixUnitaireTtcHorsRemise,
            PrixUnitaireHtHorsRemise,
            PrixUnitaireTtcEtTtcHorsPromo,
            PrixUnitaireHtEtHtHorsPromo,
            PctPromo,
            Montant,
            PrixUnitaireHorsPromo,
            PrixUnitaireHorsRemise,
            PrixUnitaireEtHorsPromo,
            Differentiant1,
            Differentiant2
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

        [DefaultValue(false)]
        public bool CacherSiVide { get; set; }

        public override void DataBind()
        {

            object o = this.GetBoundObject();
            if (o != null && o is ElementPanier)
            {
                ElementPanier elm = o as ElementPanier;
                var prv = ECommerceServer.Panier;

                switch (Field)
                {
                    case ProduitField.Reference:
                        this.Text = elm.Reference;
                        break;
                    case ProduitField.Libelle:
                        this.Text = elm.Libelle;
                        break;
                    case ProduitField.PrixUnitaire:
                        if (prv.EstEnHT)
                            goto case ProduitField.PrixUnitaireHt;
                        else
                            goto case ProduitField.PrixUnitaireTtc;
                    case ProduitField.PrixUnitaireHt:
                        if (elm.PuHT == 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            if (!string.IsNullOrEmpty(TextePrixZero))
                            {
                                this.Text = TextePrixZero;
                                break;
                            }
                        }
                        this.Text = string.IsNullOrEmpty(Format) ? elm.PuHT.ToString("###,##0.00") : elm.PuHT.ToString(Format);
                        break;
                    case ProduitField.PrixUnitaireTtc:
                        if (elm.PuTTC == 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            if (!string.IsNullOrEmpty(TextePrixZero))
                            {
                                this.Text = TextePrixZero;
                                break;
                            }
                        }
                        this.Text = string.IsNullOrEmpty(Format) ? elm.PuTTC.ToString("###,##0.00") : elm.PuTTC.ToString(Format);
                        break;
                    case ProduitField.Quantite:
                        this.Text = string.IsNullOrEmpty(Format) ? elm.Quantite.ToString("###,##0") : elm.Quantite.ToString(Format);
                        break;
                    case ProduitField.Montant:
                        if (prv.EstEnHT)
                            goto case ProduitField.MontantHt;
                        else
                            goto case ProduitField.MontantTtc;
                    case ProduitField.MontantHt:
                        if (elm.MontantHT == 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            if (!string.IsNullOrEmpty(TextePrixZero))
                            {
                                this.Text = TextePrixZero;
                                break;
                            }
                        }

                        this.Text = string.IsNullOrEmpty(Format) ? elm.MontantHT.ToString("###,##0.00") : elm.MontantHT.ToString(Format);
                        break;
                    case ProduitField.MontantTtc:
                        if (elm.MontantTTC == 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            if (!string.IsNullOrEmpty(TextePrixZero))
                            {
                                this.Text = TextePrixZero;
                                break;
                            }
                        }
                        this.Text = string.IsNullOrEmpty(Format) ? elm.MontantTTC.ToString("###,##0.00") : elm.MontantTTC.ToString(Format);
                        break;

                    case ProduitField.PctPromo:

                        if ((elm.PuTTCHorsPromo.HasValue && elm.PuHTHorsPromo.Value != elm.PuHT) || elm.RemiseTTC != 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;

                            decimal d = elm.PuTTCHorsPromo.HasValue ? elm.PuTTCHorsPromo.Value : elm.PuHorsRemiseTTC;
                            decimal red = (d - elm.PuTTC);
                            decimal pct = ((d - elm.PuTTC) / d) * 100;

                            this.Text = "<span>" + (string.IsNullOrEmpty(Format) ? pct.ToString("0") : pct.ToString(Format)) + "</span>";
                        }
                        break;
                    case ProduitField.PrixUnitaireHtHorsRemise:
                        if (elm.RemiseHT != 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            this.Text = string.IsNullOrEmpty(Format) ? elm.PuHorsRemiseHT.ToString("###,##0.00") : elm.PuHorsRemiseHT.ToString(Format);
                        }
                        break;
                    case ProduitField.PrixUnitaireTtcHorsRemise:
                        if (elm.RemiseTTC != 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            this.Text = string.IsNullOrEmpty(Format) ? elm.PuHorsRemiseTTC.ToString("###,##0.00") : elm.PuHorsRemiseTTC.ToString(Format);
                        }
                        break;
                    case ProduitField.PrixUnitaireHtHorsPromo:
                        if (elm.PuHTHorsPromo.HasValue && elm.PuHTHorsPromo.Value != elm.PuHT)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            this.Text = string.IsNullOrEmpty(Format) ? elm.PuHTHorsPromo.Value.ToString("###,##0.00") : elm.PuHTHorsPromo.Value.ToString(Format);
                        }
                        break;
                    case ProduitField.PrixUnitaireTtcHorsPromo:
                        if (elm.PuTTCHorsPromo.HasValue && elm.PuTTCHorsPromo.Value != elm.PuHT)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            this.Text = string.IsNullOrEmpty(Format) ? elm.PuTTCHorsPromo.Value.ToString("###,##0.00") : elm.PuTTCHorsPromo.Value.ToString(Format);
                        }
                        break;
                    case ProduitField.PrixUnitaireHtEtHtHorsPromo:
                        string txtHt = null;

                        if (elm.PuHT == 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            if (!string.IsNullOrEmpty(TextePrixZero))
                            {
                                this.Text = TextePrixZero;
                            }
                        }
                        else
                        {
                            if (elm.PuHTHorsPromo.HasValue && elm.PuHTHorsPromo.Value != elm.PuHT)
                            {
                                if (!string.IsNullOrEmpty(CssClassSiPromo))
                                    this.CssClass = CssClassSiPromo;
                                txtHt = "<span class='orig'>";
                                txtHt += string.IsNullOrEmpty(Format) ? elm.PuHTHorsPromo.Value.ToString("###,##0.00") : elm.PuHTHorsPromo.Value.ToString(Format);
                                txtHt += "</span>";
                            }
                            else if (elm.RemiseHT != 0)
                            {
                                if (!string.IsNullOrEmpty(CssClassSiPromo))
                                    this.CssClass = CssClassSiPromo;
                                txtHt = "<span class='orig'>";
                                txtHt += string.IsNullOrEmpty(Format) ? elm.PuHorsRemiseHT.ToString("###,##0.00") : elm.PuHorsRemiseHT.ToString(Format);
                                txtHt += "</span>";
                            }
                            this.Text = txtHt + (string.IsNullOrEmpty(Format) ? elm.PuHT.ToString("###,##0.00") : elm.PuHT.ToString(Format));
                        }
                        break;

                    case ProduitField.PrixUnitaireTtcEtTtcHorsPromo:
                        string txtTtc = null;

                        if (elm.PuTTC == 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            if (!string.IsNullOrEmpty(TextePrixZero))
                            {
                                this.Text = TextePrixZero;
                            }
                        }
                        else
                        {
                            if ((elm.PuTTCHorsPromo.HasValue && elm.PuTTCHorsPromo.Value != elm.PuTTC))
                            {
                                if (!string.IsNullOrEmpty(CssClassSiPromo))
                                    this.CssClass = CssClassSiPromo;
                                txtTtc = "<span class='orig'>";
                                txtTtc += string.IsNullOrEmpty(Format) ? elm.PuTTCHorsPromo.Value.ToString("###,##0.00") : elm.PuTTCHorsPromo.Value.ToString(Format);
                                txtTtc += "</span>";
                            }
                            else if (elm.RemiseTTC != 0)
                            {
                                if (!string.IsNullOrEmpty(CssClassSiPromo))
                                    this.CssClass = CssClassSiPromo;
                                txtTtc = "<span class='orig'>";
                                txtTtc += string.IsNullOrEmpty(Format) ? elm.PuHorsRemiseTTC.ToString("###,##0.00") : elm.PuHorsRemiseTTC.ToString(Format);
                                txtTtc += "</span>";
                            }
                            this.Text = txtTtc + (string.IsNullOrEmpty(Format) ? elm.PuTTC.ToString("###,##0.00") : elm.PuTTC.ToString(Format));
                        }
                        break;
                    case ProduitField.PrixUnitaireHorsPromo:
                        if (prv.EstEnHT)
                            goto case ProduitField.PrixUnitaireHtHorsPromo;
                        else
                            goto case ProduitField.PrixUnitaireTtcHorsPromo;
                    case ProduitField.PrixUnitaireHorsRemise:
                        if (prv.EstEnHT)
                            goto case ProduitField.PrixUnitaireHtHorsRemise;
                        else
                            goto case ProduitField.PrixUnitaireTtcHorsRemise;
                    case ProduitField.PrixUnitaireEtHorsPromo:
                        if (prv.EstEnHT)
                            goto case ProduitField.PrixUnitaireHtEtHtHorsPromo;
                        else
                            goto case ProduitField.PrixUnitaireTtcEtTtcHorsPromo;
                    case ProduitField.Differentiant1:
                        var dif = elm.AttributsDifferentiants;
                        if (dif != null && dif.Length > 0)
                            this.Text = dif[0];
                        else
                            this.Visible = false;
                        break;
                    case ProduitField.Differentiant2:
                        var dif2 = elm.AttributsDifferentiants;
                        if (dif2 != null && dif2.Length > 1)
                            this.Text = dif2[1];
                        else
                            this.Visible = false;
                        break;
                }
            }

            if (CacherSiVide && string.IsNullOrEmpty(Text))
                Visible = false;
        }

    }

    public class PanierProduitLink : Hyperlink
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

        public bool PourPageAmp { get; set; }

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

        public override void DataBind()
        {

            object o = this.GetBoundObject();
            if (o != null && o is ElementPanier)
            {
                ElementPanier elm = o as ElementPanier;


                var url = ECommerceServer.Contexte.GetProductPage(elm.SiteId, elm.ArticleGuid, -1, elm.Reference, null, -1);
                if (PourPageAmp)
                    url = System.IO.Path.ChangeExtension(url, ".amp");
                if (!string.IsNullOrEmpty(url))
                    this.NavigateUrl = url;

                switch (Field)
                {
                    case ProduitField.Reference:
                        this.Text = elm.Reference;
                        break;
                    case ProduitField.Libelle:
                        this.Text = elm.Libelle;
                        break;
                    case ProduitField.PrixUnitaireHt:
                        if (elm.PuHT == 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            if (!string.IsNullOrEmpty(TextePrixZero))
                            {
                                this.Text = TextePrixZero;
                                break;
                            }
                        }
                        this.Text = string.IsNullOrEmpty(Format) ? elm.PuHT.ToString("###,##0.00") : elm.PuHT.ToString(Format);
                        break;
                    case ProduitField.PrixUnitaireTtc:
                        if (elm.PuTTC == 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            if (!string.IsNullOrEmpty(TextePrixZero))
                            {
                                this.Text = TextePrixZero;
                                break;
                            }
                        }
                        this.Text = string.IsNullOrEmpty(Format) ? elm.PuTTC.ToString("###,##0.00") : elm.PuTTC.ToString(Format);
                        break;
                    case ProduitField.Quantite:
                        this.Text = string.IsNullOrEmpty(Format) ? elm.Quantite.ToString("###,##0") : elm.Quantite.ToString(Format);
                        break;
                    case ProduitField.MontantHt:
                        if (elm.MontantHT == 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            if (!string.IsNullOrEmpty(TextePrixZero))
                            {
                                this.Text = TextePrixZero;
                                break;
                            }
                        }

                        this.Text = string.IsNullOrEmpty(Format) ? elm.MontantHT.ToString("###,##0.00") : elm.MontantHT.ToString(Format);
                        break;
                    case ProduitField.MontantTtc:
                        if (elm.MontantTTC == 0)
                        {
                            if (!string.IsNullOrEmpty(CssClassSiPromo))
                                this.CssClass = CssClassSiPromo;
                            if (!string.IsNullOrEmpty(TextePrixZero))
                            {
                                this.Text = TextePrixZero;
                                break;
                            }
                        }
                        this.Text = string.IsNullOrEmpty(Format) ? elm.MontantTTC.ToString("###,##0.00") : elm.MontantTTC.ToString(Format);
                        break;
                }
            }
        }

    }


    /// <summary>
    /// A utiliser dans un <see cref="PanierProduitsGrid" /> pour 
    /// afficher un td avec l'image du produit
    /// </summary>
    public class PanierProduitImageField : EDataControlField
    {
        public enum PanierTypeImage
        {
            Tiny,
            Intermediate
        }

        public bool PourPageAmp { get; set; }

        protected override DataControlField CreateField()
        {
            return new PanierProduitImageField();
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String CssClass
        {
            get;
            set;
        }

        [Bindable(false)]
        [Category("Appearance")]
        [DefaultValue("")]
        public string ImageUrlIfNone { get; set; }


        [Bindable(false)]
        [Category("Appearance")]
        [DefaultValue("")]
        public PanierTypeImage TypeImage
        {
            get; set;
        }

        [Bindable(false)]
        [Category("Appearance")]
        [DefaultValue("")]
        public bool DoNotLink { get; set; }

        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);
            cell.CssClass = CssClass;
            if (cellType == DataControlCellType.DataCell)
            {

                if (this.Visible)
                {
                    cell.DataBinding += new EventHandler(cell_DataBinding);
                    if (!DoNotLink)
                    {
                        Hyperlink img = new Hyperlink();
                        cell.Controls.Add(img);
                    }
                    else
                    {
                        Image img = new Image();
                        cell.Controls.Add(img);
                    }
                }
            }
        }

        void cell_DataBinding(object sender, EventArgs e)
        {
            if (sender is TableCell)
            {
                TableCell cell = sender as TableCell;
                object o = DataBinder.GetDataItem(cell.NamingContainer);
                if (o != null && o is ElementPanier)
                {
                    ContexteProvider prv = ECommerceServer.Contexte;
                    ElementPanier elm = o as ElementPanier;
                    if (!DoNotLink)
                    {
                        Hyperlink c = cell.Controls[0] as Hyperlink;
                        string url = prv.GetProductPage(elm.SiteId, elm.ArticleGuid, -1, elm.Reference, null, -1);
                        if (PourPageAmp)
                            url = System.IO.Path.ChangeExtension(url, ".amp");
                        c.NavigateUrl = url;
                        c.ImageUrl = ECommerceServer.ResolveResourceUrl(FindImage(elm));
                    }
                    else
                    {
                        Image c = cell.Controls[0] as Image;
                        c.ImageUrl = ECommerceServer.ResolveResourceUrl(FindImage(elm));
                    }
                }
            }
        }

        private string FindImage(ElementPanier elm)
        {
            switch (TypeImage)
            {
                case PanierTypeImage.Tiny:
                    if (string.IsNullOrEmpty(elm.TinyImage))
                        return ImageUrlIfNone;
                    return elm.TinyImage;
                case PanierTypeImage.Intermediate:
                    if (string.IsNullOrEmpty(elm.IntermediateImage))
                        return ImageUrlIfNone;
                    return elm.IntermediateImage;
            }

            return ImageUrlIfNone;
        }

    }

    /// <summary>
    /// A utiliser dans un <see cref="PanierProduitsDataList" /> pour 
    /// afficher un lien avec l'image du produit
    /// </summary>
    public class PanierProduitImage : Hyperlink
    {
        [Bindable(false)]
        [Category("Appearance")]
        [DefaultValue("")]
        public bool DoNotLink { get; set; }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            object o = this.GetBoundObject();
            if (o != null && o is ElementPanier)
            {
                ContexteProvider prv = ECommerceServer.Contexte;
                ElementPanier elm = o as ElementPanier;

                if (!DoNotLink)
                    this.NavigateUrl = prv.GetProductPage(elm.SiteId, elm.ArticleGuid, -1, elm.Reference, null, -1);
                else
                    this.NavigateUrl = null;
                this.ImageUrl = FindImage(elm);
            }
        }

        private string FindImage(ElementPanier elm)
        {
            if (string.IsNullOrEmpty(elm.TinyImage))
                return null;
            return elm.TinyImage;
        }

    }


    /// <summary>
    /// A utiliser dans un <see cref="PanierProduitsGrid" /> pour 
    /// afficher un td avec une zone de saisie permettant la modification
    /// de la quantité
    /// </summary>
    public class PanierQuantiteModifiableField : EDataControlField
    {
        public enum ModeModification
        {
            PerteFocus,
            Lien,
            LienEtPerteFocus,
            Interval
        }

        public PanierQuantiteModifiableField()
        {
            Mode = ModeModification.PerteFocus;
        }

        public ModeModification Mode { get; set; }

        private class QteTextBox : TextBox
        {
            public Guid LigneGuid
            {
                get
                {
                    object o = ViewState["LigneGuid"];
                    if (o == null)
                        return Guid.Empty;
                    return (Guid)o;
                }
                set
                {
                    if (LigneGuid != value)
                    {
                        ViewState["LigneGuid"] = value;
                    }
                }
            }
        }
        protected override DataControlField CreateField()
        {
            return new PanierQuantiteModifiableField();
        }

        public override void ValidateSupportsCallback()
        {

        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String CssClass
        {
            get
            {
                object o = ViewState["CssClass"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (CssClass != value)
                {
                    ViewState["CssClass"] = value;
                }
            }
        }



        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String LienCssClass
        {
            get
            {
                object o = ViewState["LienCssClass"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (LienCssClass != value)
                {
                    ViewState["LienCssClass"] = value;
                }
            }
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String LienText
        {
            get
            {
                object o = ViewState["LienText"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (LienCssClass != value)
                {
                    ViewState["LienText"] = value;
                }
            }
        }


        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);
            cell.CssClass = CssClass;

            if (cellType == DataControlCellType.DataCell)
            {
                string url = System.Web.HttpContext.Current.Request.AppRelativeCurrentExecutionFilePath.ToLower();
                cell.DataBinding += new EventHandler(cell_DataBinding);
                ECommercePage pg = Control.Page as ECommercePage;
                if (pg == null || pg.WorkflowStep != WorkflowStep.Panier)
                {
                    return;
                }

                if (this.Visible)
                {
                    cell.DataBinding += new EventHandler(cell_DataBinding);
                    QteTextBox tb = new QteTextBox();
                    tb.ID = "txtQuantite";
                    Panel p;
                    switch (Mode)
                    {
                        case ModeModification.PerteFocus:
                            tb.AutoPostBack = true;
                            tb.TextChanged += new EventHandler(tb_TextChanged);
                            cell.Controls.Add(tb);
                            break;
                        case ModeModification.Lien:
                            p = new Panel();
                            p.DefaultButton = "lnkQuantiteModifier";
                            cell.Controls.Add(p);
                            p.Controls.Add(tb);
                            LinkButton btn = new LinkButton();
                            btn.CssClass = LienCssClass;
                            btn.Text = LienText;
                            btn.ID = "lnkQuantiteModifier";
                            btn.Click += new EventHandler(btn_Click);
                            p.Controls.Add(btn);
                            break;
                        case ModeModification.LienEtPerteFocus:
                            p = new Panel();
                            p.DefaultButton = "lnkQuantiteModifier";
                            cell.Controls.Add(p);
                            tb.AutoPostBack = true;
                            tb.TextChanged += new EventHandler(tb_TextChanged);
                            p.Controls.Add(tb);
                            btn = new LinkButton();
                            btn.CssClass = LienCssClass;
                            btn.Text = LienText;
                            btn.ID = "lnkQuantiteModifier";
                            btn.Click += new EventHandler(btn_Click);
                            p.Controls.Add(btn);
                            break;
                    }
                }
            }
        }

        void btn_Click(object sender, EventArgs e)
        {
            Control c = (sender as LinkButton).NamingContainer;
            QteTextBox tb = c.FindControl("txtQuantite") as QteTextBox;

            foreach (ElementPanier pn in ECommerceServer.Panier.Contenu)
            {
                if (pn.LigneGuid == tb.LigneGuid)
                {
                    int t = 1;
                    if (!int.TryParse(tb.Text, out t))
                        t = 1;
                    ECommerceServer.Panier.ModifierQuantite(pn, t, true);
                    if (this.Control is PanierProduitsGrid)
                    {
                        (this.Control as PanierProduitsGrid).OnDataUpdated();
                    }
                }
            }
        }

        void tb_TextChanged(object sender, EventArgs e)
        {
            QteTextBox tb = sender as QteTextBox;

            foreach (ElementPanier pn in ECommerceServer.Panier.Contenu)
            {
                if (pn.LigneGuid == tb.LigneGuid)
                {
                    int t = 1;
                    if (!int.TryParse(tb.Text, out t))
                        t = 1;
                    ECommerceServer.Panier.ModifierQuantite(pn, t, true);
                    if (this.Control is PanierProduitsGrid)
                    {
                        (this.Control as PanierProduitsGrid).OnDataUpdated();
                    }
                }
            }
        }

        void cell_DataBinding(object sender, EventArgs e)
        {
            //if (this.Control.Page.IsPostBack)
            //    return;

            if (sender is TableCell)
            {
                TableCell cell = sender as TableCell;
                object o = DataBinder.GetDataItem(cell.NamingContainer);
                ContexteProvider prv = ECommerceServer.Contexte;
                if (o != null && o is ElementPanier)
                {
                    ElementPanier elm = o as ElementPanier;
                    if (cell.Controls.Count < 1 || !(cell.Controls[0] is QteTextBox) && !(cell.Controls[0] is Panel))
                    {
                        cell.Text = elm.Quantite.ToString("0");
                    }
                    else
                    {
                        Control c = cell.Controls[0];
                        QteTextBox tb;
                        if (c is Panel)
                        {
                            tb = (c as Panel).Controls[0] as QteTextBox;
                        }
                        else
                        {
                            tb = c as QteTextBox;
                        }
                        if (tb != null)
                        {
                            if (elm.QuantiteFixe || elm.NonModifiable)
                            {
                                tb.ReadOnly = true;
                                if (!string.IsNullOrEmpty(tb.CssClass))
                                    tb.CssClass += " readOnly";
                                else
                                    tb.CssClass = "readOnly";
                            }
                            tb.LigneGuid = elm.LigneGuid;
                            tb.Text = elm.Quantite.ToString("0");
                        }

                    }
                }
            }
        }
    }


    /// <summary>
    /// A utiliser dans un <see cref="PanierProduitsGrid" /> pour 
    /// afficher un td avec le libelle et la référence du produit
    /// </summary>
    public class PanierProduitLibelleEtRefField : EDataControlField
    {
        protected override DataControlField CreateField()
        {
            return new PanierProduitImageField();
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String CssClass
        {
            get
            {
                object o = ViewState["CssClass"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (CssClass != value)
                {
                    ViewState["CssClass"] = value;
                }
            }
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String CssClassLibelle
        {
            get
            {
                object o = ViewState["CssClassLibelle"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (CssClassLibelle != value)
                {
                    ViewState["CssClassLibelle"] = value;
                }
            }
        }

        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String CssClassReference
        {
            get
            {
                object o = ViewState["CssClassReference"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (CssClassReference != value)
                {
                    ViewState["CssClassReference"] = value;
                }
            }
        }
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String Separateur
        {
            get
            {
                object o = ViewState["Separateur"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (Separateur != value)
                {
                    ViewState["Separateur"] = value;
                }
            }
        }

        public bool DoNotLink { get; set; }

        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);
            cell.CssClass = CssClass;
            if (cellType == DataControlCellType.DataCell)
            {
                if (this.Visible)
                {
                    cell.DataBinding += new EventHandler(cell_DataBinding);

                    if (!DoNotLink)
                    {
                        cell.Controls.Add(new Hyperlink());
                        Literal l = new Literal();
                        l.Text = Separateur;
                        cell.Controls.Add(l);
                        cell.Controls.Add(new Hyperlink());
                    }
                    else
                    {
                        cell.Controls.Add(new Label());
                        Literal l = new Literal();
                        l.Text = Separateur;
                        cell.Controls.Add(l);
                        cell.Controls.Add(new Label());
                    }
                }
            }
        }

        void cell_DataBinding(object sender, EventArgs e)
        {
            if (sender is TableCell)
            {
                TableCell cell = sender as TableCell;
                object o = DataBinder.GetDataItem(cell.NamingContainer);
                ContexteProvider prv = ECommerceServer.Contexte;
                if (o != null && o is ElementPanier)
                {
                    ElementPanier elm = o as ElementPanier;
                    string url = prv.GetProductPage(elm.SiteId, elm.ArticleGuid, -1, elm.Reference, null, -1);

                    if (!DoNotLink)
                    {
                        Hyperlink c = cell.Controls[2] as Hyperlink;
                        c.NavigateUrl = url;
                        c.Text = elm.Libelle;
                        c.CssClass = CssClassLibelle;
                        c = cell.Controls[0] as Hyperlink;
                        c.Text = elm.Reference;
                        c.NavigateUrl = url;
                        c.CssClass = CssClassReference;
                    }
                    else
                    {
                        Label c = cell.Controls[2] as Label;
                        c.Text = elm.Libelle;
                        c.CssClass = CssClassLibelle;
                        c = cell.Controls[0] as Label;
                        c.Text = elm.Reference;
                        c.CssClass = CssClassReference;
                    }
                }
            }
        }

        private string FindImage(ElementPanier elm)
        {
            if (string.IsNullOrEmpty(elm.TinyImage))
                return null;
            return elm.TinyImage;
        }

    }

    /// <summary>
    /// A utiliser dans un <see cref="PanierProduitsGrid" /> pour 
    /// afficher un td avec lien d'action
    /// </summary>
    public class PanierProduitCommandLink : EDataControlField
    {
        protected override DataControlField CreateField()
        {
            return new PanierProduitCommandLink();
        }

        public override void ValidateSupportsCallback()
        {

        }

        [UrlProperty]
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String MouseOverImageUrl
        {
            get
            {
                object o = ViewState["MouseOverImageUrl"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (MouseOverImageUrl != value)
                {
                    ViewState["MouseOverImageUrl"] = value;
                }
            }
        }

        [UrlProperty]
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String ImageUrl
        {
            get
            {
                object o = ViewState["ImageUrl"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (ImageUrl != value)
                {
                    ViewState["ImageUrl"] = value;
                }
            }
        }

        [Category("Appearance")]
        [DefaultValue("")]
        public String Text
        {
            get
            {
                object o = ViewState["Text"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (Text != value)
                {
                    ViewState["Text"] = value;
                }
            }
        }

        [Category("Behavior")]
        [DefaultValue("")]
        public String Command
        {
            get
            {
                object o = ViewState["Command"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (Command != value)
                {
                    ViewState["Command"] = value;
                }
            }
        }
        [Bindable(true)]
        [Category("Appearance")]
        [DefaultValue("")]
        public String CssClass
        {
            get
            {
                object o = ViewState["CssClass"];
                if (o == null)
                    return null;
                return (String)o;
            }
            set
            {
                if (CssClass != value)
                {
                    ViewState["CssClass"] = value;
                }
            }
        }

        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);
            cell.CssClass = CssClass;
            if (cellType == DataControlCellType.DataCell)
            {

                ECommercePage p = Control.Page as ECommercePage;
                if (p == null || p.WorkflowStep != WorkflowStep.Panier)
                {
                    return;
                }

                if (this.Visible)
                {
                    cell.DataBinding += new EventHandler(cell_DataBinding);
                    if (!string.IsNullOrEmpty(ImageUrl))
                    {
                        MouseOverImageButton btn = new MouseOverImageButton();
                        btn.ImageUrl = ImageUrl;
                        //btn.ID = "CommandBtn" + Command;
                        btn.MouseOverImageUrl = MouseOverImageUrl;
                        btn.CommandName = Command;
                        if (!string.IsNullOrEmpty(Text))
                            btn.ToolTip = Text;
                        cell.Controls.Add(btn);
                    }
                    else
                    {
                        LinkButton btn = new LinkButton();
                        btn.Text = Text;
                        //btn.ID = "CommandBtn" + Command;
                        btn.CommandName = Command;
                        cell.Controls.Add(btn);
                    }
                }
            }
        }

        void cell_DataBinding(object sender, EventArgs e)
        {
            if (sender is TableCell)
            {
                TableCell cell = sender as TableCell;
                object o = DataBinder.GetDataItem(cell.NamingContainer);
                if (o != null && o is ElementPanier)
                {
                    IButtonControl c = cell.Controls[0] as IButtonControl;
                    c.CommandArgument = (o as ElementPanier).LigneGuid.ToString();
                    ElementPanier pn = o as ElementPanier;
                    if (pn.NonModifiable)
                    {
                        try
                        {
                            (c as Control).Visible = false;
                        }
                        catch
                        {

                        }
                    }
                    else if (pn.QuantiteFixe)
                    {
                        if (c.CommandName.Equals("addone") || c.CommandName.Equals("removeone"))
                        {
                            try
                            {
                                this.Visible = false;
                            }
                            catch
                            {

                            }
                        }
                    }

                }
            }
        }

    }

    /// <summary>
    /// A utiliser dans un <see cref="PanierProduitsDataList" /> pour 
    /// afficher un lien d'action
    /// </summary>
    public class PanierProduitCommandLinkButton : LinkButton
    {
        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            object o = this.GetBoundObject();
            if (o != null && o is ElementPanier)
            {

                this.CommandArgument = (o as ElementPanier).LigneGuid.ToString();
                ElementPanier pn = o as ElementPanier;
                if (pn.NonModifiable)
                {
                    try
                    {
                        this.Visible = false;
                    }
                    catch
                    {

                    }
                }
                else if (pn.QuantiteFixe)
                {
                    if(this.CommandName.Equals("addone") || this.CommandName.Equals("removeone"))
                    {
                        try
                        {
                            this.Visible = false;
                        }
                        catch
                        {

                        }
                    }
                }

            }
        }

    }

}
