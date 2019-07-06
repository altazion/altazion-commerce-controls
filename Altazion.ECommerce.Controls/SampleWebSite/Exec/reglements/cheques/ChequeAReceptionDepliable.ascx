<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChequeDepliable.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.cheques.ChequeDepliable" %>
<div class="TypeReglement">
    <asp:Panel runat="server" ID="pnlMain">
        <ecom:ThemableMultiView runat="server" ActiveViewIndex="0" ID="mvReglement">
            <ecom:ThemableView runat="server" ID="vwFerme">
                <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementChequeAReceptionFerme"
                    RenderWithNoTag="true">
                    <Content>
                        Paiement par Chèque :
                        <ecom:ReglementOuvrirLinkButton ID="ReglementOuvrirLinkButton1" runat="server" Text="Choisir" />
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwOuvert">
                <ecom:ThemablePanelControl runat="server" ID="pnlOuvert" SkinID="ModeReglementChequeAReceptionOuvert"
                    RenderWithNoTag="true">
                    <Content>
                        Paiement par Chèque
                        <br />
                        Montant du cheque :
                        <asp:Label runat="server" ID="lblMontantRestant" />
                        <br />
                        Numéro du cheque
                        <asp:TextBox runat="server" ValidationGroup="ModeReglementChequeOuvert" ID="txtNumCheque" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNumCheque" ValidationGroup="ModeReglementChequeOuvert"
                            ID="valNumChequeObligatoire" />
                        <ecom:ReglementChoisirLinkButton runat="server" ValidationGroup="ModeReglementChequeOuvert"
                            Text="Valider" ID="ReglementChoisirLinkButton1" />
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwNonDisponible">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="ModeReglementChequeAReceptionNonDispo"
                    RenderWithNoTag="true">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwEnErreur">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="ModeReglementChequeAReceptionEnErreur"
                    RenderWithNoTag="true">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
        </ecom:ThemableMultiView>
    </asp:Panel>
</div>
