using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CPointSoftware.Equihira.Business.ECommerce.Data;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Active une adresse en tant qu'adresse de livraison/facturation
    /// pour la commande
    /// </summary>
    /// <remarks>
    /// Vous devez préciser le <see cref="TypeAdresse"/> et le <see cref="AdresseGuid"/>.
    /// </remarks>
    public class AdresseChoisirLink : LinkButton
    {
        /// <summary>
        /// Obtient ou définit le type d'adresse qui sera remplacée par
        /// celle associée à ce contrôle.
        /// </summary>
        /// <remarks>Si vous passez <c>AdresseLivraison</c>, l'adresse de livraison
        /// du panier sera mise à jour, <c>AdresseFacturation</c>modifiera l'adresse de facturation et 
        /// si il n'y a pas d'adresse de livraison selectionnée, l'adresse de livraison</remarks>
        public AdresseSelectionKind TypeAdresse { get; set; }

        /// <summary>
        /// Obtient ou définit le Guid de l'adresse à sélectionner
        /// </summary>
        public Guid AdresseGuid {
            get
            {
                object o = ViewState["AdresseGuid"];
                if (o == null)
                    return Guid.Empty;
                return (Guid)o;
            } 
            set
            {

                if (AdresseGuid != value)
                {
                    ViewState["AdresseGuid"] = value;
                }
            }
        }

        /// <summary>
        /// Lie une source de données au contrôle serveur appelé et à tous ses contrôles enfants.
        /// </summary>
        public override void DataBind()
        {
            base.DataBind();
            object o = this.GetBoundObject();
            if (o != null && o is AdressesDS.ecommerce_adressesRow)
            {
                AdressesDS.ecommerce_adressesRow r = o as AdressesDS.ecommerce_adressesRow;
                if (TypeAdresse == AdresseSelectionKind.AdresseFacturation
                    && !r.adr_est_facturation)
                {
                    this.Visible = false;
                }

                AdresseGuid = r.adr_guid;
            }
        }
    }
}
