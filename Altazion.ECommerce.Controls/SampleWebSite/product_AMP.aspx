<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Amp.Master" AutoEventWireup="true" CodeBehind="product_AMP.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.product_AMP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style amp-custom>
        <ecom:ThemablePanelControl runat="server" SkinID="CommonCSSAMP" RenderWithNoTag="true" />
        <ecom:ThemablePanelControl runat="server" SkinID="ProductCSSAMP" RenderWithNoTag="true" />
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView ActiveViewIndex="0" runat="server" ID="MultiView1">
        <asp:View runat="server" ID="found">
            <ecom:ProduitEnFiche ID="ProduitEnFiche1" runat="server" OnNotFound="Product_NotFound" PourPageAmp="true" />
        </asp:View>
        <asp:View runat="server" ID="notFound">
        </asp:View>
    </asp:MultiView>
</asp:Content>
