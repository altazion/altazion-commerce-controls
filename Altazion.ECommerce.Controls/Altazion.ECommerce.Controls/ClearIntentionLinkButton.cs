using System;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Contrôle de type "lien" permettant de retirer toutes
    /// les intentions de règlements associés au panier
    /// </summary>
    /// <remarks>
    /// <para>Destiné à permettre de réactiver un panier qui aurait été bloqué
    /// lors de la création d'un règlement (par exemple lors de l'envoi
    /// vers une plateforme de paiement externe)
    /// </para>
    /// <para>Utilisation : </para>
    /// <para><code>
    ///     &lt;ecom:ClearIntentionLinkButton runat="server" 
    ///         CssClass="btn retour" 
    ///         RedirectTo="~/exec/panier.aspx"&gt; Retour au panier &lt;/ecom:ClearIntentionLinkButton&gt;
    /// </code></para>
    /// <para>Ce contrôle est affiché sous la forme d'un lien 
    /// <code>&lt;a href='javascript....'&gt;[votre contenu]&lt;/a&gt;</code></para>
    /// </remarks>
    /// <seealso cref="" />
    public class ClearIntentionLinkButton : LinkButton
    {
        /// <summary>
        /// Obtient ou définit l'url vers laquelle rediriger
        /// l'utlisateur après retrait des intentions de règlement
        /// </summary>
        public string RedirectTo { get; set; }


        /// <summary>
        /// Traite l'évènement Init du contrôle
        /// </summary>
        /// <param name="e"></param>
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            Click += new EventHandler(OnClick);
        }

        private void OnClick(Object sender, EventArgs e)
        {
            ((SessionCartProvider)ECommerceServer.Panier).RetirerTousLesReglements();

            if (!string.IsNullOrEmpty(RedirectTo))
                Page.Response.Redirect(RedirectTo);
        }
    }
}
