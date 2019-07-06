<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarteLaserDepliable.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.LaSer.CarteLaserDepliable" %>
<div class="TypeReglement">
    <asp:Panel runat="server" ID="pnlMain">
        <ecom:ThemableMultiView runat="server" ActiveViewIndex="0" ID="mvReglement">
            <ecom:ThemableView runat="server" ID="vwFerme">
                <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementLaSerFerme" 
                    RenderWithNoTag="true">
                    <Content>
					<div class="ligne_1">
						<ecom:ReglementOuvrirLinkButton ID="ReglementOuvrirLinkButton1" CausesValidation="false" runat="server" Text="" CssClass="Lien-Paiement">
							<ecom:ReglementOuvrirImageButton ID="ReglementChoixLinkButton1" CausesValidation="false" runat="server" ImageUrl="/App_Themes/sit_2/medias/img/altima/radio-blanc-off.gif" />
							<p>Carte cadeau King Jouet et Bébé King</p>				 
							<img title="carte cadeau" alt="carte cadeau" class="blocFormIco" src="/App_Themes/sit_2/medias/img/img-carte-cadeau.png" style="height: 28px; width: 135px; border-width: 0px;">
                       </ecom:ReglementOuvrirLinkButton>
	           <!--
	                        <asp:Panel runat="server" ID="pnlConsomme" Visible="false">
	                        Montant restant à payer <asp:Label runat="server" ID="lblMontantRestant" />
	                        </asp:Panel>-->
					</div>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
			

            <ecom:ThemableView runat="server" ID="vwOuvert">
                <asp:UpdatePanel runat="server" ID="updLaSer" class="ligne_1_selection">
				<ContentTemplate>
	                <ecom:ThemablePanelControl runat="server" ID="pnlOuvert" SkinID="ModeReglementLaSerOuvert" RenderWithNoTag="true">
	                    <Content>
						<div class="pmt_1"><asp:Image ID="ReglementChoixLinkButton1" CausesValidation="false" runat="server" ImageUrl="/App_Themes/sit_2/medias/img/altima/radio-blanc-on.gif" /></div>
  						<div class="pmt_2">Carte cadeau King Jouet et Bébé King</div>
						<div class="pmt_3"><img title="carte cadeau" alt="carte cadeau" class="blocFormIco" src="/App_Themes/sit_2/medias/img/img-carte-cadeau.png" style="height: 28px; width: 135px; border-width: 0px;">
</div>
						<div class="detail_paiement Carte-cadeau">
							<div class="texte">
		                        <asp:GridView runat="server" ID="gdPaiements" Visible="false" AutoGenerateColumns="false">
		                            <Columns>
		                                <asp:TemplateField>
		                                <ItemTemplate>Votre Paiement</ItemTemplate>
		                                </asp:TemplateField>
		                                <asp:BoundField DataField="irc_montant" DataFormatString="{0:0.00 €}"
		                        ItemStyle-CssClass="Montant" HtmlEncode="false" /> 
		                            </Columns>
		                        </asp:GridView>

								<asp:Panel runat="server" ID="pnlPaiements" Visible="false">
									<%-- mettre ici un texte du genre : cliquez sur un autre moyen --%>
									Choisissez un autre moyen pour terminer le reglement de votre commande.
								</asp:Panel>

		                        <p class="RestePayerCarte">Montant restant à payer : <asp:Label runat="server" ID="lblMontantRestant" /></p>
		                        <p>
		                        Numéro de la carte : 
		                        <asp:TextBox runat="server" 
								MaxLength="16" Columns="16" 
								ValidationGroup="ModeReglementLaSerOuvert" ID="txtNumCarte" AutoCompleteType="None" />
		                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNumCarte" ValidationGroup="ModeReglementLaSerOuvert"
		                            ErrorMessage="Obligatoire"
		                            ID="valNumChequeObligatoire" />
								<asp:LinkButton runat="server" ID="lnkVerifierCarte" OnClick="lnkVerifierCarte_Click">Vérifier ma carte</asp:LinkButton>
		                        </p>
							
							<%--
								<p>
		                        Code à 4 chiffres au dos de la carte 
								
								<a target="_blank" href="/pages/lytebox/carte-cadeau.html" > (où se trouve ce code)</a> :

		                        <asp:TextBox runat="server" 
									MaxLength="4" Columns="4" 
								ValidationGroup="ModeReglementLaSerOuvert" ID="txtScratchCode" AutoCompleteType="None" />
		                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtScratchCode" ValidationGroup="ModeReglementLaSerOuvert"
		                            ErrorMessage="Obligatoire"
		                            ID="RequiredFieldValidator1" />

		                        
								</p>
								--%>
								<p>
                        <asp:Panel runat="server" id="pnlEtatCarte">
                            <asp:Label runat="server" ID="lblAction" />
                        </asp:Panel>

                        <asp:Panel CssClass="Erreur" runat="server" id="pnlErreurCarte">
                            <asp:Label runat="server" ID="lblErreur" />
							<p>Erreur de saisie, veuillez ressaisir vos informations.</p>
                        </asp:Panel>								
								
								</p>
		                        <ecom:ReglementChoisirLinkButton runat="server" Visible="false" ValidationGroup="ModeReglementLaSerOuvert" CssClass="cartecadeau-paiement"
                            Text="" ID="ReglementChoisirLinkButton1" />
							
							</div>
						</div>
											
	                    </Content>
	                </ecom:ThemablePanelControl>
	                </ContentTemplate>
					</asp:UpdatePanel>
	            </ecom:ThemableView>
				
	            <ecom:ThemableView runat="server" ID="vwNonDisponible">
	                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="ModeReglementLaSerNonDispo"
	                    RenderWithNoTag="true">
	                    <Content>
	                    </Content>
	                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
			
            <ecom:ThemableView runat="server" ID="vwEnErreur">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="ModeReglementLaSerEnErreur"
                    RenderWithNoTag="true">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
			
        </ecom:ThemableMultiView>
    </asp:Panel>
</div>