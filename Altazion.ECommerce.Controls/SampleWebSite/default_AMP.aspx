<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Amp.Master" AutoEventWireup="true" CodeBehind="default_AMP.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.default_AMP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style amp-custom>
        <ecom:ThemablePanelControl runat="server" SkinID="CommonCSSAMP" RenderWithNoTag="true" />
        <ecom:ThemablePanelControl runat="server" SkinID="HomePageCSSAMP" RenderWithNoTag="true" />
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ecom:ThemablePanelControl runat="server" SkinID="HomePagePanelAMP" ID="HomePagePanelAMP">
        <Content>
            <h1>Home en AMP</h1>
        </Content>
    </ecom:ThemablePanelControl>
</asp:Content>
