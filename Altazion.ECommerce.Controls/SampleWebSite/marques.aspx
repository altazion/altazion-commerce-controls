<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="marques.aspx.cs" 
Inherits="CPointSoftware.ECommerce.Site.marques"    MasterPageFile="~/Masters/DefaultTheme.Master" 
MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:DataList runat="server" DataSourceID="MarquesSource" SkinID="ToutesLesMarques" ID="lstMarques" RepeatColumns="3">
    <ItemTemplate>
        <ecom:RechercherMarqueHyperLink runat="server" />
    </ItemTemplate>
    </asp:DataList>

    

    <ecom:MarquesSource runat="server" ID="MarquesSource" Mode="PourRecherche" MaxRows="500" />
</asp:Content>