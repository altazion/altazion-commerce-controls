<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EnCours.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.EnCours.EnCours" %>
<div class="TypeReglement">
    <asp:MultiView runat="server" ID="mvMain">
        <asp:View runat="server" ID="vwDispo">
            <div class="TypeReglement">
                <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ModeReglementEnCours" />
                <ecom:MouseOverImageButton runat="server" SkinID="ModeReglementChequeButton" ID="btnPayer" />
            </div>
        </asp:View>
        <asp:View runat="server" ID="vwDejaUtilise">
            <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="ModeReglementEnCoursUtilise" />
            <asp:Label runat="server" ID="lblMontantEnCours" />
        </asp:View>
        <asp:View runat="server" ID="vwMalConfigure">
            <asp:Label runat="server" ForeColor="Firebrick" Text="Configuration du mode de reglement non valide" />
        </asp:View>
    </asp:MultiView>
</div>
