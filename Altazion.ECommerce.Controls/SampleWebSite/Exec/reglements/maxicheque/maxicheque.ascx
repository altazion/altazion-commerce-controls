<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="maxicheque.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.maxicheque.maxicheque" %>
<asp:Panel ID="Panel1" runat="server" CssClass="TypeReglement">
    <div class="Header">
        <ecom:ThemablePanelControl runat="server" ID="pnlModeReg" SkinID="ModeReglementMaxiCheque">
            <Content>
                <h3>
                    Règlement par Maxichèques</h3>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div class="ModeReglementBoutonOk">
        <ecom:PaymentImageButton runat="server" SkinID="ModeReglementMaxiChequeButton" ImageUrl="~/images/standard/btnOk.gif"
            ID="btnPayer" OnClick="btnPayer_Click" Text="Payer grâce à MaxiCheque" />
    </div>
</asp:Panel>