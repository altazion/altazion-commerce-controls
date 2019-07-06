<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true"
    CodeBehind="CorrectionAdresse.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Clients.CorrectionAdresse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="pnlHeaderMy" runat="server" SkinID="ClientsAllPagesHeader" />
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ClientsCorrectionAdresseHeader">
            <Content>
                <h1>
                    Modifier votre adresse</h1>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
</asp:Content>
