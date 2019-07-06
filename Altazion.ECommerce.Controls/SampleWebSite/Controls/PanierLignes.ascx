<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PanierLignes.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.PanierLignes" %>
<asp:ScriptManagerProxy runat="server" />
<asp:MultiView runat="server" ID="mviewPanier">
    <asp:View ID="viewProduits" runat="server">
        <asp:MultiView runat="server" ID="mvLignes" ActiveViewIndex="1">
            <asp:View runat="server" ID="vwGrille">
                <ecom:PanierProduitsGrid ID="DataView" runat="server" AutoGenerateColumns="False"
                    DataSourceID="CartSource" GridLines="None" OnRowCommand="CartDetailsGridView_RowCommand"
                    OnDataUpdated="CartDetailsGridView_DataUpdated" SkinID="CartDetailsGridView"
                    ShowHeader="false" CellPadding="0">
                    <RowStyle CssClass="LignePanier" />
                    <Columns>
                        <ecom:PanierProduitCommandLink Command="removeall" CssClass="PanierProduitRemove"
                            Text="Remove" />
                        <ecom:PanierProduitLibelleEtRefField ItemStyle-CssClass="PanierProduitReference" />
                        <ecom:PanierProduitField CssClass="PanierProduitQuantite" Field="Quantite" />
                        <ecom:PanierProduitField CssClass="PanierProduitPrixUnitaireTtc" Field="PrixUnitaireTtc" />
                        <ecom:PanierProduitField CssClass="PanierProduitMontantTtc" Field="MontantTtc" />
                    </Columns>
                    <HeaderStyle Font-Bold="True" />
                    <AlternatingRowStyle CssClass="LignePanierAlternee" />
                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td class="PanierProduitRemove">&nbsp;
                                </td>
                                <td class="PanierProduitReference">&nbsp;
                                </td>
                                <td class="PanierProduitLibelle">Aucun article dans le panier
                                </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </ecom:PanierProduitsGrid>
            </asp:View>
            <asp:View runat="server" ID="vwRepeater">
                <asp:Repeater ID="PanierProduitsRepeater" runat="server"
                    DataSourceID="CartSource" OnItemCommand="PanierProduitsRepeater_ItemCommand"
                    OnItemCreated="PanierProduitsRepeater_ItemCreated"
                    SkinID="CartDetailsRepeater">
                    <ItemTemplate>
                        <ecom:ThemablePanelControl runat="server" ID="ligneItem" SkinID="CartDetailsRepeaterItem">
                            <Content>
                                <ecom:PanierProduitLabel runat="server" />
                            </Content>
                        </ecom:ThemablePanelControl>
                    </ItemTemplate>

                </asp:Repeater>
            </asp:View>
            <asp:View ID="vwDataList" runat="server">
                <ecom:PanierProduitsDataList DataSourceID="CartSource"
                    runat="server"
                    OnItemCommand="CartDetailsDataList_RowCommand"
                    SkinID="CartDetailsDataList">

                    <ItemTemplate>
                        <ecom:PanierProduitLabel ID="PanierProduitLabel1" runat="server" Field="Libelle" />
                    </ItemTemplate>

                </ecom:PanierProduitsDataList>
            </asp:View>

        </asp:MultiView>
    </asp:View>
    <asp:View ID="viewPort" runat="server">
        <ecom:ThemablePanelControl EnableViewState="false" ID="ThemablePanelControl0" runat="server"
            SkinID="PanierLigneTransporteur" RenderWithNoTag="true">
            <Content>
                <div class="ModeLivraison">
                    <ecom:LivraisonMode ID="LivraisonMode1" runat="server" />
                    - Livré le 
                    <ecom:LivraisonDelai ID="LivraisonDelai1" runat="server" Format="dd MMMM" />
                        <div class="prix-normal"><ecom:PanierProduitLabel runat="server" Field="Montant" Format="0.00€" /> </div>

                    <asp:HyperLink ID="HyperLink1" runat="server" Text="(modifier)" NavigateUrl="~/exec/panier.aspx" />
                </div>
            </Content>
        </ecom:ThemablePanelControl>
    </asp:View>
    <asp:View ID="viewAvantages" EnableViewState="false" runat="server">
        <asp:MultiView runat="server" ID="mvAvantages" ActiveViewIndex="1">
            <asp:View runat="server" ID="vwAvantagesGrilles">
                <ecom:PanierAvantagesGrid EnableViewState="false" runat="server" AutoGenerateColumns="False"
                    DataSourceID="CartSource" GridLines="None" ID="AvantagesView" SkinID="CartDetailsGridView"
                    BorderColor="#E7E7FF">
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <RowStyle CssClass="LignePanier" />
                    <Columns>
                        <ecom:PanierProduitField Field="Reference" />
                        <ecom:PanierProduitField Field="Libelle" />
                    </Columns>
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle CssClass="LignePanierAlternee" />
                </ecom:PanierAvantagesGrid>
            </asp:View>

            <asp:View runat="server" ID="vwAvantagesRepeater">
                <asp:Repeater ID="rptAvantages" runat="server"
                    DataSourceID="CartSource" OnItemCommand="PanierProduitsRepeater_ItemCommand"
                    OnItemCreated="PanierProduitsRepeater_ItemCreated"
                    SkinID="CartDetailsRepeater">
                    <ItemTemplate>
                        <ecom:ThemablePanelControl runat="server" ID="ligneItem" SkinID="CartAvantagesRepeaterItem">
                            <Content>
                                <ecom:PanierProduitLabel runat="server" />
                            </Content>
                        </ecom:ThemablePanelControl>
                    </ItemTemplate>

                </asp:Repeater>
            </asp:View>

        </asp:MultiView>
    </asp:View>
</asp:MultiView>
<ecom:PanierSourceControl EnableViewState="false" runat="server" ID="CartSource"
    OnSelected="CartSource_Selected">
    <Parameters>
        <asp:SessionParameter SessionField="rjs_id" Name="RjsId" Type="Int32" DefaultValue="-1" />
        <asp:SessionParameter SessionField="sit_pk" Name="SitPk" Type="Int32" DefaultValue="-1" />
    </Parameters>
</ecom:PanierSourceControl>
