<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Atos2Depliable.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.Atos2.Atos2Depliable" %>

<div class="TypeReglement">
    <asp:Panel runat="server" ID="pnlMain">
        <ecom:ThemableMultiView runat="server" ActiveViewIndex="0" ID="mvReglement">
            <ecom:ThemableView runat="server" ID="vwFerme">
                <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementAtos2Ferme">
                    <Content>
                        
                       <h3>
                        <ecom:ReglementOuvrirLinkButton ID="ReglementChoixLinkButton1" runat="server" CssClass="butt1">
                            <i></i> Carte Bancaire <span class="small">(paiement sécurisé)</span>  <img src="/App_Themes/sit_2/img/p-cb.png" alt=""/>
                        </ecom:ReglementOuvrirLinkButton>
                        </h3>

                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwOuvert">
                <ecom:ThemablePanelControl runat="server" ID="pnlOuvert" SkinID="ModeReglementAtos2Ouvert">
                    <Content>
 
                        <h3>
                        <ecom:ReglementFermerLinkButton ID="ReglementFermerLinkButton1" runat="server" CssClass="butt1 orange">                      
                            <span class="orange icon-radio-checked"></span> Carte Bancaire <span class="small">(paiement sécurisé)</span>   <img src="/App_Themes/sit_2/img/p-cb.png" alt=""/>             
                        </ecom:ReglementFermerLinkButton>
                        </h3>
                        <p>
                            En choisissant ce mode de règlement vous allez être redirigé vers le site de paiement sécurisé de la Société Générale.<br />
			                <b>La transaction s'effectuera ainsi de façon 100% sécurisée. </b>
                        </p>

                        <asp:HyperLink runat="server" ID="btnPayerAtos2"
                            Text="Payer" />
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwNonDisponible">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="ModeReglementAtos2NonDispo">
                    <Content>
                        Carte bancaire non disponible
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwEnErreur">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="ModeReglementAtos2EnErreur">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
        </ecom:ThemableMultiView>
    </asp:Panel>
</div>