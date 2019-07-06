<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BonsAchats.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.bonsachats.BonsAchats" %>
<asp:MultiView runat="server" ID="mwBA">
    
    <asp:View runat="server" ID="vwLocked">
        <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementBonAchatBloque"
            RenderWithNoTag="true">
            <Content>
                Vous avez déjà une commande utilisant des bons d'achats en cours de validation,
                merci de re-essayer dans quelques minutes.
            </Content>
        </ecom:ThemablePanelControl>
    </asp:View>
    
</asp:MultiView>