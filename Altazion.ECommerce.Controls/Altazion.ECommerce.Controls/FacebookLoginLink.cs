using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.Equihira.Common;
using CPointSoftware.Equihira.Common.Sys;
using CPointSoftware.Equihira.Business.Common;
using CPointSoftware.Equihira.Business.Common.Data;
using System.Web;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche un lien permettant de démarrer le login
    /// via Facebook.
    /// </summary>
    public class FacebookLoginLink : HyperLink
    {
        /// <summary>
        /// Gère l'évènement de chargement de la page
        /// </summary>
        /// <param name="e"></param>
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            SiteWeb st = ECommerceServer.CurrentSite;
            ServerConfigSection sc = EConfigurationManager.GetConfig(st);
            if (sc.ECommerce.Authentication == null
                || !sc.ECommerce.Authentication.UseFacebook)
            {
                this.Visible = false;
            }

            if (Page.User.Identity.IsAuthenticated)
                this.Visible = false;
        }

        /// <summary>
        /// Effectue le traitement de préchargement du
        /// controle.
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            SiteWeb st = ECommerceServer.CurrentSite;

            string dt = ECommerceServer.User.CreateNewCSRFToken();

            // Récupère les infos de configuration de Facebook
            // depuis la base de données
            FacebookSitesDS ds = ECommerceServer.DataCache.Facebook;
            if (ds == null || ds.ecommerce_facebook_siteswebs.Count == 0)
                return;
            FacebookSitesDS.ecommerce_facebook_siteswebsRow r = ds.ecommerce_facebook_siteswebs[0];
            if (r.Isfcb_application_idNull())
                return;

            ServerConfigSection sc = EConfigurationManager.GetConfig(st);

            string appId = r.fcb_application_id;

            // Prépare l'URL de connexion à la page de login
            StringBuilder blr = new StringBuilder();
            blr.Append("https://www.facebook.com/dialog/oauth?client_id=");
            blr.Append(appId);
            blr.Append("&scope=email");
            blr.Append("&state=");
            blr.Append(HttpUtility.UrlEncode(dt));
            blr.Append("|");
            if (!string.IsNullOrEmpty(Page.Request["ReturnUrl"]))
                blr.Append(HttpUtility.UrlEncode(Page.Request["ReturnUrl"]));
            else
                blr.Append(HttpUtility.UrlEncode("/"));
            blr.Append("&redirect_uri=");
            StringBuilder blrUri = new StringBuilder();
            blrUri.Append(st.UrlPrincipale);
            if (!st.UrlPrincipale.EndsWith("/"))
                blrUri.Append("/");
            blrUri.Append("oauth/facebook/process/");
            blr.Append(HttpUtility.UrlEncode(blrUri.ToString()));

            // et en fait l'url du lien
            this.NavigateUrl = blr.ToString();
        }
    }
}
