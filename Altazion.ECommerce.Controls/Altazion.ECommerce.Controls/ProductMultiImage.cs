using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.Equihira.Business.Catalogue.Data;
using System.Web.UI;
using CPointSoftware.ECommerce.Tools;


namespace Altazion.ECommerce.Controls
{
    #pragma warning disable 0618

    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : 
    /// affiche un ul avec toutes les images secondaires d'un produit
    /// </summary>
    public class ProduitMultiImages : WebControl, IEquihiraBindable
    {
        ArticlesDocumentsDS _data = null;

        public string ImageCssClass { get; set; }

        #region IEquihiraBindable Members

        public void BindTo(object o)
        {
            if (o == null) return;

            if (o is ArticlesDataSourceResult)
            {
                _data = (o as ArticlesDataSourceResult).ImagesSupplementaires;
            }
        }

        #endregion

        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            if (_data == null)
                return;

            List<Link> links = ECommerceServer.DataCache.LiensRecherchesSansResultats;
            writer.Write("<ul ");

            if (!string.IsNullOrEmpty(CssClass))
            {
                writer.Write(" class='");
                writer.Write(CssClass);
                writer.Write("'");
            }


            if (Style != null && Style.Count > 0)
            {
                writer.Write(" style='");
                writer.Write(Style.ToString());
                writer.Write("'");
            }
            writer.Write(" >");


            foreach (ArticlesDocumentsDS.catalog_articles_documentsRow r in _data.catalog_articles_documents)
            {
                writer.Write("<li");
                if(!string.IsNullOrEmpty(ImageCssClass))
                {
                    writer.Write(" class='");
                    writer.Write(ImageCssClass);
                    writer.Write("'");
                }
                writer.Write(">");
                writer.Write("<a href='");
                writer.Write(ECommerceServer.ResolveResourceUrl(r.doa_url_document));
                writer.Write("'>");

                writer.Write("<img border='0' src='");
                writer.Write(ECommerceServer.ResolveResourceUrl(r.doa_url_imagette));
                writer.Write("' />");

                writer.Write("</a>");

                writer.Write("</li>");
            }

            writer.Write("</ul>");

        }
    }


    public class ProduitMultiImagesRepeater : Repeater, IEquihiraBindable
    {
        public ProduitMultiImagesRepeater()
        {
        }

        public void BindTo(object o)
        {
            if (o == null)
                return;

            if(o is ArticlesDataSourceResult)
            {
                var src = (o as ArticlesDataSourceResult);
                this.DataSource = src.ImagesSupplementaires;
            }

            foreach (var c in Controls)
            {
                if (c is IEquihiraBindable)
                    (c as IEquihiraBindable).BindTo(o);
            }
        }

        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);

            var o = this.GetBoundObject();
            BindTo(o);
        }
    }
}
