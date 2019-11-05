using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche un div si le mode de règlement <see cref="GuidModeReglement"/>
    /// est utilisé dans le paiement de la commande active
    /// </summary>
    public class PanelConditionnelReglement : Panel
    {
        public Guid GuidModeReglement { get; set; }
        [TypeConverter(typeof(GuidArrayConverter))]
        public Guid[] GuidModeReglementsAEviter { get; set; }


        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            bool b = ECommerceServer.Panier.VerifierSiReglementDuType(GuidModeReglement);

            if(GuidModeReglementsAEviter!=null)
            {
                foreach(Guid g in GuidModeReglementsAEviter)
                {
                    if (ECommerceServer.Panier.VerifierSiReglementDuType(g))
                        b = false;
                }
            }

            this.Visible = b;
        }
    }
}
