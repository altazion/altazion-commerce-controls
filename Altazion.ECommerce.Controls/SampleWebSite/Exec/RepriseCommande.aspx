<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/DefaultTheme.Master"  CodeBehind="RepriseCommande.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.exec.RepriseCommande" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <h3>
        Reprendre une commande</h3>

    <asp:Panel runat="server" ID="pnlErreurs" Visible="false">
        <p>La commande ne peut pas être reprise pour les raisons suivantes :</p>
        <ul runat="server" id="ulErreurs">

        </ul>
    </asp:Panel>
    
    <asp:Panel runat="server" ID="pnlOK" Visible="false">
        <p>La commande <asp:Label runat="server" ID="lblNum" /> a été chargée.</p>
        <p>Attention, les avantages et promotions ont été retirées ou recalculées en fonction des opérations actives.</p>
        <asp:HyperLink runat="server" NavigateUrl="~/" Text="Retour à la homepage" />
    </asp:Panel>


</asp:Content>
