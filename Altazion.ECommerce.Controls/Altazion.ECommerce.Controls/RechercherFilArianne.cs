using Newtonsoft.Json;
using System.Collections.Generic;
using System.ComponentModel;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Version du fil d'ariane spécialisée pour les
    /// pages de recherche
    /// </summary>
    /// <remarks>
    /// <para>La structure du fil d'ariane est la suivante : </para>
    /// <list type="bullet">
    /// <item>un UL contient tout le fil d'ariane</item>
    /// <item>le noeud 'acceuil' est dans un a dans un li</item>
    /// <item>la page courante est dans un li simple</item>
    /// </list>
    /// </remarks>
    public class RechercherFilAriane : WebControl
    {
        /// <summary>
        /// Initialise une nouvelle instance de <see cref="RechercherFilAriane"/>
        /// </summary>
        public RechercherFilAriane()
        {
            Separator = ">";
        }

        /// <summary>
        /// Obtient ou définit le header du fil d'ariane
        /// </summary>
        public string Header { get; set; }

        /// <summary>
        /// Obtient ou définit la classe CSS du header
        /// </summary>
        public string HeaderCssClass { get; set; }

        /// <summary>
        /// Obtient ou définit la classe CSS à utiliser pour chaque item
        /// </summary>
        public string ItemCssClass { get; set; }

        /// <summary>
        /// Obtient ou définit la classe CSS à utiliser pour le premier item
        /// </summary>
        public string FirstItemCssClass { get; set; }

        /// <summary>
        /// Obtient ou définit la classe CSS à utiliser pour le dernier item
        /// </summary>
        public string LastItemCssClass { get; set; }

        /// <summary>
        /// Obtient ou définit un booléen spécifiant si la home
        /// doit toujours faire partie du breadcrumb
        /// </summary>
        public bool AlwaysShowHome { get; set; }

        /// <summary>
        /// Obtient ou définit un booléen spécifiant si le dernier élément
        /// doit être cliquable
        /// </summary>
        public bool LastIsClickable { get; set; }

        /// <summary>
        /// Obtient ou définit le séparateur entre les items
        /// </summary>
        [DefaultValue(">")]
        public string Separator { get; set; }

        /// <summary>
        /// Obtient ou définit un booléen spécifiant si le &lt;title&gt; de
        /// la page doit être utilisé si 
        /// </summary>
        public bool UsePageTitleIfEmpty { get; set; }

        int nbRendered;


        /// <summary>
        /// Effectue l'affichage du controle
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
            ContexteProvider prv = ECommerceServer.Contexte;
            ContexteBreadCrumbItem[] cur = prv.BreadCrumbItems;
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
                else if (AlwaysShowHome)
                {
                    if (!string.IsNullOrEmpty(Header))
                        RenderHeader(writer);
                    if (pg != null && pg.TypePage != ECommercePageType.HomePage)
                        RenderHomeLink(writer, true);
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
                {
                    if (LastIsClickable)
                        RenderBreadCrumb(writer, cur[cur.Length - 1]);
                    else
                        RenderNonClickable(writer, cur[cur.Length - 1].Label, cur[cur.Length - 1].Url);
                }
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
            writer.Write("<li  ");
            if (!string.IsNullOrEmpty(LastItemCssClass))
            {
                writer.Write("class='");
                writer.Write(LastItemCssClass);
                writer.Write("'");
            }
            writer.Write("><span>");
            writer.Write(Page.Server.HtmlEncode(p));
            writer.Write("</span>");
          
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


    /// <summary>
    /// Ajoute un bloc JSON/LD avec les informations de
    /// breadcrumb de parcours de la descente
    /// </summary>
    public class RechercherFilArianeJsonLd : WebControl
    {
        /// <summary>
        /// Initialise une nouvelle instance de <see cref="RechercherFilArianeJsonLd"/>
        /// </summary>
        public RechercherFilArianeJsonLd()
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

            List<ContexteBreadCrumbItem> cur = new List<ContexteBreadCrumbItem>(prv.BreadCrumbItems);
            List<BreadCrumbItemJson> items = new List<BreadCrumbItemJson>();
            if (cur.Count == 0)
            {
                if (!string.IsNullOrEmpty(pg.PageName))
                {
                    var j = new ContexteBreadCrumbItem()
                    {
                        Url = Page.Request.RawUrl,
                        Label = pg.PageName
                    };
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
