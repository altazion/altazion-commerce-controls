<%@ Page Title="" Language="C#" MasterPageFile="~/admin/AdminMasterPage.Master"
AutoEventWireup="true" CodeBehind="ClearCache.aspx.cs" 
Inherits="CPointSoftware.ECommerce.Site.admin.ClearCache" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="MainContent" runat="server">



    <h3><span>
        Vider le cache</span></h3>
    <p>
        Cliquez sur le bouton ci-dessous pour vider le cache de l&#39;application, 
        attention, cette opération n&#39;est possible que toutes les 5 minutes.</p>
    <p>
        
   <asp:LinkButton ID="btnReinit" CssClass="command" runat="server" onclick="btnReinit_Click" 
            Text="Vider le cache" />
    </p>

    <asp:Panel CssClass="confirmation" runat="server" ID="pnlOK" Visible="false">
        <p>Cache vidé</p>
    </asp:Panel>

</asp:Content>
