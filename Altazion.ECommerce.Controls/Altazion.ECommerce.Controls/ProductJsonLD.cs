using CPointSoftware.Equihira.Business.ECommerce.Data;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;


namespace Altazion.ECommerce.Controls
{
    public class ProductJsonLD : WebControl, IEquihiraBindable
    {
        protected override void OnDataBinding(EventArgs e)
        {
            base.OnDataBinding(e);
            object o = this.GetBoundObject();
            BindTo(o);
        }
        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                CompleteResult = null;
                MiniInfo = o as VueArticlesWebDS.ecommerce_articles_webRow;
            }
            else if (o is ArticlesDataSourceResult)
            {
                var a = (o as ArticlesDataSourceResult);
                if (a.Article.ecommerce_articles_web.Count == 1)
                {
                    CompleteResult = a;
                    MiniInfo = a.Article.ecommerce_articles_web[0];
                }
            }

        }

        private ArticlesDataSourceResult CompleteResult { get; set; }
        private VueArticlesWebDS.ecommerce_articles_webRow MiniInfo { get; set; }

        private class Data
        {
            public Data()
            {
                context = "http://schema.org/";
                type = "Product";
            }
            [JsonProperty("@context")]
            public string context { get; set; }
            [JsonProperty("@type")]
            public string type { get; set; }
            public string name { get; set; }
            public string gtin13 { get; set; }
            public string image { get; set; }
            public string description { get; set; }
            public string mpn { get; set; }

            public Offer[] offers { get; set; }
            public Brand brand { get; set; }


        }

        private class DataWithReview : Data
        {
            public Review[] review { get; set; }
            public Ratings aggregateRating { get; set; }
        }

        private class Offer
        {
            public Offer()
            {
                type = "Offer";
            }
            public string itemCondition { get; set; }
            public string availability { get; set; }
            public string price { get; set; }
            public string priceCurrency { get; set; }
            [JsonProperty("@type")]
            public string type { get; set; }
            public Seller seller { get; set; }

        }

        private class Seller
        {
            public Seller()
            {
                type = "Organization";
            }
            [JsonProperty("@type")]
            public string type { get; set; }
            public string url { get; set; }
            public string name { get; set; }

        }

        private class Brand
        {
            public Brand()
            {
                type = "Thing";
            }
            [JsonProperty("@type")]
            public string type { get; set; }

            public string name { get; set; }
        }

        private class Ratings
        {
            public Ratings()
            {
                type = "AggregateRating";
            }
            [JsonProperty("@type")]
            public string type { get; set; }
            public string ratingValue { get; set; }
            public string reviewCount { get; set; }
        }

        private class Review
        {
            public Review()
            {
                type = "Review";
                reviewRating = new Ratings();
                reviewRating.type = "Rating";
            }
            [JsonProperty("@type")]
            public string type { get; set; }
            public Ratings reviewRating { get; set; }
            public string author { get; set; }
            public string datePublished { get; set; }
            public string description { get; set; }
        }

        protected override void Render(HtmlTextWriter writer)
        {
            writer.Write("<script type='application/ld+json'>");
            try
            {
                if (MiniInfo == null)
                    return;

                var st = ECommerceServer.CurrentSite;
                Data d = null;


                d = new DataWithReview();


                d.name = MiniInfo.Isarw_libelleNull() ? null : MiniInfo.arw_libelle;
                if (MiniInfo.Isarw_url_img_bigNull())
                {
                    if (!MiniInfo.Isarw_url_img_intermediateNull())
                        d.image = MiniInfo.arw_url_img_intermediate;
                    else if (!MiniInfo.Isarw_url_img_imagetteNull())
                        d.image = MiniInfo.arw_url_img_imagette;
                }
                else
                    d.image = MiniInfo.arw_url_img_big;

                d.description = HttpUtility.HtmlEncode(MiniInfo.arw_description_html);
                d.mpn = MiniInfo.Isart_refNull() ? null : MiniInfo.art_ref;



                if (!MiniInfo.Isart_mar_pkNull())
                {
                    var marque = ECommerceServer.DataCache.Marques.catalog_marques.FindBymar_pk(MiniInfo.art_mar_pk);
                    if (marque != null)
                    {
                        d.brand = new Brand() { name = marque.mar_libelle };
                    }
                }

                decimal prix = MiniInfo.arw_pu_ttc;
                if (ECommerceServer.Animation.Promotions.EstEnPromo(MiniInfo))
                    prix = MiniInfo.arw_pu_promo_ttc;

                List<Offer> o = new List<Offer>();
                o.Add(new Offer()
                {
                    availability = MiniInfo.arw_est_dispo ? "http://schema.org/InStock" : "http://schema.org/OutOfStock",
                    itemCondition = "http://schema.org/NewCondition",
                    price = prix.ToString("0.00", CultureInfo.InvariantCulture),
                    priceCurrency = "EUR",
                    seller = new Seller()
                    {
                        name = st.Libelle,
                        url = st.UrlPrincipale
                    }
                });
                d.offers = o.ToArray();

                if (CompleteResult != null)
                {
                    if (CompleteResult.References != null)
                    {
                        var ean13 = (from z in CompleteResult.References.catalog_articles_references
                                     where z.rar_type.Equals("EAN13") && z.rar_est_principal
                                     select z).FirstOrDefault();
                        if (ean13 != null)
                            d.gtin13 = ean13.rar_reference;
                    }

                    if (CompleteResult.Avis.ecommerce_avis.Count > 0)
                    {
                        var moyenne = (from z in CompleteResult.Avis.ecommerce_avis
                                       select z.avi_note).Average();
                        if (d is DataWithReview)
                        {
                            (d as DataWithReview).aggregateRating = new Ratings()
                            {
                                ratingValue = moyenne.ToString("0.00", CultureInfo.InvariantCulture),
                                reviewCount = CompleteResult.Avis.ecommerce_avis.Count.ToString("0")
                            };
                        }

                        List<Review> rvs = new List<Review>();
                        foreach (var av in CompleteResult.Avis.ecommerce_avis)
                        {
                            Review rv = new Review()
                            {
                                author = av.Isavi_nomNull() ? "anonyme" : av.avi_nom,
                                datePublished = (av.Isavi_date_validationNull() ? av.avi_date : av.avi_date_validation).ToString("yyyy-MM-dd"),
                                description = av.avi_message,
                                reviewRating = new Ratings()
                                {
                                    type = "Rating",
                                    ratingValue = av.avi_note.ToString("0")
                                }
                            };
                            rvs.Add(rv);
                        }
                        if (d is DataWithReview) (d as DataWithReview).review = rvs.ToArray();
                    }
                }
                else if (!MiniInfo.Isavp_countNull() && !MiniInfo.Isavp_moyenneNull() && MiniInfo.avp_count > 0)
                {
                    if (d is DataWithReview)
                    {
                        (d as DataWithReview).aggregateRating = new Ratings()
                        {
                            ratingValue = MiniInfo.avp_moyenne.ToString("0.00", CultureInfo.InvariantCulture),
                            reviewCount = MiniInfo.avp_count.ToString("0")
                        };
                    }
                }


                writer.Write(JsonConvert.SerializeObject(d));

            }
            catch
            {

            }
            writer.Write("</script>");

        }
    }
}
