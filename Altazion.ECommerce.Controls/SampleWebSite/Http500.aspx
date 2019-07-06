<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Http500.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Http500" 
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" 
%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<ecom:ThemablePanelControl SkinID="Error500Panel" runat="server">
<Content>
    <h1>Erreur 500 !</h1>
    <p>Une erreur est survenue.</p>
    </Content>
</ecom:ThemablePanelControl>
</asp:Content>