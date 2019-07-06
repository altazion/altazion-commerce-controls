<%@ Page Language="C#"  AutoEventWireup="true"
    EnableSessionState="ReadOnly"
    CodeBehind="default.aspx.cs" Inherits="CPointSoftware.ECommerce.Site._default"
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" 
    
    %>
<%@ OutputCache Location="None" %>


<asp:Content  ContentPlaceHolderID="head" runat="server" ID="head1">

    <ecom:GoogleValidator runat="server" />

</asp:Content>

<asp:Content ContentPlaceHolderID="BeforeContent" runat="server" ID="BeforeContent1">
    <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="HomePageBeforeContent"></ecom:ThemablePanelControl>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <ecom:ThemablePanelControl runat="server" SkinID="HomePagePanel" ID="HomePagePanel">
        <Content>
            Placez le contenu de votre home ici
       </Content>
    </ecom:ThemablePanelControl>

<ecom:TestLabel runat="server" />
   
</asp:Content>



<asp:Content ContentPlaceHolderID="AfterContent" runat="server" ID="Content2">
    <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="HomePageAfterContent"></ecom:ThemablePanelControl>
</asp:Content>