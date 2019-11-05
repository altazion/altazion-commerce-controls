using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche un span avec le code avantage actif
    /// </summary>
    public class AvantageLabel : Label
    {
        /// <summary>
        /// Obtient ou définit le texte à afficher si un code 
        /// avantage saisi est actif. 
        /// </summary>
        /// <remarks>
        /// Ce texte est utilisé pour formater le code saisi :
        /// utilisez {0} dans ce texte pour afficher le
        /// code.
        /// </remarks>
        public string TextIfActive { get; set; }

        /// <summary>
        /// Obtient ou définit le message lorsqu'aucun code
        /// n'est saisi
        /// </summary>
        public string TextIfInactive { get; set; }


        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            PanierProvider prv = ECommerceServer.Panier;
            if (!string.IsNullOrEmpty(prv.CodeAvantage))
                this.Text = string.Format(TextIfActive, prv.CodeAvantage);
            else if (!string.IsNullOrEmpty(TextIfInactive))
                this.Text = TextIfInactive;
            else
                this.Visible = false;
        }
    }
}
