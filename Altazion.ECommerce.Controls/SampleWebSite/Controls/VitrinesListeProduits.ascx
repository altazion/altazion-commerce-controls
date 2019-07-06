<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VitrinesListeProduits.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.VitrinesListeProduits" %>
<asp:MultiView runat="server" ID="mvTypeAffichage">
    <asp:View runat="server" ID="vwTable">
        <asp:DataList ID="InnerList" runat="server" CssClass="ProductItemListVitrines" DataSourceID="ArticlesSource"
            DataKeyField="art_guid" RepeatColumns="1" SkinID="ProductItemListVitrines" 
            onitemcreated="InnerList_ItemCreated">
            <ItemTemplate>
                <ecom:ProductPanel ID="ProductPanel1" runat="server" SkinID="ProductItemInListVitrines">
                    <Content>
                        <ecom:ProduitLibelleLink ID="ProduitLibelleLink1" runat="server" />
                    </Content>
                </ecom:ProductPanel>
            </ItemTemplate>
        </asp:DataList>
    </asp:View>
    <asp:View runat="server" ID="vwFlux">
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ArticlesSource"
            SkinID="ProductItemListVitrines" onitemcreated="Repeater1_ItemCreated">
            <ItemTemplate>
                <ecom:ProductPanel ID="ProductPanel1" runat="server" SkinID="ProductItemInListVitrines">
                    <Content>
                        <ecom:ProduitLibelleLink ID="ProduitLibelleLink1" runat="server" />
                    </Content>
                </ecom:ProductPanel>
            </ItemTemplate>
        </asp:Repeater>
    </asp:View>
</asp:MultiView>
<ecom:VitrineArticlesDataSource ID="ArticlesSource" runat="Server" OnSelecting="ArticlesSource_Selecting" OnSelected="ArticlesSource_Selected">
    <Parameters>
        <asp:Parameter Name="CodeVitrine" Type="String" />
        <asp:Parameter Name="NombreArticles" Type="Int32" DefaultValue="10" />
        <asp:Parameter Name="SelectionAleatoire" Type="Boolean" DefaultValue="False" />
    </Parameters>
</ecom:VitrineArticlesDataSource>
