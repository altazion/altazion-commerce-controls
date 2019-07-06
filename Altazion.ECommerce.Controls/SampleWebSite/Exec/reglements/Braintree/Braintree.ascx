<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Braintree.ascx.cs" 
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.Braintree.Braintree" %>

<asp:Panel ID="Panel1" runat="server" CssClass="TypeReglement">
    <script src="https://js.braintreegateway.com/web/dropin/1.14.1/js/dropin.min.js" type="text/javascript"></script>
    <script src="https://js.braintreegateway.com/web/3.39.0/js/client.min.js" type="text/javascript"></script>
    <script src="https://js.braintreegateway.com/web/3.39.0/js/payment-request.min.js" type="text/javascript"></script>

    <div class="Header">    
    <ecom:ThemablePanelControl runat="server" ID="pnlModeReg" SkinID="ModeReglementBraintree">
        <Content>
            <div>
                <h3>
                    Règlement avec Braintree</h3>
            </div>
        </Content>
    </ecom:ThemablePanelControl>
    </div>
    <asp:MultiView runat="server" ID="mviewPanel">
        <asp:View runat="server" ID="pnlOk">
            <div id="dropin-container"></div>
                        <div id="checkout-message"></div>
                        <button id="submit-button">Payer</button>
            <div class="modal fade" id="myModal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body" id="modalBody">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
        </asp:View>
        <asp:View runat="server" ID="pnlError">
            <asp:Label runat="server" ID="lblMessageErreur" ForeColor="Firebrick" />
        </asp:View>
    </asp:MultiView> 
</asp:Panel>