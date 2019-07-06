<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true" CodeBehind="ErreurCarte.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.ErreurCarte" %>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="Step2ProcessHeader">
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" SkinID="ErreurCarteHeader"
            runat="server" />
    </div>
    <div id="ExecContent">
        <div id="ErreurBanque">
            <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="ErreurCarteTexte">
                <Content>
                    <p>
                        Votre règlement n'a pas pu aboutir : la banque a refusé votre carte.</p>
                    <p>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Exec/Process/ConfirmationCommande.aspx">Choisir un autre mode de paiement</asp:HyperLink></p>
                </Content>
            </ecom:ThemablePanelControl>
        </div>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
