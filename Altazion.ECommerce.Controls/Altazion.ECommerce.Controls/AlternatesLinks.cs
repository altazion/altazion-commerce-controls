using System;
using System.Collections;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Représente une alternative locale pour le contrôle
    /// <see cref="AlternatesLinks"/>
    /// </summary>
    public class AlternateLinkInfo
    {
        /// <summary>
        /// La langue (sous la forme du code de localisation
        /// xx-XX)
        /// </summary>
        /// <remarks>Par exemple, pour la france, utilisez fr-FR</remarks>
        public string Langue { get; set; }

        /// <summary>
        /// L'url racine du site correspondant
        /// </summary>
        public string UrlRacine { get; set; }
    }

    /// <summary>
    /// Ajoute des &lt;link ... /&gt; pour chaque 
    /// alternative de langue
    /// </summary>
    /// <remarks>
    /// <para>Les urls pointées par les balises link sont
    /// consituées de l'url racine correspondant à 
    /// chaque langue, complétée du path courant.</para>
    /// <para>Par exemple, pour l'url 
    /// https://demo.ecommerce-server.fr/produits/descente-categorie/page1.htm, 
    /// le contrôle suivant :</para>
    /// <code>
    /// &lt;ecom:AlternatesLinks runat="server"&gt;
    ///     &lt;Alternates&gt;
    ///         &lt;ecom:AlternateLinkInfo 
    ///             Langue="fr-fr" 
    ///             UrlRacine="https://demo.ecommerce-server.fr/" /&gt;
    ///         &lt;ecom:AlternateLinkInfo 
    ///             Langue="en-us-ch" 
    ///             UrlRacine="https://demo-us.ecommerce-server.com/" /&gt;
    ///     &lt;/Alternates&gt;
    /// &lt;/ecom:AlternatesLinks&gt;
    /// </code>
    /// <para>calculera les urls pour la version française et américaine sous la forme :</para>
    /// <code>&lt;link rel='alternate' hreflang='fr-fr' 
    ///    href='https://demo.ecommerce-server.fr/produits/descente-categorie/page1.htm' /&gt;
    /// &lt;link rel='alternate' hreflang='fr-ch' 
    ///    href='https://demo-us.ecommerce-server.com/produits/descente-categorie/page1.htm' /&gt;</code>
    /// </remarks>
    [ParseChildren(true, "Alternates")]
    public class AlternatesLinks : WebControl
    {
        /// <summary>
        /// Constructeur par défaut
        /// </summary>
        public AlternatesLinks()
        {
            Alternates = new ArrayList();
        }

        /// <summary>
        /// Obtient ou définit la liste des alternates sous forme d'une liste
        /// de <see cref="AlternateLinkInfo"/>
        /// </summary>
        /// <remarks>
        /// <para>En asp.net, vous pouvez inclure les différentes valeurs sous
        /// formes de "sous noeud" du contrôle, par exemple :</para>
        /// <code>
        /// &lt;ecom:AlternatesLinks runat="server"&gt;
        ///     &lt;Alternates&gt;
        ///         &lt;ecom:AlternateLinkInfo 
        ///             Langue="fr-fr" 
        ///             UrlRacine="https://demo.ecommerce-server.fr/" /&gt;
        ///         &lt;ecom:AlternateLinkInfo 
        ///             Langue="en-us-ch" 
        ///             UrlRacine="https://demo-us.ecommerce-server.com/" /&gt;
        ///     &lt;/Alternates&gt;
        /// &lt;/ecom:AlternatesLinks&gt;
        /// </code>
        /// </remarks>
        [PersistenceMode(PersistenceMode.InnerDefaultProperty)]
        public ArrayList Alternates { get; set; }


        /// <summary>
        /// Prend en charge l'évènement d'init
        /// </summary>
        /// <param name="e"></param>
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            if (Alternates == null || Alternates.Count == 0)
            {
                this.Visible = false;
                return;
            }

            Controls.Clear();
            var absUr = Page.Request.RawUrl;
            if (!absUr.StartsWith("/"))
                absUr = "/" + absUr;
            foreach (var tmp in Alternates)
            {
                var alt = tmp as AlternateLinkInfo;
                if (alt == null)
                    continue;
                var lit = new Literal();
                string url = alt.UrlRacine;
                if (url.EndsWith("/"))
                    url = url.Substring(0, url.Length - 1);
                url += absUr;
                lit.Text = string.Format("<link rel='alternate' hreflang='{0}' href='{1}' />", alt.Langue, url);
                this.Controls.Add(lit);
            }

        }

        /// <summary>
        /// Réalise l'affichage
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            RenderChildren(writer);
        }

    }
}
