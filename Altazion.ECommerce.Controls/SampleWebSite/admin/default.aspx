<%@ Page Title="administration" Language="C#" MasterPageFile="~/admin/AdminMasterPage.Master"
    AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.admin._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h3>Module e-commerce</h3>

    <h4>Etat du serveur</h4>
    <pre><asp:Literal runat="server" ID="ltlData" /></pre>

    <h4>Modules MEF</h4>
    <asp:GridView runat="server" ID="lstModules" AutoGenerateColumns="true">
        <EmptyDataTemplate>
            <pre>Aucun module personnalisé</pre>
        </EmptyDataTemplate>
    </asp:GridView>

    <h4>Configuration</h4>
    <pre><asp:Literal runat="server" ID="ltlConfig" /></pre>


</asp:Content>
