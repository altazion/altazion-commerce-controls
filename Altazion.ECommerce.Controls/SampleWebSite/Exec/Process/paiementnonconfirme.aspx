<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true"
    CodeBehind="paiementnonconfirme.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Process.paiementnonconfirme" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Step2ProcessHeader">
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" SkinID="PaiementNonConfirmeHeader" runat="server" />
    </div>
    <div id="ExecContent">
        
        <ecom:ThemablePanelControl runat="server" SkinID="PaiementNonConfirmeMessage">
            <Content>
            </Content>
        </ecom:ThemablePanelControl>
        
        <ecom:ThemablePanelControl runat="server" SkinID="ReglementPanelPaiementNonConfirme">
            <Content>
                <div id="AutresReglements">
                    <ecom:ReglementsSelection runat="server" ID="pnlReglements" />
                </div>
            </Content>
        </ecom:ThemablePanelControl>
        
        <ecom:ThemablePanelControl ID="ThemablePanelControl3" SkinID="PaiementNonConfirmeFooter" runat="server" />
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
