using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    public class PanierLivraisonCodePostalHidden : HiddenField
    {
        public PanierLivraisonCodePostalHidden()
        {
        }

        protected override void OnPreRender(EventArgs e)
        {
            this.Value = ECommerceServer.Panier.AdresseLivraisonCodePostal;
        }
    }


}
