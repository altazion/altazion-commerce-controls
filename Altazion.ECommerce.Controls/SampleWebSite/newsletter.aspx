<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="newsletter.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.newsletter"
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="ExecContent">
    </div>
    <div id="ExecNewsletterContent">
        <ecom:ThemablePanelControl SkinID="NewsletterHeader" runat="server" />
        <asp:MultiView runat="server" ID="pnlEMail">
            <asp:View runat="server" ID="NoEMail">
                <ecom:NewsletterInscription runat="server" />
            </asp:View>
            <asp:View runat="server" ID="WithEMail">
                <ecom:NewsletterChangeEtat runat="server" />
            </asp:View>
        </asp:MultiView>
        <ecom:ThemablePanelControl SkinID="NewsletterFooter" runat="server" />
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ExecFooter" />
    </div>

</asp:Content>
