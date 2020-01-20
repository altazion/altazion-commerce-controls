using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Datalist pouvant être bindé sur un <see cref="PanierSourceControl"/>
    /// </summary>
    public class PanierProduitsDataList : DataList
    {

    }

    /// <summary>
    /// GriVview pouvant être bindé sur un <see cref="PanierSourceControl"/>
    /// </summary>
    public class PanierProduitsGrid : GridView
    {
        /// <summary>
        /// Levé lorsque les données ont été modifiées
        /// </summary>
        /// <remarks>Cet événement n'est lancé que sur le thread
        /// qui a procédé à la modification. Il ne peut donc servir
        /// à vérifier que le panier est modifié de façon certaine : 
        /// par exemple, si votre site utilise plusieurs worker process, les modifications
        /// apportés dans l'un de ceux-ci ne seront pas signalé dans l'autre.</remarks>
        public event EventHandler DataUpdated;

        internal void OnDataUpdated(/* add parameters here*/)
        {
            EventHandler evt = DataUpdated;
            if (evt != null)
            {
                EventArgs args = new EventArgs();
                /* change args fields/property here */
                evt(this, args);
            }
        }

        /// <summary>
        /// Obtient ou définit une valeur indicant si on doit omettre le table &lt;table&gt;
        /// </summary>
        /// <value>
        /// Si <c>true</c> le tag table ne sera pas créé par cette gridview.
        /// </value>
        public bool RenderWithNoTableTag { get; set; }

        /// <summary>
        /// Génère le rendu du contenu du contrôle serveur Web via le navigateur du client à l'aide de l'objet <see cref="T:System.Web.UI.HtmlTextWriter" /> spécifié.
        /// </summary>
        /// <param name="writer"><see cref="T:System.Web.UI.HtmlTextWriter" /> utilisé pour afficher le contenu du contrôle serveur sur le navigateur du client.</param>
        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {

            if (RenderWithNoTableTag)
            {
                System.IO.StringWriter sw = new System.IO.StringWriter();
                System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(sw);
                base.Render(hw);
                hw.Flush();
                hw.Close();
                string origTag = sw.ToString();
                string newTag = origTag.Substring(origTag.IndexOf("<tr"), origTag.LastIndexOf("</tr>") + 5 - origTag.IndexOf("<tr"));
                writer.Write(newTag);
            }
            else
                base.Render(writer);


        }

        /// <summary>
        /// Génère le rendu de la balise d'ouverture HTML du contrôle via le writer spécifié. Cette méthode est principalement utilisée par des développeurs de contrôles.
        /// </summary>
        /// <param name="writer"><see cref="T:System.Web.UI.HtmlTextWriter" /> qui représente le flux de sortie utilisé pour rendre le contenu HTML sur le client.</param>
        public override void RenderBeginTag(System.Web.UI.HtmlTextWriter writer)
        {
            if(!RenderWithNoTableTag)
                base.RenderBeginTag(writer);
        }

        /// <summary>
        /// Génère le rendu de la balise de fermeture HTML du contrôle via le writer spécifié. Cette méthode est principalement utilisée par des développeurs de contrôles.
        /// </summary>
        /// <param name="writer"><see cref="T:System.Web.UI.HtmlTextWriter" /> qui représente le flux de sortie utilisé pour rendre le contenu HTML sur le client.</param>
        public override void RenderEndTag(System.Web.UI.HtmlTextWriter writer)
        {
            if (!RenderWithNoTableTag)
                base.RenderEndTag(writer);
        }
    }

    /// <summary>
    /// GriVview pouvant être bindé sur un <see cref="PanierSourceControl"/> pour
    /// afficher les lignes d'avantages
    /// </summary>
    public class PanierAvantagesGrid : GridView
    {
        /// <summary>
        /// Obtient ou définit une valeur indicant si on doit omettre le table &lt;table&gt;
        /// </summary>
        /// <value>
        /// Si <c>true</c> le tag table ne sera pas créé par cette gridview.
        /// </value>
        public bool RenderWithNoTableTag { get; set; }

        /// <summary>
        /// Génère le rendu du contenu du contrôle serveur Web via le navigateur du client à l'aide de l'objet <see cref="T:System.Web.UI.HtmlTextWriter" /> spécifié.
        /// </summary>
        /// <param name="writer"><see cref="T:System.Web.UI.HtmlTextWriter" /> utilisé pour afficher le contenu du contrôle serveur sur le navigateur du client.</param>
        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {

            if (RenderWithNoTableTag)
            {
                System.IO.StringWriter sw = new System.IO.StringWriter();
                System.Web.UI.HtmlTextWriter hw = new System.Web.UI.HtmlTextWriter(sw);
                base.Render(hw);
                hw.Flush();
                hw.Close();
                string origTag = sw.ToString();
                if (origTag.IndexOf("<tr") < 0)
                {
                    writer.Write("");
                }
                else
                {
                    string newTag = origTag.Substring(origTag.IndexOf("<tr"), origTag.LastIndexOf("</tr>") + 5 - origTag.IndexOf("<tr"));
                    writer.Write(newTag);
                }
            }
            else
                base.Render(writer);
        }

        /// <summary>
        /// Génère le rendu de la balise d'ouverture HTML du contrôle via le writer spécifié. Cette méthode est principalement utilisée par des développeurs de contrôles.
        /// </summary>
        /// <param name="writer"><see cref="T:System.Web.UI.HtmlTextWriter" /> qui représente le flux de sortie utilisé pour rendre le contenu HTML sur le client.</param>
        public override void RenderBeginTag(System.Web.UI.HtmlTextWriter writer)
        {
            if (!RenderWithNoTableTag)
                base.RenderBeginTag(writer);
        }

        /// <summary>
        /// Génère le rendu de la balise de fermeture HTML du contrôle via le writer spécifié. Cette méthode est principalement utilisée par des développeurs de contrôles.
        /// </summary>
        /// <param name="writer"><see cref="T:System.Web.UI.HtmlTextWriter" /> qui représente le flux de sortie utilisé pour rendre le contenu HTML sur le client.</param>
        public override void RenderEndTag(System.Web.UI.HtmlTextWriter writer)
        {
            if (!RenderWithNoTableTag)
                base.RenderEndTag(writer);
        }
    }
}
