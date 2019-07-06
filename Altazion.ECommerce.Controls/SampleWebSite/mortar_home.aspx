<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mortar_home.aspx.cs" 
    Inherits="CPointSoftware.ECommerce.Site.mortar_home" MasterPageFile="~/Masters/DefaultTheme.Master" 
    MaintainScrollPositionOnPostback="true" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ecom:ThemablePanelControl runat="server" ID="ThemablePanel1" SkinID="MortarHomeHeader">
    </ecom:ThemablePanelControl>
    <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="MortarHomeContent">
        <Content>
            <h2><span>Découvrez nos magasins</span></h2>
            <p>Entrez votre code postal pour trouver le magasin le plus proche de chez vous :</p>
            <ecom:MagasinsRechercheCP runat="server" />
        </Content>
    </ecom:ThemablePanelControl>
    <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="MortarHomeFooter" />
</asp:Content>
