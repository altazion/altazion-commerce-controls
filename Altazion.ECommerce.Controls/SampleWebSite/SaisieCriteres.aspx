<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaisieCriteres.aspx.cs"
    Inherits="CPointSoftware.ECommerce.Site.SaisieCriteres" MasterPageFile="~/Masters/DefaultTheme.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <ecom:rsslink id="RssLink1" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <div id="SaisieCriteres">
        <ecom:themablepanelcontrol runat="server" skinid="SaisieCritereHeader">
            <Content>
                <h3>
                    Recherche avancée</h3>
            </Content>
        </ecom:themablepanelcontrol>
        <asp:Panel runat="server" DefaultButton="btnSearch">
            <div class="SaisieCritereSearchButton">
                <ecom:mouseoverimagebutton runat="server" skinid="SaisieCritereSearchButton" 
                    onclick="btnSearch_Click" />
            </div>
            <ecom:saisiecriterespanel runat="server" skinid="SaisieCriterePanel" id="pnlSaisie">
            <ecom:ThemablePanelControl runat="server" SkinID="SaisieCriterePanel" />
        </ecom:saisiecriterespanel>
            <ecom:themablepanelcontrol runat="server" skinid="SaisieCritereAfterPanel" />
            <div class="SaisieCritereSearchButton">
                <ecom:mouseoverimagebutton runat="server" skinid="SaisieCritereSearchButton" id="btnSearch"
                    onclick="btnSearch_Click" />
            </div>
        </asp:Panel>
        <ecom:themablepanelcontrol runat="server" skinid="SaisieCritereFooter" />
    </div>
</asp:Content>
