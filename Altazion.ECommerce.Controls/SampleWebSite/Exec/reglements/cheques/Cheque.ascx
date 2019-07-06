﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cheque.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.cheques.Cheque" %>
<div class="TypeReglement">
    <div class="Header">
    <ecom:ThemablePanelControl runat="server" ID="pnlModeReg" SkinID="ModeReglementCheque" RenderWithNoTag="true">
    <Content>
    <h3>Règlement par chèque</h3>
    <span><asp:Label Width="70px" runat="server" ForeColor="Firebrick" ID="lblAccepterErreur" />
    <asp:CheckBox runat="server" id="chkAccepter" Text="J'ai noté que ma commande ne sera déclenché qu'à réception du chèque" /></span>
    </Content>
    </ecom:ThemablePanelControl>
    </div>    
    <div class="ModeReglementBoutonOk">
    <ecom:MouseOverImageButton runat="server" SkinID="ModeReglementChequeButton" ImageUrl="~/images/standard/btnOk.gif" ID="btnPayer" OnClick="btnPayer_Click" Text="Payer par chèque" />
    </div>
</div>