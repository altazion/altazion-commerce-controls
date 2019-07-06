<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GesteCommercial.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.GesteCommercial.GesteCommercial" %>
<asp:MultiView runat="server" ID="mvViews" ActiveViewIndex="0">
    <asp:View runat="server" ID="vwNonUtilisable"></asp:View>
    <asp:View runat="server" ID="vwUtilisable">
        <div class="Header">
            <ecom:ThemablePanelControl runat="server" ID="pnlModeReg" SkinID="ModeReglementGesteCom">
                <Content>
                    <h3>
                        Règlement par geste commercial</h3>
                </Content>
            </ecom:ThemablePanelControl>
        </div>
        <div class="ModeReglementBoutonOk">
            <ecom:MouseOverImageButton runat="server" SkinID="ModeReglementGesteComButton" ImageUrl="~/images/standard/btnOk.gif"
                ID="btnPayer" OnClick="btnPayer_Click" Text="Confirmer ma commande" />
        </div>
    </asp:View>
</asp:MultiView>