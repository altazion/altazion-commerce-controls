using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche une div uniquement pour certaines pages
    /// </summary>
    /// <remarks>
    /// Ce controle est destiné à être placé dans une partie normalement commune à toutes les pages. Son utilisation est la suivante:
    /// <list type="bullet">
    /// <item>Placez <see cref="VisibiliteParDefaut"/> à <c>true</c> si vous souhaitez afficher la div pour toutes les pages SAUF celles spécifiées,
    /// à <c>false</c> si la div ne doit s'afficher que sur certaines pages</item>
    /// <item>Spécifiez via <see cref="SaufPour"/> le type de page pour lequel la visibilité est l'inverse de <see cref="VisibiliteParDefaut"/></item>
    /// </list>
    /// Pour afficher une div que sur la home, par exemple : VisibiliteParDefaut='false', SaufPour='HomePage'
    /// </remarks>
    public class PanelPageSpecifique : Panel
    {
        public PanelPageSpecifique()
        {
            InlineContent = false;
        }

        public bool InlineContent { get; set; }
        public bool VisibiliteParDefaut { get; set; }
        public ECommercePageType SaufPour { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            ECommerceBasePage pg = this.Page as ECommerceBasePage;
            if (pg == null)
            {
                Visible = VisibiliteParDefaut;
            }
            else if ((pg.TypePage & SaufPour) != 0)
            {
                Visible = !VisibiliteParDefaut;
            }
            else
            {
                Visible = VisibiliteParDefaut;
            }
        }

        //protected override void Render(HtmlTextWriter writer)
        //{
        //    if (InlineContent)
        //        RenderChildren(writer);
        //    else
        //        base.Render(writer);
        //}

        public override void RenderBeginTag(HtmlTextWriter writer)
        {
            if(!InlineContent)
                base.RenderBeginTag(writer);
        }

        public override void RenderEndTag(HtmlTextWriter writer)
        {
            if(!InlineContent)
                base.RenderEndTag(writer);
        }
    }
}
