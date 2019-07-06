<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="paypalDepliable.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.PayPal.paypalDepliable" %>
<div class="TypeReglement">
    <asp:Panel runat="server" ID="pnlMain">
        <ecom:ThemableMultiView runat="server" ActiveViewIndex="0" ID="mvReglement">
            <ecom:ThemableView runat="server" ID="vwFerme">
                <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementPaypalFerme"
                    RenderWithNoTag="true">
                    <Content>
                        Paiement par paypal :
                        <ecom:ReglementOuvrirLinkButton ID="ReglementChoixLinkButton1" runat="server" Text="Choisir le paiement paypal" />
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwOuvert" SkinID="ModeReglementPaypalOuvert">
                <ecom:ThemablePanelControl runat="server" ID="pnlOuvert" SkinID="ModeReglementPaypalOuvert"
                    RenderWithNoTag="true">
                    <Content>
                        Paiement par paypal
                        <br />
                        Montant :
                        <asp:Label runat="server" ID="lblMontantRestant" />
                        <br />
                        Cliquez sur le lien suivant :
                        <ecom:ReglementChoisirLinkButton runat="server" ID="ReglementChoisirLinkButton1"
                            Text="Payer" />
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwNonDisponible">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="ModeReglementPaypalNonDispo"
                    RenderWithNoTag="true">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwEnErreur">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="ModeReglementPaypalEnErreur"
                    RenderWithNoTag="true">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
        </ecom:ThemableMultiView>
    </asp:Panel>
</div>
