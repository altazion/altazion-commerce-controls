<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true" CodeBehind="wlw-web-layout.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.wlw_web_layout" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Panel runat="server" ID="pnlContenu" CssClass="customContent">
        <h1><span>{post-title}</span></h1>
        {post-body}
    </asp:Panel>

</asp:Content>
