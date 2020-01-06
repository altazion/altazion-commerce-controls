using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CPointSoftware.Equihira.Common.Sys;
using CPointSoftware.Equihira.Business.Common;
using System.Web.UI.WebControls;
using CPointSoftware.Equihira.Common;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche un lien pointant vers la home des pages
    /// magasins si le module est actif
    /// </summary>
    public class ClickNMortarHomeLink : Hyperlink
    {
        public ClickNMortarHomeLink()
        {
            ServerConfigSection s = EConfigurationManager.GetConfig(ECommerceServer.CurrentSite);
            if (!s.ECommerce.ClickNMortar.Enabled)
                this.Visible = false;
            else
                this.NavigateUrl = s.ECommerce.ClickNMortar.RootPagePath;
        }


        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            ServerConfigSection s = EConfigurationManager.GetConfig(ECommerceServer.CurrentSite);
            if (!s.ECommerce.ClickNMortar.Enabled)
                this.Visible = false;
        }
    }

    public class TousLesMagasinsListeHiddenField : HiddenField
    {
        public class MagasinClicknMortarAvecUrl : MagasinClicknMortar
        {
            public string Url { get; set; }
        }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            var ds = ECommerceServer.DataCache.Magasins;
            List<MagasinClicknMortar> ret = new List<MagasinClicknMortar>();

            var sit = ECommerceServer.CurrentSite;


            foreach(var r in ds.clicknmortar_magasins)
            {
                if (r.mag_est_archive)
                    continue;

                if (sit != null && sit.DefaultPaysPk != null && !sit.DefaultPaysPk.Equals(r.mag_pay_pk))
                    continue;

                var dt = MagasinClicknMortarAvecUrl.FromData<MagasinClicknMortarAvecUrl>(r);
                try
                {
                    dt.Url = ECommerceServer.Magasins.GetDetailUrl(r.mag_guid,
                        r.mag_zone,
                        r.mag_cp,
                        r.mag_ville,
                        r.Ismag_codeNull() ? null : r.mag_code).Replace("~/", "/");
                }
                catch
                {
                    dt.Url = "/magasins/details.htm?mag_guid=" + r.mag_guid;
                }
                ret.Add(dt);

            }
            this.Value = JsonHelper.Serialize(ret);
        }
    }
}

