<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomTrackers.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.CustomTrackers" %>


<asp:Literal runat="server" ID="ltlScriptBdd" />

<asp:MultiView runat="server" ID="mvTags">
    <asp:View runat="server" ID="vwEndOfHead">

    </asp:View>
    <asp:View runat="server" ID="vwStartOfBody">

    </asp:View>
    <asp:View runat="server" ID="vwEndOfBody">
        <ecom:GoogleRemarketing runat="server" />
    </asp:View>
    <asp:View runat="server" ID="vwInProductList">

    </asp:View>
    <asp:View runat="server" ID="vwInProductDetails">

    </asp:View>
    <asp:View runat="server" ID="vwInStoreList">

    </asp:View>
    <asp:View runat="server" ID="vwInStoreDetails">

    </asp:View>
</asp:MultiView>