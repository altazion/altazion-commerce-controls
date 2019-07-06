<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChequeEtChequeCadeauDepliable.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.cheques.ChequeEtChequeCadeauDepliable" %>
<ecom:ThemableMultiView runat="server" ActiveViewIndex="0" ID="mvReglement">
    <ecom:ThemableView runat="server" ID="vwFerme">
        <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementChequeEtChequeCadeauFerme"
            RenderWithNoTag="true">
            <Content>
                Paiement par Chèque (test) :
                        <ecom:ReglementOuvrirLinkButton ID="ReglementOuvrirLinkButton1" runat="server" Text="Choisir" />
            </Content>
        </ecom:ThemablePanelControl>
    </ecom:ThemableView>
    <ecom:ThemableView runat="server" ID="vwOuvert">
        <ecom:ThemablePanelControl runat="server" ID="pnlOuvert" SkinID="ModeReglementChequeEtChequeCadeauOuvert"
            RenderWithNoTag="true">
            <Content>
                Type de cheque :<br />
                <asp:DropDownList runat="server" CausesValidation="true" alidationGroup="ModeReglementChequeEtChequeCadeauOuvert"
                    ID="cboTypeCC">
                    <asp:ListItem Text="--" Value="" Enabled="false" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="cboTypeCC" ErrorMessage="obligatoire"
                    Display="Dynamic" ID="valCboTypeCC" />
                <br />
                Montant :<br />
                <asp:TextBox runat="server" AutoPostBack="true" CausesValidation="true" ValidationGroup="ModeReglementChequeEtChequeCadeauOuvert"
                    ID="txtMontantCC" />
                <asp:RangeValidator ID="RangeValidator1" SetFocusOnError="true" ControlToValidate="txtMontantCC"
                    Type="Double" MinimumValue="0" MaximumValue="50000" Display="Dynamic" runat="server"
                    ErrorMessage="Veuillez saisir un montant valide" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMontantCC" ErrorMessage="obligatoire"
                    Display="Dynamic" ID="valTxtMontantCC" />
                <asp:LinkButton runat="server" ID="lnkMaj" Text="Recalculer" />
                <br />
                <asp:Panel runat="server" ID="pnlCheque">
                    Numéro du 1er cheque
                            <br />
                    <asp:TextBox runat="server" ValidationGroup="ModeReglementChequeEtChequeCadeauOuvert"
                        ID="txtNumCheque" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNumCheque" ValidationGroup="ModeReglementChequeEtChequeCadeauOuvert"
                        ID="valNumChequeObligatoire" />
                    <br />
                    Le cheque devra être d'un montant de :
                            <asp:Label runat="server" ID="lblMontantRestant" />
                </asp:Panel>
                <ecom:ReglementChoisirLinkButton runat="server" Text="Valider" ID="ReglementChoisirLinkButton1" />
            </Content>
        </ecom:ThemablePanelControl>
    </ecom:ThemableView>
    <ecom:ThemableView runat="server" ID="vwNonDisponible">
        <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="ModeReglementChequeEtChequeCadeauNonDispo"
            RenderWithNoTag="true">
            <Content>
            </Content>
        </ecom:ThemablePanelControl>
    </ecom:ThemableView>
    <ecom:ThemableView runat="server" ID="vwEnErreur">
        <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="ModeReglementChequeEtChequeCadeauEnErreur"
            RenderWithNoTag="true">
            <Content>
            </Content>
        </ecom:ThemablePanelControl>
    </ecom:ThemableView>
</ecom:ThemableMultiView>
