using CPointSoftware.Equihira.Business.Common;
using CPointSoftware.Equihira.Business.ECommerce;
using CPointSoftware.Equihira.Business.ECommerce.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.Caching;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche un bloc de contenu pour le SEO ou 
    /// la personnalisation du contenu des pages
    /// </summary>
    /// <remarks><para>Ce contrôle est destiné à être utilisé dans 
    /// un thème personnalisé pour définir un emplacement dont
    /// le contenu sera géré via un éditeur CMS dans le back-office.
    /// Pour plus d'information, consultez la documentation sur
    /// la personnalisation.</para>
    /// <para>Le contenu SEO est ajouté au code HTML de la page
    /// tel quel, sans aucun tag englobant. Par exemple :</para>
    /// <code>&lt;ecom:SeoContent runat="server" 
    ///    CodeEmplacement="Footer" 
    ///    DefaultContent="&lt;p&gt;Test&lt;/p&gt;" /&gt;</code>
    /// <para>affichera le simple code HTML suivant 
    /// (si aucun contenu n'est définit dans le back office) :</para>
    /// <code>&lt;p&gt;Test&lt;/p&gt;</code>
    /// </remarks>
    public class SeoContent : Literal
    {
        /// <summary>
        /// Constructeur par défaut
        /// </summary>
        public SeoContent()
        {
            DefaultContent = null;
            CodeEmplacement = "SEO";
        }

        /// <summary>
        /// Obtient ou définit un code d'emplacement 
        /// pour identifier la zone à afficher
        /// </summary>
        public string CodeEmplacement { get; set; }

        /// <summary>
        /// Obtient ou définit le contenu par défaut pour
        /// le cas où il ne serait pas définit dans 
        /// le back-office.
        /// </summary>
        public string DefaultContent { get; set; }


        /// <summary>
        /// Effectue le calcul de pré-rendu du controle
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);


            var sit = ECommerceServer.CurrentMiniSite;
            if (sit == null)
                sit = ECommerceServer.CurrentSite;

            var p = EServer.SharedCache.Get(sit, "_seo_content_for_pages_" + sit.Id) as SeoContenusDS;
            if (p == null)
            {
                p = new SeoBll(sit.RjsId).GetContenus(sit.Id, null, new string[] { SeoBll.TypePageGenerique, SeoBll.TypePageHome }, null);
                EServer.SharedCache.Add(sit, "_seo_content_for_pages_" + sit.Id,
                    p, null, DateTime.Now.AddMinutes(5),
                        ECommerceCacheProvider.NoSlidingExpiration,
                        CacheItemPriority.High,
                        null);
            }

            var empls = ECommerceServer.DataCache.EmplacementsSEO;
            var rempl = (from z in empls.ecommerce_seo_emplacements
                         where z.sep_sit_pk == sit.Id
                            && z.sep_code.Equals(CodeEmplacement, StringComparison.InvariantCultureIgnoreCase)
                         select z).FirstOrDefault();
            if (rempl == null)
            {
                if (!string.IsNullOrEmpty(DefaultContent))
                    this.Text = DefaultContent;
                else
                    this.Text = "<!-- code emplacement " + CodeEmplacement + " inconnu -->";
            }
            else
            {
                var url = Page.Request.RawUrl.ToLowerInvariant();
                url = VirtualPathUtility.ToAppRelative(url);
                SeoContenusDS.ecommerce_seo_contenusRow r = GetContent(url, p, rempl);
                if(r==null)
                {
                    // essayons de virer le default si il y en a un
                    // ou le home
                    if (url.EndsWith("/default.aspx"))
                        url = url.Substring(0, url.Length - 12); //"default.aspx" => 12 chars
                    else if (url.EndsWith("/default.html"))
                        url = url.Substring(0, url.Length - 12); //"default.html" => 12 chars
                    else if (url.EndsWith("/default.htm"))
                        url = url.Substring(0, url.Length - 11); //"default.htm" => 11 chars
                    else if (url.EndsWith("/home.htm"))
                        url = url.Substring(0, url.Length - 8); //"home.htm" => 8 chars
                    else if (url.EndsWith("/home.html"))
                        url = url.Substring(0, url.Length - 9); //"home.html" => 9 chars
                    r = GetContent(url, p, rempl);
                }
                if (r == null)
                {
                    if (!string.IsNullOrEmpty(DefaultContent))
                        this.Text = DefaultContent;
                    else
                        this.Visible = false;
                }
                else
                {
                    switch (r.sec_type_contenu.ToUpperInvariant())
                    {
                        case "S": // source (html en source)
                        case "H": // html (par éditeur)
                            this.Text = r.sec_contenu;
                            break;
                        default:
                            this.Text = "<!-- type de contenu " + r.sec_type_contenu + " non géré -->";
                            break;
                    }
                }
            }
        }

        internal static SeoContenusDS.ecommerce_seo_contenusRow GetContent(string url, SeoContenusDS p, SeoEmplacementsDS.ecommerce_seo_emplacementsRow rempl)
        {
            return (from z in p.ecommerce_seo_contenus
                    where z.sec_sep_guid.Equals(rempl.sep_guid)
                    && z.sec_id_type.Equals("URL")
                    && z.sec_id_valeur.Equals(url, StringComparison.InvariantCultureIgnoreCase)
                    orderby z.sec_contenu_ordre
                    select z).FirstOrDefault();
        }
    }

    /// <summary>
    /// Affiche le titre associé à un bloc de contenu pour le SEO ou 
    /// la personnalisation du contenu des pages
    /// </summary>
    /// <remarks><para>Ce contrôle est destiné à être utilisé dans 
    /// un thème personnalisé pour définir un emplacement dont
    /// le contenu sera géré via un éditeur CMS dans le back-office.
    /// Pour plus d'information, consultez la documentation sur
    /// la personnalisation.</para>
    /// <para>Le contenu du titre est affiché "tel quel" 
    /// sans tag englobant</para>
    /// </remarks>
    public class SeoContentTitle : Literal
    {
        /// <summary>
        /// Le constructeur par défaut
        /// </summary>
        public SeoContentTitle()
        {
            DefaultContent = null;
            CodeEmplacement = "SEO";
        }

        /// <summary>
        /// Obtient ou définit un code d'emplacement 
        /// pour identifier la zone à afficher
        /// </summary>
        public string CodeEmplacement { get; set; }

        /// <summary>
        /// Obtient ou définit le contenu par défaut pour
        /// le cas où il ne serait pas définit dans 
        /// le back-office.
        /// </summary>
        public string DefaultContent { get; set; }

        /// <summary>
        /// Effectue le calcul de pré-rendu du controle
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);


            var sit = ECommerceServer.CurrentMiniSite;
            if (sit == null)
                sit = ECommerceServer.CurrentSite;

            var p = EServer.SharedCache.Get(sit, "_seo_content_for_pages_" + sit.Id) as SeoContenusDS;
            if (p == null)
            {
                p = new SeoBll(sit.RjsId).GetContenus(sit.Id, null, SeoBll.TypePageGenerique, null);
                EServer.SharedCache.Add(sit, "_seo_content_for_pages_" + sit.Id,
                    p, null, DateTime.Now.AddMinutes(5),
                        ECommerceCacheProvider.NoSlidingExpiration,
                        CacheItemPriority.High,
                        null);
            }

            var empls = ECommerceServer.DataCache.EmplacementsSEO;
            var rempl = (from z in empls.ecommerce_seo_emplacements
                         where z.sep_sit_pk == sit.Id
                            && z.sep_code.Equals(CodeEmplacement, StringComparison.InvariantCultureIgnoreCase)
                         select z).FirstOrDefault();
            if (rempl == null)
            {
                if (!string.IsNullOrEmpty(DefaultContent))
                    this.Text = DefaultContent;
                else
                    this.Text = "<!-- code emplacement " + CodeEmplacement + " inconnu -->";
            }
            else
            {
                var url = Page.Request.RawUrl.ToLowerInvariant();
                url = VirtualPathUtility.ToAppRelative(url);
                SeoContenusDS.ecommerce_seo_contenusRow r = SeoContent.GetContent(url, p, rempl);
                if (r == null)
                {
                    // essayons de virer le default si il y en a un
                    // ou le home
                    if (url.EndsWith("/default.aspx"))
                        url = url.Substring(0, url.Length - 12); //"default.aspx" => 12 chars
                    else if (url.EndsWith("/default.html"))
                        url = url.Substring(0, url.Length - 12); //"default.html" => 12 chars
                    else if (url.EndsWith("/default.htm"))
                        url = url.Substring(0, url.Length - 11); //"default.htm" => 11 chars
                    else if (url.EndsWith("/home.htm"))
                        url = url.Substring(0, url.Length - 8); //"home.htm" => 8 chars
                    else if (url.EndsWith("/home.html"))
                        url = url.Substring(0, url.Length - 9); //"home.html" => 9 chars
                    r = SeoContent.GetContent(url, p, rempl);
                }
                if (r == null)
                {
                    if (!string.IsNullOrEmpty(DefaultContent))
                        this.Text = DefaultContent;
                    else
                        this.Visible = false;
                }
                else
                {
                    switch (r.sec_type_contenu.ToUpperInvariant())
                    {
                        case "S": // source (html en source)
                        case "H": // html (par éditeur)
                            this.Text = r.sec_libelle;
                            break;
                        default:
                            this.Text = "<!-- type de contenu " + r.sec_type_contenu + " non géré -->";
                            break;
                    }
                }
            }
        }


    }


    /// <summary>
    /// Panel (div) affiché si un emplacement SEO 
    /// a été renseigné dans le back-office.
    /// </summary>
    /// <remarks><para>Ce contrôle est destiné à être utilisé dans 
    /// un thème personnalisé pour définir un emplacement dont
    /// le contenu sera géré via un éditeur CMS dans le back-office.
    /// Pour plus d'information, consultez la documentation sur
    /// la personnalisation.</para>
    /// <para>Ce controle ajoute une div si l'emplacement SEO
    /// a été renseigné dans le back office, la div n'est pas
    /// ajoutée dans le cas contraire.</para>
    /// </remarks>
    public class SeoContentPanel : Panel
    {
        /// <summary>
        /// Constructeur par défaut
        /// </summary>
        public SeoContentPanel()
        {
            CodeEmplacement = "SEO";
        }

        /// <summary>
        /// Obtient ou définit un code d'emplacement 
        /// pour identifier la zone à afficher
        /// </summary>
        public string CodeEmplacement { get; set; }


        /// <summary>
        /// Effectue le calcul de pré-rendu du contrôle.
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            var url = Page.Request.Url.AbsolutePath;
            url = VirtualPathUtility.ToAppRelative(url);

            var sit = ECommerceServer.CurrentMiniSite;
            if (sit == null)
                sit = ECommerceServer.CurrentSite;

            var p = EServer.SharedCache.Get(sit, "_seo_content_for_pages_" + sit.Id) as SeoContenusDS;
            if (p == null)
            {
                p = new SeoBll(sit.RjsId).GetContenus(sit.Id, null, SeoBll.TypePageGenerique, null);
                EServer.SharedCache.Add(sit, "_seo_content_for_pages_" + sit.Id,
                    p, null, DateTime.Now.AddMinutes(5),
                        ECommerceCacheProvider.NoSlidingExpiration,
                        CacheItemPriority.High,
                        null);
            }

            var empls = ECommerceServer.DataCache.EmplacementsSEO;
            var rempl = (from z in empls.ecommerce_seo_emplacements
                         where z.sep_sit_pk == sit.Id
                            && z.sep_code.Equals(CodeEmplacement, StringComparison.InvariantCultureIgnoreCase)
                         select z).FirstOrDefault();
            if (rempl == null)
            {
                this.Visible = false;
            }
            else
            {
                var r = (from z in p.ecommerce_seo_contenus
                         where z.sec_sep_guid.Equals(rempl.sep_guid)
                         && z.sec_id_type.Equals("URL")
                         && z.sec_id_valeur.Equals(url, StringComparison.InvariantCultureIgnoreCase)
                         orderby z.sec_contenu_ordre
                         select z).FirstOrDefault();
                if (r == null)
                    this.Visible = false;
                else
                {
                    this.Visible = true;
                }
            }
        }
    }

}
