using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.Equihira.Common;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche un span avec le nom du site
    /// </summary>
    public class SiteNom : Label
    {
        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            SiteWeb st = ECommerceServer.CurrentMiniSite;
            if (st == null)
                st = ECommerceServer.CurrentSite;

            this.Text = st.Libelle;
        }
    }

    /// <summary>
    /// Affiche le n° de tel du service client
    /// </summary>
    /// <remarks><para>Ce controle permet d'afficher le numéro de téléphone
    /// du service client depuis les informations paramétrées dans les options
    /// du site.</para>
    /// <para>Il n'y a aucun formatage ou tag html entourant ce numéro et
    /// aucune vérification n'est faite sur sa validité : le contenu saisi
    /// dans le back-office est affiché sans aucun traitement</para>
    /// <para>Exemple d'utilisation : </para>
    /// <code>&lt;ecom:SiteServiceClientTelephone runat="server" /&gt;</code>
    /// </remarks>
    public class SiteServiceClientTelephone : Literal
    {
        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            SiteWeb st = ECommerceServer.CurrentMiniSite;
            if (st == null)
                st = ECommerceServer.CurrentSite;

            if (string.IsNullOrEmpty(st.TelephoneServiceClient))
                this.Visible = false;
            this.Text = st.TelephoneServiceClient;
        }
    }

    /// <summary>
    /// Affiche l'email du service client
    /// </summary>
    /// <remarks><para>Ce controle permet d'afficher l'e-mail
    /// du service client depuis les informations paramétrées dans les options
    /// du site.</para>
    /// <para>Il n'y a aucun formatage ou tag html entourant cet e-mail et
    /// aucune vérification n'est faite sur sa validité : le contenu saisi
    /// dans le back-office est affiché sans aucun traitement</para>
    /// <para>Exemple d'utilisation : </para>
    /// <code>&lt;ecom:SiteServiceClientEmail runat="server" /&gt;</code>
    ///</remarks>
    public class SiteServiceClientEmail : Literal
    {
        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            SiteWeb st = ECommerceServer.CurrentMiniSite;
            if (st == null)
                st = ECommerceServer.CurrentSite;

            if (string.IsNullOrEmpty(st.EmailServiceClient))
                this.Visible = false;

            this.Text = st.EmailServiceClient;
        }
    }

    /// <summary>
    /// Affiche l'email du service client sous forme d'un lien mailto:
    /// </summary>
    /// <remarks><para>Ce controle permet d'afficher l'e-mail
    /// du service client depuis les informations paramétrées dans les options
    /// du site.</para>
    /// <para>L'e-mail est placé dans une balise &lt;a&gt;. Par contre,
    /// aucune vérification n'est faite sur sa validité : le contenu saisi
    /// dans le back-office est affiché sans aucun traitement</para>
    /// <para>Exemple d'utilisation : </para>
    /// <code>&lt;ecom:SiteServiceClientEmailLink CssClass="tel-service-client" runat="server" /&gt;</code>
    /// <para>produira le code html suivant : </para>
    /// <code>&lt;a class="tel-service-client" href="mailto:serviceclient@altazion-demo.com"&gt;
    /// serviceclient@altazion-demo.com&lt;/a&gt;</code>
    ///</remarks>
    public class SiteServiceClientEmailLink : Hyperlink
    {
        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            SiteWeb st = ECommerceServer.CurrentMiniSite;
            if (st == null)
                st = ECommerceServer.CurrentSite;

            if (string.IsNullOrEmpty(st.EmailServiceClient))
                this.Visible = false;

            this.Text = st.EmailServiceClient;
            this.NavigateUrl = "mailto:" + st.EmailServiceClient;
        }
    }


    /// <summary>
    /// Affiche les horaires du service client
    /// </summary>
    /// <remarks><para>Ce controle permet d'afficher les horaires
    /// du service client depuis les informations paramétrées dans les options
    /// du site.</para>
    /// <para>Il n'y a aucun formatage ou tag html entourant ces horaires et
    /// aucune vérification n'est faite sur leur validité : le contenu saisi
    /// dans le back-office est affiché sans aucun traitement</para>
    /// <para>Exemple d'utilisation : </para>
    /// <code>&lt;ecom:SiteServiceClientHoraires runat="server" /&gt;</code>
    ///</remarks>
    public class SiteServiceClientHoraires : Literal
    {
        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            SiteWeb st = ECommerceServer.CurrentMiniSite;
            if (st == null)
                st = ECommerceServer.CurrentSite;

            if (string.IsNullOrEmpty(st.HorairesServiceClient))
                this.Visible = false;

            this.Text = st.HorairesServiceClient;
        }
    }

    /// <summary>
    /// Affiche un span avec le slogan du site
    /// </summary>
    public class SiteSlogan : Label
    {
        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            SiteWeb st = ECommerceServer.CurrentMiniSite;
            if (st == null)
                st = ECommerceServer.CurrentSite;
            if (string.IsNullOrEmpty(st.Description))
                this.Visible = false;
            this.Text = st.Description;
        }
    }

    /// <summary>
    /// Affiche un span avec l'url du site
    /// </summary>
    public class SiteHomeUrl : Label
    {
        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            SiteWeb st = ECommerceServer.CurrentMiniSite;
            if (st == null)
                st = ECommerceServer.CurrentSite;

            this.Text = st.UrlPrincipale;
        }
    }

    /// <summary>
    /// Affiche un lien avec pointant vers la home du site.
    /// </summary>
    public class SiteHomePageLink : Hyperlink
    {
        /// <summary>
        /// Raises the <see cref="E:PreRender" /> event.
        /// </summary>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            SiteWeb st = ECommerceServer.CurrentMiniSite;
            if (st == null)
                st = ECommerceServer.CurrentSite;

            this.NavigateUrl = st.UrlPrincipale;            
#if DEBUG

#endif
        }
    }


}
