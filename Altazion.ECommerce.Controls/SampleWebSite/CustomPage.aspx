<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" 
    AutoEventWireup="true" CodeBehind="CustomPage.aspx.cs" 
    Inherits="CPointSoftware.ECommerce.Site.CustomPage" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ecom:ThemablePanelControl ID="ThemablePanelControl1"  SkinID="CustomPageBeforeContent" runat="server" />

    <asp:Panel runat="server" ID="pnlContenu" CssClass="customContent">

    </asp:Panel>

    <ecom:ThemablePanelControl ID="ThemablePanelControl2"  SkinID="CustomPageAfterContent" runat="server" />

    <ecom:KnowledgeTag runat="server" />

</asp:Content>
