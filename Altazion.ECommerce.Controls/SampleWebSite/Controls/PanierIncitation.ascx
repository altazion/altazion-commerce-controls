<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PanierIncitation.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.PanierIncitation" %>
<asp:MultiView runat="server" ID="mvType">
    <asp:View runat="server" ID="vwDiv">
        <asp:Panel runat="server" ID="pnlIncitation">
            <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="CartIncentiveView">
                <Content>
                    <div class="AvantageIncitation">
                        <div class="Header">
                            <ecom:IncitationLibelle ID="lblMessage" runat="server" />
                        </div>
                        <div class="Content">
                            <div class="hover">
                            </div>
                            <table>
                                <tr>
                                    <td class="PanierProduitRemove">
                                        &nbsp;
                                    </td>
                                    <td class="PanierProduitReference">
                                        <ecom:IncitationProduitField runat="server" Field="Reference" />
                                    </td>
                                    <td class="PanierProduitLibelle">
                                        <ecom:IncitationProduitField runat="server" Field="Libelle" />
                                    </td>
                                    <td class="PanierProduitQuantite">
                                        <ecom:IncitationProduitField runat="server" Field="Quantite" />
                                    </td>
                                    <td class="PanierProduitPrixUnitaireTtc">
                                        <ecom:IncitationProduitField runat="server" Field="PrixUnitaireTtc" TextePrixZero="Gratuit" />
                                    </td>
                                    <td class="PanierProduitMontantTtc">
                                        <ecom:IncitationProduitField runat="server" Field="MontantTtc" TextePrixZero="Gratuit" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </Content>
            </ecom:ThemablePanelControl>
        </asp:Panel>
    </asp:View>
    <asp:View runat="server" ID="vwTablePart">
        <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="CartIncentiveView">
            <Content>
                <tr class="AvantageIncitation">
    <td colspan="6">
                
                    <ecom:IncitationLibelle ID="IncitationLibelle1" runat="server" />
                    </td>
                </tr>
                <tr class="AvantageIncitationContent">
                    <td class="PanierProduitRemove">
                        &nbsp;
                    </td>
                    <td class="PanierProduitReference">
                        <ecom:IncitationProduitField ID="IncitationProduitField1" runat="server" Field="Reference" />
                    </td>
                    <td class="PanierProduitLibelle">
                        <ecom:IncitationProduitField ID="IncitationProduitField2" runat="server" Field="Libelle" />
                    </td>
                    <td class="PanierProduitQuantite">
                        <ecom:IncitationProduitField ID="IncitationProduitField3" runat="server" Field="Quantite" />
                    </td>
                    <td class="PanierProduitPrixUnitaireTtc">
                        <ecom:IncitationProduitField ID="IncitationProduitField4" runat="server" Field="PrixUnitaireTtc"
                            TextePrixZero="Gratuit" />
                    </td>
                    <td class="PanierProduitMontantTtc">
                        <ecom:IncitationProduitField ID="IncitationProduitField5" runat="server" Field="MontantTtc"
                            TextePrixZero="Gratuit" />
                    </td>
                </tr>
            </Content>
        </ecom:ThemablePanelControl>
    </asp:View>
</asp:MultiView>
