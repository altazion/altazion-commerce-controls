<%@ Control EnableViewState="true" Language="C#" AutoEventWireup="true" CodeBehind="ProduitsEnListe.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.ProduitsEnListe" %>

<%@ Register Src="~/Controls/CustomTrackers.ascx" TagPrefix="local" TagName="CustomTrackers" %>


<%// deux vues sont possibles : soit en table ou en "flux". %>
<asp:MultiView runat="server" ID="mvTypeAffichage">
    <asp:View runat="server" ID="vwTable">
        <asp:DataList ID="InnerList" SkinID="ProductItemList" CssClass="ProductItemList"
            OnItemCreated="InnerList_ItemCreated"
            RepeatColumns='<%#RepeatColumns%>' runat="server" DataKeyField="art_guid" EnableViewState="false"
            RepeatDirection='<%#Orientation%>'>
            <ItemTemplate>
                
                <div data-ekind="Product" style="display:none">
                    <ecom:ProductDataHiddenField runat="server"  />
                </div>
                <ecom:GoogleUniversalAnalytics  runat="server" ID="tagGoogleUniv" Position="ProductInList" />
                <%// la présentation personnalisable "ProductItemInList" %>
                <ecom:ProductPanel SkinID="ProductItemInList" runat="server">
                    <Content>
                        <ecom:ProduitMetaTag runat="server" />
                        <ecom:ProduitLibelle runat="server" />
                    </Content>
                </ecom:ProductPanel>
            </ItemTemplate>
        </asp:DataList>
    </asp:View>
    <asp:View ID="vwFlux" runat="server">
            <asp:Repeater SkinID="ProductItemList" id="InnerFlux" 
                OnItemCreated="InnerFlux_ItemCreated"
                runat="server" EnableViewState="false" >
            <ItemTemplate>
                
                <asp:Panel runat="server" Visible='<%# !PourPageAmp %>' data-ekind="Product" style="display:none">
                    <ecom:ProductDataHiddenField runat="server"  />
                </asp:Panel>

                <ecom:GoogleUniversalAnalytics  runat="server" ID="tagGoogleUniv" Position="ProductInList" />
                <%// la même présentation personnalisable "ProductItemInList" est utilisée en mode flux %>
                <ecom:ProductPanel ID="ProductPanel1" SkinID="ProductItemInList" runat="server">
                    <Content>
                        <ecom:ProduitLibelle ID="ProduitLibelle1" runat="server" />
                    </Content>
                </ecom:ProductPanel>
            </ItemTemplate>
        </asp:Repeater>    
    </asp:View>
</asp:MultiView>

<% if(!PourPageAmp) { %>
<script>
    E.ParseProductsList();
</script>
<% } %>

<local:CustomTrackers runat="server" Position="ProductInList" />

