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
    /// Affiche un span avec le n° de tel du service client
    /// </summary>
    public class SiteServiceClientTelephone : Label
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
    /// Affiche un span avec l'email du service client
    /// </summary>
    public class SiteServiceClientEmail : Label
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
    /// Affiche un span avec les horaires du service client
    /// </summary>
    public class SiteServiceClientHoraires : Label
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
