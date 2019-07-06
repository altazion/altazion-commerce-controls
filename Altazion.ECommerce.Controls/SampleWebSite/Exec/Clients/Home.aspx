<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Clients.Home"
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="pnlHeaderMy" runat="server" SkinID="ClientsAllPagesHeader" />
        <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="ClientsHomeHeader">
            <Content></Content>
        </ecom:ThemablePanelControl>
    </div>
    <div id="ExecContent">
        <div id="ClientHome">
            <ecom:ThemablePanelControl runat="server" SkinID="ClientsHome">
                <Content>
                    <ul>
                        <li class="monCompte">
                            <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/my/compte.htm" Text="Mon mot de passe" /></li>
                        <li class="monCarnetAdresses">
                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/my/adresses.htm" Text="Mon carnet d'adresses" /></li>
                        <li class="mesCommandes">
                            <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/my/commandes.htm" Text="Mes commandes" /></li>
                        <li class="mesAvoirs">
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/my/encours.htm" Text="Mes avoirs" /></li>
                        <li class="mesNewsletters">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/newsletter.htm" Text="Mes newsletters" /></li>
                    </ul>
                    <ecom:LoginStatus runat="server" ID="Login" LogoutPageUrl="~/" LogoutAction="Redirect"
                        CssClass="logOut" />
                </Content>
            </ecom:ThemablePanelControl>
        </div>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
