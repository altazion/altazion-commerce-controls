<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.product"
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>


 
<asp:Content ContentPlaceHolderID="BeforeContent" runat="server">
    <ecom:ThemablePanelControl runat="server" SkinID="ProductPageBeforeContent" />
</asp:Content>
<asp:Content ContentPlaceHolderID="AfterContent" runat="server">
    <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ProductPageAfterContent" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="FicheProduitHeader" />
    <asp:MultiView ActiveViewIndex="0" runat="server" ID="mvStatus">
        <asp:View runat="server" ID="found">
            <ecom:ProduitEnFiche ID="ProduitEnFiche1" runat="server" OnNotFound="Product_NotFound" />
        </asp:View>
        <asp:View runat="server" ID="notFound">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="ArticleSource" RenderOuterTable="false" >
                <ItemTemplate>
                    <ecom:ProductPanel ID="ProductPanel1" runat="server" SkinID="ProductNotFoundDetail" AjouterRDFa="true">
                        <Content>
                        </Content>
                    </ecom:ProductPanel>
                </ItemTemplate>
            </asp:FormView>
            <ecom:ArticlesDataSourceControl ID="ArticleSource" runat="server" Mode="Pour404">
                <Parameters>
                    <ecom:ContexteParameter Name="ArticleGuid" Field="ArticleGuid" />
                </Parameters>
            </ecom:ArticlesDataSourceControl>
        </asp:View>
    </asp:MultiView>
    <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="FicheProduitFooter" />
</asp:Content>
