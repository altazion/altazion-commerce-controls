using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Panel (div) affiché lorsque la session active est en mode de
    /// test d'une campagne. Si la session active n'est pas en test
    /// le contrôle n'est pas ajouté au code html
    /// </summary>
    public class AnimationEnTestPanel : Panel
    {
        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            if (!ECommerceServer.Animation.IsModeTest())
                this.Visible = false;

            base.OnPreRender(e);
        }
    }
}
