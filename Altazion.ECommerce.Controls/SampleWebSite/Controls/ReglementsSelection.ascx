<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ReglementsSelection.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.ReglementsSelection" %>
<asp:ScriptManagerProxy runat="server" />
<ecom:ThemablePanelControl runat="server" SkinID="TypesReglementsHeader" ID="ThemablePanelControl3" />
<asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <asp:Panel ID="pnlModesSecondairesAvant" runat="server" CssClass="TypesReglementsSecondairesAvant">
        </asp:Panel>
        <ecom:ThemablePanelControl runat="server" SkinID="SelectionReglementTotalIntermediaire"
            ID="pnlMontantRestant">
            <Content>
                <div class="SelectionReglementTotalIntermediaire">
                    <span>Montant restant à règler : </span>
                    <ecom:PanierMontantNonRegle runat="server" />
                </div>
            </Content>
        </ecom:ThemablePanelControl>
        <asp:MultiView runat="server" ID="mvPrincipaux">
            <asp:View runat="server" ID="vwUnSeulBloc">
                <ecom:ThemablePanelControl runat="server" SkinID="TypesReglementsPrincipauxHeader"
                    ID="ThemablePanelControl1" />
                <asp:Panel ID="pnlModesPrincipaux" runat="server" CssClass="TypesReglementsPrincipaux">
                </asp:Panel>
                <ecom:ThemablePanelControl runat="server" SkinID="TypesReglementsPrincipauxFooter"
                    ID="ThemablePanelControl2" />
                <asp:Panel ID="pnlModesSecondairesApres" runat="server" CssClass="TypesReglementsSecondairesApres">
                </asp:Panel>
            </asp:View>
            <asp:View runat="server" ID="vwAvecExtension">
                <ecom:ThemablePanelControl runat="server" SkinID="TypesReglementsPrincipauxHeader"
                    ID="ThemablePanelControl5" />
                <asp:Panel ID="pnlPrincipauxMain" runat="server" CssClass="TypesReglementsPrincipaux">
                </asp:Panel>
                <asp:MultiView runat="server" ID="mvAccordeon">
                    <asp:View runat="server" ID="vwExtensionFerme">
                        <ecom:ThemablePanelControl runat="server" SkinID="TypesReglementsPrincipauxOuvrirExtension">
                            <Content>
                                <asp:LinkButton runat="server" ID="lnkOuvrirExtension" SkinID="TypesReglementsPrincipauxOuvrirExtension"
                                    OnClick="lnkOuvrirExtension_Click" />
                            </Content>
                        </ecom:ThemablePanelControl>
                    </asp:View>
                    <asp:View runat="server" ID="vwExtensionOuvert">
                        <ecom:ThemablePanelControl runat="server" SkinID="TypesReglementsPrincipauxAutresHeader"
                            ID="ThemablePanelControl7" />
                        <asp:Panel ID="pnlPrincipauxAutres" runat="server" CssClass="TypesReglementsPrincipaux">
                        </asp:Panel>
                        <ecom:ThemablePanelControl runat="server" SkinID="TypesReglementsPrincipauxFooter"
                            ID="ThemablePanelControl6" />
                        <asp:Panel ID="pnlModesSecondairesApres2" runat="server" CssClass="TypesReglementsSecondairesApres">
                        </asp:Panel>
                    </asp:View>
                </asp:MultiView>
            </asp:View>
        </asp:MultiView>
    </ContentTemplate>
</asp:UpdatePanel>
<ecom:ThemablePanelControl runat="server" SkinID="TypesReglementsFooter" ID="ThemablePanelControl4" />
