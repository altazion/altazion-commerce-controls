using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using CPointSoftware.Equihira.Business.Catalogue.Data;
using CPointSoftware.Equihira.Business.ECommerce;
using CPointSoftware.Equihira.Business.ECommerce.Data;
using System.Web.UI.WebControls;
using System.Web.UI;
using CPointSoftware.Equihira.Extensibility;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche un lien vers la page de recherche
    /// pour une marque donnée ou vers le site de la marque
    /// </summary>
    /// <remarks>Vous pouvez utiliser ce contrôle dans les
    /// éléments qui affichent une marque :
    /// <list type="bullet">
    /// <item><description>Un <see cref="ProductPanel"/> :
    /// dans ce cas, la marque de l'article sera prise en
    /// compte</description></item>
    /// <item><description>Une descente produit correspondant à
    /// une marque, pour en faire, par exemple, un entête de page
    /// </description></item>
    /// <item><description>Un <see cref="RechercheCritereLabel"/> ou
    /// dans le contrôle RechercheCritereMarque.ascx : 
    /// pour afficher la marque d'un critère (d'un facet) de recherche
    /// </description></item>
    /// <item><description>Un contrôle dont la source de données
    /// serait un <see cref="MarquesSource" />
    /// </description></item>
    /// <item><description>ou tout contrôle personnalisé qui effecturait
    /// un databinding sur la table catalog_marques.
    /// </description></item>
    /// </list></remarks>
    public class MarqueLink : Hyperlink, IEquihiraBindable
    {

        /// <summary>
        /// Represente le type de lien
        /// </summary>
        public enum TypeMarqueLink
        {
            /// <summary>
            /// Un lien vers la descente produit
            /// correspondant à la marque
            /// </summary>
            MoteurDeRecherche,
            /// <summary>
            /// Un lien vers le site externe 
            /// de la marque
            /// </summary>
            SiteWeb,
            /// <summary>
            /// Un lien vers la page perso si il y en 
            /// a une de renseignée ou vers le moteur
            /// si ce n'est pas le cas
            /// </summary>
            PagePersoOuMoteur
        }

        /// <summary>
        /// Obtient ou définit le format d'affichage 
        /// du lien, où {0} représente le nom de la marque
        /// </summary>
        public string TextFormat { get; set; }


        /// <summary>
        /// Obtient ou définit le type de lien à 
        /// établir
        /// </summary>
        /// <remarks>
        /// Utilisez <see cref="TypeMarqueLink.MoteurDeRecherche"/>
        /// pour un lien vers une page de descente produit interne ou
        /// <see cref="TypeMarqueLink.SiteWeb"/> pour pointer vers
        /// le site de la marque si il est renseigné</remarks>
        public TypeMarqueLink TypeLien { get; set; }

        /// <summary>
        /// Constructeur par défaut
        /// </summary>
        public MarqueLink()
        {
            TypeLien = TypeMarqueLink.MoteurDeRecherche;
        }

        /// <summary>
        /// Effectue le databinding vers l'objet de données
        /// </summary>
        public override void DataBind()
        {
            base.DataBind();

            object o = this.GetBoundObject();
            BindTo(o);
        }

        #region IEquihiraBindable Members
        /// <summary>
        /// Effectue le databinding vers l'objet de données
        /// </summary>
        public virtual void BindTo(object o)
        {
            if (o == null) return;
            if (o is MarquesDS.catalog_marquesRow)
            {
                MarquesDS.catalog_marquesRow r = o as MarquesDS.catalog_marquesRow;
                if (!string.IsNullOrEmpty(TextFormat))
                    this.Text = string.Format(TextFormat, r.mar_libelle);
                else
                    this.Text = r.mar_libelle;
                switch (TypeLien)
                {
                    case TypeMarqueLink.PagePersoOuMoteur:
                        try
                        {
                            if(r.Table.Columns.Contains("mar_url_redirection") && !r.IsNull("mar_url_redirection"))
                            {
                                this.NavigateUrl = ResolveUrl(r["mar_url_redirection"] as string);
                            }
                        }
                        catch
                        {
                            goto case TypeMarqueLink.MoteurDeRecherche;
                        }
                        break;
                    case TypeMarqueLink.MoteurDeRecherche:
                        this.NavigateUrl = ECommerceServer.Contexte.GetSearchPagePath(-1,
                            Guid.Empty,
                            r.mar_pk,
                            null,
                            null,
                            true);
                        break;
                    case TypeMarqueLink.SiteWeb:
                        break;
                }
            }
            else if (o is RechercheMarque)
            {
                RechercheMarque r = o as RechercheMarque;
                if (!string.IsNullOrEmpty(TextFormat))
                    this.Text = string.Format(TextFormat, r.Label);
                else
                    this.Text = r.Label;
                this.NavigateUrl = ECommerceServer.Contexte.GetSearchPagePath(-1,
                    Guid.Empty,
                    r.Id,
                    null,
                    null,
                    true);
            }
            else if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                if (res.Marque != null && res.Marque.catalog_marques.Count == 1)
                {
                    MarquesDS.catalog_marquesRow r = res.Marque.catalog_marques[0];
                    if (!string.IsNullOrEmpty(TextFormat))
                        this.Text = string.Format(TextFormat, r.mar_libelle);
                    else
                        this.Text = r.mar_libelle;
                    this.NavigateUrl = ECommerceServer.Contexte.GetSearchPagePath(-1,
                        Guid.Empty,
                        r.mar_pk,
                        null, null, true);
                }
                else
                    this.Visible = false;
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                ContexteProvider prv = ECommerceServer.Contexte;
            }
        }

        #endregion

    }

    /// <summary>
    /// Affiche un span avec la description de la marque
    /// </summary>
    /// <remarks>Vous pouvez utiliser ce contrôle dans les
    /// éléments qui affichent une marque :
    /// <list type="bullet">
    /// <item><description>Un <see cref="ProductPanel"/> :
    /// dans ce cas, la marque de l'article sera prise en
    /// compte</description></item>
    /// <item><description>Une descente produit correspondant à
    /// une marque, pour en faire, par exemple, un entête de page
    /// </description></item>
    /// <item><description>Un contrôle dont la source de données
    /// serait un <see cref="MarquesSource" />
    /// </description></item>
    /// <item><description>ou tout contrôle personnalisé qui effecturait
    /// un databinding sur la table catalog_marques.
    /// </description></item>
    /// </list></remarks>
    public class MarqueDescription : System.Web.UI.WebControls.Label, IEquihiraBindable
    {
        /// <summary>
        /// Obtient ou définit le format d'affichage 
        /// du lien, où {0} représente le nom de la marque
        /// </summary>
        /// <remarks>Ne pas renseigner ce champ pour
        /// afficher le contenu de la description sans
        /// modifications</remarks>
        public string TextFormat { get; set; }

        /// <summary>
        /// Effectue le databinding vers l'objet de données
        /// </summary>
        public override void DataBind()
        {
            base.DataBind();

            object o = this.GetBoundObject();
            BindTo(o);
        }

        #region IEquihiraBindable Members
        /// <summary>
        /// Effectue le databinding vers l'objet de données
        /// </summary>
        public virtual void BindTo(object o)
        {
            if (o == null) return;
            if (o is MarquesDS.catalog_marquesRow)
            {
                MarquesDS.catalog_marquesRow r = o as MarquesDS.catalog_marquesRow;
                if (r.Ismar_commentaire_publicNull())
                    return;
                if (!string.IsNullOrEmpty(TextFormat))
                    this.Text = string.Format(TextFormat, r.mar_commentaire_public);
                else
                    this.Text = r.mar_commentaire_public;
            }
            else if (o is RechercheMarque)
            {
                this.Visible = false;
            }
            else if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                if (res.Marque != null && res.Marque.catalog_marques.Count == 1)
                {
                    MarquesDS.catalog_marquesRow r = res.Marque.catalog_marques[0];
                    if (r.Ismar_commentaire_publicNull())
                        return;
                    if (!string.IsNullOrEmpty(TextFormat))
                        this.Text = string.Format(TextFormat, r.mar_commentaire_public);
                    else
                        this.Text = r.mar_commentaire_public;
                }
                else
                    this.Visible = false;
            }
            else if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;
                MarquesDS.catalog_marquesRow mar = ECommerceServer.DataCache.Marques.catalog_marques.FindBymar_pk(r.art_mar_pk);
                BindTo(mar);
            }
        }

        #endregion

    }

    /// <summary>
    /// Affiche un div si le conteneur englobant ce controle
    /// affiche une marque, un produit ayant une marque ou un résultat
    /// de recherche spécifique à une marque.
    /// </summary>
    /// <remarks>Vous pouvez utiliser ce contrôle dans les
    /// éléments qui affichent une marque :
    /// <list type="bullet">
    /// <item><description>Un <see cref="ProductPanel"/> :
    /// dans ce cas, la marque de l'article sera prise en
    /// compte</description></item>
    /// <item><description>Une descente produit correspondant à
    /// une marque, pour en faire, par exemple, un entête de page
    /// </description></item>
    /// <item><description>Un contrôle dont la source de données
    /// serait un <see cref="MarquesSource" />
    /// </description></item>
    /// </list></remarks>
    public class MarquePanel : Panel, IEquihiraBindable
    {
        #region IEquihiraBindable Members
        /// <summary>
        /// Effectue le databinding vers l'objet de données
        /// </summary>
        public void BindTo(object o)
        {
            this.Visible = false;
            foreach (Control c in Controls)
            {
                if (c is IEquihiraBindable)
                    (c as IEquihiraBindable).BindTo(o);
            }
            if (o == null)
                return;

            if (o is MarquesDS.catalog_marquesRow)
            {
                MarquesDS.catalog_marquesRow r = o as MarquesDS.catalog_marquesRow;
                if (!r.Ismar_commentaire_publicNull())
                    this.Visible = true;
                else if (!r.Ismar_url_imageNull())
                    this.Visible = true;
                else if (!r.Ismar_url_site_marqueNull())
                    this.Visible = true;
            }
            else if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                if (res.Marque != null && res.Marque.catalog_marques.Count == 1)
                {
                    BindTo(res.Marque.catalog_marques[0]);
                }
            }
            else if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;
                MarquesDS.catalog_marquesRow mar = ECommerceServer.DataCache.Marques.catalog_marques.FindBymar_pk(r.art_mar_pk);
                BindTo(mar);
            }
        }

        #endregion
    }

}
