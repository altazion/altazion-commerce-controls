<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"  
    CodeBehind="search.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.search"
    MasterPageFile="~/Masters/DefaultTheme.Master" %>
<asp:Content ContentPlaceHolderID="head" runat="server">
    <ecom:RssLink runat="server" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <ecom:RechercheResultats ID="RechercheResultats" runat="server"  />
</asp:Content>