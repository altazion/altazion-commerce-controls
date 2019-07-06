<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AvantageSaisieCode.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.AvantageSaisieCode" %>

<asp:Panel runat="server" DefaultButton="bntValiderCodeAvantage" CssClass="AvantageSaisie">
    <asp:TextBox runat="server" ID="txtCodeAvantage"  CssClass="TextBox" />
    <asp:LinkButton runat="server" ID="bntValiderCodeAvantage" 
         SkinID="SaisieCodeAvantageButton" Text="OK"
        onclick="bntValiderCodeAvantage_Click" />
    <asp:Label CssClass="erreur" ForeColor="Firebrick" runat="server" ID="lblErreur" />
</asp:Panel>