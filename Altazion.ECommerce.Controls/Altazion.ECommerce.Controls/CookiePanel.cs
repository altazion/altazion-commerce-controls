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
    /// <summary>
    /// Panel (div) s'affichant jusqu'à ce qu'un cookie spécifique
    /// soit placé. Permet par exemple d'afficher les messages 
    /// légaux de gestion des infos personelles
    /// </summary>
    public class NoCookiePanel : Panel
    {
        /// <summary>
        /// Initialise une nouvelle instance de <see cref="NoCookiePanel" />
        /// </summary>
        public NoCookiePanel()
        {
            CookieName = "Avertissement_cookies";
        }

        /// <summary>
        /// Obtient ou définit le nom du cookie à vérifier
        /// </summary>
        public string CookieName { get; set; }

        /// <summary>
        /// Effectue le pré-rendu du contrôle
        /// </summary>
        /// <param name="e"></param>
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

        /// <summary>
        /// Ajoute le script de gestion de la visibilité après le tag de
        /// fin du panel
        /// </summary>
        /// <param name="writer"></param>
        public override void RenderEndTag(HtmlTextWriter writer)
        {
            base.RenderEndTag(writer);
            writer.Write("<script type='text/javascript'>$(document).ready(function() {");
            writer.Write("E.checkCookieForPanel('#" + this.ClientID + "', true)");
            writer.Write("});</script>");
        }
    }

    /// <summary>
    /// Lien (a) définissant une valeur d'un cookie coté client
    /// lorsqu'il est cliqué
    /// </summary>
    public class SetCookieLink : System.Web.UI.HtmlControls.HtmlAnchor
    {
        /// <summary>
        /// Initialise une nouvelle instance de <see cref="SetCookieLink" />
        /// </summary>
        public SetCookieLink()
        {
            CookieName = "Avertissement_cookies";
            CookieValueToSet = "true";
        }

        /// <summary>
        /// Obtient ou définit le nom du cookie à vérifier
        /// </summary>
        public string CookieName { get; set; }

        /// <summary>
        /// Obtient ou définit la valeur à affecter au
        /// cookie
        /// </summary>
        public string CookieValueToSet { get; set; }

        /// <summary>
        /// Effectue le pré-rendu du contrôle
        /// </summary>
        /// <param name="e"></param>
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
