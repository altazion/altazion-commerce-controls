<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnCours.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Clients.EnCours"
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>

<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="ClientsEnCoursHeader">
            <Content>
                <h1>
                    Votre en-cours</h1>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div id="ExecContent">
        <div id="ExecEnCoursContent">
            <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ClientsEnCoursContentHeader">
                <Content>
                    <p>
                        Vous trouverez ci-dessous l'ensemble des disponibilités (avoirs, chèques cadeaux,
                        avantages fidélités...) qui sont créditées sur votre compte.</p>
                    <p>
                        Vous pourrez utiliser ce montant lors de votre prochaine commande en sélectionnant
                        "depuis mon compte" dans les modes de règlements.</p>
                </Content>
            </ecom:ThemablePanelControl>
            <div class="avoirs">
                <asp:multiview runat="server" id="mvAvoirs" activeviewindex="0">
                    <asp:view runat="server" id="vwAvecAvoirs">
                        <div class="EnCoursClientTotal">
                            <span>
                                <asp:label runat="server" skinid="EnCoursClientTotalLabel" text="Total disponible"
                                    cssclass="Header" /></span>
                            <ecom:EnCoursClientTotal runat="server" GridViewId="grdEnCours" SkinID="EnCoursClientTotal"
                                CssClass="Montant" />
                        </div>
                        <div class="EnCoursClientDetails">
                            <asp:gridview id="grdEnCours" skinid="EnCoursClientDetails" datasourceid="EnCoursSource"
                                cellpadding="0" cellspacing="0" runat="server" autogeneratecolumns="false">
                                <columns>
                        <asp:BoundField DataField="Date" DataFormatString="{0:dd/MM/yyyy}" HeaderStyle-CssClass="Date" ItemStyle-CssClass="Date" HtmlEncode="false"
                            HeaderText="Date" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField DataField="Raison" HeaderText="Raison" ItemStyle-CssClass="Raison"  HeaderStyle-CssClass="Raison" />
                        <asp:BoundField DataField="Montant" DataFormatString="{0:###,##0.00}€"  ItemStyle-CssClass="Montant" HeaderStyle-CssClass="Montant"
                            HtmlEncode="false" HeaderText="Montant" />
                    </columns>
                            </asp:gridview>
                        </div>
                    </asp:view>
                    <asp:view runat="server" id="vwSansAvoirs">
            
                         Vous n'avez aucun avoir disponible.
            
                    </asp:view>
                </asp:multiview>
            </div>
            <ecom:EnCoursClientSource runat="server" ID="EnCoursSource" OnSelected="EnCoursSource_Selected">
                <Parameters>
                    <ecom:PanierParameter Name="ClientGuid" Field="ClientGuid" />
                </Parameters>
            </ecom:EnCoursClientSource>
            <ecom:ThemablePanelControl ID="ThemablePanelControl6" runat="server" SkinID="ClientsEnCoursAvantBonsAchats" />
            <div class="bonsAchats">
                <asp:multiview runat="server" activeviewindex="0" id="mvBonsAchats">
                    <asp:view runat="server" id="vwAvecBA">
                        <ecom:BonsAchatsGridView runat="server" ID="gdvBons" SkinID="ClientsEnCoursBonsAchats">
                            <Columns>
                                <ecom:BonAchatsLabelGridColumn runat="server" />
                                <ecom:BonAchatsConditionsGridColumn runat="server" />
                                <ecom:BonAchatsOriginalAmountGridColumn runat="server" Format="{0:0.00}€" />
                                <ecom:BonAchatsAmountGridColumn runat="server" Format="{0:0.00}€" />
                            </Columns>
                        </ecom:BonsAchatsGridView>
                            <asp:panel runat="server" ID="pnlAvecBonBloques" Visible="false">
                                <a href="RecuperationBonAchat.htm">Débloquer des bons d'achat</a>
                            </asp:panel>
                    </asp:view>
                    <asp:view runat="server" id="vwSansBA">
            
            Vous n'avez pas de bons d'achats
            
            </asp:view>
                </asp:multiview>
            </div>
            <ecom:ThemablePanelControl ID="ThemablePanelControl5" runat="server" SkinID="ClientsEnCoursApresBonsAchats" />
            <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ClientsEnCoursContentFooter" />
        </div>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="ExecFooter" />
    </div>
</asp:content>
