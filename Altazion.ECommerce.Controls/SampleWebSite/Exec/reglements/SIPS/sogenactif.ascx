<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sogenactif.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.SIPS.sogenactif" %>
<asp:Panel ID="Panel1" runat="server" CssClass="TypeReglement">
    
    <div class="Header">    
    <ecom:ThemablePanelControl runat="server" ID="pnlModeReg" SkinID="ModeReglementSogenactif">
        <Content>
            <div>
                <h3>
                    Règlement par CB avec SOGENACTIF</h3>
            </div>
        </Content>
    </ecom:ThemablePanelControl>
    </div>
    <asp:MultiView runat="server" ID="mviewPanel">
        <asp:View runat="server" ID="pnlOk">
            <div class="ModeReglementBoutonOk">
                <ecom:MouseOverImageButton runat="server" SkinID="ModeReglementSogenactifButton"
                    ImageUrl="~/images/standard/btnOk.gif" ID="btnPayer" OnClick="btnPayer_Click"
                    Text="Payer par CB" />
            </div>
        </asp:View>
        <asp:View runat="server" ID="pnlError">
            <asp:Label runat="server" ID="lblMessageErreur" ForeColor="Firebrick" />
        </asp:View>
</asp:MultiView> 
</asp:Panel>
