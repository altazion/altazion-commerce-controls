using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using System.ComponentModel;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// affiche un ul représentant le fil d'Ariane
    /// </summary>
    /// <remarks>
    /// La structure du fil d'ariane est la suivante : 
    /// <list type="bullet">
    /// <item>un UL contient tout le fil d'ariane</item>
    /// <item>le noeud 'acceuil' est dans un a dans un li</item>
    /// <item>toutes les pages permettant de "remonter" sont dans a, dans des li avec un marquage rdfa</item>
    /// <item>la page courante est dans un li simple</item>
    /// </list>
    /// </remarks>
    public class FilAriane : WebControl
    {
        public FilAriane()
        {
            Separator = ">";
        }

        public string Header { get; set; }
        public string HeaderCssClass { get; set; }

        public string ItemCssClass { get; set; }
        public string FirstItemCssClass { get; set; }
        public string LastItemCssClass { get; set; }


        [DefaultValue(">")]
        public string Separator { get; set; }

        public bool UsePageTitleIfEmpty { get; set; }

        int nbRendered;

        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            nbRendered = 0;

            writer.Write("<ul");
            if (!string.IsNullOrEmpty(CssClass))
            {
                writer.Write(" class='");
                writer.Write(CssClass);
                writer.Write("'");
            }
            if (Style != null && Style.Count > 0)
            {
                writer.Write(" style='");
                writer.Write(Style);
                writer.Write("'");
            }
            writer.Write(">");

            ECommercePage pg = Page as ECommercePage;

            ContexteBreadCrumbItem[] cur = new ContexteBreadCrumbItem[0];
            if(pg!=null)
                cur = pg.GetBreadCrumb();
            if (cur.Length == 0)
            {
                if (UsePageTitleIfEmpty && pg != null && !string.IsNullOrEmpty(pg.PageName))
                {
                    if (!string.IsNullOrEmpty(Header))
                        RenderHeader(writer);
                    if (pg != null && pg.TypePage != ECommercePageType.HomePage)
                        RenderHomeLink(writer, true);
                    RenderNonClickable(writer, pg.PageName, null);
                }
            }
            else
            {
                if (!string.IsNullOrEmpty(Header))
                    RenderHeader(writer);
                if (pg != null && pg.TypePage != ECommercePageType.HomePage)
                    RenderHomeLink(writer, true);

                for (int i = 0; i < (cur.Length - 1); i++)
                {
                    RenderBreadCrumb(writer, cur[i]);
                }  

                if (cur.Length > 0)
                    RenderNonClickable(writer, cur[cur.Length - 1].Label, cur[cur.Length - 1].Url);
            }
            writer.Write("</ul>");
        }

        private void RenderHomeLink(System.Web.UI.HtmlTextWriter writer, bool toHomePage)
        {
            RenderSeparator(writer);
            writer.Write("<li ");
            if (!string.IsNullOrEmpty(FirstItemCssClass))
            {
                writer.Write("class='");
                writer.Write(FirstItemCssClass);
                writer.Write("'");
            }
            writer.Write(">");
            writer.Write("<a href='");
            writer.Write(ResolveUrl("~/"));
            writer.Write("'>");
            writer.Write("Accueil");
            writer.Write("</a></li>");
            nbRendered++;
        }

        private void RenderNonClickable(System.Web.UI.HtmlTextWriter writer, string p, string url)
        {
            RenderSeparator(writer);
            writer.Write("<li ");
            if (!string.IsNullOrEmpty(LastItemCssClass))
            {
                writer.Write("class='");
                writer.Write(LastItemCssClass);
                writer.Write("'");
            }
            writer.Write("><span>");
            writer.Write(Page.Server.HtmlEncode(p));
            writer.Write("</span>");
            if (!string.IsNullOrEmpty(url))
            {
                writer.Write("<span style='display:none'>");
                writer.Write(ResolveUrl(url));
                writer.Write("</span>");
            }
            writer.Write("</li>");
            nbRendered++;
        }

        private void RenderSeparator(System.Web.UI.HtmlTextWriter writer)
        {
            if (nbRendered > 0 && !string.IsNullOrEmpty(Separator))
            {
                writer.Write("<li>");
                writer.Write(Separator);
                writer.Write("</li>");
            }
        }

        private void RenderHeader(System.Web.UI.HtmlTextWriter writer)
        {
            RenderSeparator(writer);
            writer.Write("<li");
            if (!string.IsNullOrEmpty(CssClass))
            {
                writer.Write(" class='");
                writer.Write(CssClass);
                writer.Write("'");
            }
            writer.Write(">");
            writer.Write(Page.Server.HtmlEncode(Header));
            writer.Write("</li>");
        }

        private void RenderBreadCrumb(System.Web.UI.HtmlTextWriter writer, ContexteBreadCrumbItem it)
        {
            RenderSeparator(writer);
            writer.Write("<li ><a href='");
            writer.Write(ResolveUrl(it.Url));
            writer.Write("' >");
            writer.Write(Page.Server.HtmlEncode(it.Label));
            writer.Write("</a></li>");
            nbRendered++;
        }
    }

}
