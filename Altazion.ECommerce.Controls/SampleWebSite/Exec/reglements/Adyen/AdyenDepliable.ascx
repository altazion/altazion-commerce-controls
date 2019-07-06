<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdyenDepliable.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.Adyen.AdyenDepliable" %>

<div class="TypeReglement">
    <asp:Panel runat="server" ID="pnlMain">
        <ecom:ThemableMultiView runat="server" ActiveViewIndex="0" ID="mvReglement">
            <ecom:ThemableView runat="server" ID="vwFerme">
                <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementAdyenFerme">
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
                <ecom:ThemablePanelControl runat="server" ID="pnlOuvertHeader" SkinID="ModeReglementAdyenOuvertHeader">
                    <Content>
 
                        <h3>
                        <ecom:ReglementFermerLinkButton ID="ReglementFermerLinkButton1" runat="server" CssClass="butt1 orange">                      
                            <span class="orange icon-radio-checked"></span> Carte Bancaire <span class="small">(paiement sécurisé)</span>   <img src="/App_Themes/sit_2/img/p-cb.png" alt=""/>             
                        </ecom:ReglementFermerLinkButton>
                        </h3>
                        <p>
                            En choisissant ce mode de règlement vous pouvez être redirigé vers le site de votre banque.<br />
			                <b>La transaction s'effectuera ainsi de façon 100% sécurisée. </b>
                        </p>
                    </Content>
                </ecom:ThemablePanelControl>

                <ecom:ThemablePanelControl runat="server" ID="pnlAdyenCssClass" SkinID="AdyenCssClass">
                    <Content>
                        <link rel="stylesheet" href="https://checkoutshopper-test.adyen.com/checkoutshopper/sdk/2.5.0/adyen.css" />
                    </Content>
                </ecom:ThemablePanelControl>

                <asp:Panel runat="server" ID="securedfields" ClientIDMode="Static"
                        CssClass="adyen-panel-class-securedfields" >
                    <asp:Panel runat="server" ID="pnlAdyenPaymentImage" ClientIDMode="Static" CssClass="adyen-panel-class-AdyenPaymentImage">
                        <ecom:ThemablePanelControl runat="server" SkinID="AdyenPaymentImage">
                            <Content>
                                <img id="imgAdyenPayment" width="40" src="https://checkoutshopper-test.adyen.com/checkoutshopper/images/logos/nocard.svg" />
                            </Content>
                        </ecom:ThemablePanelControl>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="pnl_encryptedCardNumber" ClientIDMode="Static" Visible="false" 
                        CssClass="adyen-panel-class-encryptedCardNumber" >
                        <ecom:ThemablePanelControl runat="server" SkinID="AdyenLabel_CardNumber">
                            <Content>
                                <Label>Card number:</Label>
                            </Content>
                        </ecom:ThemablePanelControl>
                        <span data-cse="encryptedCardNumber"></span>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="pnl_encryptedExpiryMonth" ClientIDMode="Static" Visible="false" 
                        CssClass="adyen-panel-class-encryptedExpiryMonth" >
                        <ecom:ThemablePanelControl runat="server" SkinID="AdyenLabel_ExpiryMonth">
                            <Content>
                                <Label>Expiry month:</Label>
                            </Content>
                        </ecom:ThemablePanelControl>
                        <span data-cse="encryptedExpiryMonth"></span>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="pnl_encryptedExpiryYear" ClientIDMode="Static" Visible="false" 
                        CssClass="adyen-panel-class-encryptedExpiryYear" >
                        <ecom:ThemablePanelControl runat="server" SkinID="AdyenLabel_ExpiryYear">
                            <Content>
                                <Label>Expiry year:</Label>
                            </Content>
                        </ecom:ThemablePanelControl>
                        <span data-cse="encryptedExpiryYear"></span>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="pnl_encryptedSecurityCode" ClientIDMode="Static" Visible="false" 
                        CssClass="adyen-panel-class-encryptedSecurityCode" >
                        <ecom:ThemablePanelControl runat="server" SkinID="AdyenLabel_SecurityCode">
                            <Content>
                                <Label>CVV/CVC:</Label>
                            </Content>
                        </ecom:ThemablePanelControl>
                        <span data-cse="encryptedSecurityCode"></span>
                    </asp:Panel>

                    <asp:Panel runat="server" ID="pnl_applepaytoken" ClientIDMode="Static" Visible="false" 
                        CssClass="adyen-panel-class-applepaytoken" >
                        <ecom:ThemablePanelControl runat="server" SkinID="AdyenLabel_ApplepayToken">

                        </ecom:ThemablePanelControl>
                        <span data-cse="applepay.token"></span>
                    </asp:Panel>


                </asp:Panel>

                <ecom:ThemablePanelControl runat="server" ID="pnlOuvertFooter" SkinID="ModeReglementAdyenButton">
                    <Content>
                        <asp:HyperLink runat="server" ID="btnPayerAdyen" ClientIDMode="Static"
                            Text="Payer" />
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwNonDisponible">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="ModeReglementAdyenNonDispo">
                    <Content>
                        Carte bancaire non disponible
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwEnErreur">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="ModeReglementAdyenEnErreur">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
        </ecom:ThemableMultiView>
    </asp:Panel>
</div>