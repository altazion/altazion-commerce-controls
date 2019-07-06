<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="maxichequeDepliable.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.maxicheque.maxichequeDepliable" %>
<div class="TypeReglement">
    <asp:Panel runat="server" ID="pnlMain">
        <ecom:ThemableMultiView runat="server" ActiveViewIndex="0" ID="mvReglement">
            <ecom:ThemableView runat="server" ID="vwFerme">
                <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementMaxichequeFerme">
                    <Content>
                        Paiement par Chèque :
                        <ecom:ReglementOuvrirLinkButton ID="ReglementOuvrirLinkButton1" runat="server" Text="Choisir" />
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwOuvert">
                <ecom:ThemablePanelControl runat="server" ID="pnlOuvert" SkinID="ModeReglementMaxichequeOuvert">
                    <Content>
                        Paiement par maxichèque
                        <br />
                        Cliquez sur le lien suivant :
                        <ecom:ReglementChoisirLinkButton runat="server" ID="ReglementChoisirLinkButton1"
                            Text="Payer" />
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwNonDisponible">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="ModeReglementMaxichequeNonDispo">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwEnErreur">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="ModeReglementMaxichequeEnErreur">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
        </ecom:ThemableMultiView>
    </asp:Panel>
</div>
