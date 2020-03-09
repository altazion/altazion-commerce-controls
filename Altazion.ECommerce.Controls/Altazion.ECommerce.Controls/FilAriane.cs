using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using System.ComponentModel;
using CPointSoftware.ECommerce.Tools;
using Newtonsoft.Json;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// affiche un ul représentant le fil d'Ariane
    /// </summary>
    /// <remarks>
    /// La structure du fil d'ariane est la suivante : 
    /// <list type="bullet">
    /// <item><description>un UL contient tout le fil d'ariane</description></item>
    /// <item><description>le noeud 'acceuil' est dans un a dans un li</description></item>
    /// <item><description>toutes les pages permettant de "remonter" sont dans a, dans des li avec un marquage rdfa</description></item>
    /// <item><description>la page courante est dans un li simple</description></item>
    /// </list>
    /// </remarks>
    public class FilAriane : WebControl
    {
        /// <summary>
        /// Constructeur par défaut
        /// </summary>
        public FilAriane()
        {
            Separator = ">";
        }

        /// <summary>
        /// Obtient ou définit l'entete du fil d'ariane
        /// </summary>
        public string Header { get; set; }
        /// <summary>
        /// Obtient ou définit la classe CSS de l'entête
        /// </summary>
        public string HeaderCssClass { get; set; }

        /// <summary>
        /// Obtient ou définit la classe CSS des éléments
        /// </summary>
        public string ItemCssClass { get; set; }
        
        /// <summary>
        /// Obtient ou définit la classe CSS spécifique du premier élément
        /// </summary>
        /// <remarks>Cette valeur est utilisée pour le premier item 
        /// et <see cref="ItemCssClass"/> est ignorée</remarks>
        public string FirstItemCssClass { get; set; }

        /// <summary>
        /// Obtient ou défiit la classe CSS spécifique du dernier élément
        /// </summary>
        /// <remarks>Cette valeur est utilisée pour le dernier item 
        /// et <see cref="ItemCssClass"/> est ignorée</remarks>
        public string LastItemCssClass { get; set; }


        /// <summary>
        /// Obtient ou définit le séparateur entre les items
        /// </summary>
        /// <remarks>Par défaut &gt; est utilisé</remarks>
        [DefaultValue(">")]
        public string Separator { get; set; }

        /// <summary>
        /// Obtient ou définit un booléen précisant si le
        /// dernier item doit prendre la valeur du titre
        /// de la page si sa valeur spécifique est vide
        /// </summary>
        public bool UsePageTitleIfEmpty { get; set; }

        int nbRendered;

        /// <summary>
        /// Effectue l'affichage du contrôle
        /// </summary>
        /// <param name="writer"></param>
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
            if (cur.Length == 0 ||  (cur.Length==1 && string.IsNullOrEmpty(cur[0].Label)))
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

    public class FilArianeJsonLd : WebControl
    {
        /// <summary>
        /// Initialise une nouvelle instance de <see cref="RechercherFilArianeJsonLd"/>
        /// </summary>
        public FilArianeJsonLd()
        {
        }

        /// <summary>
        /// Effectue le rendu du controle
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {

            ECommercePage pg = Page as ECommercePage;
            ContexteProvider prv = ECommerceServer.Contexte;

            writer.Write("<script type='application/ld+json'>{ \"@context\": \"http://schema.org\", \"@type\": \"BreadcrumbList\",");
            writer.Write("\"itemListElement\": ");

            List<ContexteBreadCrumbItem> cur = new List<ContexteBreadCrumbItem>(pg.GetBreadCrumb());
            List<BreadCrumbItemJson> items = new List<BreadCrumbItemJson>();
            if(cur.Count == 1 && string.IsNullOrEmpty(cur[0].Label))
            {
                if (!string.IsNullOrEmpty(pg.PageName))
                {
                    var j = cur[0];
                    j.Url = Page.Request.RawUrl;
                    j.Label = pg.PageName;
                }
            }
            else if (cur.Count == 0)
            {
                if (!string.IsNullOrEmpty(pg.PageName))
                {
                    var j = new ContexteBreadCrumbItem()
                    {
                        Url = Page.Request.RawUrl,
                        Label = pg.PageName
                    };
                    cur.Add(j);
                }
            }
            var it = new BreadCrumbItemJson()
            {
                type = "ListItem",
                position = items.Count + 1,
                item = new Item()
                {
                    id = ECommerceServer.CurrentSite.UrlPrincipale,
                    name = "Accueil",
                }
            };
            items.Add(it);

            foreach (var c in cur)
            {
                it = new BreadCrumbItemJson()
                {
                    type = "ListItem",
                    position = items.Count + 1,
                    item = new Item()
                    {
                        id = ResolveUrl(c.Url),
                        name = c.Label
                    }
                };

                if (it.item.id.StartsWith("/"))
                    it.item.id = ECommerceServer.CurrentSite.UrlPrincipale + it.item.id.Substring(1);

                items.Add(it);
            }

            string s = CPointSoftware.Equihira.Business.Common.JsonHelper.Serialize(items);
            writer.Write(s);
            writer.Write("}</script>");

        }

        internal class BreadCrumbItemJson
        {
            [JsonProperty("@type")]
            public string type { get; set; }
            public int position { get; set; }
            public Item item { get; set; }
        }

        internal class Item
        {
            [JsonProperty("@id")]
            public string id { get; set; }
            public string name { get; set; }
        }

    }

}
