<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true" CodeBehind="WishListDetails.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.WishListDetails" %>

<script runat="server">
    protected override void OnLoad(EventArgs e)
    {
        WishlistTitleFormat = "Test {0}";
        base.OnLoad(e);
    }

</script>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:FormView runat="server" ID="EnteteView" RenderOuterTable="false">
            <ItemTemplate>
                La liste de cadeaux de
                <asp:Label runat="server" Text='<%#Eval("lis_titre")%>' />
            </ItemTemplate>
        </asp:FormView>

        <asp:Repeater runat="server" ID="rptContenuList" DataSourceID="ListeDataSource">
            <ItemTemplate>
                <ecom:ProductPanel runat="server" SkinID="ProductInPublicWishListItem">
                    <Content>
                        <ecom:ProduitLibelle runat="server" />
                        :
                        <ecom:ProduitWishlistQuantite runat="server" />

                        <ecom:PanierAjouterScriptLink runat="server" Text="Ajouter au panier" />

                        <ecom:ProduitWishlistRealisation runat="server" />
                    </Content>
                </ecom:ProductPanel>
            </ItemTemplate>
        </asp:Repeater>

        <ecom:ListesArticlesDatasource ID="ListeDataSource" runat="server">
            <Parameters>
                <asp:QueryStringParameter Name="ListeGuid" QueryStringField="guid" />
            </Parameters>
        </ecom:ListesArticlesDatasource>
</asp:Content>
