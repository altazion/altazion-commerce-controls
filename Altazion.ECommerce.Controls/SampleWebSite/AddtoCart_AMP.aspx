<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Amp.Master" AutoEventWireup="true" CodeBehind="AddtoCart_AMP.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.AddtoCart_AMP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style amp-custom>
        <ecom:ThemablePanelControl runat="server" SkinID="CommonCSSAMP" RenderWithNoTag="true" />
        <ecom:ThemablePanelControl runat="server" SkinID="AddToCartCSSAMP" RenderWithNoTag="true" />
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView runat="server" ID="mvAjouter" ActiveViewIndex="0">
        <asp:View ID="vwNormal" runat="server">
            <ecom:ThemablePanelControl runat="server" SkinID="ProductItemAddedErrorAssocie" Visible="false" ID="pnlErrorAssocies">
                <Content>
                    <div>
                        <p style="color: #CC0000;">Les piles ou emballages associés à cet article ne sont plus disponibles.</p>
                    </div>
                </Content>
            </ecom:ThemablePanelControl>
            <asp:Repeater ID="rptItems" runat="server" DataSourceID="ArticleSource" >
                <ItemTemplate>
                    <ecom:ProductPanel ID="ProductPanel1" runat="server" SkinID="ProductItemAddedAMP">
                        <Content>
                            L'article <b>
                                <ecom:ProduitLibelle runat="server" /></b> a bien été ajouté à votre panier
                        </Content>
                    </ecom:ProductPanel>
                </ItemTemplate>
            </asp:Repeater>
            <ecom:ArticlesDataSourceControl ID="ArticleSource" runat="server">
                <Parameters>
                    <ecom:ContexteParameter Name="ArticleGuid" Field="ArticleGuid" />
                </Parameters>
            </ecom:ArticlesDataSourceControl>

        </asp:View>

        <asp:View runat="server" ID="vwNonDispo">
            <ecom:ThemablePanelControl runat="server" SkinID="AddToCartArticleNonDisponibleAMP" Visible="false" ID="ThemablePanelControl1">
                <Content>
                    <div>
                        <p style="color: #CC0000;">Cet article n'est plus disponible</p>
                    </div>
                </Content>
            </ecom:ThemablePanelControl>

        </asp:View>

        <asp:View ID="vwNonActif" runat="server">
            <ecom:ThemablePanelControl runat="server" SkinID="AddToCartNonActiveAMP">
                <Content>
                    <h2>Fonction désactivée</h2>
                    <p>La prise de commande et la mise au panier sont actuellement désactivées. Nous vous prions d'accepter nos excuses pour ce désagrément.</p>
                </Content>
            </ecom:ThemablePanelControl>
        </asp:View>

        <asp:View runat="server" ID="vwMultiple">
            <ecom:ThemablePanelControl runat="server" SkinID="AddToCartMultipleAMP">
                <Content>
                    <h2>Les articles disponibles ont été ajoutés</h2>
                </Content>
            </ecom:ThemablePanelControl>

        </asp:View>

    </asp:MultiView>

</asp:Content>
