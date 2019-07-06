<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Commandes.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Clients.Commandes"
    MasterPageFile="~/Masters/DefaultTheme.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="pnlHeaderMy" runat="server" SkinID="ClientsAllPagesHeader" />
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="EtatCommandesHeader">
            <Content>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <asp:Panel runat="server" ClientIDMode="Static" id="ExecContent">
            <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="EtatCommandesContentHeader" />
        <div id="EtatCommandesListe">
            <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="EtatCommandesListeHeader" />
            <ecom:EtatsCommandesGridView DataSourceID="CommandesSource" runat="server" Visible="true"
                AutoGenerateColumns="False" class="EtatCommandesListe" 
                AllowPaging="True" DataKeyNames="Guid" BorderWidth="0" ID="grdCommandes" OnSelectedIndexChanged="grdCommandes_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="Numero" HeaderText="Numero" ItemStyle-CssClass="Numero">
                        <ItemStyle CssClass="Numero"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy HH:mm}"
                        ItemStyle-CssClass="Date" HtmlEncode="false">
                        <ItemStyle CssClass="Date"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="EtatGeneral" HeaderText="Statut de la commande" ItemStyle-CssClass="Statut">
                        <ItemStyle CssClass="Statut"></ItemStyle>
                    </asp:BoundField>
                    <asp:CommandField ShowSelectButton="true" SelectText="<span>&gt; Voir le détail</span>" ItemStyle-CssClass="Details" />
                </Columns>
            </ecom:EtatsCommandesGridView>

            <ecom:EtatsCommandesRepeater runat="server" ID="rptCommandes" SkinID="EtatCommandesRepeater"
                DataSourceID="CommandesSource"
                Visible="false" OnItemCommand="rptCommandes_ItemCommand">
                <ItemTemplate>

                </ItemTemplate>
            </ecom:EtatsCommandesRepeater>

            <ecom:CommandesClientSource Mode="Liste" ID="CommandesSource" runat="server">
                <Parameters>
                    <ecom:PanierParameter Name="ClientGuid" Field="ClientGuid" />
                </Parameters>
            </ecom:CommandesClientSource>
            <ecom:ThemablePanelControl ID="ThemablePanelControl5" runat="server" SkinID="EtatCommandesListeFooter" />
        </div>
        <div id="EtatCommandesDetail">
            <ecom:ThemablePanelControl ID="ThemablePanelControl6" runat="server" SkinID="EtatCommandesDetailHeader" />
            <asp:FormView DataSourceID="DetailsSource" ID="frmDetails" RenderOuterTable="false" runat="server">
                <ItemTemplate>
                    <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="EtatCommandesInfoHeader" />
                    <div class="EtatCommandesDetailAll">
                    <div class="EtatsCommandesDetailView">

                        <p>
                            <ecom:EtatsCommandesDetailView ID="pnlDetails" DataSource='<%#Eval("Details")%>' RenderOuterTable="false"
                                runat="server">
                                <ItemTemplate>
                                    <h5>
                                            Votre commande</h5>


                                    <span class="header numcommande">N° de commande : </span>
                                    <asp:Label class="numcommande" ID="Label1" runat="server" Text='<%#Eval("Numero")%>' /><br />
                                    <span class="header etat">Etat : </span>
                                    <asp:Label class="etat" ID="Label2" runat="server" Text='<%#Eval("EtatGeneral")%>' />
                                    </p>
                                </ItemTemplate>
                            </ecom:EtatsCommandesDetailView>
                            <ecom:DemandeRemboursementCommandeView ID="DemandeRemboursementCommandeView1" runat="server"
                                DataSource='<%#Eval("Details")%>'>
                                <ItemTemplate>
                                    <p>
                                        Cliquez
                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%#Eval("Guid", "~/my/retractation.htm?bcd_guid={0:D}")%>'>ici pour annuler votre commande</asp:HyperLink></p>
                                </ItemTemplate>
                            </ecom:DemandeRemboursementCommandeView>
                            <ecom:DemandeEnCoursCommandeView ID="DemandeEnCoursCommandeView1" runat="server" DataSource='<%#Eval("Details")%>'>
                                <ItemTemplate>
                                    <p>
                                        Votre demande d'annulation est en cours de traitement.</p>
                                </ItemTemplate>
                            </ecom:DemandeEnCoursCommandeView>
                    </div>

                    <div class="EtatsCommandesBPView">
                        <ecom:ThemablePanelControl ID="ThemablePanelControl8" runat="server" SkinID="EtatCommandesBPHeader">
                            <Content>
                                <h5>
                                    Bons de préparation</h5>
                            </Content>
                        </ecom:ThemablePanelControl>
                        <asp:GridView ID="EtatsCommandesBonPrepaView" SkinID="EtatsCommandesBonPrepaView" AutoGenerateColumns="false" DataSource='<%#Eval("BonsPrepa")%>'
                            BorderWidth="0" runat="server">
                            <Columns>
                                <asp:BoundField DataField="Numero" HeaderText="" />
                                <asp:BoundField DataField="EtatPreparation" HeaderText="Etat" />
                            </Columns>
                            <EmptyDataTemplate>
                            Aucun bon de préparation pour cette commande
                            </EmptyDataTemplate>

                        </asp:GridView>
                    </div>


                    <div class="EtatsCommandesLignesView">
                        <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="EtatCommandesLignesHeader">
                            <Content>
                                <h5>
                                    Articles</h5>
                            </Content>
                        </ecom:ThemablePanelControl>
                        <ecom:EtatsCommandesLignesView ID="grdLignes" AutoGenerateColumns="false" DataSource='<%#Eval("Lignes")%>'
                            BorderWidth="0" runat="server" Visible="true">
                            <Columns>
                                <asp:BoundField DataField="ArticleReference" HeaderText="" />
                                <asp:BoundField DataField="ArticleLibelle" HeaderText="Produit" />
                                <asp:BoundField DataField="Quantite" HeaderText="Commandé" DataFormatString="{0:0}"
                                    HtmlEncode="false" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="QuantiteEnPreparation" HeaderText="Préparation en cours" DataFormatString="{0:0}"
                                    HtmlEncode="false" ItemStyle-HorizontalAlign="Center" />
                                <asp:BoundField DataField="QuantiteExpediee" HeaderText="Expédié" DataFormatString="{0:0}"
                                    HtmlEncode="false" ItemStyle-HorizontalAlign="Center" />
                            </Columns>
                        </ecom:EtatsCommandesLignesView>
                        <ecom:EtatsCommandesLignesRepeater Visible="false" DataSource='<%#Eval("Lignes")%>' runat="server">
                            <ItemTemplate>
                               
                            </ItemTemplate>
                        </ecom:EtatsCommandesLignesRepeater>

                    </div>
                    <div class="EtatsCommandesFacturesView">
                        <ecom:ThemablePanelControl ID="ThemablePanelControl5" runat="server" SkinID="EtatCommandesFacturesHeader">
                            <Content>
                                <h5>
                                    Factures</h5>
                            </Content>
                        </ecom:ThemablePanelControl>
                        <ecom:EtatsCommandesFacturesView runat="server" AutoGenerateColumns="false" ID="grdFactures"
                            BorderWidth="0" DataSource='<%#Eval("Factures")%>'>
                            <Columns>
                                <asp:BoundField DataField="Date" DataFormatString="{0:dd/MM/yyyy}" HtmlEncode="false" />
                                <asp:BoundField DataField="Numero" />
                                <asp:HyperLinkField Target="_blank" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="~/exec/clients/facture.ashx?fac_pk={0}"
                                    Text="Voir la facture" />
                            </Columns>
                            <EmptyDataTemplate>
                            Aucune facture pour cette commande
                            </EmptyDataTemplate>
                            
                        </ecom:EtatsCommandesFacturesView>
                    </div>
                    <div class="EtatsCommandesColisView">
                        <ecom:ThemablePanelControl ID="ThemablePanelControl6" runat="server" SkinID="EtatCommandesColisHeader">
                            <Content>
                                <h5>
                                    Colis</h5>
                            </Content>
                        </ecom:ThemablePanelControl>
                        <ecom:EtatsCommandesColisView runat="server" AutoGenerateColumns="false" ID="grdColis"
                            BorderWidth="0" DataSource='<%#Eval("Colis")%>'>
                            <Columns>
                                <asp:BoundField DataField="Date" DataFormatString="{0:dd/MM/yyyy HH:mm}" HtmlEncode="false" />
                                <asp:BoundField DataField="Numero" />
                                <ecom:EtatsCommandesColisSuiviLink Text="Suivre ce colis" Target="suivicolis" />
                            </Columns>
                            <EmptyDataTemplate>
                                Aucun colis pour cette commande
                            </EmptyDataTemplate>

                        </ecom:EtatsCommandesColisView>
                    </div>
                    </div>
                </ItemTemplate>
            </asp:FormView>
            <ecom:CommandesClientSource Mode="Detail" ID="DetailsSource" OnSelecting="DetailsSource_Selecting" runat="server">
                <Parameters>
                    <ecom:PanierParameter Name="ClientGuid" Field="ClientGuid" />
                    <asp:Parameter Name="CommandeGuid" />
                </Parameters>
            </ecom:CommandesClientSource>
            <ecom:ThemablePanelControl runat="server" SkinID="EtatCommandesDetailFooter" />
        </div>
        
        <ecom:ThemablePanelControl ID="ThemablePanelControl7" runat="server" SkinID="EtatCommandesContentFooter" />
    </asp:Panel>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
