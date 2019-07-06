<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UnEuroDepliable.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.SIPS.UnEuroDepliable" %>
<div class="TypeReglement">
    <asp:Panel runat="server" ID="pnlMain">
        <ecom:ThemableMultiView runat="server" ActiveViewIndex="0" ID="mvReglement">
            <ecom:ThemableView runat="server" ID="vwFerme">
                <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementCofidisUnEuroFerme">
                    <Content>
                        Paiement avec 1€ :
                        <ecom:ReglementOuvrirLinkButton ID="ReglementChoixLinkButton1" runat="server" Text="Choisir le paiement CB" />
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwOuvert">
                <ecom:ThemablePanelControl runat="server" ID="pnlOuvert" SkinID="ModeReglementCofidisUnEuroOuvert">
                    <Content>
                        <iframe runat="server" id="iFrameSIPS" frameborder="0" />
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwNonDisponible">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="ModeReglementCofidisUnEuroNonDispo">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwEnErreur">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="ModeReglementCofidisUnEuroEnErreur">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
        </ecom:ThemableMultiView>
    </asp:Panel>
</div>
