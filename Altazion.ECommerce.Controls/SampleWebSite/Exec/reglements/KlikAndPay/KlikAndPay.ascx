<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KlikAndPay.ascx.cs" 
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.KlikAndPay.KlikAndPay" %>
<asp:Panel ID="Panel1" runat="server" CssClass="TypeReglement">
    
    <div class="Header">    
    <ecom:ThemablePanelControl runat="server" ID="pnlModeReg" SkinID="ModeReglementKlikAndPay">
        <Content>
            <div>
                <h3>
                    Règlement avec Klik&Pay</h3>
            </div>
        </Content>
    </ecom:ThemablePanelControl>
    </div>
    <asp:MultiView runat="server" ID="mviewPanel">
        <asp:View runat="server" ID="pnlOk">
            <div class="ModeReglementBoutonOk">
                <ecom:MouseOverImageButton runat="server" SkinID="ModeReglementKlikAndPayButton"
                    ImageUrl="~/images/standard/btnOk.gif" ID="btnPayer" OnClick="btnPayer_Click"
                    Text="Payer par CB" />
            </div>
        </asp:View>
        <asp:View runat="server" ID="pnlError">
            <asp:Label runat="server" ID="lblMessageErreur" ForeColor="Firebrick" />
        </asp:View>
</asp:MultiView> 
</asp:Panel>