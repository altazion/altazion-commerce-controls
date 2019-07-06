<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Amp.Master" AutoEventWireup="true" CodeBehind="search_AMP.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.search_AMP" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style amp-custom>
        <ecom:ThemablePanelControl runat="server" SkinID="CommonCSSAMP" RenderWithNoTag="true" />
        <ecom:ThemablePanelControl runat="server" SkinID="SearchCSSAMP" RenderWithNoTag="true" />
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ecom:RechercheResultats ID="RechercheResultats" runat="server"  PourPageAmp="true"  />
</asp:Content>
