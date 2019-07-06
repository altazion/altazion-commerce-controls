<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ChequesMultiples.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.cheques.ChequesMultiples" %>

   <div class="Header">
    <ecom:ThemablePanelControl runat="server" ID="pnlModeReg" SkinID="ModeReglementChequesMultiples" RenderWithNoTag="true">
    <Content>
    <h3>Règlement par chèques (en trois fois)</h3>
    <span><asp:Label Width="70px" runat="server" ForeColor="Firebrick" ID="lblAccepterErreur" />
    <asp:CheckBox runat="server" id="chkAccepter" Text="J'ai noté que ma commande ne sera déclenché qu'à réception des chèque(s)" /></span>
    </Content>
    </ecom:ThemablePanelControl>
    </div>    
    <div class="ModeReglementBoutonOk">
    <ecom:MouseOverImageButton runat="server" SkinID="ModeReglementChequesMultiplesButton" ImageUrl="~/images/standard/btnOk.gif" ID="btnPayer" OnClick="btnPayer_Click" Text="Payer par chèque" />
    </div>