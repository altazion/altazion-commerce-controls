using CPointSoftware.ECommerce.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Altazion.ECommerce.Controls
{
    public class EvenementCrossCanalTitle : Literal
    {
        public EvenementCrossCanalTitle()
        {
            Format = "{0}";
        }
        public string Format { get; set; }
        public Guid EventGuid { get; set; }

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

    public class EvenementCrossCanalDescription : Literal
    {
        public EvenementCrossCanalDescription()
        {
            Format = "{0}";
        }

        public string Format { get; set; }
        public Guid EventGuid { get; set; }

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
