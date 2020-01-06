using CPointSoftware.Equihira.Business.Common;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche un link pointant vers la version
    /// canonique de l'url de la page si elle existe
    /// A utiliser dans le head, bien entendu.
    /// </summary>
    public class CanonicalLink : WebControl
    {
        /// <summary>
        /// Génère le rendu du contrôle via le writer HTML spécifié.
        /// </summary>
        /// <param name="writer">Objet <see cref="T:System.Web.UI.HtmlTextWriter" /> qui reçoit le contenu du contrôle.</param>
        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            ECommercePage pg = Page as ECommercePage;
            if (pg == null)
                return;

            string canon = pg.CanonicalUrl;


            if (!string.IsNullOrEmpty(canon))
            {

                var cfg = EConfigurationManager.GetConfig(ECommerceServer.CurrentSite);
                bool useAmp = cfg.ECommerce.UseAmpFramework;

#if DEBUG
                useAmp = true;
#endif
                string uPr = ECommerceServer.CurrentSite.UrlPrincipale;
                if (string.IsNullOrEmpty(uPr))
                    return;
                if (!uPr.EndsWith("/"))
                    uPr += "/";


                if (useAmp)
                {
                    string amp = canon;
                    if (canon.EndsWith("/"))
                        amp = amp + "default.amp";
                    else
                        amp = Path.ChangeExtension(amp, ".amp");
                    writer.Write("<link rel='amphtml' href='");
                    amp = amp.Replace("~/", uPr);
                    writer.Write(amp);
                    writer.Write("' />");
                }

                canon = canon.Replace("~/", uPr);
                writer.Write("<link rel='canonical' href='");
                writer.Write(canon);
                writer.Write("' />");
            }
        }
    }
}
