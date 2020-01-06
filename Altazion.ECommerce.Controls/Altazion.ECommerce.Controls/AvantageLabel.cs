using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche un span avec le code avantage 
    /// actif sur le panier en cours
    /// </summary>
    /// <remarks>
    /// <para>Vous pouvez utiliser ce contrôle dans toutes les
    /// pages du site, sous la forme :</para>
    /// <code>
    /// &lt;ecom:AvantageLabel runat="server"
    ///   TextIfActive="Votre code avantage : {0}"
    ///   /gt;</code>
    /// <para>Si vous renseignez la propriété
    /// <see cref="TextIfInactive" />, le contenu de
    /// cette propriété sera affiché lorsque le
    /// panier n'est pas associé à un code avantage.
    /// Si cette propriété est vide et que le 
    /// panier n'a pas de code avantage actif,
    /// le &lt;span&gt; ne sera pas ajouté dans
    /// la page</para>
    /// </remarks>
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
            // Si il y a un code avantage associé au panier
            // on l'affiche avec formattage
            if (!string.IsNullOrEmpty(prv.CodeAvantage))
                this.Text = string.Format(TextIfActive, prv.CodeAvantage);
            // Sinon, on affiche le message par défaut si
            // il est renseigné
            else if (!string.IsNullOrEmpty(TextIfInactive))
                this.Text = TextIfInactive;
            // ou on retire le contrôle de la page HTML
            else
                this.Visible = false;
        }
    }
}
