using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    public class PanierNomLivraison : Label
    {
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);


            var prv = ECommerceServer.Panier;
            this.Text = prv.GetNomLivraison();
        }
    }
}
