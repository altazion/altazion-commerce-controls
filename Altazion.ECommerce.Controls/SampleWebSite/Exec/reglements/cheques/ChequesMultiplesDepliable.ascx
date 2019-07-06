<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChequesMultiplesDepliable.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.cheques.ChequesMultiplesDepliable" %>
        <ecom:ThemableMultiView runat="server" ActiveViewIndex="0" ID="mvReglement">
            <ecom:ThemableView runat="server" ID="vwFerme">
                <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementChequesMultiplesFerme"
                    RenderWithNoTag="true">
                    <Content>
                        Paiement par Chèque (test) :
                        <ecom:ReglementOuvrirLinkButton ID="ReglementOuvrirLinkButton1" runat="server" Text="Choisir" />
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwOuvert">
                <ecom:ThemablePanelControl runat="server" ID="pnlOuvert" SkinID="ModeReglementChequesMultiplesOuvert"
                    RenderWithNoTag="true">
                    <Content>

                        Merci de préparer 3 chèques avec les montants suivants :
                        <ol runat="server" id="lstMontantsCheques">
                        
                        </ol>

                        Numéro du 1er cheque
                        <asp:TextBox runat="server" ValidationGroup="ModeReglementChequesMultiplesOuvert"
                            ID="txtNumCheque" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNumCheque" ValidationGroup="ModeReglementChequesMultiplesOuvert"
                            ID="valNumChequeObligatoire" />
                        <ecom:ReglementChoisirLinkButton runat="server" Text="Valider" ID="ReglementChoisirLinkButton1" />
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwNonDisponible">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="ModeReglementChequesMultiplesNonDispo"
                    RenderWithNoTag="true">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwEnErreur">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="ModeReglementChequesMultiplesEnErreur"
                    RenderWithNoTag="true">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
        </ecom:ThemableMultiView>
