using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    public class PanelConditionnelLivraison : Panel
    {
        public PanelConditionnelLivraison()
        {
            AfficherSiPointLivraison = true;
            AfficherSiNonPointLivraison = true;
        }

        public bool AfficherSiSansLivraison { get; set; }
        public bool AfficherSiPointLivraison { get; set; }
        public bool AfficherSiNonPointLivraison { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            var fp = ECommerceServer.Panier.FraisPort;
            if(fp==null)
            {
                this.Visible = AfficherSiSansLivraison;
            }
            else if(fp.PointsLivraison)
            {
                this.Visible = AfficherSiPointLivraison;
            }
            else
            {
                this.Visible = AfficherSiNonPointLivraison;
            }

        }
    }
}
