<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuCommande.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Process.RecuCommande" MasterPageFile="~/Masters/DefaultTheme.Master"
    MaintainScrollPositionOnPostback="true" %>

<%@ OutputCache Location="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="RecuHeader">
    </ecom:ThemablePanelControl>
    <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="RecuContent">
    </ecom:ThemablePanelControl>
    <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="RecuFooter">
    </ecom:ThemablePanelControl>
    <ecom:ThemablePanelControl ID="ThemablePanelControl5" runat="server" SkinID="ExecFooter" />
</asp:Content>
