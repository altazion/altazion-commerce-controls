<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="cofidis3x.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.SIPS.cofidis3x" %>
<asp:Panel ID="Panel1" runat="server" CssClass="TypeReglement">
    
    <div class="Header">    
    <ecom:ThemablePanelControl runat="server" ID="pnlModeReg" SkinID="ModeReglementCofidis3x">
        <Content>
            <div>
                <h3>
                    Règlement en 3x par CB avec Cofidis</h3>
            </div>
        </Content>
    </ecom:ThemablePanelControl>
    </div>
    <asp:MultiView runat="server" ID="mviewPanel">
        <asp:View runat="server" ID="pnlOk">
            <div class="ModeReglementBoutonOk">
                <ecom:MouseOverImageButton runat="server" SkinID="ModeReglementCofidis3xButton"
                    ImageUrl="~/images/standard/btnOk.gif" ID="btnPayer" OnClick="btnPayer_Click"
                    Text="Payer par CB" />
            </div>
        </asp:View>
       
        <asp:View runat="server" ID="pnlError">
            <asp:Label runat="server" ID="lblMessageErreur" ForeColor="Firebrick" />
        </asp:View>
        
        <asp:View runat="server" ID="pnlNonDispo">
            <asp:Label runat="server" ID="lblNonDispo" Text="Profitez ce de mode de paiement à partir de 99€ d'achats" ForeColor="DimGray" />
        </asp:View> 
</asp:MultiView> 
</asp:Panel>