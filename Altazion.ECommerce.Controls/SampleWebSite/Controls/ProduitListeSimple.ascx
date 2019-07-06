<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProduitListeSimple.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.ProduitListeSimple" %>

<asp:DataList ID="InnerList" runat="server" DataSourceID="ArticlesSource"
    DataKeyField="art_guid" RepeatColumns="1" >
    <ItemTemplate>
                <ecom:ProduitLibelleLink ID="ProduitLibelleLink1" runat="server" />
    </ItemTemplate>
</asp:DataList>
<ecom:VitrineArticlesDataSource ID="ArticlesSource" runat="Server" OnSelecting="ArticlesSource_Selecting">
    <Parameters>
        <asp:Parameter Name="CodeVitrine" Type="String" />
        <asp:Parameter Name="NombreArticles" Type="Int32" DefaultValue="10" />
        <asp:Parameter Name="SelectionAleatoire" Type="Boolean" DefaultValue="False" />
    </Parameters>
</ecom:VitrineArticlesDataSource>