<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MagasinsRechercheCP.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.MagasinsRechercheCP" %>

<asp:Panel ID="Panel1" runat="server" DefaultButton="lnRechercheMag" CssClass="MagasinsRechercheCP">		
    <ecom:ThemablePanelControl runat="server" SkinID="MagasinsRechercheCPHeader" />
	<div><asp:TextBox id="txtCP" CssClass="TextBox" SkinID="MagasinsRechercheCPTextBox" runat="server" /></div>
	<div class="MagasinsRechercheCPButton">
	    <asp:LinkButton style="border-width: 0px;" Id="lnRechercheMag" runat="server" 
	    SkinId="MagasinsRechercheCPButton" Text="OK"
	    title="OK" ImageUrl="medias/img/ok.gif" alt="Lancer la recherche" 
            onclick="btnRechercheMag_Click" />
	</div>
</asp:Panel>
