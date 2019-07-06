<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UnEuro.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.SIPS.UnEuro" %>
<asp:Panel ID="Panel1" runat="server" CssClass="TypeReglement">
    <div class="Header">
    <ecom:ThemablePanelControl runat="server" ID="pnlModeReg" SkinID="ModeReglement1Euro">
        <Content>
                <h3>
                    Règlement par 1Euro.com</h3>
        </Content>
    </ecom:ThemablePanelControl>
    </div>
    
    <asp:MultiView runat="server" ID="mviewPanel">
        <asp:View runat="server" ID="pnlOk">
            <div class="ModeReglementBoutonOk">
                <ecom:MouseOverImageButton runat="server" SkinID="ModeReglement1EuroButton"
                    ImageUrl="~/images/standard/btnOk.gif" ID="btnPayer" OnClick="btnPayer_Click"
                    Text="Payer par CB" />
            </div>
        </asp:View>
        <asp:View runat="server" ID="pnlError">
            <asp:Label runat="server" ID="lblMessageErreur" ForeColor="Firebrick" />
        </asp:View>
        <asp:View runat="server" ID="pnlNonDispo">
            <asp:Label runat="server" ID="lblNonDispo" Text="Profitez ce de mode de paiement à partir de 60€ d'achats" ForeColor="DimGray" />
        </asp:View> 
        
</asp:MultiView> 
</asp:Panel>
