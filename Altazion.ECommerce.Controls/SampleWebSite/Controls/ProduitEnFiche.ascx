<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProduitEnFiche.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.ProduitEnFiche" %>

<%@ Register Src="~/Controls/CustomTrackers.ascx" TagPrefix="local" TagName="CustomTrackers" %>

<asp:Panel runat="server" id="ProductDetails" ClientIDMode="Static" >
            <ecom:ProductPanel ID="ProductPanel1" runat="server" SkinID="ProductItemInDetailHeader" InlineContent="true" />

    <asp:Repeater runat="server" DataSourceID="ArticleSource" ID="rptView" OnItemCreated="rptView_ItemCreated" >
        <ItemTemplate>
                <div data-ekind="Product" style="display:none">
                    <ecom:ProductDataHiddenField runat="server"  />
                </div>
            <ecom:ProductJsonLD runat="server" /> 

            <ecom:GoogleUniversalAnalytics  runat="server" ID="tagGoogleUniv" Position="ProductInDetails" />
            <local:CustomTrackers runat="server" Position="ProductInDetails" />

            <ecom:ProductPanel runat="server" SkinID="ProductItemInDetail" InlineContent="true">
                <Content>
                    <div id="Images">
                    </div>
                </Content>
            </ecom:ProductPanel>

            <ecom:KnowledgeTag runat="server" />
        </ItemTemplate>
    </asp:Repeater>

    <ecom:ProductPanel ID="ProductPanel2" runat="server" SkinID="ProductItemInDetailFooter" InlineContent="true" />
</asp:Panel>


<ecom:ArticlesDataSourceControl ID="ArticleSource" runat="server" OnSelected="ArticleDataSource_Selected">
    <Parameters>
        <ecom:ContexteParameter Name="ArticleGuid" Field="ArticleGuid" />
    </Parameters>
</ecom:ArticlesDataSourceControl>
