using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche un span avec le prénom du client, si il est connecté
    /// </summary>
    /// <remarks>Le code généré est de la forme 
    /// <code>&lt;span ...&gt;Olivier&lt;/span&gt;</code>
    /// </remarks>
    [CPointSoftware.Equihira.Business.Common.AideCodeControl(CPointSoftware.Equihira.Business.Common.AideCodeControlKind.ECommerce)]
    public class ClientNom : Label
    {
        /// <summary>
        /// Surchargé pour afficher le nom du clinet
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            this.Text = ECommerceServer.User.Nom;
        }
    }
}
