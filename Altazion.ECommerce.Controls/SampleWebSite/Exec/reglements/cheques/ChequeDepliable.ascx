<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChequeDepliable.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.cheques.ChequeDepliable" %>
<ecom:ThemableMultiView runat="server" ActiveViewIndex="0" ID="mvReglement">
    <ecom:ThemableView runat="server" ID="vwFerme">
        <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementChequeFerme"
            RenderWithNoTag="true">
            <Content>
                <h3>Par chèque</h3>
                <ecom:ReglementOuvrirLinkButton ID="ReglementOuvrirLinkButton1" runat="server" Text="Choisir" />
            </Content>
        </ecom:ThemablePanelControl>
    </ecom:ThemableView>
    <ecom:ThemableView runat="server" ID="vwOuvert">
        <ecom:ThemablePanelControl runat="server" ID="pnlOuvert" SkinID="ModeReglementChequeOuvert"
            RenderWithNoTag="true">
            <Content>
                <h3>Par chèque</h3>
                <p class="montant">
                    <label>Montant de votre chèque</label>
                    <asp:Label runat="server" ID="lblMontantRestant" />
                </p>
                <p class="numero">
                    <label>Numéro du cheque</label>
                    <asp:TextBox runat="server" ValidationGroup="ModeReglementChequeOuvert" ID="txtNumCheque" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNumCheque" ValidationGroup="ModeReglementChequeOuvert"
                        ID="valNumChequeObligatoire" />
                </p>
                <ecom:ReglementChoisirLinkButton runat="server" ValidationGroup="ModeReglementChequeOuvert"
                    Text="Valider" ID="ReglementChoisirLinkButton1" />
            </Content>
        </ecom:ThemablePanelControl>
    </ecom:ThemableView>
    <ecom:ThemableView runat="server" ID="vwNonDisponible">
        <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="ModeReglementChequeNonDispo"
            RenderWithNoTag="true">
            <Content>
            </Content>
        </ecom:ThemablePanelControl>
    </ecom:ThemableView>
    <ecom:ThemableView runat="server" ID="vwEnErreur">
        <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="ModeReglementChequeEnErreur"
            RenderWithNoTag="true">
            <Content>
            </Content>
        </ecom:ThemablePanelControl>
    </ecom:ThemableView>
</ecom:ThemableMultiView>
