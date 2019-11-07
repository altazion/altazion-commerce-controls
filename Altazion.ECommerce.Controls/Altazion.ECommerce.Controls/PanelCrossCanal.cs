using CPointSoftware.Equihira.Common;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Panel (div) s'affichant si certain article du panier
    /// sont des articles à retirer en magasin
    /// </summary>
    public class PanierPanelMagasinAssocie : Panel
    {
        /// <summary>
        /// Obtient ou définit un booléen précisant si il faut
        /// cacher ce panel lorsque le panier est de type 
        /// "Click'n'mortar" (commande préparée en magasin)
        /// </summary>
        public bool CacherSiClickNMortar { get; set; }

        /// <summary>
        /// Obtient ou définit un booléen précisant si ce panel
        /// doit être caché lorsque le panier est de type
        /// "web" (préparé en centrale)
        /// </summary>
        public bool CacherSiEcommerce { get; set; }

        /// <summary>
        /// Effectue l'affichage du controle
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            if (!ECommerceServer.Panier.VerifierSiArticlesMagasins())
                this.Visible = false;

            if (CacherSiClickNMortar && ECommerceServer.SiteContentType.Equals(SiteContentType.Clicknmortar))
                this.Visible = false;

            if (CacherSiEcommerce && ECommerceServer.SiteContentType.Equals(SiteContentType.ECommerce))
                this.Visible = false;
        }
    }


    public class PanierPanelSansMagasinAssocie : Panel
    {

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            if (!ECommerceServer.Panier.VerifierSiArticlesSansMagasin())
                this.Visible = false;
        }
    }

    public class PanierPanelConditionnelCacherPresta : Panel
    {
        public int PtpPk { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            ModeLivraison ml = ECommerceServer.Panier.GetModeLivraison();


            if (ml == null)
            {
                this.Visible = false;
                return;
            }

            if (ml.PrestataireId == PtpPk)
            {
                this.Visible = false;
            } else
            {
                this.Visible = true;
            }

        }
    }

    public class PanierPanelConditionnelAfficherPresta : Panel
    {
        public int PtpPk { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            ModeLivraison ml = ECommerceServer.Panier.GetModeLivraison();


            if (ml == null)
            {
                this.Visible = false;
                return;
            }

            if (ml.PrestataireId == PtpPk)
            {
                this.Visible = true;
            } else
            {
                this.Visible = false;
            }


        }
    }

    public class PanierEncartMagasinAssocie : WebControl
    {
        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            if (!ECommerceServer.Panier.VerifierSiArticlesMagasins())
                this.Visible = false;
        }

        /// <summary>
        /// Génère le rendu du contrôle via le writer HTML spécifié.
        /// </summary>
        /// <param name="writer">Objet <see cref="T:System.Web.UI.HtmlTextWriter" /> qui reçoit le contenu du contrôle.</param>
        protected override void Render(HtmlTextWriter writer)
        {
            RenderChildren(writer);
        }
    }

    public class MagasinAssociePanel : Panel, IEquihiraBindable
    {
        public bool CacherSiAssocieMagasin { get; set; }
        public bool CacherSiNonAssocieMagasin { get; set; }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            Guid? mag = ECommerceServer.Magasins.CurrentMagasinGuid;
            if (CacherSiAssocieMagasin && mag.HasValue)
            {
                this.Visible = false;
            }
            else if (CacherSiNonAssocieMagasin && !mag.HasValue)
            {
                this.Visible = false;
            }
        }

        public void BindTo(object o)
        {
            foreach (var c in Controls)
            {
                if (c is IEquihiraBindable)
                    (c as IEquihiraBindable).BindTo(o);
            }
        }
    }


    /// <summary>
    /// Affiche un span avec le nom du magasin associé
    /// à la session utilisateur
    /// </summary>
    /// <remarks><para>Exemple d'utilisation :</para>
    /// <code>
    /// &lt;ecom:MagasinAssocieLibelle runat="server" /&gt;
    /// </code>
    /// <para>Ce qui produira l'html suivant :</para>
    /// <code>
    /// &lt;span&gt;[le nom du magasin]&lt;/span&gt;
    /// </code>
    /// <para>Si la session actuelle n'est pas associée
    /// à un magasin, le contrôle ne sera pas ajouté à l'html
    /// de la page</para></remarks>
    public class MagasinAssocieLibelle : Label
    {
        /// <summary>
        /// Constructeur par défaut
        /// </summary>
        public MagasinAssocieLibelle()
        {
            Format = "{0}";
        }

        /// <summary>
        /// Format d'affichage du code postal du magasin, sous la forme {0}
        /// </summary>
        /// <remarks>La valeur par défaut est {0}</remarks>
        public string Format { get; set; }


        /// <summary>
        /// Prépare l'affichage du contrôle
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            Guid? mag_guid = ECommerceServer.Magasins.CurrentMagasinGuid;
            if (!mag_guid.HasValue)
                this.Visible = false;
            else
            {
                var ds = ECommerceServer.DataCache.Magasins;
                var r = ds.clicknmortar_magasins.FindBymag_guid(mag_guid.Value);
                if (r != null)
                    this.Text = string.Format(Format, r.mag_libelle);
                else
                    this.Text = "--";
            }


        }

    }

    public class MagasinAssocieHorairesDuJour : Label
    {
        public MagasinAssocieHorairesDuJour()
        {
        }

        public bool AfficherAm { get; set; }
        public bool AfficherPm { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            Guid? mag_guid = ECommerceServer.Magasins.CurrentMagasinGuid;
            if (!mag_guid.HasValue)
                this.Visible = false;
            else
            {
                var ds = ECommerceServer.DataCache.Magasins;
                var r = ds.clicknmortar_magasins.FindBymag_guid(mag_guid.Value);
                if(r==null)
                {
                    this.Visible = false;
                    return;
                }
                var horaires = r.Getclicknmortar_magasins_horairesRows();
                CPointSoftware.Equihira.Business.ECommerce.Data.MagasinsDS.clicknmortar_magasins_horairesRow rh = null;
                if (horaires != null)
                {
                    string jour = "1";
                    switch (DateTime.Today.DayOfWeek)
                    {
                        case DayOfWeek.Monday: jour = "1"; break;
                        case DayOfWeek.Tuesday: jour = "2"; break;
                        case DayOfWeek.Wednesday: jour = "3"; break;
                        case DayOfWeek.Thursday: jour = "4"; break;
                        case DayOfWeek.Friday: jour = "5"; break;
                        case DayOfWeek.Saturday: jour = "6"; break;
                        default: jour = "7"; break;
                    }
                    rh = (from z in horaires
                          where z.mhr_jour.Trim().Equals(jour, StringComparison.InvariantCultureIgnoreCase)
                          select z).FirstOrDefault();
                }

                if (rh == null)
                    this.Visible = false;
                else
                {
                    this.Text = "";
                    if (AfficherAm)
                        this.Text = rh.Ismhr_ouverture_amNull() ? "fermé" : rh.mhr_ouverture_am;
                    if(AfficherPm)
                    {
                        if(!rh.Ismhr_ouverture_pmNull())
                        {
                            if (this.Text.Length > 0)
                                this.Text += " - " + rh.mhr_ouverture_pm;
                        }
                    }
                }
            }
        }
    }

    /// <summary>
    /// Affiche un span avec le code postal du magasin associé
    /// à la session utilisateur
    /// </summary>
    /// <remarks><para>Exemple d'utilisation :</para>
    /// <code>
    /// &lt;ecom:MagasinAssocieCP runat="server" /&gt;
    /// </code>
    /// <para>Ce qui produira l'html suivant :</para>
    /// <code>
    /// &lt;span&gt;[le code postal du magasin]&lt;/span&gt;
    /// </code>
    /// <para>Si la session actuelle n'est pas associée
    /// à un magasin, le contrôle ne sera pas ajouté à l'html
    /// de la page</para></remarks>
    public class MagasinAssocieCP : Label
    {
        /// <summary>
        /// Le constructeur par défaut
        /// </summary>
        public MagasinAssocieCP()
        {
            Format = "{0}";
        }

        /// <summary>
        /// Format d'affichage du code postal du magasin, sous la forme {0}
        /// </summary>
        /// <remarks>La valeur par défaut est {0}</remarks>
        public string Format { get; set; }


        /// <summary>
        /// Prépare l'affichage du contrôle
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            Guid? mag_guid = ECommerceServer.Magasins.CurrentMagasinGuid;
            if (!mag_guid.HasValue)
                this.Visible = false;
            else
            {
                var ds = ECommerceServer.DataCache.Magasins;
                var r = ds.clicknmortar_magasins.FindBymag_guid(mag_guid.Value);
                if (r != null)
                    this.Text = string.Format(Format, r.mag_cp);
                else
                    this.Text = "--";
            }


        }

    }


    /// <summary>
    /// Affiche un span avec le pays du magasin associé
    /// à la session utilisateur
    /// </summary>
    /// <remarks><para>Exemple d'utilisation :</para>
    /// <code>
    /// &lt;ecom:MagasinAssociePays runat="server" /&gt;
    /// </code>
    /// <para>Ce qui produira l'html suivant :</para>
    /// <code>
    /// &lt;span&gt;[le pays du magasin]&lt;/span&gt;
    /// </code>
    /// <para>Si la session actuelle n'est pas associée
    /// à un magasin, le contrôle ne sera pas ajouté à l'html
    /// de la page</para></remarks>
    public class MagasinAssociePays : Label
    {
        /// <summary>
        /// Prépare l'affichage du controle
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            Guid? mag_guid = ECommerceServer.Magasins.CurrentMagasinGuid;
            if (!mag_guid.HasValue)
                this.Visible = false;
            else
            {
                var ds = ECommerceServer.DataCache.Magasins;
                var r = ds.clicknmortar_magasins.FindBymag_guid(mag_guid.Value);
                if (r != null)
                {
                    var paysDS = ECommerceServer.DataCache.Pays;
                    var pay = (from z in paysDS.params_pays
                               where z.pay_pk.Equals(r.mag_pay_pk)
                               select z).FirstOrDefault();
                    if (pay != null)
                    {
                        this.Text = pay.pay_libelle;
                    }
                    else
                        this.Visible = false;

                }
                else
                    this.Visible = false;
            }


        }

    }

    /// <summary>
    /// Affiche un span avec le code du magasin associé
    /// à la session utilisateur
    /// </summary>
    /// <remarks><para>Exemple d'utilisation :</para>
    /// <code>
    /// &lt;ecom:MagasinAssocieCode runat="server" /&gt;
    /// </code>
    /// <para>Ce qui produira l'html suivant :</para>
    /// <code>
    /// &lt;span&gt;[le code du magasin]&lt;/span&gt;
    /// </code>
    /// <para>Si la session actuelle n'est pas associée
    /// à un magasin, le contrôle ne sera pas ajouté à l'html
    /// de la page</para></remarks>
    public class MagasinAssocieCode : Label
    {
        /// <summary>
        /// Constructeur par défaut
        /// </summary>
        public MagasinAssocieCode()
        {
            Format = "{0}";
        }


        /// <summary>
        /// Format d'affichage du code magasin, sous la forme {0}
        /// </summary>
        /// <remarks>La valeur par défaut est {0}</remarks>
        public string Format { get; set; }


        /// <summary>
        /// Prépare l'affichage
        /// </summary>
        /// <param name="e"></param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            Guid? mag_guid = ECommerceServer.Magasins.CurrentMagasinGuid;
            if (!mag_guid.HasValue)
                this.Visible = false;
            else
            {
                var ds = ECommerceServer.DataCache.Magasins;
                var r = ds.clicknmortar_magasins.FindBymag_guid(mag_guid.Value);
                if (r != null && ! r.Ismag_codeNull())
                    this.Text = string.Format(Format, r.mag_code);
                else
                    this.Text = "-";
            }


        }

    }

    public class MagasinAssocieVille : Label
    {
        public MagasinAssocieVille()
        {
            Format = "{0}";
        }

        public string Format { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            Guid? mag_guid = ECommerceServer.Magasins.CurrentMagasinGuid;
            if (!mag_guid.HasValue)
                this.Visible = false;
            else
            {
                var ds = ECommerceServer.DataCache.Magasins;
                var r = ds.clicknmortar_magasins.FindBymag_guid(mag_guid.Value);
                if (r != null)
                    this.Text = string.Format(Format, r.mag_ville);
                else
                    this.Text = "--";
            }


        }

    }

    public class MagasinAssocieAdresse : Label
    {
        public MagasinAssocieAdresse()
        {
            Format = "{0}";
        }

        public string Format { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            Guid? mag_guid = ECommerceServer.Magasins.CurrentMagasinGuid;
            if (!mag_guid.HasValue)
                this.Visible = false;
            else
            {
                var ds = ECommerceServer.DataCache.Magasins;
                var r = ds.clicknmortar_magasins.FindBymag_guid(mag_guid.Value);
                if (r != null)
                    this.Text = string.Format(Format, r.mag_adresse.Replace("\r", "<br />"));
                else
                    this.Text = "--";
            }


        }

    }

    public class MagasinAssocieTel : Label
    {
        public MagasinAssocieTel()
        {
            Format = "{0}";
        }

        public string Format { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            Guid? mag_guid = ECommerceServer.Magasins.CurrentMagasinGuid;
            if (!mag_guid.HasValue)
                this.Visible = false;
            else
            {
                var ds = ECommerceServer.DataCache.Magasins;
                var r = ds.clicknmortar_magasins.FindBymag_guid(mag_guid.Value);
                if (r != null)
                {
                    if (r.Ismag_telNull() || string.IsNullOrEmpty(r.mag_tel))
                        this.Visible = false;
                    else
                        this.Text = string.Format(Format, r.mag_tel);
                }
                else
                    this.Text = "--";
            }


        }

    }

    public class MagasinAssocieLink : Hyperlink
    {

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            Guid? mag_guid = ECommerceServer.Magasins.CurrentMagasinGuid;
            if (!mag_guid.HasValue)
                this.Visible = false;
            else
            {
                var ds = ECommerceServer.DataCache.Magasins;
                var r = ds.clicknmortar_magasins.FindBymag_guid(mag_guid.Value);
                if (r != null)
                {
                    this.NavigateUrl = this.ResolveUrl(ECommerceServer.Magasins.GetDetailUrl(r.mag_guid,
                       r.Ismag_zoneNull() ? null : r.mag_zone,
                       r.mag_cp, r.mag_ville, r.Ismag_codeNull() ? null : r.mag_code));
                }
                else
                    this.Visible = false;
            }


        }

    }

    public class MagasinAssocieGoogleMapLink : HyperLink
    {
        protected override void OnPreRender(EventArgs e)
        {
              Guid? mag_guid = ECommerceServer.Magasins.CurrentMagasinGuid;
            if (!mag_guid.HasValue)
                this.Visible = false;
            else
            {
                var ds = ECommerceServer.DataCache.Magasins;
                var r = ds.clicknmortar_magasins.FindBymag_guid(mag_guid.Value);
                if (r != null&& !r.Ismag_lattitudeNull() && !r.Ismag_longitudeNull())
                {
                    this.NavigateUrl = string.Format(CultureInfo.InvariantCulture, "http://maps.google.com/maps?q={0:0.000000},{1:0.000000}", r.mag_lattitude, r.mag_longitude);
                }
                else
                    this.Visible = false;
            }
            

            base.OnPreRender(e);
        }
    }
}
