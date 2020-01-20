using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche un span avec le montant non réglé du panier
    /// </summary>
    public class PanierMontantNonRegle : Label
    {
        public PanierMontantNonRegle()
        {
            Format = "{0:###,##0.00}";
        }

        public string Format { get; set; }

        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            PanierProvider prv = ECommerceServer.Panier;
            this.Text = string.Format(Format, prv.MontantNonPayeSaufPrincipal);
        }
    }

    /// <summary>
    /// Affiche un span avec le montant du panier
    /// </summary>
    public class PanierMontant : Label
    {
        public bool InclureElementsMagasin { get; set; }

        public PanierMontant()
        {
            Format = "{0:###,##0.00}";
        }

        public string Format { get; set; }

        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            PanierProvider prv = ECommerceServer.Panier;

            if (!InclureElementsMagasin)
            {
                this.Text = string.Format(Format, prv.Montant);
            }
            else
            {
                decimal mnt = 0;
                foreach(var pn in prv.TousLesElements)
                {
                    mnt += (pn.PuTTC * pn.Quantite);
                }
                this.Text = string.Format(Format, mnt);
            }
        }
    }
}
