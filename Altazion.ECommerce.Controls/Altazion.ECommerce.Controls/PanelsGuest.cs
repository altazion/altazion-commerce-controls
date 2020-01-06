using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    public class PanelCacherSiGuest : Panel
    {
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            this.Visible = !ECommerceServer.Panier.EstGuest();
        }
    }

    public class PanelCacherSiNonGuest : Panel
    {
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            this.Visible = ECommerceServer.Panier.EstGuest();
        }
    }

}
