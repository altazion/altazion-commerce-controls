<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"  
    Inherits="CPointSoftware.ECommerce.Tools.ECommerceExecutablePage" 
    MasterPageFile="~/Masters/DefaultTheme.Master" %>
<%@ OutputCache Location="None" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div id="Step3ProcessHeader"></div> 
    <div id="ExecContent">
        <h1>Paiement non enregistré</h1>    
        <p>Vous avez annulé lors de la phase de paiement.</p>
        <p><asp:HyperLink runat="server" NavigateUrl="~/exec/panier.aspx">Retour au panier</asp:HyperLink></p>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ExecFooter" />
    </div>
   
</asp:Content>