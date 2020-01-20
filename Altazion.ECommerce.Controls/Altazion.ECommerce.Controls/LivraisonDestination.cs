using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.Equihira.Business.Common.Data;
using CPointSoftware.Framework.Errors;
using System.Web;
using CPointSoftware.Equihira.Business.Common.Errors;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche dans un span le CP et pays de livraison
    /// actuellement selectionné dans le panier
    /// </summary>
    public class LivraisonDestination : Label
    {
        public LivraisonDestination()
        {
            Format = "{cp} - {pays}";
        }

        public string LabelIfEmpty { get; set; }
        public string Format { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            PanierProvider prv = ECommerceServer.Panier;

            if(!string.IsNullOrEmpty(LabelIfEmpty) &&(string.IsNullOrEmpty(prv.AdresseLivraisonCodePays) || string.IsNullOrEmpty(prv.AdresseLivraisonCodePostal) || (prv.AdresseLivraisonCodePays.Equals(ECommerceServer.CurrentSite.DefaultPaysPk) && prv.AdresseLivraisonCodePostal.Equals(ECommerceServer.CurrentSite.DefaultCP))))
            {
                this.Text = LabelIfEmpty;
            }
            else
            {
                string fmt = Convert(Format);
                string pay = prv.AdresseLivraisonCodePays;
                PaysDS.params_paysRow r = ECommerceServer.DataCache.Pays.params_pays.FindBypay_pk(pay);
                if (r != null)
                    this.Text = string.Format(fmt, prv.AdresseLivraisonCodePostal, r.pay_libelle);
                else
                    throw new BusinessException("Le pays " + pay + " est inconnu !") { ErrorCode = ErrorCodes.AdresseDonneeInvalide };
            }
        }

        private string Convert(string format)
        {
            format = format.Replace("{cp", "{0").Replace("{pays", "{1");
            format = format.Replace("{zip", "{0").Replace("{country", "{1");
            return format;
        }
    }

    /// <summary>
    /// [obsolete]
    /// </summary>
    public class LivraisonChangerDestinationLink : WebControl
    {
        public LivraisonChangerDestinationLink()
        {
            if (!ECommerceServer.Panier.AdresseLivraisonGuid.Equals(Guid.Empty))
                this.Visible = false;
        }

        public string Text { get; set; }

        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            writer.Write("<a href='#' id='");
            writer.Write(this.ClientID);
            if (!string.IsNullOrEmpty(CssClass))
            {
                writer.Write("' class='");
                writer.Write(CssClass);
            }
            if (Style.Count > 0)
            {
                writer.Write("' style='");
                writer.Write(Style);
            }
            if (Attributes.Count > 0)
            {
                writer.Write("'");
                Attributes.Render(writer);
                writer.Write("'");
            }

            writer.Write("'>");
            writer.Write(HttpUtility.HtmlEncode(Text));
            writer.WriteLine("</a>");

        writer.WriteLine("<script language='javascript' type='text/javascript'>");
        writer.Write(" E.RegisterPanierPopupDialogLink('#");
        writer.Write(ClientID);
        writer.WriteLine("');");
        writer.WriteLine("</script>");

        }
    }
}
