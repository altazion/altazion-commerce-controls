<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Campagne.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.admin.Campagne"
    Title="campagnes" MasterPageFile="~/admin/AdminMasterPage.Master" %>

<asp:Content ContentPlaceHolderID="head" ID="headContent" runat="server">
<style>
    .pageBlock 
    {
    	height:280px;
    }
</style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="pageBlock">
        <div class="content">
            <h3>
                Test de campagnes</h3>
           <p>
                Utilisez cette page pour évaluer le site à une date donnée. Les opérations marketings
                et commerciales de cette date seront activées pour vous permettre d'avoir une approximation
                la plus juste possible du site à une date donnée. Les dates de promotions des articles
                ne seront par contre pas pris en compte.<br />
                <b>Attention</b>, les traitements seront fortement ralenti (pour votre session uniquement,
                les autres visiteurs du site ne seront pas impactés) pour toute la durée de votre
                test.</p>
            <br />
            Date à simuler :<br />
            <asp:TextBox ID="txtDate" runat="server" Columns="10" MaxLength="10"></asp:TextBox>
            &nbsp;<asp:RangeValidator ID="RangeValidator1" runat="server" Display="Dynamic" ErrorMessage="Date invalide"
                MaximumValue="31/12/2099" ControlToValidate="txtDate" MinimumValue="01/01/2009"
                Type="Date"></asp:RangeValidator>
            <br />
            <br />
            <asp:LinkButton CssClass="command" ID="Button1" Text="Activer" runat="server" OnClick="ButtonClick" />
            <br />
            <br />
            <p class="instructions">
                Une fois la date prise en compte, vous serez automatiquement redirigé vers la home
                page du site. Pour être sûr(e) d'avoir la bonne version affichée, nous vous invitons
                à rafraîchir le cache de votre navigateur (Ctrl+F5 sur la plupart).</p>
        </div>
    </div>
<%--    <div class="pageBlock">
        <div class="content">
            <h3>
                Opérations en cours</h3>
        </div>
    </div>
    <div class="pageBlock">
        <div class="content">
            <h3>
                Test de campagnes</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus vulputate, orci sit amet consequat fermentum, urna nisl consequat augue, vitae vulputate massa arcu id nisl. Nunc aliquam aliquet turpis, quis feugiat dui consectetur vitae. Morbi aliquet massa quis leo semper facilisis. Nam sit amet cursus urna. Morbi in mi lorem, vitae volutpat mauris. Class aptent taciti sociosqu ad litora torquent. </p>
        </div>
    </div>--%>
</asp:Content>
