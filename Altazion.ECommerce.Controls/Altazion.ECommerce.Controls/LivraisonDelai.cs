using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche dans un span la date de livraison prévue pour le mode
    /// de transport selectionné dans le panier
    /// </summary>
    public class LivraisonDelai : Label
    {
        /// <summary>
        /// Initialise une instance de <see cref="LivraisonDelai"/>.
        /// </summary>
        public LivraisonDelai()
        {
            Format = "dd/MM";
        }

        /// <summary>
        /// Format d'affichage de la date
        /// </summary>
        public string Format { get; set; }

        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
         
            ModeLivraisonElementPanier elm = ECommerceServer.Panier.FraisPort;

            if (elm == null)
            {
                DateTime? dtMEF = PanierProvider.Extensions.GetDateLivraison();
                if (dtMEF.HasValue)
                {
                    this.Text = dtMEF.Value.ToString(Format);
                }
                return;
            }

            this.Text = elm.DateLivraisonPrevue.ToString(Format);
            
        }
    }

    /// <summary>
    /// [obsolete]
    /// </summary>
    public class LivraisonMode : Label
    {
        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            ModeLivraisonElementPanier elm = ECommerceServer.Panier.FraisPort;

            if (elm == null)
                return;

            this.Text = elm.Libelle;

        }
    }

}
