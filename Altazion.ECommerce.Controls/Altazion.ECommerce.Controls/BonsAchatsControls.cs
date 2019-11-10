using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using System.Web.UI;
using CPointSoftware.Equihira.Business.Clients;
using CPointSoftware.Equihira.Business.Clients.Data;
using CPointSoftware.Equihira.Business.Catalogue.Data;
using static CPointSoftware.Equihira.Business.Clients.BonsAchatsBll;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Affiche dans un span le montant de bons d'achats utilisé
    /// dans le règlement du panier actif.
    /// </summary>
    /// <remarks>Ce contrôle ne peut être utilisé que dans le cadre du contrôle
    /// personnalisé <code>BonsAchatsSelectionnables.ascx</code></remarks>
    public class BonsAchatsUtiliseMontant : Label
    {
        /// <summary>
        /// Initialise une instance de <see cref="BonsAchatsUtiliseMontant"/>.
        /// </summary>
        public BonsAchatsUtiliseMontant()
        {
            _format = "{0:0.00}";
        }

        private string _format;
        /// <summary>
        /// Obtient ou définit le format à utiliser pour
        /// afficher le montant sous la forme {0:0.00} (valeur par défaut)
        /// </summary>
        public string Format
        {
            get { return _format; }
            set { _format = value; }
        }

        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.Control.PreRender" />.
        /// </summary>
        /// <param name="e">Objet <see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            if (DesignMode)
                return;

            ReglementUserControl ctl = GetReglementControl();

            if (ctl == null)
            {
                this.Text = "Ce contrôle DOIT être placé dans un BonsAchatsSelectionnables";
                return;
            }

            decimal p = ECommerceServer.Panier.GetMontantReglementDuType(ctl.ModeReglementGuid.GetValueOrDefault());

            this.Text = string.Format(_format, p);
        }

        private ReglementUserControl GetReglementControl()
        {
            ReglementUserControl ctl = null;
            Control c = this;
            while (true)
            {
                if (c is ReglementUserControl)
                {
                    ctl = c as ReglementUserControl;
                    break;
                }

                if (c.Parent == null)
                    break;

                c = c.Parent;
            }

            return ctl;
        }
    }

    /// <summary>
    /// Affiche un a permettant d'ajouter un bon d'achat
    /// via le code saisi dans un textbox dont le nom est fourni
    /// dans <see cref="TextboxID"/>
    /// </summary>
    /// <remarks>Ce contrôle ne peut être utilisé que dans le cadre du contrôle
    /// personnalisé <code>BonsAchatsSelectionnables.ascx</code></remarks>
    public class BonsAchatsAjouterLink : LinkButton
    {
        /// <summary>
        /// Raisons empêchant l'ajout d'un bon d'achat
        /// </summary>
        public enum BonsAchatsAjoutImpossibleRaison
        {
            /// <summary>
            /// Une erreur technique est survenue
            /// </summary>
            ErreurTechnique,
            /// <summary>
            /// Le bon d'achat est inconnu
            /// </summary>
            BonAchatInconnu,
            /// <summary>
            /// Le bon d'achat a déjà été ajouté par quelqu'un
            /// </summary>
            BonAchatDejaUtilise
        }

        /// <summary>
        /// Représente les détails pour un événement du type <see cref="AjoutImpossible"/>
        /// </summary>
        public class BonsAchatsAjoutImpossibleEventArgs : EventArgs
        {
            /// <summary>
            /// Obtient ou définit la raison de l'impossibilité d'ajouter
            /// le bon d'achat
            /// </summary>
            public BonsAchatsAjoutImpossibleRaison Raison { get; set; }

            /// <summary>
            /// Obtient ou définit le descriptif de l'erreur
            /// </summary>
            public string Texte { get; set; }
        }

        private string _textboxId;
        /// <summary>
        /// Obtient ou définit l'identifiant de la <see cref="System.Web.UI.WebControls.TextBox"/>
        /// dans laquelle sera saisi le code du bon d'achat à ajouter
        /// </summary>
        /// <remarks>La <see cref="System.Web.UI.WebControls.TextBox"/> pointée doit être
        /// dans le même espace de nommage que ce contrôle</remarks>
        public string TextboxID
        {
            get { return _textboxId; }
            set { _textboxId = value; }
        }

        /// <summary>
        /// Représente les détails pour un événement du type <see cref="BonsAchatsAjoute"/>
        /// </summary>
        public class BonsAchatsAjoutAjouteEventArgs : EventArgs
        {
            /// <summary>
            /// Obtient ou définit l'identifiant du bon d'achat
            /// </summary>
            public Guid BonAchatGuid { get; set; }
        }


        /// <summary>
        /// Levé lorsqu'un bon d'achat est ajouté
        /// </summary>
        public event EventHandler<BonsAchatsAjoutAjouteEventArgs> BonsAchatsAjoute;
        private void OnBonsAchatsAjoute(Guid bac_guid)
        {

            EventHandler<BonsAchatsAjoutAjouteEventArgs> evt = BonsAchatsAjoute;
            if (evt != null)
            {
                BonsAchatsAjoutAjouteEventArgs args = new BonsAchatsAjoutAjouteEventArgs();
                args.BonAchatGuid = bac_guid;
                evt(this, args);
            }
        }

        /// <summary>
        /// Levé lorsque l'ajout du bon d'achat est impossible.
        /// </summary>
        public event EventHandler<BonsAchatsAjoutImpossibleEventArgs> AjoutImpossible;
        private void OnAjoutImpossible(BonsAchatsAjoutImpossibleRaison raison, string message)
        {
            EventHandler<BonsAchatsAjoutImpossibleEventArgs> evt = AjoutImpossible;
            if (evt != null)
            {
                BonsAchatsAjoutImpossibleEventArgs args = new BonsAchatsAjoutImpossibleEventArgs();
                args.Raison = raison;
                args.Texte = message;
                evt(this, args);
            }
        }

        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.WebControls.LinkButton.Click" /> du contrôle <see cref="T:System.Web.UI.WebControls.LinkButton" />.
        /// </summary>
        /// <param name="e"><see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        /// <exception cref="System.ApplicationException">Le controle  + _textboxId +  est introuvable</exception>
        protected override void OnClick(EventArgs e)
        {
            TextBox tx = null;

            tx = this.NamingContainer.FindControl(_textboxId) as TextBox;

            if (tx == null)
            {
                throw new ApplicationException("Le controle " + _textboxId + " est introuvable");
            }

            Guid g = Guid.Empty;

            BonsAchatsBll bll = new BonsAchatsBll(ECommerceServer.RjsId);
            try
            {
                g = bll.AssocierCodeAvecClient(ECommerceServer.Panier.ClientGuid, tx.Text);
            }
            catch (BonAchatPerimeException ex)
            {
                OnAjoutImpossible(BonsAchatsAjoutImpossibleRaison.BonAchatDejaUtilise,
                    ex.Message);
                return;
            }
            catch (BonAchatDejaUtiliseException)
            {
                OnAjoutImpossible(BonsAchatsAjoutImpossibleRaison.BonAchatDejaUtilise,
                    "Ce bon d'achat a déjà été utilisé");
                return;
            }
            catch (BonAchatInconnuException)
            {
                OnAjoutImpossible(BonsAchatsAjoutImpossibleRaison.BonAchatInconnu,
                    "Ce bon d'achat n'existe pas");
                return;

            }
            catch (Exception)
            {
                OnAjoutImpossible(BonsAchatsAjoutImpossibleRaison.ErreurTechnique,
                    "Les bons d'achats sont actuellement indisponibles, veuillez ré-essayer dans quelques minutes");
                return;
            }


            OnBonsAchatsAjoute(g);
            base.OnClick(e);
        }

    }


    /// <summary>
    /// GridView (table) affichant les bons d'achats
    /// d'un client.
    /// </summary>
    /// <remarks>Les données affichées sont de type <see cref="BonAchatData"/></remarks>
    /// <remarks>Ce contrôle ne peut être utilisé que dans le cadre du contrôle
    /// personnalisé <code>BonsAchatsSelectionnables.ascx</code></remarks>
    public class BonsAchatsGridView : GridView
    {

        #region Event BonAchatParsing
        /// <summary>
        /// Représente les données associées à un évènement <see cref="Parsing"/>
        /// </summary>
        public class BonAchatParsingArgs : EventArgs
        {

            /// <summary>
            /// Initialise une instance de <see cref="BonAchatParsingArgs"/>.
            /// </summary>
            /// <param name="bon">Le bon d'achat.</param>
            public BonAchatParsingArgs(BonsAchatsGridView.BonAchatData bon)
            {
                BonAchat = bon;
            }

            /// <summary>
            /// Obtient le bon d'achats
            /// </summary>
            public BonsAchatsGridView.BonAchatData BonAchat { get; private set; }
        }

        /// <summary>
        /// Délégué pour l'évènement  <see cref="Parsing"/>
        /// </summary>
        /// <param name="sender"><c>null</c> dans tous les cas</param>
        /// <param name="e">Le détail de l'évènement.</param>
        public delegate void BonAchatParsingHandler(object sender, BonAchatParsingArgs e);


        #endregion

        /// <summary>
        /// Initialise une instance de <see cref="BonsAchatsGridView"/>.
        /// </summary>
        public BonsAchatsGridView()
        {
            AutoGenerateColumns = false;
            ShowHeader = false;
            IsReadOnly = false;
        }

        /// <summary>
        /// Si le composant est readonly, les liens seront invisibles
        /// et les montants/etc ne seront pas marqués "disabled" si
        /// ils ne sont pas utilisables
        /// </summary>
        public bool IsReadOnly { get; set; }

        /// <summary>
        /// Levé lorsque les bons d'achats ont été convertis depuis
        /// la base de données dans la méthode <see cref="ParseBons"/>.
        /// </summary>
        /// <remarks>Cet évènement vous permet de modifier les bons
        /// pour appliquer des règles de gestion supplémentaires</remarks>
        public static event BonAchatParsingHandler Parsing;
        private static void OnBonAchatParsing(BonAchatData bon)
        {
            BonAchatParsingHandler evt = Parsing;
            if (evt != null)
            {
                BonAchatParsingArgs args = new BonAchatParsingArgs(bon);
                /* change args fields/property here */
                evt(bon, args);
            }
        }

        /// <summary>
        /// Représente un bon d'achat pour affichage dans
        /// le contrôle de règlement par bon d'achat
        /// </summary>
        [System.Obsolete("Cette classe est obsolète. Utilisez la classe ReglementDedie du namespace CPointSoftware.Equihira.Extensibility.Process", false)]
        [Serializable()]
        public class BonAchatData : IComparable
        {
            /// <summary>
            /// Obtient ou définit l'identifiant du bon d'achats
            /// </summary>
            public Guid Guid { get; set; }

            /// <summary>
            /// Obtient ou définit une valeur précisant si le bon
            /// d'achat est utilisable
            /// </summary>
            public bool EstUtilisable { get; set; }

            /// <summary>
            /// Obtient ou définit le libellé du bon
            /// </summary>
            public string Libelle { get; set; }

            /// <summary>
            /// Obtient ou définit une descriptif des conditions d'utilisation
            /// </summary>
            public string Conditions { get; set; }

            /// <summary>
            ///  Obtient ou définit les limitations "articles" pour les conditions
            /// </summary>
            public string LimitesArticles { get; set; }

            /// <summary>
            /// Obtient ou définit le groupe du bon d'achat
            /// </summary>
            /// <remarks>Un seul bon de chaque groupe peut
            /// être utilisé pour une commande</remarks>
            public string Groupe { get; set; }

            /// <summary>
            /// Obtient ou définit une valeur précisant si le bon
            /// d'achat a déjà été utilisé
            /// </summary>
            public bool EstUtilise { get; set; }

            /// <summary>
            /// Obtient ou définit le montant actuel du bon d'achats
            /// </summary>
            public decimal Montant { get; set; }

            /// <summary>
            /// Obtient ou définit le montant originel du bon d'achats
            /// </summary>
            public decimal MontantOriginal { get; set; }

            /// <summary>
            /// Obtient ou définit une valeur précisant si le bon
            /// d'achats est limité au paiement d'un panier avec
            /// un article particulier
            /// </summary>
            public bool EstLimiteArticle { get; set; }

            /// <summary>
            /// Obtient ou définit la date maximale d'utilisation
            /// du bon d'achats
            /// </summary>
            public DateTime DateMaxUtilisation { get; set; }

            /// <summary>
            /// Obtient ou définit la date maximale d'utilisation
            /// du bon d'achats
            /// </summary>
            public DateTime DateMinUtilisation { get; set; }

            #region IComparable Membres

            /// <summary>
            /// Compare l'instance actuelle avec un autre objet du même type et retourne un entier qui indique si l'instance actuelle précède ou suit un autre objet ou se trouve à la même position dans l'ordre de tri.
            /// </summary>
            /// <param name="obj">Objet à comparer à cette instance.</param>
            /// <returns>
            /// Valeur qui indique l'ordre relatif des objets comparés. La valeur de retour a les significations suivantes : Valeur  Signification  Inférieur à zéro  Cette instance précède <paramref name="obj" /> dans l'ordre de tri.  Zéro  Cette instance se produit dans la même position dans l'ordre de tri que <paramref name="obj" />.  Supérieure à zéro  Cette instance suit <paramref name="obj" /> dans l'ordre de tri.
            /// </returns>
            public int CompareTo(object obj)
            {
                if (obj == null || !(obj is BonAchatData))
                    return -1;
                BonAchatData d = obj as BonAchatData;

                if (EstLimiteArticle && !d.EstLimiteArticle)
                    return -1;

                return DateMaxUtilisation.CompareTo(d.DateMaxUtilisation);
            }

            #endregion
        }



        /// <summary>
        /// Converti un dataset avec des bons d'achats en objets
        /// pour affichage
        /// </summary>
        /// <param name="ds">Le dataset contenant les bons d'achats.</param>
        /// <param name="prv">Le panier actuel pour calculer les conditions.</param>
        /// <returns>Une liste de bons d'achats pour affichage</returns>
        public static List<BonsAchatsGridView.BonAchatData> ParseBons(BonsAchatsDS ds, PanierProvider prv)
        {
            List<BonsAchatsGridView.BonAchatData> ret = new List<BonsAchatsGridView.BonAchatData>();

            foreach (BonsAchatsDS.gestcom_bonsachatsRow r in ds.gestcom_bonsachats)
            {
                BonsAchatsGridView.BonAchatData dt = new BonsAchatsGridView.BonAchatData();

                dt.Guid = r.bac_guid;
                dt.Libelle = r.Isbac_libelleNull() ? "Bon d'achat" : r.bac_libelle;
                dt.EstUtilise = false;
                dt.EstUtilisable = true;
                if (!r.Isbac_art_guid_obligatoireNull()) dt.EstLimiteArticle = true;
                if (r.Isbac_date_maxi_utilisationNull()) dt.DateMaxUtilisation = DateTime.MaxValue;
                else dt.DateMaxUtilisation = r.bac_date_maxi_utilisation;

                if (r.Isbac_date_mini_utilisationNull()) dt.DateMinUtilisation = DateTime.MinValue;
                else dt.DateMinUtilisation = r.bac_date_mini_utilisation;


                dt.Montant = r.bac_montant_orig - r.bac_montant_utilise;
                dt.MontantOriginal = r.bac_montant_orig;
                dt.LimitesArticles = "";
                ret.Add(dt);
                if (!r.Isbac_groupeNull())
                    dt.Groupe = r.bac_groupe;

                DateTime dtCurr = DateTime.Now;

                if (ECommerceServer.Animation.IsModeTest())
                    dtCurr = ECommerceServer.Animation.Tests.TestDate.GetValueOrDefault(DateTime.Now);

                if (!r.Isbac_date_maxi_utilisationNull() && r.bac_date_maxi_utilisation < dtCurr)
                {
                    dt.EstUtilisable = false;
                    dt.Conditions = "Ce bon est terminé depuis le " + r.bac_date_maxi_utilisation.ToShortDateString();
                }
                else if (!r.Isbac_date_mini_utilisationNull() && r.bac_date_mini_utilisation > dtCurr)
                {
                    dt.EstUtilisable = false;
                    dt.Conditions = "Utilisable à partir du " + r.bac_date_mini_utilisation.ToShortDateString();
                }
                else if (!r.Isbac_montant_mini_utilisationNull() && r.bac_montant_mini_utilisation > prv.Montant)
                {
                    dt.EstUtilisable = false;
                    dt.Conditions = "Utilisable à partir de " + r.bac_montant_mini_utilisation.ToString("0.00 €");
                }
                else if (!r.Isbac_montant_maxi_utilisationNull() && r.bac_montant_maxi_utilisation < prv.Montant)
                {
                    dt.EstUtilisable = false;
                    dt.Conditions = "Utilisable jusqu'à " + r.bac_montant_maxi_utilisation.ToString("0.00 €");
                }
                else if (!r.Isbac_art_guid_obligatoireNull())
                {
                    bool bFound = false;

                    Guid art_guid = r.bac_art_guid_obligatoire;
                    decimal mnt = 0;
                    bFound = FindArticle(prv, art_guid, ref mnt);
                    if (!bFound)
                    {
                        dt.EstUtilisable = false;
                        string refer = "";
                        if (r.IsNull("art_ref"))
                            refer = "désignée";
                        else
                            refer = r["art_ref"] as string + (r.IsNull("art_libelle") ? "" : (" " + r["art_libelle"] as string));

                        dt.Conditions = "Utilisable uniquement avec la référence " + refer;
                        dt.LimitesArticles = "Utilisable uniquement avec la référence " + refer;
                    }
                }
                else if (!r.Isbac_vit_guid_obligatoireNull())
                {
                    bool found = false;

                    decimal mnt = 0;

                    ArticlesVitrinesDS dsArt = ECommerceServer.DataCache.GetContenuVitrine(r.bac_vit_guid_obligatoire);
                    if (dsArt != null)
                    {
                        foreach (ArticlesVitrinesDS.catalog_articles_vitrinesRow rArt in dsArt.catalog_articles_vitrines)
                        {
                            if (FindArticle(prv, rArt.var_art_guid, ref mnt))
                            {
                                found = true;
                            }
                        }
                    }


                    VitrinesDS dsVit = ECommerceServer.DataCache.Vitrines;
                    VitrinesDS.catalog_vitrinesRow rVit = dsVit.catalog_vitrines.FindByvit_guid(r.bac_vit_guid_obligatoire);

                    if (!found)
                    {
                        dt.EstUtilisable = false;
                        dt.EstLimiteArticle = true;
                        if (rVit == null)
                        {
                            dt.Conditions = "Ce bon d'achat n'est utilisable qu'avec certains produits";
                        }
                        else
                        {
                            dt.Conditions = "Uniquement avec des produits de la selection " + rVit.vit_libelle;
                        }
                    }
                    else if (!r.Isbac_montant_mini_utilisationNull() && r.bac_montant_mini_utilisation > mnt)
                    {
                        dt.EstUtilisable = false;
                        dt.Conditions = "Utilisable à partir de " + r.bac_montant_mini_utilisation.ToString("0.00 €") + " dans la sélection " + rVit.vit_libelle;
                    }
                    else if (!r.Isbac_montant_maxi_utilisationNull() && r.bac_montant_maxi_utilisation < mnt)
                    {
                        dt.EstUtilisable = false;
                        dt.Conditions = "Utilisable jusqu'à " + r.bac_montant_maxi_utilisation.ToString("0.00 €") + " dans la sélection " + rVit.vit_libelle;
                    }
                }

                OnBonAchatParsing(dt);
            }
            ret.Sort();
            return ret;
        }

        private static bool FindArticle(PanierProvider prv, Guid art_guid, ref decimal montant)
        {
            bool bFound = false;
            foreach (ElementPanier pn in prv.Contenu)
            {
                if (pn.ArticleGuid.Equals(art_guid))
                {
                    bFound = true;
                    montant += (pn.Quantite * pn.PuTTC);
                }
            }

            return bFound;
        }

    }

    /// <summary>
    /// Représente une colonne dans une <see cref="BonsAchatsGridView"/>
    /// affichant un td avec le libellé du bon d'achat
    /// </summary>
    /// <remarks>Ce contrôle ne peut être utilisé que dans le cadre du contrôle
    /// <see cref="BonsAchatsGridView"/></remarks>
    public class BonAchatsLabelGridColumn : EDataControlField
    {
        /// <summary>
        /// En cas de substitution dans une classe dérivée, crée un objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </summary>
        /// <returns>
        /// Objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </returns>
        protected override DataControlField CreateField()
        {
            return new BonAchatsLabelGridColumn();
        }

        /// <summary>
        /// Ajoute du texte ou des contrôles à la collection de contrôles d'une cellule.
        /// </summary>
        /// <param name="cell"><see cref="T:System.Web.UI.WebControls.DataControlFieldCell" /> qui contient le texte ou les contrôles du <see cref="T:System.Web.UI.WebControls.DataControlField" />.</param>
        /// <param name="cellType">Une des valeurs de <see cref="T:System.Web.UI.WebControls.DataControlCellType" />.</param>
        /// <param name="rowState">Une des valeurs <see cref="T:System.Web.UI.WebControls.DataControlRowState" /> spécifiant l'état de la ligne qui contient <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        /// <param name="rowIndex">Index de la ligne contenant <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);
            if (cellType == DataControlCellType.DataCell)
            {
                if (this.Visible)
                {
                    cell.DataBinding += new EventHandler(cell_DataBinding);
                }
            }
        }

        void cell_DataBinding(object sender, EventArgs e)
        {
            if (sender is TableCell)
            {
                TableCell cell = sender as TableCell;
                object o = DataBinder.GetDataItem(cell.NamingContainer);

                if (o is BonsAchatsGridView.BonAchatData)
                {
                    BonsAchatsGridView.BonAchatData b = o as BonsAchatsGridView.BonAchatData;
                    cell.Text = b.Libelle;
                    var t = (this.Control as BonsAchatsGridView);
                    if (t != null && t.IsReadOnly)
                        return;

                    if (!b.EstUtilisable)
                    {
                        cell.Enabled = false;
                        cell.CssClass = GetItemStyleCss() + " disabled";
                    }
                }
            }
        }

        private string GetItemStyleCss()
        {
            if (this.ItemStyle == null)
                return "";
            if (string.IsNullOrEmpty(this.ItemStyle.CssClass))
                return "";
            else

                return this.ItemStyle.CssClass;
        }
    }

    /// <summary>
    /// Représente une colonne dans une <see cref="BonsAchatsGridView"/>
    /// affichant un td avec le montant actuel du bon d'achat
    /// </summary>
    /// <remarks>Ce contrôle ne peut être utilisé que dans le cadre du contrôle
    /// <see cref="BonsAchatsGridView"/></remarks>
    public class BonAchatsAmountGridColumn : EDataControlField
    {
        /// <summary>
        /// Initialise une instance de <see cref="BonAchatsAmountGridColumn"/>.
        /// </summary>
        public BonAchatsAmountGridColumn()
        {
            Format = "{0:0.00}";
        }

        /// <summary>
        /// Obtient ou définit le format d'affichage du montant
        /// </summary>
        public string Format { get; set; }

        /// <summary>
        /// En cas de substitution dans une classe dérivée, crée un objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </summary>
        /// <returns>
        /// Objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </returns>
        protected override DataControlField CreateField()
        {
            return new BonAchatsLabelGridColumn();
        }

        /// <summary>
        /// Ajoute du texte ou des contrôles à la collection de contrôles d'une cellule.
        /// </summary>
        /// <param name="cell"><see cref="T:System.Web.UI.WebControls.DataControlFieldCell" /> qui contient le texte ou les contrôles du <see cref="T:System.Web.UI.WebControls.DataControlField" />.</param>
        /// <param name="cellType">Une des valeurs de <see cref="T:System.Web.UI.WebControls.DataControlCellType" />.</param>
        /// <param name="rowState">Une des valeurs <see cref="T:System.Web.UI.WebControls.DataControlRowState" /> spécifiant l'état de la ligne qui contient <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        /// <param name="rowIndex">Index de la ligne contenant <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);
            if (cellType == DataControlCellType.DataCell)
            {
                if (this.Visible)
                {
                    cell.DataBinding += new EventHandler(cell_DataBinding);
                }
            }
        }

        void cell_DataBinding(object sender, EventArgs e)
        {
            if (sender is TableCell)
            {
                TableCell cell = sender as TableCell;
                object o = DataBinder.GetDataItem(cell.NamingContainer);

                if (o is BonsAchatsGridView.BonAchatData)
                {
                    BonsAchatsGridView.BonAchatData b = o as BonsAchatsGridView.BonAchatData;
                    cell.Text = string.Format(Format, b.Montant);
                    var t = (this.Control as BonsAchatsGridView);
                    if (t != null && t.IsReadOnly)
                        return;

                    if (!b.EstUtilisable)
                    {
                        cell.Enabled = false;
                        cell.CssClass = GetItemStyleCss() + " disabled";

                    }
                }
            }
        }
        private string GetItemStyleCss()
        {
            if (this.ItemStyle == null)
                return "";
            if (string.IsNullOrEmpty(this.ItemStyle.CssClass))
                return "";
            else

                return this.ItemStyle.CssClass;
        }
    }


    /// <summary>
    /// Représente une colonne dans une <see cref="BonsAchatsGridView"/>
    /// affichant un td avec la date maximale d'utilisation du bon d'achat
    /// </summary>
    /// <remarks>Ce contrôle ne peut être utilisé que dans le cadre du contrôle
    /// <see cref="BonsAchatsGridView"/></remarks>
    public class BonAchatsDateMaxGridColumn : EDataControlField
    {
        /// <summary>
        /// Initialise une instance de <see cref="BonAchatsAmountGridColumn"/>.
        /// </summary>
        public BonAchatsDateMaxGridColumn()
        {
            Format = "{0:dd/MM/yyyy}";
        }

        /// <summary>
        /// Obtient ou définit le format d'affichage du montant, sous la forme
        /// {0:dd/MM/yyyy} (valeur par défaut)
        /// </summary>
        public string Format { get; set; }

        /// <summary>
        /// En cas de substitution dans une classe dérivée, crée un objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </summary>
        /// <returns>
        /// Objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </returns>
        protected override DataControlField CreateField()
        {
            return new BonAchatsLabelGridColumn();
        }

        /// <summary>
        /// Ajoute du texte ou des contrôles à la collection de contrôles d'une cellule.
        /// </summary>
        /// <param name="cell"><see cref="T:System.Web.UI.WebControls.DataControlFieldCell" /> qui contient le texte ou les contrôles du <see cref="T:System.Web.UI.WebControls.DataControlField" />.</param>
        /// <param name="cellType">Une des valeurs de <see cref="T:System.Web.UI.WebControls.DataControlCellType" />.</param>
        /// <param name="rowState">Une des valeurs <see cref="T:System.Web.UI.WebControls.DataControlRowState" /> spécifiant l'état de la ligne qui contient <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        /// <param name="rowIndex">Index de la ligne contenant <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);
            if (cellType == DataControlCellType.DataCell)
            {
                if (this.Visible)
                {
                    cell.DataBinding += new EventHandler(cell_DataBinding);
                }
            }
        }

        void cell_DataBinding(object sender, EventArgs e)
        {
            if (sender is TableCell)
            {
                TableCell cell = sender as TableCell;
                object o = DataBinder.GetDataItem(cell.NamingContainer);

                if (o is BonsAchatsGridView.BonAchatData)
                {
                    BonsAchatsGridView.BonAchatData b = o as BonsAchatsGridView.BonAchatData;
                    cell.Text = string.Format(Format, b.DateMaxUtilisation);
                    if (b.DateMaxUtilisation == DateTime.MinValue || b.DateMaxUtilisation == DateTime.MaxValue)
                        cell.Text = "";
                    var t = (this.Control as BonsAchatsGridView);
                    if (t != null && t.IsReadOnly)
                        return;

                    if (!b.EstUtilisable)
                    {
                        cell.Enabled = false;
                        cell.CssClass = GetItemStyleCss() + " disabled";

                    }
                }
            }
        }
        private string GetItemStyleCss()
        {
            if (this.ItemStyle == null)
                return "";
            if (string.IsNullOrEmpty(this.ItemStyle.CssClass))
                return "";
            else

                return this.ItemStyle.CssClass;
        }
    }

    /// <summary>
    /// Représente une colonne dans une <see cref="BonsAchatsGridView"/>
    /// affichant un td avec la date maximale d'utilisation du bon d'achat
    /// </summary>
    /// <remarks>Ce contrôle ne peut être utilisé que dans le cadre du contrôle
    /// <see cref="BonsAchatsGridView"/></remarks>
    public class BonAchatsDateMinGridColumn : EDataControlField
    {
        /// <summary>
        /// Initialise une instance de <see cref="BonAchatsAmountGridColumn"/>.
        /// </summary>
        public BonAchatsDateMinGridColumn()
        {
            Format = "{0:dd/MM/yyyy}";
        }

        /// <summary>
        /// Obtient ou définit le format d'affichage du montant
        /// sous la forme {0:dd/MM/yyyy} (valeur par défaut)
        /// </summary>
        public string Format { get; set; }

        /// <summary>
        /// En cas de substitution dans une classe dérivée, crée un objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </summary>
        /// <returns>
        /// Objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </returns>
        protected override DataControlField CreateField()
        {
            return new BonAchatsLabelGridColumn();
        }

        /// <summary>
        /// Ajoute du texte ou des contrôles à la collection de contrôles d'une cellule.
        /// </summary>
        /// <param name="cell"><see cref="T:System.Web.UI.WebControls.DataControlFieldCell" /> qui contient le texte ou les contrôles du <see cref="T:System.Web.UI.WebControls.DataControlField" />.</param>
        /// <param name="cellType">Une des valeurs de <see cref="T:System.Web.UI.WebControls.DataControlCellType" />.</param>
        /// <param name="rowState">Une des valeurs <see cref="T:System.Web.UI.WebControls.DataControlRowState" /> spécifiant l'état de la ligne qui contient <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        /// <param name="rowIndex">Index de la ligne contenant <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);
            if (cellType == DataControlCellType.DataCell)
            {
                if (this.Visible)
                {
                    cell.DataBinding += new EventHandler(cell_DataBinding);
                }
            }
        }

        void cell_DataBinding(object sender, EventArgs e)
        {
            if (sender is TableCell)
            {
                TableCell cell = sender as TableCell;
                object o = DataBinder.GetDataItem(cell.NamingContainer);

                if (o is BonsAchatsGridView.BonAchatData)
                {
                    BonsAchatsGridView.BonAchatData b = o as BonsAchatsGridView.BonAchatData;
                    cell.Text = string.Format(Format, b.DateMinUtilisation);
                    if (b.DateMinUtilisation == DateTime.MinValue || b.DateMinUtilisation == DateTime.MaxValue)
                        cell.Text = "";

                    var t = (this.Control as BonsAchatsGridView);
                    if (t != null && t.IsReadOnly)
                        return;

                    if (!b.EstUtilisable)
                    {
                        cell.Enabled = false;
                        cell.CssClass = GetItemStyleCss() + " disabled";

                    }
                }
            }
        }
        private string GetItemStyleCss()
        {
            if (this.ItemStyle == null)
                return "";
            if (string.IsNullOrEmpty(this.ItemStyle.CssClass))
                return "";
            else

                return this.ItemStyle.CssClass;
        }
    }

    /// <summary>
    /// Représente une colonne dans une <see cref="BonsAchatsGridView"/>
    /// affichant un td avec le montant d'origine du bon d'achat
    /// </summary>
    /// <remarks>Ce contrôle ne peut être utilisé que dans le cadre du contrôle
    /// <see cref="BonsAchatsGridView"/></remarks>
    public class BonAchatsOriginalAmountGridColumn : EDataControlField
    {
        /// <summary>
        /// Initialise une instance de <see cref="BonAchatsOriginalAmountGridColumn"/>.
        /// </summary>
        public BonAchatsOriginalAmountGridColumn()
        {
            Format = "{0:0.00}";
        }

        /// <summary>
        /// Obtient ou définit le format d'affichage du montant
        /// sous la forme {0:0.00} (valeur par défaut)
        /// </summary>
        public string Format { get; set; }

        /// <summary>
        /// En cas de substitution dans une classe dérivée, crée un objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </summary>
        /// <returns>
        /// Objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </returns>
        protected override DataControlField CreateField()
        {
            return new BonAchatsLabelGridColumn();
        }

        /// <summary>
        /// Ajoute du texte ou des contrôles à la collection de contrôles d'une cellule.
        /// </summary>
        /// <param name="cell"><see cref="T:System.Web.UI.WebControls.DataControlFieldCell" /> qui contient le texte ou les contrôles du <see cref="T:System.Web.UI.WebControls.DataControlField" />.</param>
        /// <param name="cellType">Une des valeurs de <see cref="T:System.Web.UI.WebControls.DataControlCellType" />.</param>
        /// <param name="rowState">Une des valeurs <see cref="T:System.Web.UI.WebControls.DataControlRowState" /> spécifiant l'état de la ligne qui contient <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        /// <param name="rowIndex">Index de la ligne contenant <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);
            if (cellType == DataControlCellType.DataCell)
            {
                if (this.Visible)
                {
                    cell.DataBinding += new EventHandler(cell_DataBinding);
                }
            }
        }

        void cell_DataBinding(object sender, EventArgs e)
        {
            if (sender is TableCell)
            {
                TableCell cell = sender as TableCell;
                object o = DataBinder.GetDataItem(cell.NamingContainer);

                if (o is BonsAchatsGridView.BonAchatData)
                {
                    BonsAchatsGridView.BonAchatData b = o as BonsAchatsGridView.BonAchatData;
                    cell.Text = string.Format(Format, b.MontantOriginal);

                    var t = (this.Control as BonsAchatsGridView);
                    if (t != null && t.IsReadOnly)
                        return;

                    if (!b.EstUtilisable)
                    {
                        cell.Enabled = false;
                        cell.CssClass = GetItemStyleCss() + " disabled";

                    }
                }
            }
        }
        private string GetItemStyleCss()
        {
            if (this.ItemStyle == null)
                return "";
            if (string.IsNullOrEmpty(this.ItemStyle.CssClass))
                return "";
            else

                return this.ItemStyle.CssClass;
        }
    }

    /// <summary>
    /// Représente une colonne dans une <see cref="BonsAchatsGridView"/>
    /// affichant un td avec un lien permettant d'utiliser le
    /// bon d'achat
    /// </summary>
    /// <remarks>Ce contrôle ne peut être utilisé que dans le cadre du contrôle
    /// <see cref="BonsAchatsGridView"/></remarks>
    public class BonAchatsUtiliserGridColumn : EDataControlField
    {
        /// <summary>
        /// Obtient ou définit le texte du lien
        /// </summary>
        public string Text { get; set; }

        /// <summary>
        /// En cas de substitution dans une classe dérivée, crée un objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </summary>
        /// <returns>
        /// Objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </returns>
        protected override DataControlField CreateField()
        {
            return new BonAchatsLabelGridColumn();
        }

        /// <summary>
        /// Ajoute du texte ou des contrôles à la collection de contrôles d'une cellule.
        /// </summary>
        /// <param name="cell"><see cref="T:System.Web.UI.WebControls.DataControlFieldCell" /> qui contient le texte ou les contrôles du <see cref="T:System.Web.UI.WebControls.DataControlField" />.</param>
        /// <param name="cellType">Une des valeurs de <see cref="T:System.Web.UI.WebControls.DataControlCellType" />.</param>
        /// <param name="rowState">Une des valeurs <see cref="T:System.Web.UI.WebControls.DataControlRowState" /> spécifiant l'état de la ligne qui contient <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        /// <param name="rowIndex">Index de la ligne contenant <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);

            var t = (this.Control as BonsAchatsGridView);
            if (t != null && t.IsReadOnly)
                return;

            if (cellType == DataControlCellType.DataCell)
            {
                if (this.Visible)
                {
                    cell.DataBinding += new EventHandler(cell_DataBinding);
                    LinkButton btn = new LinkButton();
                    btn.ID = "lnkSelect";
                    btn.Text = Text;
                    cell.Controls.Add(btn);
                }
            }
        }

        void cell_DataBinding(object sender, EventArgs e)
        {
            if (sender is TableCell)
            {
                TableCell cell = sender as TableCell;
                object o = DataBinder.GetDataItem(cell.NamingContainer);

                var t = (this.Control as BonsAchatsGridView);
                if (t != null && t.IsReadOnly)
                    return;

                if (o is BonsAchatsGridView.BonAchatData)
                {
                    BonsAchatsGridView.BonAchatData b = o as BonsAchatsGridView.BonAchatData;
                    LinkButton btn = cell.FindControl("lnkSelect") as LinkButton;
                    btn.CssClass = b.EstUtilise ? "selected" : "unselected";
                    btn.CommandName = b.EstUtilise ? "unselect" : "select";
                    btn.Enabled = b.EstUtilisable;
                    btn.CommandArgument = b.Guid.ToString();
                }
            }
        }
    }

    /// <summary>
    /// Représente une colonne dans une <see cref="BonsAchatsGridView"/>
    /// affichant un td avec les conditions d'utilisation du bon d'achat
    /// </summary>
    /// <remarks>Ce contrôle ne peut être utilisé que dans le cadre du contrôle
    /// <see cref="BonsAchatsGridView"/></remarks>
    public class BonAchatsConditionsGridColumn : EDataControlField
    {

        /// <summary>
        /// En cas de substitution dans une classe dérivée, crée un objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </summary>
        /// <returns>
        /// Objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </returns>
        protected override DataControlField CreateField()
        {
            return new BonAchatsLabelGridColumn();
        }

        /// <summary>
        /// Ajoute du texte ou des contrôles à la collection de contrôles d'une cellule.
        /// </summary>
        /// <param name="cell"><see cref="T:System.Web.UI.WebControls.DataControlFieldCell" /> qui contient le texte ou les contrôles du <see cref="T:System.Web.UI.WebControls.DataControlField" />.</param>
        /// <param name="cellType">Une des valeurs de <see cref="T:System.Web.UI.WebControls.DataControlCellType" />.</param>
        /// <param name="rowState">Une des valeurs <see cref="T:System.Web.UI.WebControls.DataControlRowState" /> spécifiant l'état de la ligne qui contient <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        /// <param name="rowIndex">Index de la ligne contenant <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);
            if (cellType == DataControlCellType.DataCell)
            {
                if (this.Visible)
                {
                    cell.DataBinding += new EventHandler(cell_DataBinding);
                }
            }
        }

        void cell_DataBinding(object sender, EventArgs e)
        {
            if (sender is TableCell)
            {
                TableCell cell = sender as TableCell;
                object o = DataBinder.GetDataItem(cell.NamingContainer);

                if (o is BonsAchatsGridView.BonAchatData)
                {
                    BonsAchatsGridView.BonAchatData b = o as BonsAchatsGridView.BonAchatData;
                    cell.Text = b.Conditions;
                    var t = (this.Control as BonsAchatsGridView);
                    if (t != null && t.IsReadOnly)
                        return;

                    if (!b.EstUtilisable)
                    {
                        cell.Enabled = false;
                        cell.CssClass = GetItemStyleCss() + " disabled";

                    }
                }
            }
        }
        private string GetItemStyleCss()
        {
            if (this.ItemStyle == null)
                return "";
            if (string.IsNullOrEmpty(this.ItemStyle.CssClass))
                return "";
            else

                return this.ItemStyle.CssClass;
        }
    }


    /// <summary>
    /// Représente une colonne dans une <see cref="BonsAchatsGridView"/>
    /// affichant un td avec l(es) article(s) obligatoire pour utiliser
    /// ce bon d'achat.
    /// </summary>
    /// <remarks>Ce contrôle ne peut être utilisé que dans le cadre du contrôle
    /// <see cref="BonsAchatsGridView"/></remarks>
    public class BonAchatsArticleGridColumn : EDataControlField
    {

        /// <summary>
        /// En cas de substitution dans une classe dérivée, crée un objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </summary>
        /// <returns>
        /// Objet dérivé de <see cref="T:System.Web.UI.WebControls.DataControlField" /> vide.
        /// </returns>
        protected override DataControlField CreateField()
        {
            return new BonAchatsLabelGridColumn();
        }

        /// <summary>
        /// Ajoute du texte ou des contrôles à la collection de contrôles d'une cellule.
        /// </summary>
        /// <param name="cell"><see cref="T:System.Web.UI.WebControls.DataControlFieldCell" /> qui contient le texte ou les contrôles du <see cref="T:System.Web.UI.WebControls.DataControlField" />.</param>
        /// <param name="cellType">Une des valeurs de <see cref="T:System.Web.UI.WebControls.DataControlCellType" />.</param>
        /// <param name="rowState">Une des valeurs <see cref="T:System.Web.UI.WebControls.DataControlRowState" /> spécifiant l'état de la ligne qui contient <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        /// <param name="rowIndex">Index de la ligne contenant <see cref="T:System.Web.UI.WebControls.DataControlFieldCell" />.</param>
        public override void InitializeCell(DataControlFieldCell cell, DataControlCellType cellType, DataControlRowState rowState, int rowIndex)
        {
            base.InitializeCell(cell, cellType, rowState, rowIndex);
            if (cellType == DataControlCellType.DataCell)
            {
                if (this.Visible)
                {
                    cell.DataBinding += new EventHandler(cell_DataBinding);
                }
            }
        }

        void cell_DataBinding(object sender, EventArgs e)
        {
            if (sender is TableCell)
            {
                TableCell cell = sender as TableCell;
                object o = DataBinder.GetDataItem(cell.NamingContainer);

                if (o is BonsAchatsGridView.BonAchatData)
                {
                    BonsAchatsGridView.BonAchatData b = o as BonsAchatsGridView.BonAchatData;
                    cell.Text = string.IsNullOrEmpty(b.LimitesArticles) ? "" : b.LimitesArticles;
                    var t = (this.Control as BonsAchatsGridView);
                    if (t != null && t.IsReadOnly)
                        return;

                    if (!b.EstUtilisable)
                    {
                        cell.Enabled = false;
                        cell.CssClass = GetItemStyleCss() + " disabled";

                    }
                }
            }
        }
        private string GetItemStyleCss()
        {
            if (this.ItemStyle == null)
                return "";
            if (string.IsNullOrEmpty(this.ItemStyle.CssClass))
                return "";
            else
                return this.ItemStyle.CssClass;
        }
    }

    /// <summary>
    /// Affiche un lien permettant de recupérer un bon d'achat bloqué
    /// </summary>
    public class BonAchatsRecupereLink : LinkButton
    {

        /// <summary>
        /// Représente les détails pour un événement du type <see cref="Recuperation"/>
        /// </summary>
        public class BonsAchatsRecuperationEventArgs : EventArgs
        {
            /// <summary>
            /// Obtient ou définit le descriptif de l'erreur
            /// </summary>
            public string Texte { get; set; }
        }

        /// <summary>
        /// Levé lorsqu'un bon d'achat est ajouté
        /// </summary>
        public event EventHandler<BonsAchatsRecuperationEventArgs> BonsAchatsRecupe;
        private void OnBonsAchatsRecupe()
        {

            EventHandler<BonsAchatsRecuperationEventArgs> evt = BonsAchatsRecupe;
            if (evt != null)
            {
                BonsAchatsRecuperationEventArgs args = new BonsAchatsRecuperationEventArgs();

                evt(this, args);
            }
        }

        /// <summary>
        /// Déclenche l'événement <see cref="E:System.Web.UI.WebControls.LinkButton.Click" /> du contrôle <see cref="T:System.Web.UI.WebControls.LinkButton" />.
        /// </summary>
        /// <param name="e"><see cref="T:System.EventArgs" /> qui contient les données d'événement.</param>
        protected override void OnClick(EventArgs e)
        {
            PanierProvider prv = ECommerceServer.Panier;
            BonsAchatsBll babll = new BonsAchatsBll(ECommerceServer.RjsId);
            BonsAchatsDS dsAll = new BonsAchatsBll(ECommerceServer.RjsId).GetBonsClient(prv.ClientGuid);
            var bcbll = new CPointSoftware.Equihira.Business.ECommerce.BonsCommandesBll(ECommerceServer.RjsId, ECommerceServer.SiteId);
            foreach (var rgba in dsAll.gestcom_bonsachats)
            {
                if (!rgba.Isbac_bcd_guid_bloquanteNull())
                {
                    var bcds = bcbll.Get(rgba.bac_bcd_guid_bloquante);
                    if (bcds.ecommerce_bonscommandes.Count != 0)
                    {
                        var etat = bcds.ecommerce_bonscommandes[0].ebc_etat;
                        if (etat == 0 || etat == 127)
                            babll.DebloquerBonAchat(rgba.bac_guid, rgba.bac_bcd_guid_bloquante);
                    }

                }

            }

            OnBonsAchatsRecupe();

            base.OnClick(e);
            
        }
    }

}
