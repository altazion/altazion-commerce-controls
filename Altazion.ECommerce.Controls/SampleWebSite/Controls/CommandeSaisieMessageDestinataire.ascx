<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CommandeSaisieMessageDestinataire.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.CommandeSaisieMessageDestinataire" %>
<ecom:ThemablePanelControl runat="server" SkinID="CommandeSaisieMessageDestinataireHeader" />

<asp:UpdatePanel runat="server" ID="updMsgDest"><ContentTemplate>

<asp:MultiView runat="server" ID="mvMessage" ActiveViewIndex="0">
    <asp:View runat="server" ID="vwAucunMessage">
        <ecom:ThemablePanelControl runat="server" SkinID="CommandeSaisieMessageDestinataireVide" />
        <asp:LinkButton ID="lnkAjout" runat="server" Text="Ajouter"
            SkinID="CommandeSaisieMessageDestinataireVideButton" onclick="lnkAjouter_Click" 
            style="width: 14px" />
    </asp:View>
    <asp:View runat="server" ID="vwAvecMessage">
        <ecom:ThemablePanelControl runat="server" SkinID="CommandeSaisieMessageDestinataireSaisieHeader" />
        <asp:Label ID="lblOrigine" runat="server" Rows="5" Columns="40" TextMode="MultiLine" />
        <asp:Label ID="lblMessage" runat="server" Rows="5" Columns="40" TextMode="MultiLine" />
        <asp:LinkButton runat="server" ID="lnkEdit" 
            SkinID="CommandeSaisieMessageDestinataireSaisieButton" 
            onclick="lnkEditer_Click" />
        <ecom:ThemablePanelControl runat="server" SkinID="CommandeSaisieMessageDestinataireSaisieFooter" />

    </asp:View>
    <asp:View runat="server" ID="vwEditionMessage">
        <ecom:ThemablePanelControl runat="server" SkinID="CommandeSaisieMessageDestinataireSaisieHeader" />
        <asp:TextBox ID="txtOrigine" runat="server" Columns="40" TextMode="SingleLine" />
        <asp:TextBox ID="txtMessage" runat="server" Rows="5" Columns="40" TextMode="MultiLine" />
        <asp:LinkButton id="lnkModif" runat="server" 
            SkinID="CommandeSaisieMessageDestinataireSaisieButton" 
            onclick="lnkModifier_Click" />
        <asp:LinkButton ID="lnkAnn" runat="server" 
            SkinID="CommandeSaisieMessageDestinataireSaisieAnnuler" onclick="lnkAnnuler_Click" 
             />
        <ecom:ThemablePanelControl runat="server" SkinID="CommandeSaisieMessageDestinataireSaisieFooter" />
    </asp:View>
</asp:MultiView>

</ContentTemplate></asp:UpdatePanel>

<ecom:ThemablePanelControl runat="server" SkinID="CommandeSaisieMessageDestinataireFooter" />
