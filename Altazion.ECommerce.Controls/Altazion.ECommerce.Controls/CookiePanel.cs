using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    public class NoCookiePanel : Panel
    {
        public NoCookiePanel()
        {
            CookieName = "Avertissement_cookies";
        }

        public string CookieName { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            var ck = CookieManager.Get(CookieName);
            if (ck != null && !string.IsNullOrEmpty(ck.Value))
                this.Visible = false;

            var c = this.Style["display"];
            if (c == null)
                this.Style.Add("display", "none");

            c = this.Attributes["data-e_cookiepanel"];
            if (c == null)
                this.Attributes.Add("data-e_cookiepanel", CookieName);

            base.OnPreRender(e);
        }

        public override void RenderEndTag(HtmlTextWriter writer)
        {
            base.RenderEndTag(writer);
            writer.Write("<script type='text/javascript'>$(document).ready(function() {");
            writer.Write("E.checkCookieForPanel('#" + this.ClientID + "', true)");
            writer.Write("});</script>");
        }

        protected override void Render(HtmlTextWriter writer)
        {
            base.Render(writer);
        }
    }

    public class SetCookieLink : System.Web.UI.HtmlControls.HtmlAnchor
    {
        public SetCookieLink()
        {
            CookieName = "Avertissement_cookies";
            CookieValueToSet = "true";
        }

        public string CookieName { get; set; }
        public string CookieValueToSet { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            var c = this.Attributes["data-e_cookiepanel"];
            if (c == null)
                this.Attributes.Add("data-e_cookiepanel", CookieName);
            c = this.Attributes["data-e_cookiepanelvalue"];
            if (c == null)
                this.Attributes.Add("data-e_cookiepanelvalue", CookieValueToSet);

            c = this.Attributes["href"];
            if (c != null)
                this.Attributes["href"] = "javascript:E.setCookieForPanel('#" + this.ClientID + "')";
            else
                this.Attributes.Add("href","javascript:E.setCookieForPanel('#" + this.ClientID + "')");

            base.OnPreRender(e);
        }
    }

}
