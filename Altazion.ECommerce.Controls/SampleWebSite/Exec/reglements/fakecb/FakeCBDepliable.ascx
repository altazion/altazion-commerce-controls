<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FakeCBDepliable.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.fakecb.FakeCBDepliable" %>
<div class="TypeReglement">
    <asp:Panel runat="server" ID="pnlMain">
        <ecom:ThemableMultiView runat="server" ActiveViewIndex="0" ID="mvReglement">
            <ecom:ThemableView runat="server" ID="vwFerme">
                <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementFakeCBFerme"
                    RenderWithNoTag="true">
                    <Content>
                        <h3>Par CB Démo (opérations factices)</h3>
                        <ecom:ReglementOuvrirLinkButton ID="ReglementOuvrirLinkButton1" runat="server" Text="Choisir" />
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwOuvert">
                <ecom:ThemablePanelControl runat="server" ID="pnlOuvert" SkinID="ModeReglementFakeCBOuvert"
                    RenderWithNoTag="true">
                    <Content>
                        <h3>Par CB Démo (opérations factices)</h3>
                        <p class="montant">
                            <label>Montant de votre chèque</label>
                            <asp:Label runat="server" ID="lblMontantRestant" />
                        </p>
                        <ecom:ReglementChoisirLinkButton runat="server" ValidationGroup="ModeReglementFakeCBOuvert"
                            Text="Valider" ID="ReglementChoisirLinkButton1" />
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwNonDisponible">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="ModeReglementFakeCBNonDispo"
                    RenderWithNoTag="true">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwEnErreur">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="ModeReglementFakeCBEnErreur"
                    RenderWithNoTag="true">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
        </ecom:ThemableMultiView>
    </asp:Panel>

    <div class="clear">
    </div>
</div>
