<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true"
     Inherits="CPointSoftware.ECommerce.Tools.ECommerceEspaceClientPage" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="pnlHeaderMy" runat="server" SkinID="ClientsAllPagesHeader" />
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ClientsAdressesModificationHeader">
            <Content>
                <h2>
                    Votre adresse</h2>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div id="ExecContent">
        <div id="ModificationAdresse">
            <div class="blocForm">
                <div class="blocFormContent">
                <h1>Impossible d'effectuer cette modification d'adresse : elle a déjà été modifiée</h1>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
