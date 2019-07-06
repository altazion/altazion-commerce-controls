<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"
    Inherits="CPointSoftware.ECommerce.Tools.ECommerceExecutablePage" MasterPageFile="~/Masters/DefaultTheme.Master" %>

<%@ OutputCache Location="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="ErreurCommande">
        <Content>
            <h1>Règlement en erreur</h1>
            <p>
                Une erreur est survenue pendant le paiement de votre commande. Celle-ci n'a pas
                    pu être enregistrée.
            </p>
        </Content>
    </ecom:ThemablePanelControl>
    <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ExecFooter" />
</asp:Content>
