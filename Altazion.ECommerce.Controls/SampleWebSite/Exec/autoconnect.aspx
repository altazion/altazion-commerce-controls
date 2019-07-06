<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="autoconnect.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.autoconnect" 
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>
<%@ OutputCache Location="None" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">

                        <h2>
            Connexion automatique</h2>

    </div>
    <div id="ExecContent">
        <asp:MultiView runat="server" id="mvLogin">
            <asp:View runat="server" ID="vwOK">
                <h1>Connexion réussie</h1>
                <p><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/my/">Cliquez ici pour accèder au compte client</asp:HyperLink></p>
            </asp:View>
            <asp:View runat="server" ID="vwKO">
                <h1>La connexion a échouée</h1>
                <p>Impossible de valider vos informations</p>
            </asp:View>
        </asp:MultiView>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
