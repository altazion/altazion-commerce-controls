<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true"
    CodeBehind="ErreurBanque.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.ErreurBanque" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Step2ProcessHeader">
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" SkinID="ErreurBanqueHeader"
            runat="server" />
    </div>
    <div id="ExecContent">
        <div id="ErreurBanque">
            <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="ErreurBanqueTexte">
                <Content>
                    <p>
                        Votre règlement n'a pas pu aboutir à cause d'une erreur renvoyée par votre banque.</p>
                    <p>
                        <asp:HyperLink runat="server" NavigateUrl="~/Exec/Process/ConfirmationCommande.aspx">Choisir un autre mode de paiement</asp:HyperLink></p>
                </Content>
            </ecom:ThemablePanelControl>
        </div>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ExecFooter" />
    </div>
    
</asp:Content>
