using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Lien permettant de désactiver le mode de test des campagnes
    /// commerciales. 
    /// </summary>
    /// <remarks>Ce contrôle devrait être placé dans un <see cref="AnimationEnTestPanel"/></remarks>
    public class AnimationArreterTestLinkButton : LinkButton
    {
        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.WebControls.LinkButton.Click" /> du contrôle <see cref="T:System.Web.UI.WebControls.LinkButton" />
        /// et désactive le mode de test.
        /// </summary>
        /// <param name="e"><see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnClick(EventArgs e)
        {
            base.OnClick(e);
            ECommerceServer.Animation.ClearModeTest();
        }
    }
}
