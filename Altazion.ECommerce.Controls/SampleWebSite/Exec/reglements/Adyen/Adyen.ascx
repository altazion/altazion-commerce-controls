<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Adyen.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.Adyen.Adyen" %>

<asp:Panel ID="Panel1" runat="server" CssClass="TypeReglement">
    
    <div class="Header">    
    <ecom:ThemablePanelControl runat="server" ID="pnlModeReg" SkinID="ModeReglementAdyen">
        <Content>
            <div>
                <h3>
                    Règlement par CB</h3>
            </div>
        </Content>
    </ecom:ThemablePanelControl>
    </div>
    <asp:MultiView runat="server" ID="mviewPanel">
        <asp:View runat="server" ID="pnlOk">
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

                <ecom:ThemablePanelControl runat="server" ID="pnlFooter" SkinID="ModeReglementAdyenButton">
                    <Content>
                        <asp:HyperLink runat="server" ID="btnPayerAdyen" ClientIDMode="Static"
                            Text="Payer" />
                    </Content>
                </ecom:ThemablePanelControl>

        </asp:View>
        <asp:View runat="server" ID="pnlError">
            <asp:Label runat="server" ID="lblMessageErreur" ForeColor="Firebrick" />
        </asp:View>
    </asp:MultiView> 
</asp:Panel>