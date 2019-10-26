using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Altazion.ECommerce.Controls
{

    public class AlternateLinkInfo
    {
        public string Langue { get; set; }

        public string UrlRacine { get; set; }
    }

    [ParseChildren(true, "Alternates")]
    public class AlternatesLinks : WebControl
    {
        public AlternatesLinks()
        {
            Alternates = new ArrayList();
        }



        [PersistenceMode(PersistenceMode.InnerDefaultProperty)]
        public ArrayList Alternates { get; set; }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            if (Alternates == null || Alternates.Count == 0)
            {
                this.Visible = false;
                return;
            }

            Controls.Clear();
            var absUr = Page.Request.RawUrl;
            if (!absUr.StartsWith("/"))
                absUr = "/" + absUr;
            foreach (var tmp in Alternates)
            {
                var alt = tmp as AlternateLinkInfo;
                if (alt == null)
                    continue;
                var lit = new Literal();
                string url = alt.UrlRacine;
                if (url.EndsWith("/"))
                    url = url.Substring(0, url.Length - 1);
                url += absUr;
                lit.Text = string.Format("<link rel='alternate' hreflang='{0}' href='{1}' />", alt.Langue, url);
                this.Controls.Add(lit);
            }

        }

        protected override void Render(HtmlTextWriter writer)
        {
            RenderChildren(writer);
        }

    }
}
