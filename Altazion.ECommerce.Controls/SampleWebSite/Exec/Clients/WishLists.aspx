<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true" CodeBehind="WishLists.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Clients.WishLists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="pnlHeaderMy" runat="server" SkinID="ClientsAllPagesHeader" />
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="EtatCommandesHeader">
            <Content>
                <h3>Mes wishlists</h3>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div id="ExecContent">

        <ecom:ListesDropdownList runat="server" ID="cboListes" AutoPostBack="true" />

        <asp:Repeater runat="server" ID="rptContenuList" DataSourceID="ListeDataSource" OnItemCommand="Repeater_ItemCommand">
            <ItemTemplate>
                <ecom:ProductPanel runat="server" SkinID="ProductInWishListItem">
                    <Content>
                        <ecom:ProduitLibelle runat="server" /> : <ecom:ProduitWishlistQuantite runat="server" />
                        <ecom:ProduitWishlistLigneLink runat="server" CommandName="remove">Supprimer</ecom:ProduitWishlistLigneLink>
                    </Content>
                </ecom:ProductPanel>
            </ItemTemplate>
        </asp:Repeater>

        <ecom:ListesArticlesDatasource ID="ListeDataSource" runat="server">
            <Parameters>
                <asp:ControlParameter Name="ListeGuid" ControlID="cboListes" PropertyName="SelectedValue" />
            </Parameters>
        </ecom:ListesArticlesDatasource>

    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
