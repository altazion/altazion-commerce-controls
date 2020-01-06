using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// affiche un ul représentant le fil des catégories
    /// </summary>
    /// <remarks>
    /// La structure du fil d'ariane est la suivante : 
    /// <list type="bullet">
    /// <item>un UL contient tout le fil d'ariane</item>
    /// <item>le noeud 'acceuil' est dans un a dans un li</item>
    /// <item>la page courante est dans un li simple</item>
    /// </list>
    /// </remarks>
    public class ProductFilArianeCategories : WebControl, IEquihiraBindable
    {
        public ProductFilArianeCategories()
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

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (_article == null)
                this.Visible = false;
        }

        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            if (_article == null)
                return;

            //ECommerceServer.Contexte.BreadCrumbItems

            ECommercePage pg = Page as ECommercePage;
            List<ContexteBreadCrumbItem> cur = GetContenuBreadCrumb(pg, _article);
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



            if (cur.Count == 0)
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

                for (int i = 0; i < (cur.Count - 1); i++)
                {
                    RenderBreadCrumb(writer, cur[i]);
                }

                if (cur.Count > 0)
                    RenderNonClickable(writer, cur[cur.Count - 1].Label, cur[cur.Count - 1].Url);
            }
            writer.Write("</ul>");
        }

        internal static List<ContexteBreadCrumbItem> GetContenuBreadCrumb(ECommercePage pg, ArticlesDataSourceResult article)
        {
            List<ContexteBreadCrumbItem> cur = new List<ContexteBreadCrumbItem>();

            var rArt = article.Article.ecommerce_articles_web.FirstOrDefault();
            if (rArt == null)
                return cur;

            if (!rArt.Isarw_seg_pk_principaleNull())
            {
                var segDS = ECommerceServer.DataCache.ToutesLesSegmentations;
                var seg = segDS.catalog_segmentations.FindByseg_pk(rArt.arw_seg_pk_principale);
                while (true)
                {
                    if (seg == null)
                        break;
                    var url = ECommerceServer.Contexte.GetSearchPagePath(seg.seg_pk, Guid.Empty, -1, null, null, true);
                    cur.Insert(0, new ContexteBreadCrumbItem() { Url = url, Label = seg.seg_libelle });
                    if (!seg.Isseg_parent_seg_pkNull())
                    {
                        seg = segDS.catalog_segmentations.FindByseg_pk(seg.seg_parent_seg_pk);
                        if (seg == null)
                            break;
                        if (ECommerceServer.CurrentSite.SegmentRacineId == seg.seg_pk)
                            break;
                    }
                    else
                        break;
                }
            }
            cur.Add(new ContexteBreadCrumbItem() { Url = pg.Request.RawUrl, Label = rArt.arw_libelle });
            return cur;
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
            writer.Write("><span >");
            writer.Write(Page.Server.HtmlEncode(p));
            writer.Write("</span>");
            if (!string.IsNullOrEmpty(url))
            {
                writer.Write("<span style='display:none' >");
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
            writer.Write("'  >");
            writer.Write(Page.Server.HtmlEncode(it.Label));
            writer.Write("</a></li>");
            nbRendered++;
        }

        ArticlesDataSourceResult _article = null;

        public void BindTo(object o)
        {
            if (o is ArticlesDataSourceResult)
            {
                _article = o as ArticlesDataSourceResult;
            }
        }
    }

    public class ProductFilArianeJsonLd : WebControl, IEquihiraBindable
    {
        public ProductFilArianeJsonLd()
        {
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (_article == null)
                this.Visible = false;
        }

        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            if (_article == null)
                return;

            writer.Write("<script type='application/ld+json'>{ \"@context\": \"http://schema.org\", \"@type\": \"BreadcrumbList\",");
            writer.Write("\"itemListElement\": ");

            ECommercePage pg = Page as ECommercePage;
            List<ContexteBreadCrumbItem> cur = ProductFilArianeCategories.GetContenuBreadCrumb(pg, _article);
            List<BreadCrumbItemJson> items = new List<BreadCrumbItemJson>();

            var it = new BreadCrumbItemJson()
            {
                type = "ListItem",
                position = items.Count + 1,
                item = new Item()
                {
                    id = ECommerceServer.CurrentSite.UrlPrincipale,
                    name = "Accueil"
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

        ArticlesDataSourceResult _article = null;

        public void BindTo(object o)
        {
            if (o is ArticlesDataSourceResult)
            {
                _article = o as ArticlesDataSourceResult;
            }
        }

        public class BreadCrumbItemJson
        {
            [JsonProperty("@type")]
            public string type { get; set; }
            public int position { get; set; }
            public Item item { get; set; }
        }

        public class Item
        {
            [JsonProperty("@id")]
            public string id { get; set; }
            public string name { get; set; }
        }

    }
}
