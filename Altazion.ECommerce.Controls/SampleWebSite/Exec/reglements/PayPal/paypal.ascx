<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="paypal.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.PayPal.paypal" %>
<asp:Panel ID="Panel1" runat="server" CssClass="TypeReglement">
    <div class="Header">
        <ecom:ThemablePanelControl runat="server" ID="pnlModeReg" SkinID="ModeReglementPaypal" RenderWithNoTag="true">
            <Content>
                <h3>
                    Règlement par CB avec Paypal</h3>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div class="ModeReglementBoutonOk">
        <ecom:PaymentImageButton runat="server" SkinID="ModeReglementPaypalButton" ImageUrl="~/images/standard/btnOk.gif"
            ID="btnPayer" OnClick="btnPayer_Click" Text="Payer grâce à Paypal" />
    </div>
</asp:Panel>
