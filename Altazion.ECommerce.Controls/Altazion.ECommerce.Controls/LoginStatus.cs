using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Security;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Classe de gestion du login à utiliser en lieu et place
    /// de celui d'asp.net
    /// </summary>
    public class LoginStatus : System.Web.UI.WebControls.LoginStatus
    {
        /// <summary>
        /// Effectue le traitement spécifique de déconnexion
        /// de l'utilisateur
        /// </summary>
        /// <param name="e"></param>
        protected override void OnLoggedOut(EventArgs e)
        {
            PanierProvider prv = ECommerceServer.Panier;
            prv.DefinirClient(Guid.Empty);
            if (ECommerceServer.User.EstImpersonnalise)
            {
                try
                {
                    ECommerceServer.User.PanierSauvegarde = "";
                }
                catch
                {
                }
            }

            ECommerceServer.User.ClientGuid = Guid.Empty;
            ECommerceServer.User.EstImpersonnalise = false;
            FormsAuthentication.SignOut();
            ECommerceServer.User.ClearLogin();
            Page.Session.Abandon();
            base.OnLoggedOut(e);
        }
    }
}
