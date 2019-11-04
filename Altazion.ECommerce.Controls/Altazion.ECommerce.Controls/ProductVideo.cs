using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.Equihira.Business.Catalogue.Data;
using System.IO;
using System.Web.UI;
using CPointSoftware.ECommerce.Tools;


namespace Altazion.ECommerce.Controls
{
#pragma warning disable 0618

    /// <summary>
    /// Affiche une video sous la forme d'un flash
    /// </summary>
    public partial class ProductVideo : WebControl
    {
        public ProductVideo()
        {
            PlayerUrl = "~/player_flv_mini.swf";
        }

        public string PlayerUrl { get; set; }
        public string MoreParams { get; set; }
        public string VideoUrl { get; set; }

        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            WriteContent(writer, VideoUrl, Height, Width, Page, PlayerUrl, MoreParams);
        }

        private static void WriteContent(HtmlTextWriter writer, string videoUrl, Unit height, Unit width, Page page, string playerUrl, string moreParams)
        {
            if (string.IsNullOrEmpty(videoUrl))
                return;
            if (videoUrl.Contains("youtube.com"))
            {
                writer.Write("<iframe width='");
                writer.Write(width.ToString());
                writer.Write("' height='");
                writer.Write(height.ToString());
                writer.Write("' src='");
                writer.Write(videoUrl);
                writer.Write("' frameborder='0' allow='autoplay; encrypted-media' allowfullscreen></iframe>");
            }
            else if (videoUrl.EndsWith(".flv") || videoUrl.EndsWith(".fla"))
            {
                writer.Write("<object type=\"application/x-shockwave-flash\" data=\"");
                writer.Write(page.ResolveUrl(playerUrl));
                writer.Write("\" width=\"");
                writer.Write(width.ToString());
                writer.Write("\" height=\"");
                writer.Write(height.ToString());
                writer.WriteLine("\">");


                writer.Write("<param name=\"movie\" value=\"");
                writer.Write(page.ResolveUrl(playerUrl));
                writer.WriteLine("\">");

                writer.Write("<param name=\"FlashVars\" value=\"flv=");
                writer.Write(page.ResolveUrl(videoUrl));
                writer.Write("&width=");
                writer.Write(width.Value.ToString());
                writer.Write("&height=");
                writer.Write(height.Value.ToString());
                if (!string.IsNullOrEmpty(moreParams))
                {
                    if (!moreParams.StartsWith("&"))
                        writer.Write("&");
                    writer.Write(moreParams);
                }
                writer.WriteLine("\">");

                writer.WriteLine("</object>");
            }
            else if (videoUrl.EndsWith(".webm") || videoUrl.EndsWith(".mp4"))
            {
                writer.Write("<video width=\"");
                writer.Write(width.ToString());
                writer.Write("\" height=\"");
                writer.Write(height.ToString());
                writer.WriteLine("\" controls=\"controls\">");

                writer.Write("<source src=\"");
                writer.Write(page.ResolveUrl(videoUrl));
                if (videoUrl.EndsWith(".webm"))
                {
                    writer.WriteLine("\" type=\"video/webm\" />");
                }
                else if (videoUrl.EndsWith(".mp4"))
                {
                    writer.WriteLine("\" type=\"video/mp4\" />");
                }

                writer.WriteLine("</video>");
            }
        }

        //#region IEquihiraBindable Membres

        //public void BindTo(object o)
        //{

        //}

        //#endregion

        //public override void DataBind()
        //{
        //    object o = this.GetBoundObject();
        //    BindTo(o);
        //}


    }


    /// <summary>
    /// A utiliser dans un contrôle bindé sur un produit : 
    /// affiche un ul avec liens contenant les imagettes des videos
    /// associées au produit
    /// </summary>
    public class ProduitVideoList : WebControl, IEquihiraBindable
    {
        public string VideoCssClass { get; set; }
        ArticlesDocumentsDS _data = null;

        #region IEquihiraBindable Members

        public void BindTo(object o)
        {
            if (o == null) return;

            if (o is ArticlesDataSourceResult)
            {
                _data = (o as ArticlesDataSourceResult).Videos;
            }
        }

        #endregion
        protected override void Render(System.Web.UI.HtmlTextWriter writer)
        {
            base.Render(writer);
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
                if (string.IsNullOrEmpty(r.doa_url_document))
                    continue;

                bool estHtml = false;

                writer.Write("<li");
                if (!string.IsNullOrEmpty(VideoCssClass))
                {
                    writer.Write(" class='");
                    writer.Write(VideoCssClass);
                    writer.Write("'");
                }
                writer.Write(">");

                writer.Write("<a href='");
                try
                {
                    if (Path.GetExtension(r.doa_url_document).ToLower().Contains(".htm"))
                    {
                        writer.Write(ResolveUrl(r.doa_url_document));
                        estHtml = true;
                    }
                    else
                    {
                        writer.Write(ResolveUrl("~/VideoPlayer.aspx?video=" + Page.Server.UrlEncode(r.doa_url_document)));
                    }
                }
                catch
                {
                    writer.Write(ResolveUrl("~/VideoPlayer.aspx?video=" + Page.Server.UrlEncode(r.doa_url_document)));
                }

                writer.Write("&width=");
                writer.Write(r.Isdoa_affichage_largeurNull() ? 400 : r.doa_affichage_largeur);
                writer.Write("&height=");
                writer.Write(r.Isdoa_affichage_hauteurNull() ? 300 : r.doa_affichage_hauteur);


                writer.Write("' >");
                writer.Write("<img border='0' src='");
                writer.Write(ResolveUrl(r.doa_url_imagette));
                writer.Write("' />");

                writer.Write("</a>");

                writer.Write("</li>");
            }

            writer.Write("</ul>");

        }
    }

}
