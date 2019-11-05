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

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            SiteWeb st = ECommerceServer.CurrentSite;

            string dt = ECommerceServer.User.CreateNewCSRFToken();

            FacebookSitesDS ds = ECommerceServer.DataCache.Facebook;
            if (ds == null || ds.ecommerce_facebook_siteswebs.Count == 0)
                return;

            FacebookSitesDS.ecommerce_facebook_siteswebsRow r = ds.ecommerce_facebook_siteswebs[0];
            if (r.Isfcb_application_idNull())
                return;

            ServerConfigSection sc = EConfigurationManager.GetConfig(st);

            string appId = r.fcb_application_id;

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
            //blrUri.Append("http://http://localhost:2952/Ecommerce/");
            if (!st.UrlPrincipale.EndsWith("/"))
                blrUri.Append("/");
            blrUri.Append("oauth/facebook/process/");
            blr.Append(HttpUtility.UrlEncode(blrUri.ToString()));

            //Page.Response.Redirect(blr.ToString());
            this.NavigateUrl = blr.ToString();
            //this.Target = "_top";
        }
    }
}
