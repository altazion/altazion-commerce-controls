using CPointSoftware.Equihira.Business.ECommerce.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche le nom de l'utilisateur/client ayant laissé l'avis.
    /// </summary>
    /// <remarks>Ce contrôle devrait être placé dans un conteneur bindé sur 
    /// la table <c>ecommerce_avis</c> tel que <see cref="ProduitAvisPanel"/> 
    /// ou le contrôle personnalisé <code>AvisAffichage.ascx</code></remarks>

    public class AvisNom : Label, IEquihiraBindable
    {
        /// <summary>
        /// Binde les données de contexte sur le contrôle (<see cref="IEquihiraBindable"/>)
        /// </summary>
        /// <param name="o">L'objet de donné à afficher</param>
        public void BindTo(object o)
        {
            if(o is AvisDS.ecommerce_avisRow)
            {
                var r = o as AvisDS.ecommerce_avisRow;
                this.Text = r.Isavi_nomNull() ? "" : r.avi_nom;
            }
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            BindTo(this.GetBoundObject());
        }
    }

    /// <summary>
    /// Affiche la date (de validation) de l'avis.
    /// </summary>
    /// <remarks>Ce contrôle devrait être placé dans un conteneur bindé sur 
    /// la table <c>ecommerce_avis</c> tel que <see cref="ProduitAvisPanel"/> 
    /// ou le contrôle personnalisé <code>AvisAffichage.ascx</code></remarks>

    public class AvisDate : Label, IEquihiraBindable
    {
        /// <summary>
        /// Initialise une nouvelle instancce de <see cref="AvisDate" />
        /// </summary>
        public AvisDate()
        {
            Format = "{0:dd/MM/yyyy}";
        }

        /// <summary>
        /// Obtient ou définit le format de la date sous la forme
        /// {0:dd/MM/yyyy} (valeur par défaut)
        /// </summary>
        public string Format { get; set; }


        /// <summary>
        /// Binde les données de contexte sur le contrôle (<see cref="IEquihiraBindable"/>)
        /// </summary>
        /// <param name="o">L'objet de donné à afficher</param>
        public void BindTo(object o)
        {
            if (o is AvisDS.ecommerce_avisRow)
            {
                var r = o as AvisDS.ecommerce_avisRow;
                this.Text = r.Isavi_date_validationNull() ? "" : (string.Format(Format, r.avi_date_validation));
            }
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            BindTo(this.GetBoundObject());
        }
    }

    /// <summary>
    /// Affiche la note associé à l'avis.
    /// </summary>
    /// <remarks>Ce contrôle devrait être placé dans un conteneur bindé sur 
    /// la table <c>ecommerce_avis</c> tel que <see cref="ProduitAvisPanel"/> 
    /// ou le contrôle personnalisé <code>AvisAffichage.ascx</code></remarks>


    public class AvisNote : ProduitAvis, IEquihiraBindable
    {
        /// <summary>
        /// Binde les données de contexte sur le contrôle (<see cref="IEquihiraBindable"/>)
        /// </summary>
        /// <param name="o">L'objet de donné à afficher</param>
        public void BindTo(object o)
        {
            if (o is AvisDS.ecommerce_avisRow)
            {
                var r = o as AvisDS.ecommerce_avisRow;
                this.Note = r.avi_note;
            }
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            BindTo(this.GetBoundObject());
        }
    }

    /// <summary>
    /// Affiche le contenu de l'avis.
    /// </summary>
    /// <remarks>Ce contrôle devrait être placé dans un conteneur bindé sur 
    /// la table <c>ecommerce_avis</c> tel que <see cref="ProduitAvisPanel"/> 
    /// ou le contrôle personnalisé <code>AvisAffichage.ascx</code></remarks>

    public class AvisMessage : Label, IEquihiraBindable
    {
        /// <summary>
        /// Binde les données de contexte sur le contrôle (<see cref="IEquihiraBindable"/>)
        /// </summary>
        /// <param name="o">L'objet de donné à afficher</param>
        public void BindTo(object o)
        {
            if (o is AvisDS.ecommerce_avisRow)
            {
                var r = o as AvisDS.ecommerce_avisRow;
                this.Text = r.avi_message;
            }
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            BindTo(this.GetBoundObject());
        }
    }
}
