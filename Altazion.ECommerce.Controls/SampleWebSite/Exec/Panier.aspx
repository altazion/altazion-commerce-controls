<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Panier.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Panier"
    MaintainScrollPositionOnPostback="true" MasterPageFile="~/Masters/DefaultTheme.Master" %>

<%@ OutputCache Location="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <div id="PanierHeader">
        <ecom:ThemablePanelControl runat="server" SkinID="PanierHeader">
            <Content>
            </Content>
        </ecom:ThemablePanelControl>
        <div id="PanierWait">
            <asp:UpdateProgress ID="prgHautPage" AssociatedUpdatePanelID="pnlPanier" runat="server"
                Visible="false">
                <ProgressTemplate>
                    <table>
                        <tr>
                            <td class="PanierWait">Modification en cours
                            </td>
                        </tr>
                    </table>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </div>
    <div id="ExecContent">
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="PanierContentHeader" />
        <asp:UpdatePanel runat="server" ID="pnlPanier" UpdateMode="Always">
            <ContentTemplate>
                <asp:Panel runat="server" ID="pnlVide" Visible="false">
                    <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="PanierVide">
                        <Content>
                            Votre panier est vide
                        </Content>
                    </ecom:ThemablePanelControl>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlNormal">

                    <ecom:PanierErreurPanel ID="pnlErreurPanier" runat="server" CssClass="PanierErreurPanel panier-erreur-panel">
                        <ecom:ThemablePanelControl ID="ThemablePanelControl8" runat="server" SkinID="PanierMessageErreur">
                            <Content>
                            <p class="Erreur">
                                <ecom:PanierErreurLibelle ID="PanierErreurLibelle1" runat="server" />
                            </p>
                            <p class="Lien">
                                <ecom:PanierErreurLink ID="PanierErreurLink1" runat="server" />
                            </p>
                            </Content>
                            </ecom:ThemablePanelControl>
                    </ecom:PanierErreurPanel>

                    <ecom:ThemablePanelControl runat="server" SkinID="PanierDetailFull">
                        <Content>

                            <div class="LeDetailPanier">
                                <ecom:PanierPanelMagasinAssocie runat="server" CssClass="container">

                                    <ecom:ThemablePanelControl runat="server" SkinID="PanierDetailStore">
                                        <Content>
                                            <table class="LeDetailPanier">
                                                <ecom:ThemablePanelControl ID="ThemablePanelControl5" RenderWithNoTag="true" SkinID="PanierDetailStoreHeader"
                                                    runat="server" />

                                                <ecom:ThemablePanelControl runat="server" SkinID="PanierDetailStoreContent">
                                                    <Content>
                                                        <ecom:PanierLignes runat="server" HideIfEmpty="true" Type="Produit" ID="PanierLignes1" AssociesMagasin="true"
                                                            RenderAsTableLines="true" />
                                                    </Content>
                                                </ecom:ThemablePanelControl>

                                                <ecom:ThemablePanelControl ID="ThemablePanelControl7" RenderWithNoTag="true" SkinID="PanierDetailStoreAfterProducts"
                                                    runat="server" />

                                                <ecom:ThemablePanelControl ID="ThemablePanelControl6" RenderWithNoTag="true" SkinID="PanierDetailStoreFooter"
                                                    runat="server" />
                                            </table>

                                        </Content>
                                    </ecom:ThemablePanelControl>
                                </ecom:PanierPanelMagasinAssocie>




                                <ecom:ThemablePanelControl runat="server" SkinID="PanierDetailStandard">
                                    <Content>
                                        <table class="LeDetailPanier">
                                            <ecom:ThemablePanelControl ID="ThemablePanelControl5" RenderWithNoTag="true" SkinID="PanierDetailStandardHeader"
                                                runat="server" />


                                            <ecom:PanierRepeaterTypePrepa runat="server" ID="rptTypePrepa">
                                                <ItemTemplate>
                                                    <ecom:ThemablePanelControl ID="ThemablePanelControl5" RenderWithNoTag="true" SkinID="PanierDetailExternalHeader">
                                                        <Content>
                                                            <ecom:PanierEncartTypePrepa runat="server" TypePrepa='<%#Eval("TypePrepa") %>'>
                                                                <ecom:PanierPreparationLibelle runat="server" />
                                                            </ecom:PanierEncartTypePrepa>
                                                        </Content>
                                                    </ecom:ThemablePanelControl>

                                                    <ecom:PanierLignes runat="server" HideIfEmpty="true" Type="Produit" ID="PanierLignes1" AssociesMagasin="false" TypePrepa='<%#Eval("TypePrepa") %>'
                                                        RenderAsTableLines="true" />
                                                </ItemTemplate>
                                            </ecom:PanierRepeaterTypePrepa>

                                            <ecom:PanierEncartTypePrepaPrincipal runat="server" AfficherSiUniquementAutresPrepa="true">
                                                <ecom:ThemablePanelControl runat="server" SkinID="PanierDetailStandardGeneralHeader">
                                                </ecom:ThemablePanelControl>
                                            </ecom:PanierEncartTypePrepaPrincipal>
                                            <ecom:ThemablePanelControl runat="server" SkinID="PanierDetailStandardContent">
                                                <Content>
                                                    <ecom:PanierLignes runat="server" HideIfEmpty="true" Type="Produit" ID="PanierLignes1"
                                                        RenderAsTableLines="true" />
                                                </Content>
                                            </ecom:ThemablePanelControl>

                                            <ecom:ThemablePanelControl ID="ThemablePanelControl7" RenderWithNoTag="true" SkinID="PanierDetailStandardAfterProducts"
                                                runat="server" />

                                            <ecom:PanierIncitation runat="server" ID="PanierIncitation1" RenderAsTableLines="true" />
                                            <ecom:PanierLignes ID="PanierLignes2" runat="server" Type="Avantages" IsEditable="false"
                                                RenderAsTableLines="true" />

                                            <ecom:ThemablePanelControl ID="ThemablePanelControl6" RenderWithNoTag="true" SkinID="PanierDetailStandardFooter"
                                                runat="server" />
                                        </table>

                                        <div class="LeTransporteur">
                                            <ecom:LivraisonChoix ID="LivraisonChoix2" runat="server" OnContenuModifie="LivraisonChoix_ContenuModifie" />
                                        </div>
                                        <div class="SaisieCodeAvantage">
                                            <ecom:AvantageSaisieCode ID="AvantageSaisieCode2" runat="server" OnContenuModifie="AvantageSaisie_ContenuModifie" />
                                        </div>
                                    </Content>
                                </ecom:ThemablePanelControl>
                        </Content>
                    </ecom:ThemablePanelControl>

                    <asp:UpdateProgress ID="prgApresContenu" AssociatedUpdatePanelID="pnlPanier" runat="server"
                        Visible="false">
                        <ProgressTemplate>
                            <table>
                                <tr>
                                    <td class="PanierWait">Modification en cours
                                    </td>
                                </tr>
                            </table>
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                    <ecom:ThemablePanelControl runat="server" SkinID="PanierCommandes" RenderWithNoTag="true">
                        <Content>
                            
                        </Content>
                    </ecom:ThemablePanelControl>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
        <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="PanierGlobalFooter" />
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
