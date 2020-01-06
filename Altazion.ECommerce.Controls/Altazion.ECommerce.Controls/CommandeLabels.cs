using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche un span avec le numéro de commande
    /// du panier actif. (sera vide tant que le panier
    /// n'a pas été au moins validé une première fois)
    /// </summary>
    public class CommandeNumero  : Label
    {
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            this.Text = ECommerceServer.Panier.NumeroCommande;
        }
    }
}
