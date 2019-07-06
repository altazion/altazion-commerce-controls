<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FakeCB.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.fakecb.FakeCB" %>
<div class="TypeReglement">
    <div class="Header">
        <ecom:ThemablePanelControl runat="server" ID="pnlModeReg" SkinID="ModeReglementCheque" RenderWithNoTag="true">
            <Content>
                <h3>Règlement par CB (démonstration : opérations factices)</h3>
                <span>
                    <asp:Label Width="70px" runat="server" ForeColor="Firebrick" ID="lblAccepterErreur" />
                    </span>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div class="ModeReglementBoutonOk">
        <asp:LinkButton runat="server" SkinID="ModeReglementFakeCBButton"  ID="btnPayer" OnClick="btnPayer_Click" Text="Payer" />
    </div>
</div>
