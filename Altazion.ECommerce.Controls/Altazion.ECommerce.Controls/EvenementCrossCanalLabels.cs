using CPointSoftware.ECommerce.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Controle (sans tag) affichant le libellé d'un évènement
    /// cross canal
    /// </summary>
    public class EvenementCrossCanalTitle : Literal
    {
        /// <summary>
        /// Initialise une nouvelle instance de <see cref="EvenementCrossCanalTitle" />
        /// </summary>
        public EvenementCrossCanalTitle()
        {
            Format = "{0}";
        }

        /// <summary>
        /// Obtient ou définit le format d'affichage du titre
        /// </summary>
        /// <example><h1>{0}</h1></example>
        public string Format { get; set; }

        /// <summary>
        /// Obtient ou définit l'identifiant de l'évènement crosscanal
        /// </summary>
        public Guid EventGuid { get; set; }


        /// <summary>
        /// Effectue le pré-rendu en récupérant les informations de
        /// l'évènement
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (EventGuid.Equals(Guid.Empty))
                this.Visible = false;
            else
            {
                var evt = (from z in ECommerceServer.DataCache.EvenementsCrossCanaux.clicknmortar_evenements_crosscanaux
                           where z.evc_guid.Equals(EventGuid)
                           select z).FirstOrDefault();
                if (evt == null)
                    this.Visible = false;
                else
                {
                    string fmt = Format;
                    if (string.IsNullOrEmpty(fmt)) fmt = "{0}";
                    this.Text = string.Format(fmt, evt.evc_libelle);
                }
            }
        }
    }


    /// <summary>
    /// Controle (sans tag) affichant la description (publique) d'un évènement
    /// cross canal
    /// </summary>
    public class EvenementCrossCanalDescription : Literal
    {
        /// <summary>
        /// Initialise une nouvelle instance de <see cref="EvenementCrossCanalDescription" />
        /// </summary>
        public EvenementCrossCanalDescription()
        {
            Format = "{0}";
        }

        /// <summary>
        /// Obtient ou définit le format d'affichage du contenu
        /// </summary>
        /// <example><p>{0}</p></example>
        public string Format { get; set; }

        /// <summary>
        /// Obtient ou définit l'identifiant de l'évènement crosscanal
        /// </summary>
        public Guid EventGuid { get; set; }

        /// <summary>
        /// Effectue le pré-rendu en récupérant les informations de
        /// l'évènement
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            if (EventGuid.Equals(Guid.Empty))
                this.Visible = false;
            else
            {
                var evt = (from z in ECommerceServer.DataCache.EvenementsCrossCanaux.clicknmortar_evenements_crosscanaux
                           where z.evc_guid.Equals(EventGuid)
                           select z).FirstOrDefault();
                if(evt==null)
                    this.Visible = false;
                else
                {
                    string fmt = Format;
                    if (string.IsNullOrEmpty(fmt)) fmt = "{0}";
                    this.Text = string.Format(fmt, evt.Isevc_messageNull() ? "" : evt.evc_message);
                }
            }

        }
    }

}
