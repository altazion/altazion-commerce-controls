<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RechercheRapide.ascx.cs"
    EnableViewState="true" Inherits="CPointSoftware.ECommerce.Site.Controls.RechercheRapide" %>
<%@ Register Src="RechercheAffichageMeilleures.ascx" TagName="RechercheAffichageMeilleures"
    TagPrefix="uc1" %>


<asp:Panel runat="server" DefaultButton="btnSearch" ID="pnlSearch">

    <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="RechercheRapideHeader">
    </ecom:ThemablePanelControl>

    <asp:DropDownList runat="server" ID="cboMiniSite" Visible="false" CssClass="ChoixMinisite" />
    <asp:TextBox ID="SearchTextBox" runat="server" />
    <ecom:RechercherDefinirKeywordLinkButton runat="server" ID="btnSearch" 
        CssClass="image" MinisiteDropDown="cboMiniSite" KeywordBox="SearchTextBox" SkinID="RechecheRapideButton"
        Text="Go"
        ToolTip="go" />

    <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl1" SkinID="RechercheRapideFooter">
    </ecom:ThemablePanelControl>
</asp:Panel>
