using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using System.ComponentModel;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche dans un span le montant de la livraison
    /// actuellement selectionnée dans le panier
    /// </summary>
    public class LivraisonMontant : Label
    {

        public string MessageSiOffert { get; set; }




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

        public override void DataBind()
        {
            base.DataBind();

            PanierProvider prv = ECommerceServer.Panier;
            if (prv == null || prv.FraisPort == null)
                this.Text = "";
            else if (!string.IsNullOrEmpty(Format))
                this.Text = prv.MontantFraisPort.ToString(Format);
            else
                this.Text = prv.MontantFraisPort.ToString();

        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            PanierProvider prv = ECommerceServer.Panier;
            if (prv == null || prv.FraisPort == null)
                this.Text = "";
            else if (prv.FraisPort.MontantTTC == 0 && !string.IsNullOrEmpty(MessageSiOffert))
            {
                this.Text = MessageSiOffert;
            }
            else if (!string.IsNullOrEmpty(Format))
                this.Text = prv.FraisPort.MontantTTC.ToString(Format);
            else
                this.Text = prv.FraisPort.MontantTTC.ToString();
        }
    }

    /// <summary>
    /// Affiche dans un span le libellé de la livraison
    /// actuellement selectionnée dans le panier
    /// </summary>
    public class LivraisonLibelle : Label
    {
        public override void DataBind()
        {
            base.DataBind();

            PanierProvider prv = ECommerceServer.Panier;
            if (prv == null || prv.FraisPort == null)
                this.Text = "";
            else
                this.Text = prv.FraisPort.Libelle;

        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            PanierProvider prv = ECommerceServer.Panier;
            if (prv == null || prv.FraisPort == null)
                this.Text = "";
            else
                this.Text = prv.FraisPort.Libelle;
        }
    }
}
