using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.Equihira.Business.ECommerce;
using CPointSoftware.Equihira.Business.ECommerce.Data;
using CPointSoftware.Equihira.Business.Logistique;
using CPointSoftware.Equihira.Business.Logistique.Data;
using System.ComponentModel;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Ce panel (div) est un conteneur d'adresse
    /// et s'affichera si nécessaire en fonction du type d'affichage
    /// </summary>
    /// <remarks>
    /// Les différents types d'affichages sont :
    /// <list type="bullet">
    /// <item><term>ToutLeTemps</term> <description>Le panel s'affichera tout le temps</description></item>
    /// <item><term>UniquementSiDifferentes</term> <description>Le panel s'affichera uniquement si l'adresse de facturation
    /// et l'adresse de livraison sont différentes</description></item>
    /// <item><term>UniquementSiIdentiques</term> <description>Le panel s'affichera uniquement si l'adresse de facturation
    /// est aussi l'adresse de livraison</description></item>
    /// </list>
    /// </remarks>
    public class AdressePanel : Panel
    {
        /// <summary>
        /// Initialise une instance de <see cref="AdressePanel"/>.
        /// </summary>
        public AdressePanel()
        {
            
        }
        /// <summary>
        /// Conditions d'affichage de l'adresse
        /// </summary>
        public enum TypeAffichageAdresses
        {
            /// <summary>
            /// Le panel s'affichera tout le temps
            /// </summary>
            ToutLeTemps,
            /// <summary>
            /// Le panel s'affichera uniquement si l'adresse de facturation
            /// et l'adresse de livraison sont différentes
            /// </summary>
            UniquementSiDifferentes,
            /// <summary>
            /// Le panel s'affichera uniquement si l'adresse de facturation
            /// est aussi l'adresse de livraison
            /// </summary>
            UniquementSiIdentiques
        }

        /// <summary>
        /// Obtient ou définit les conditions d'affichage de l'adresse
        /// </summary>
        public TypeAffichageAdresses TypeAffichage { get; set; }

        /// <summary>
        /// Obtient ou définit un booléen précisant si le panel
        /// s'affiche en cas de point relais
        /// </summary>
        /// <remarks>
        /// Utilisez : true pour n'afficher qu'en cas de point relai,
        /// false pour n'afficher qu'en cas de livraison domicile
        /// ou null (ne pas mettre l'attribut) pour s'afficher 
        /// dans tous les cas</remarks>
        public bool? AfficherSiPointRelais { get; set; }

        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.Load" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            PanierProvider prv = ECommerceServer.Panier;

            if(AfficherSiPointRelais.HasValue)
            {
                if(prv.FraisPort!=null)
                {
                    if (prv.FraisPort.PointsLivraison != AfficherSiPointRelais.Value)
                        this.Visible = false;
                }
            }

            if (TypeAffichage == TypeAffichageAdresses.UniquementSiDifferentes)
            {
                if (prv.AdresseFacturationGuid.Equals(prv.AdresseLivraisonGuid))
                    this.Visible = false;
            }
            else if (TypeAffichage == TypeAffichageAdresses.UniquementSiIdentiques)
            {
                if (!prv.AdresseFacturationGuid.Equals(prv.AdresseLivraisonGuid))
                    this.Visible = false;
            }

        }
    }
}
