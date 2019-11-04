using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using CPointSoftware.Equihira.Business.ECommerce.Data;
using CPointSoftware.Equihira.Business.Logistique;
using System.ComponentModel;
using System.Web.UI;
using CPointSoftware.Equihira.Common;
using CPointSoftware.Equihira.Business.Logistique.Data;
using System.Collections;
using CPointSoftware.ECommerce.Tools;


namespace Altazion.ECommerce.Controls
{

    public class ProductLivraisonLibelle
    {
        public string Libelle { get; set; }
        public Guid ModeGuid { get; set; }
        public bool Disabled { get; set; }
    }

    /// <summary>
    /// affiche un span avec la date de livraison prévue pour
    /// un produit.
    /// </summary>
    [ParseChildren(true, "Libelles")]
    public class ProductLivraison : Label, IEquihiraBindable
    {
        

        public string Format { get; set; }
        public string MessageNonLivrable { get; set; }
        public string MessageImmateriel { get; set; }
        public TypePreference Preference { get; set; }

        public ArrayList Libelles { get; private set; }


        public enum TypePreference
        {
            DateMin,
            PrixMin
        }

        public ProductLivraison()
        {
            Format = "Livraison par {0} le {1:dd/MM/yyyy} pour {2:0.00}€";
            MessageNonLivrable = "";
            Preference = TypePreference.DateMin;
            Libelles = new ArrayList();
        }

        #region IEquihiraBindable Membres

        public void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.Article.ecommerce_articles_web[0];

                Afficher(r);
            }
            if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = (o as VueArticlesWebDS.ecommerce_articles_webRow);
                Afficher(r);
            }
        }

        private void Afficher(VueArticlesWebDS.ecommerce_articles_webRow r)
        {

            if (r.art_est_immateriel)
            {
                if (!string.IsNullOrEmpty(MessageImmateriel))
                    this.Text = MessageImmateriel;
                else
                    this.Visible = false;
                return;
            }

            PanierProvider prv = ECommerceServer.Panier;
            ExpeditionsBll bll = new ExpeditionsBll(ECommerceServer.RjsId);

            string cp = prv.AdresseLivraisonCodePostal;
            if (string.IsNullOrEmpty(cp))
            {

                if (!string.IsNullOrEmpty(ECommerceServer.CurrentSite.DefaultCP))
                    cp = ECommerceServer.CurrentSite.DefaultCP;
                else
                    cp = "75000";
            }
            string pay = prv.AdresseLivraisonCodePays;
            if (string.IsNullOrEmpty(pay))
            {
                if (!string.IsNullOrEmpty(ECommerceServer.CurrentSite.DefaultPaysPk))
                    pay = ECommerceServer.CurrentSite.DefaultPaysPk;
                else
                    pay = "FRA";
            }


            var modes = ECommerceServer.Livraisons.GetFraisPortPossibles(new ElementPanier[] { new ElementPanier()
            {
                ArticleGuid = r.art_guid,
                TypeArticle = MetaTypeArticle.Produit,
                Quantite = 1,
                PuHT = 0,
                PuTTC = 0
            }}, cp, pay);

            Context.Trace.Write("FicheProduit", string.Format("Recherche modes livraison pour {0}-{1} : {2} mode(s)",
                cp, pay, modes == null ? 0 : modes.Length));


            if (modes == null || modes.Length == 0)
            {
                if (!string.IsNullOrEmpty(MessageNonLivrable))
                    this.Text = MessageNonLivrable;
                else
                    this.Visible = false;
                return;
            }

            ModeLivraisonElementPanier chosen = null;


            if (Preference == TypePreference.DateMin)
            {
                DateTime minDate = DateTime.MaxValue;

                foreach (var mode in modes)
                {
                    if (!mode.EstActif)
                        continue;
                    if (Libelles != null && Libelles.Count >= 0)
                    {
                        bool not = false;
                        foreach (ProductLivraisonLibelle c in Libelles)
                        {
                            if (c.Disabled && c.ModeGuid == mode.ModeLivraisonGuid)
                                not = true;
                        }
                        if (not)
                            continue;
                    }

                    if (mode.DateLivraisonPrevue <= minDate)
                    {
                        chosen = mode;
                        minDate = mode.DateLivraisonPrevue;
                    }
                }
            }
            else if (Preference == TypePreference.PrixMin)
            {
                decimal minval = decimal.MaxValue;

                foreach (var mode in modes)
                {
                    if (!mode.EstActif)
                        continue;
                    if (Libelles != null && Libelles.Count >= 0)
                    {
                        bool not = false;
                        foreach (ProductLivraisonLibelle c in Libelles)
                        {
                            if (c.Disabled && c.ModeGuid == mode.ModeLivraisonGuid)
                                not = true;
                        }
                        if (not)
                            continue;
                    }

                    if (mode.PuTTC <= minval)
                    {
                        chosen = mode;
                        minval = mode.PuTTC;
                    }
                }
            }


            if (chosen == null)
            {
                if (!string.IsNullOrEmpty(MessageNonLivrable))
                    this.Text = MessageNonLivrable;
                else
                    this.Visible = false;
                return;
            }
            else
            {
                this.Text = string.Format(Format, GetLibelle(chosen), chosen.DateLivraisonPrevue, chosen.MontantTTC, GetDelai(DateTime.Today, chosen.DateLivraisonPrevue));
            }




        }

        private string GetLibelle(ModeLivraisonElementPanier chosen)
        {
            if (Libelles == null)
                return chosen.Libelle;

            foreach (ProductLivraisonLibelle c in Libelles)
            {
                if (c.ModeGuid == chosen.ModeLivraisonGuid)
                    return c.Libelle;
            }

            return chosen.Libelle;
        }

        private string GetDelai(DateTime dateTime1, DateTime dateTime2)
        {
            try
            {
                int i = (int)(dateTime2.Date - dateTime1.Date).TotalDays;
                if (i == 0)
                    return "aujourd'hui";
                if (i == 1)
                    return "demain";
                if (i < 7)
                {
                    switch (dateTime2.DayOfWeek)
                    {
                        case DayOfWeek.Friday: return "vendredi";
                        case DayOfWeek.Monday: return "lundi";
                        case DayOfWeek.Saturday: return "samedi";
                        case DayOfWeek.Sunday: return "dimanche";
                        case DayOfWeek.Thursday: return "jeudi";
                        case DayOfWeek.Tuesday: return "mardi";
                        case DayOfWeek.Wednesday: return "mercredi";
                    }
                }

                return string.Format("le {0:dd/MM/yyyy}", dateTime2);
            }
            catch
            {

            }

            return "";
        }

        #endregion
    }
}
