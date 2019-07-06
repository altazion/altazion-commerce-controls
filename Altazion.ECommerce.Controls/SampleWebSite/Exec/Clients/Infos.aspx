<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Infos.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Clients.Infos"
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

            <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="InfoArticlesContentHeader" />


    <asp:MultiView runat="server" ID="mvInformations" ActiveViewIndex="0">
        
        <asp:View runat="server" ID="vwModification">
            <asp:Panel runat="server" ID="pnlInformations">
                <%--
    placer ici des contrôles dérivant de ClientUserControl
--%>


                <asp:LinkButton runat="server" ID="lnkEnregistrer" Text="Enregistrer" OnClick="lnkEnregistrer_Click" />
            </asp:Panel>
        </asp:View>
        
        <asp:View runat="server" ID="vwOK">
        
        Vos modifications ont été enregistrées.
        
        </asp:View>
        
    </asp:MultiView>

                <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="InfoArticlesContentFooter" />


</asp:Content>
