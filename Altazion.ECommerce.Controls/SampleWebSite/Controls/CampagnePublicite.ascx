<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CampagnePublicite.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.CampagnePublicite" %>

<asp:MultiView runat="server" ID="mviewElement">
    <asp:View runat="server" ID="viewImageSimple">
        <ecom:MouseOverHyperlink runat="server" ID="lnkImageSimple" />
    </asp:View>
    <asp:View runat="server" ID="viewFlashSimple">
        <ecom:FlashControl runat="server" ID="flaFlashSimple" />
    </asp:View>
    <asp:View runat="server" ID="viewHtml">
        <asp:Literal runat="server" ID="ltlHtml" />
    </asp:View>
</asp:MultiView>