<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true"
    CodeBehind="AddToCart_ACP.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.AddToCart_ACP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView runat="server" ID="mvAjouter" ActiveViewIndex="0">
        <asp:View ID="vwNormal" runat="server">
        <ecom:ThemablePanelControl runat="server" SkinID="ProductItemAddedErrorAssocie" Visible="false" ID="pnlErrorAssocies">
        <Content>
        <div><p style="color:#CC0000;">Les piles ou emballages associés à cet article ne sont plus disponibles.</p></div>
        </Content>
        </ecom:ThemablePanelControl>
            <asp:FormView ID="FormView1" runat="server" DataSourceID="ArticleSource" RenderOuterTable="false">
                <ItemTemplate>
                    <ecom:ProductPanel ID="ProductPanel1" runat="server" SkinID="ProductItemAdded">
                        <Content>
                            L'article <b>
                                <ecom:ProduitLibelle runat="server" /></b> a bien été ajouté à votre panier
                        </Content>
                    </ecom:ProductPanel>
                </ItemTemplate>
            </asp:FormView>
            <ecom:ArticlesDataSourceControl ID="ArticleSource" runat="server">
                <Parameters>
                    <ecom:ContexteParameter Name="ArticleGuid" Field="ArticleGuid" />
                </Parameters>
            </ecom:ArticlesDataSourceControl>
            
        </asp:View>
                
        <asp:View runat="server" ID="vwNonDispo">
        <ecom:ThemablePanelControl runat="server" SkinID="AddToCartArticleNonDisponible" Visible="false" ID="ThemablePanelControl1">
        <Content>
        <div><p style="color:#CC0000;">Cet article n'est plus disponible</p></div>
        </Content>
        </ecom:ThemablePanelControl>
        
        </asp:View>
                
        <asp:View ID="vwNonActif" runat="server">
            <ecom:ThemablePanelControl runat="server" SkinID="AddToCartNonActive">
                <Content>
                <h2>Fonction désactivée</h2>
                <p>La prise de commande et la mise au panier sont actuellement désactivées. Nous vous prions d'accepter nos excuses pour ce désagrément.</p>
                </Content>
            </ecom:ThemablePanelControl>
        </asp:View>     
        
        <asp:View runat="server" ID="vwMultiple">
            <ecom:ThemablePanelControl runat="server" SkinID="AddToCartMultiple">
                <Content>
                <h2>Les articles disponibles ont été ajoutés</h2>
                </Content>
            </ecom:ThemablePanelControl>

        </asp:View>
           
    </asp:MultiView>
    
</asp:Content>

