<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RechercheResultats.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.RechercheResultats" %>
<%@ Register TagPrefix="uc1" TagName="ProduitsEnListe" Src="~/Controls/ProduitsEnListe.ascx" %>
<%@ Register Src="RechercheCritere.ascx" TagName="RechercheCritere" TagPrefix="uc2" %>


<asp:MultiView runat="server" ID="vwResultats" ActiveViewIndex="0">
    <asp:View runat="server" ID="vwAvecResultats">
        <asp:Repeater runat="server" DataSourceID="SearchSource">
            <ItemTemplate>
                <div class="products">
                        <%// un bloc personnalisable au dessus de tout le résultat, pour, par exemple, la gestion des pages et des criteres de tri %>
                        <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="SearchResultHeader">
                        </ecom:ThemablePanelControl>
                    <%// Les résultats de recherche %>
                        <%// Avec un bloc personnalisable avant les produits %>
                        <ecom:ThemablePanelControl ID="lcol" SkinID="ProductItemListBefore" runat="server">
                        </ecom:ThemablePanelControl>
                        <%// Les produits, dans une table par defaut, vous pouvez changer le TypeAffichage en Flux  %>
                        <uc1:ProduitsEnListe SkinID="ProductItemList" runat="server" 
                            TypeAffichage="Flux" PourPageAmp="false"
                            ID="SearchResults" Data='<%#Eval("Articles")%>' Orientation="Horizontal" RepeatColumns="4" />
                        <%// et un bloc personnalisable juste après les produits %>
                        <ecom:ThemablePanelControl ID="ThemablePanelControl3" SkinID="ProductItemListAfter"
                            runat="server">
                        </ecom:ThemablePanelControl>
                        <%// un bloc personnalisable au dessous de tout le résultat, pour, par exemple, les pages et le critère de tri %>
                        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="SearchResultFooter">
                        </ecom:ThemablePanelControl>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </asp:View>
    <asp:View runat="server" ID="vwAvecResultatsAMP">
        <asp:Repeater runat="server" DataSourceID="SearchSource">
            <ItemTemplate>
                <%// Avec un bloc personnalisable avant les produits %>
                <ecom:ThemablePanelControl ID="lcol" SkinID="ProductItemListBeforeAMP" runat="server">
                </ecom:ThemablePanelControl>
                <%// Les produits, dans une table par defaut, vous pouvez changer le TypeAffichage en Flux  %>
                <uc1:ProduitsEnListe SkinID="ProductItemListAMP" runat="server"
                    PourPageAmp="true" TypeAffichage="Flux"
                    ID="SearchResults" Data='<%#Eval("Articles")%>' Orientation="Horizontal" RepeatColumns="4" />
                <%// et un bloc personnalisable juste après les produits %>
                <ecom:ThemablePanelControl ID="ThemablePanelControl3" SkinID="ProductItemListAfterAMP"
                    runat="server">
                </ecom:ThemablePanelControl>
            </ItemTemplate>
        </asp:Repeater>
    </asp:View>
    <asp:View runat="server" ID="vwBarreUniquement">
        <asp:Repeater runat="server" DataSourceID="SearchSource">
            <ItemTemplate>
                <div class="SearchResultHeader">
                    <%// un bloc personnalisable au dessus de tout le résultat, pour, par exemple, la gestion des pages et des criteres de tri %>
                    <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="SearchResultHeaderUniquementBarre">
                    </ecom:ThemablePanelControl>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </asp:View>
    <asp:View runat="server" ID="vwSansResultat">
        <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="NoResultHeader" />
        <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="NoResultContent">
            <Content>
                <ecom:RechercheResultatsVides ID="RechercheResultatsVides1" runat="Server" />
            </Content>
        </ecom:ThemablePanelControl>
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="NoResultFooter" />
    </asp:View>



</asp:MultiView>


            <ecom:RechercheDataSourceControl runat="server" ID="SearchSource" PageSize="12" OnSelected="SearchSource_Selected"
            OnSelecting="SearchSource_Selecting">
            <Parameters>
                <ecom:ServerParameter Field="IdRaisonJuridique" Name="RjsId" Type="Int32" DefaultValue="-1" />
                <ecom:ServerParameter Field="IdSite" Name="SitPk" Type="Int32" DefaultValue="-1" />
                <ecom:ContexteParameter Field="CurrentPage" Name="Page" />
                <ecom:ContexteParameter Field="SegmentPk" Name="SegPk" />
                <ecom:ContexteParameter Field="Criteres" Name="Criteres" />
                <ecom:ContexteParameter Field="VitrineGuid" Name="VitGuid" />
                <ecom:ContexteParameter Field="CritereTri" Name="CritereTri" />
                <ecom:ContexteParameter Field="OrdreTri" Name="OrdreTri" />
                <ecom:ContexteParameter Field="MarquePk" Name="MarPk" />
                <ecom:ContexteParameter Field="Keywords" Name="Keywords" />
            </Parameters>
        </ecom:RechercheDataSourceControl>

<ecom:KnowledgeTag runat="server" ID="knlTag" />
