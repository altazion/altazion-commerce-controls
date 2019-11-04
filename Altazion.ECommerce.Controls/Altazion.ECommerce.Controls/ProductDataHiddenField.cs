using CPointSoftware.Equihira.Business.Catalogue.Data;
using CPointSoftware.Equihira.Business.Common;
using CPointSoftware.Equihira.Business.ECommerce.Data;
using CPointSoftware.Equihira.Extensibility.PointOfSale.DigitalSignage;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;


namespace Altazion.ECommerce.Controls
{
    public class ProductDataHiddenField : HiddenField, IEquihiraBindable
    {
        private class ArticleDataDetails : ArticlePhygitalBase
        {
            public string Ean13 { get; set; }
            public string Segmentation { get; set; }
        }

        private void DoBind(VueArticlesWebDS.ecommerce_articles_webRow r, ArticlesReferencesDS references)
        {
            var dt = ArticleDataDetails.FromDataRow<ArticleDataDetails>(r);
            var segDS = ECommerceServer.DataCache.Segmentation;
            var rSeg = segDS.ecommerce_segmentation.FindByseg_pk(r.arw_seg_pk_principale);
            if (rSeg != null)
                dt.Segmentation = rSeg.seg_libelle;
            if (!r.Isart_mar_pkNull())
            {
                var marDS = ECommerceServer.DataCache.Marques;
                var rMar = marDS.catalog_marques.FindBymar_pk(r.art_mar_pk);
                if (rMar != null)
                    dt.Marque = rMar.mar_libelle;
            }

            if (references != null)
            {
                var ean13 = (from z in references.catalog_articles_references
                             where z.rar_type.Equals("EAN13") && z.rar_est_principal
                             select z).FirstOrDefault();
                if (ean13 != null)
                    dt.Ean13 = ean13.rar_reference;
            }

            this.Value = JsonHelper.Serialize(dt);
        }

        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                DoBind(o as VueArticlesWebDS.ecommerce_articles_webRow, null);
            }
            else if (o is ArticlesDataSourceResult)
            {
                var a = (o as ArticlesDataSourceResult);
                if (a.Article.ecommerce_articles_web.Count == 1)
                    DoBind(a.Article.ecommerce_articles_web[0], a.References);
            }

        }



        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            object o = this.GetBoundObject();
            BindTo(o);
        }
    }
}
