<%@ Control Language="C#" AutoEventWireup="true" Inherits="CPointSoftware.ECommerce.Tools.ReglementDepliableUserControl" %>

<%@ Import Namespace="CPointSoftware.ECommerce.Tools" %>
<%@ Import Namespace="CPointSoftware.Equihira.Business.Clients" %>
<%@ Import Namespace="CPointSoftware.Equihira.Business.Clients.Data" %>
<%@ Import Namespace="CPointSoftware.Equihira.Business.Common" %>
<%@ Import Namespace="CPointSoftware.Equihira.Business.Catalogue.Data" %>


<script runat="server">
    public override bool PeutEtreOuvertParDefaut
    {
        get
        {
            if (!ADesBonsAchatsAuDepart)
                return false;
            if (ECommerceServer.Panier.VerifierSiReglementDuType(ModeReglementGuid.Value))
                return false;
            return base.PeutEtreOuvertParDefaut;
        }
    }

    public override bool ClefComplementObligatoire
    {
        get
        {
            return false;
        }
    }

    public override bool ClefMarchandObligatoire
    {
        get
        {
            return false;
        }
    }

    public override bool PeutEtreMisEnAvant
    {
        get
        {
            return ADesBonsAchatsAuDepart;
        }
    }


    private bool ADesBonsAchatsAuDepart
    {
        get
        {
            if (Session["__e_bonsachats_surlecompteaudebut__"] == null)
            {
                CPointSoftware.Equihira.Business.Clients.BonsAchatsBll bll = new CPointSoftware.Equihira.Business.Clients.BonsAchatsBll(ECommerceServer.RjsId);
                int i = bll.GetNombreBonAchatsActifs(ECommerceServer.Panier.ClientGuid, ECommerceServer.Panier.GetGuidCommande());
                bool adesba = i > 0;
                Session["__e_bonsachats_surlecompteaudebut__"] = adesba;
                return adesba;
            }
            else return (bool)Session["__e_bonsachats_surlecompteaudebut__"];
        }
    }

    private bool BonsBloques
    {
        get
        {
            return new CPointSoftware.Equihira.Business.Clients.BonsAchatsBll(ECommerceServer.RjsId).EstClientBloque(ECommerceServer.Panier.ClientGuid, ECommerceServer.Panier.GetGuidCommande());
        }

    }

    private List<BonsAchatsGridView.BonAchatData> BonsAchats
    {
        get
        {
            if (ViewState["balist"] == null)
            {
                PanierProvider prv = ECommerceServer.Panier;
                CPointSoftware.Equihira.Business.Clients.Data.BonsAchatsDS ds = new CPointSoftware.Equihira.Business.Clients.BonsAchatsBll(ECommerceServer.RjsId).GetBonsClient(prv.ClientGuid, ECommerceServer.Panier.GetGuidCommande());
                List<BonsAchatsGridView.BonAchatData> ret = BonsAchatsGridView.ParseBons(ds, prv);

                var utilises = prv.GetReglementsDuType(this.ModeReglementGuid.GetValueOrDefault());
                foreach(var r in utilises.ecommerce_bonscommandes_intentionsreglement)
                {
                    if (r.Isirc_numeroNull() || string.IsNullOrEmpty(r.irc_numero))
                        continue;
                    Guid bacGuid = Guid.Parse(r.irc_numero);
                    var bac = (from z in ret where z.Guid.Equals(bacGuid) select z).FirstOrDefault();
                    if (bac != null && !bac.EstUtilise)
                        bac.EstUtilise = true;
                }

                BonsAchats = ret;
                return ret;
            }
            else return (List<BonsAchatsGridView.BonAchatData>)ViewState["balist"];
        }

        set
        {
            ViewState["balist"] = value;
        }
    }

    public override void Fermer()
    {
        //base.Fermer();
        //if (BonsBloques)
        //    mwBA.SetActiveView(vwLocked);
        //else
        if (ECommerceServer.Panier.VerifierSiReglementDuType(ModeReglementGuid.Value))
            mwBA.SetActiveView(vwSelectionne);
        else if (BonsAchats.Count > 0)
            mwBA.SetActiveView(vwClosed);
        else
            mwBA.SetActiveView(vwAucunFerme);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        PanierProvider prv = ECommerceServer.Panier;
        //bool aUnAvoir = prv.VerifierSiReglementDuType(new Guid("123726E1-7663-48BD-9A3E-5BCDD6ECADE9"));

        //if (aUnAvoir) this.Visible = false;

        if (!IsPostBack)
        {
            lnkChoisir.Visible = false;
            if (prv.VerifierSiReglementDuType(this.ModeReglementGuid.GetValueOrDefault()))
            {
                mwBA.SetActiveView(vwSelectionne);
            }

            else if (!ADesBonsAchatsAuDepart)
            {
                mwBA.SetActiveView(vwAucunFerme);
            }
            else
            {
                mwBA.SetActiveView(vwSelectionEnCours);
            }

            if (BonsBloques)
            {
                pnlUnlock.Visible = true;
            }
        }

        gdvBons.DataSource = BonsAchats;
        gdvBons.DataBind();

    }

    public override void Ouvrir()
    {
        PanierProvider prv = ECommerceServer.Panier;
        if (mwBA.ActiveViewIndex >= 0)
        {
            View v = mwBA.Views[mwBA.ActiveViewIndex];
            if (v == vwClosed || v == vwSelectionne) // fermé totalement
            {
                //prv.RetirerReglementsDuType(ModeReglementGuid.Value);
                //foreach (BonsAchatsGridView.BonAchatData d in BonsAchats)
                //    d.EstUtilise = false;
                //new CPointSoftware.Equihira.Business.Clients.BonsAchatsBll(ECommerceServer.RjsId).DebloquerClient(prv.ClientGuid, prv.GetGuidCommande());
                if (BonsAchats.Count > 0)
                {
                    mwBA.SetActiveView(vwSelectionEnCours);
                    gdvBons.DataSource = BonsAchats;
                    gdvBons.DataBind();
                }
                else
                {
                    mwBA.SetActiveView(vwAucunOuvert);
                }
            }
            else if (v == vwAucunFerme)
            {
                mwBA.SetActiveView(vwAucunOuvert);
            }
        }
        base.Ouvrir();
    }

    protected void lnkAjouter_BonsAchatsAjoute(object sender, BonsAchatsAjouterLink.BonsAchatsAjoutAjouteEventArgs e)
    {
        lblErreurAjout1.Visible = false;
        lblErreurAjout2.Visible = false;
        txtAjouter1.Text = "";
        txtAjouter2.Text = "";

        if (mwBA.ActiveViewIndex <= 2)
        {
            mwBA.SetActiveView(vwSelectionEnCours);
        }


        pnlAjouter2.Visible = false;
        pnlDemarrerAjout.Visible = true;


        BonsAchats = null;
        gdvBons.DataSource = BonsAchats;

        decimal mnt = 0.0M;

        foreach (BonsAchatsGridView.BonAchatData ach in BonsAchats)
        {
            if (ach.Guid == e.BonAchatGuid)
            {
                if (ach.EstUtilisable)
                    ach.EstUtilise = true;
            }
            else
                ach.EstUtilise = false;

            if (ach.EstUtilise)
                mnt += ach.Montant;
        }

        if (mnt > 0)
        {
            if (lnkChoisir != null) lnkChoisir.Visible = true;
            if (pnlReste != null) pnlReste.Visible = true;
        }
        else
        {
            if (lnkChoisir != null) lnkChoisir.Visible = false;
            if (pnlReste != null) pnlReste.Visible = false;
        }

        decimal reste = ECommerceServer.Panier.MontantNonPaye;

        if (lblReste != null)
        {
            lblReste.Text = reste > mnt ? (reste - mnt).ToString("0.00 €") : 0.ToString("0.00 €");
        }

        if (lnkChoisir != null)
        {
            if ((reste - mnt) <= 0)
            {
                lnkChoisir.CssClass = "complet";
            }
            else
            {
                lnkChoisir.CssClass = "";
            }
        }


        gdvBons.DataBind();
    }

    protected void lnkAjouter1_AjoutImpossible(object sender, BonsAchatsAjouterLink.BonsAchatsAjoutImpossibleEventArgs e)
    {
        if (lblErreurAjout1 != null)
        {
            lblErreurAjout1.Visible = true;
            lblErreurAjout1.Text = e.Texte;
            txtAjouter1.Focus();
        }
    }

    protected void lnkAjouter2_AjoutImpossible(object sender, BonsAchatsAjouterLink.BonsAchatsAjoutImpossibleEventArgs e)
    {
        if (lblErreurAjout2 != null)
        {
            lblErreurAjout2.Visible = true;
            lblErreurAjout2.Text = e.Texte;
            txtAjouter2.Focus();
        }
    }

    protected void gdvBons_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (!e.CommandName.Equals("select") && !e.CommandName.Equals("unselect"))
            return;

        List<BonsAchatsGridView.BonAchatData> data = BonsAchats;
        Guid g = new Guid(e.CommandArgument as string);

        decimal mnt = 0.0M;

        foreach (BonsAchatsGridView.BonAchatData ach in data)
        {
            if (ach.Guid.Equals(g))
            {
                switch (e.CommandName)
                {
                    case "select":
                        if (ach.EstUtilisable) {
						 ach.EstUtilise = true;
						 BasicLogHelper.TracerInfo(1, EServer.Service.ECommerce, string.Format("{0} utilisé", ach.Libelle));
						 }
						 else {
							BasicLogHelper.TracerInfo(1, EServer.Service.ECommerce, string.Format("{0} n'était pas disponible", ach.Libelle));
						 }
                        break;
                    case "unselect":
                        ach.EstUtilise = false;
                        break;
                }
            }

            if (ach.EstUtilise)
            {
                mnt += ach.Montant;
            }
        }

        if (mnt > 0)
        {
            if (lnkChoisir != null) lnkChoisir.Visible = true;
            if (pnlReste != null) pnlReste.Visible = true;
        }
        else
        {
            if (lnkChoisir != null) lnkChoisir.Visible = false;
            if (pnlReste != null) pnlReste.Visible = false;
        }

        decimal reste = ECommerceServer.Panier.MontantNonPaye;

        if (lblReste != null)
        {
            lblReste.Text = reste > mnt ? (reste - mnt).ToString("0.00 €") : 0.ToString("0.00 €");
        }

        if (lnkChoisir != null)
        {
            if ((reste - mnt) <= 0)
            {
                lnkChoisir.CssClass = "complet";
            }
            else
            {
                lnkChoisir.CssClass = "";
            }
        }

        RefreshBonsAchats(data);

        BonsAchats = data;
        gdvBons.DataSource = BonsAchats;
        gdvBons.DataBind();

        Consommer();
    }

    private void RefreshBonsAchats(List<BonsAchatsGridView.BonAchatData> data)
    {
        List<string> typeactif = new List<string>();
        PanierProvider prv = ECommerceServer.Panier;
        CPointSoftware.Equihira.Business.Clients.Data.BonsAchatsDS ds = new CPointSoftware.Equihira.Business.Clients.BonsAchatsBll(ECommerceServer.RjsId).GetBonsClient(prv.ClientGuid, prv.GetGuidCommande());

        foreach (BonsAchatsGridView.BonAchatData d in data)
        {
            if (d.EstUtilise && !string.IsNullOrEmpty(d.Groupe))
                typeactif.Add(d.Groupe);
        }

        foreach (CPointSoftware.Equihira.Business.Clients.Data.BonsAchatsDS.gestcom_bonsachatsRow r in ds.gestcom_bonsachats)
        {
            BonsAchatsGridView.BonAchatData dt = null;
            foreach (BonsAchatsGridView.BonAchatData d in data)
            {
                if (d.Guid.Equals(r.bac_guid))
                {
                    dt = d;
                    break;
                }
            }
            if (dt == null)
            {
                dt = new BonsAchatsGridView.BonAchatData();

                dt.Guid = r.bac_guid;
                dt.Libelle = r.Isbac_libelleNull() ? "Bon d'achat" : r.bac_libelle;
                dt.EstUtilise = false;
                dt.EstUtilisable = true;
                dt.Montant = r.bac_montant_orig - r.bac_montant_utilise;
                if (!r.Isbac_groupeNull())
                    dt.Groupe = r.bac_groupe;

                data.Add(dt);
            }

            dt.EstUtilisable = true;

            if (!string.IsNullOrEmpty(dt.Groupe))
            {
                if (!dt.EstUtilise)
                {
                    if (typeactif.Contains(dt.Groupe))
                        dt.EstUtilisable = false;
                }
            }
            if (!r.Isbac_date_maxi_utilisationNull() && r.bac_date_maxi_utilisation < DateTime.Now)
            {
                dt.EstUtilisable = false;
                dt.Conditions = "Ce bon est terminé depuis le " + r.bac_date_maxi_utilisation.ToShortDateString();
            }
            else if (!r.Isbac_date_mini_utilisationNull() && r.bac_date_mini_utilisation > DateTime.Now)
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

                foreach (ElementPanier pn in prv.Contenu)
                {
                    if (pn.ArticleGuid.Equals(r.bac_art_guid_obligatoire))
                    {
                        bFound = true;
                        break;
                    }
                }
                if (!bFound)
                {
                    dt.EstUtilisable = false;
                    string refer = "";
                    if (r.IsNull("art_ref"))
                        refer = "désignée";
                    else
                        refer = r["art_ref"] as string + (r.IsNull("art_libelle") ? "" : (" " + r["art_libelle"] as string));

                    dt.Conditions = "Utilisable uniquement avec la référence " + refer;
                }
            }
            else if (!r.Isbac_vit_guid_obligatoireNull())
            {
                bool found = false;

                decimal mnt = 0;

                CPointSoftware.Equihira.Business.Catalogue.Data.ArticlesVitrinesDS dsArt = ECommerceServer.DataCache.GetContenuVitrine(r.bac_vit_guid_obligatoire);
                if (dsArt != null)
                {
                    foreach (CPointSoftware.Equihira.Business.Catalogue.Data.ArticlesVitrinesDS.catalog_articles_vitrinesRow rArt in dsArt.catalog_articles_vitrines)
                    {
                        if (FindArticle(prv, rArt.var_art_guid, ref mnt))
                        {
                            found = true;
                        }
                    }
                }


                CPointSoftware.Equihira.Business.Catalogue.Data.VitrinesDS dsVit = ECommerceServer.DataCache.Vitrines;
                CPointSoftware.Equihira.Business.Catalogue.Data.VitrinesDS.catalog_vitrinesRow rVit = dsVit.catalog_vitrines.FindByvit_guid(r.bac_vit_guid_obligatoire);

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
        }
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

    public override void Selectionner()
    {
        Fermer();

    }

    public void Consommer()
    {
        PanierProvider prv = ECommerceServer.Panier;
        prv.RetirerReglementsDuType(ModeReglementGuid.Value);

        CPointSoftware.Equihira.Business.Clients.BonsAchatsBll bll = new CPointSoftware.Equihira.Business.Clients.BonsAchatsBll(ECommerceServer.RjsId);
        //if (bll.EstClientBloque(prv.ClientGuid, prv.GetGuidCommande()))
        //{
        //    mwBA.SetActiveView(vwLocked);
        //    return;
        //}
        List<BonsAchatsGridView.BonAchatData> d = new List<BonsAchatsGridView.BonAchatData>(BonsAchats);

        d.Sort();
        decimal mnt = prv.MontantNonPayeSaufPrincipal;
        bool hasLigne = false;
        foreach (BonsAchatsGridView.BonAchatData ach in d)
        {

            if (ach.EstUtilise)
            {
                decimal r = ach.Montant;
                if (mnt < r)
                    r = mnt;
                prv.AjouterReglement(ModeReglementGuid.Value, ach.Guid.ToString(), r, DateTime.Now, true, CPointSoftware.Equihira.Common.TypeReglement.BonsAchats, ach.Guid, false);
				
				BasicLogHelper.TracerInfo(1, EServer.Service.ECommerce, string.Format("{0} pris en compte : {1} regs", ach.Libelle,
					prv.GetReglementsDuType(ModeReglementGuid.Value).ecommerce_bonscommandes_intentionsreglement.Count));
                mnt -= r;
                hasLigne = true;
                bll.BloquerBonAchat(ach.Guid, prv.GetGuidCommande());
            }
            else 
                bll.DebloquerBonAchat(ach.Guid, prv.GetGuidCommande(), true);
        }

        

        CPointSoftware.Equihira.Business.Common.BasicLogHelper.TracerInfo(1, CPointSoftware.Equihira.Business.Common.EServer.Service.ECommerce, "reglement",
            string.Format("Paiement par bons d'achats pour la commande {0}",
            ECommerceServer.Panier.GetGuidCommande()));


        if (prv.MontantNonPayeSaufPrincipal <= 0M)
        {
            prv.TerminerCommande();
            Response.Redirect(string.Format("~/exec/process/RecuCommande.aspx?guid={0}", ECommerceServer.Panier.GetGuidCommande()));
        }
        else
        {

        }

    }

    protected void lnkDemarerAjout_Click(object sender, EventArgs e)
    {
        pnlAjouter2.Visible = true;
        pnlDemarrerAjout.Visible = false;

    }


</script>

<asp:MultiView runat="server" ID="mwBA">


    <asp:View runat="server" ID="vwSelectionne">
	<div class="TypeReglement">
        <div class="ligne_1_valider">          
                <div id="bon-achat-modifier" style="float:right"><ecom:ReglementOuvrirLinkButton ID="ReglementOuvrirLinkButton2" runat="server" class="btn-link" Text="Modifier"  /></div>            
			
            <div class="pmt_3">
			Vous utilisez des bons d'achats pour un montant de
                <ecom:BonsAchatsUtiliseMontant ID="BonsAchatsUtiliseMontant1" cssclass="Montant" runat="server" Format="{0:0.00} €" />
            </div>
        </div>
	</div>	
    </asp:View>
	
	
    <asp:View runat="server" ID="vwAucunFerme">
	    <div class="TypeReglement">
                         <h3>
                        <ecom:ReglementOuvrirLinkButton CausesValidation="false" ID="ReglementOuvrirLinkButton1" runat="server" CssClass="butt1">
                            <i></i>Bons d'achat
                        </ecom:ReglementOuvrirLinkButton>
                        </h3>

			<div class="ligne_1">
               
                <ecom:ReglementOuvrirLinkButton ID="ReglementChoixLinkButton1" CausesValidation="false" runat="server">
                    <small><span class='icon icon-plus'></span></small> Ajouter un bon d'achat
                </ecom:ReglementOuvrirLinkButton>
				
				
            </div>
        </div>
    </asp:View>
	
	
    <asp:View runat="server" ID="vwAucunOuvert">
	<div class="TypeReglement">


               	
                        <h3>
                            <ecom:ReglementFermerLinkButton ID="ReglementFermerLinkButton2" runat="server" CssClass="butt1 orange">                              
                                <span class="orange icon-radio-checked"></span>Bons d'achat                               
                            </ecom:ReglementFermerLinkButton>
                         </h3>



		
		
	        <asp:Panel runat="server" ID="pnlAjouter1" DefaultButton="lnkAjouter1" CssClass="">
             
                <div id="form-bon" class="form-inline">
                        <div class="form-group">

	            Saisissez votre bon d'achat : 

	                <asp:TextBox runat="server" CssClass="inputcheque form-control" ID="txtAjouter1" />
	                <ecom:BonsAchatsAjouterLink runat="server" CssClass="ajouter-ok btn btn-gris" Text="" ID="lnkAjouter1" TextboxID="txtAjouter1"
	                    OnBonsAchatsAjoute="lnkAjouter_BonsAchatsAjoute" OnAjoutImpossible="lnkAjouter1_AjoutImpossible">
                        Ajouter

                            </ecom:BonsAchatsAjouterLink>


                        </div>
	                <div id="erreur-bon-achat">
                        <asp:Label CssClass="obligatoire" runat="server" ID="lblErreurAjout1" Visible="false" />

	                </div>
	            </div>
	        </asp:Panel>

	</div>	
    </asp:View>
	


	
    <asp:View runat="server" ID="vwSelectionEnCours">
	<div class="TypeReglement">
       	
                        <h3>
                            <ecom:ReglementFermerLinkButton ID="ReglementFermerLinkButton1" runat="server" CssClass="butt1 orange">                              
                                <span class="orange icon-radio-checked"></span>Bons d'achat                               
                            </ecom:ReglementFermerLinkButton>
                         </h3>

      
				
			<p><b>Rappel : </b>les bons d'achat ne sont pas compatibles avec les paiements par chèque.</p> 
            <div class="detail_paiement table-responsive">
                <ecom:BonsAchatsGridView runat="server" ID="gdvBons" CssClass="ListeBonsAchats table table-condensed" OnRowCommand="gdvBons_RowCommand" GridLines="None">
                    <Columns>
                        <ecom:BonAchatsUtiliserGridColumn runat="server" ItemStyle-CssClass="case1" />
                        <ecom:BonAchatsLabelGridColumn runat="server" ItemStyle-CssClass="case2" />
                        <ecom:BonAchatsConditionsGridColumn runat="server" ItemStyle-CssClass="case3" />
                        <ecom:BonAchatsDateMinGridColumn runat="server" ItemStyle-CssClass="text-center"  />
                        <ecom:BonAchatsDateMaxGridColumn runat="server" ItemStyle-CssClass="text-center" />
                        <ecom:BonAchatsAmountGridColumn runat="server" ItemStyle-CssClass="case4 Montant text-right" Format="{0:0.00} €" />
                    </Columns>
                </ecom:BonsAchatsGridView>
				
                <asp:Panel ID="pnlDemarrerAjout" runat="server" CssClass="ajouter-bon">
                   <asp:LinkButton class="btn btn-gris" runat="server" ID="lnkDemarerAjout" 
                    Text="<small><span class='icon icon-plus'></span></small> Ajouter un bon d'achat" onclick="lnkDemarerAjout_Click" />
                    <p>(vous disposez d’un bon d’achat qui n’est pas dans la liste ci-dessus)</p>
                </asp:Panel>

                <asp:panel runat="server" ID="pnlUnlock" Visible="false">
	            <div class="TypeReglement">
        
                        <p><b>
                        Vous avez déjà une commande utilisant des bons d'achats en cours de validation,</b><br />

                        <%--pour les débloquer cliquez <a href="../../my/encours.htm">ici</a></p>--%>
        
	            </div>	
                </asp:panel>

                <asp:Panel runat="server" ID="pnlAjouter2" DefaultButton="lnkAjouter2" Visible="false">
                    <div id="form-bon" class="form-inline">
                        <div class="form-group">

Saisissez votre bon d'achat : 

                        <asp:TextBox runat="server" CssClass="inputcheque form-control" ID="txtAjouter2" Text=""/>

                         <ecom:BonsAchatsAjouterLink runat="server" Text="" CssClass="ajouter-ok btn btn-gris" ID="lnkAjouter2" TextboxID="txtAjouter2"
                        OnBonsAchatsAjoute="lnkAjouter_BonsAchatsAjoute" OnAjoutImpossible="lnkAjouter2_AjoutImpossible">

                             Ajouter
                            </ecom:BonsAchatsAjouterLink>

                        </div>

                         <div id="erreur-bon-achat">
                        <asp:Label CssClass="obligatoire" runat="server" ID="lblErreurAjout2" Visible="false" />
                       </div>
                    </div>
 
                </asp:Panel>
			
                <asp:Panel runat="server" ID="pnlReste" Visible="false" CssClass="RestePayer">
                    <b>Il vous reste à payer :</b>
                    <asp:Label runat="server" Visible="false" ID="lblReste" />
					<ecom:PanierMontantNonRegle runat="server" CssClass="Montant"/><span class="Montant">€</span>
					<span class="detail_reste">avec un mode de paiement complémentaire </span>
					
                </asp:Panel>
           
	
	                <ecom:ReglementChoisirLinkButton runat="server" class="btn btn-lg btn-orange pull-right" ID="lnkChoisir"  Visible="false">
                        Valider <span class="icon icon-chevron-right"></span>
                </ecom:ReglementChoisirLinkButton>
		    
                <div class="clear"></div>

            </div>
        </div>

    </asp:View>
	
	
    <%--<asp:View runat="server" ID="vwLocked">
	<div class="TypeReglement">
        
            <p><b>
            Vous avez déjà une commande utilisant des bons d'achats en cours de validation,</b><br />

            merci de re-essayer dans quelques minutes.</p>
        
	</div>	
    </asp:View>--%>
	
	
    <asp:View runat="server" ID="vwClosed">
	<div class="TypeReglement">
                    <h3>
                        <ecom:ReglementOuvrirLinkButton CausesValidation="false" ID="ReglementOuvrirLinkButton4" runat="server" CssClass="butt1">
                            <i></i>Bons d'achat
                        </ecom:ReglementOuvrirLinkButton>
                        </h3>  
	</div>	
    </asp:View>
</asp:MultiView>

