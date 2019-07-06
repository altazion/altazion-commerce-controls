<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="noresult.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.noresult"
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="NoResultHeader" />
    <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="NoResultContent">
        <Content>
            <ecom:RechercheResultatsVides runat="Server" />
            
            
        </Content>
        
    </ecom:ThemablePanelControl>
    <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="NoResultFooter" />
</asp:Content>
