<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RechercheCritereSansUrl.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.RechercheCritereSansUrl" %>

<div id="CritereDeRecherche">

<h5>
    <asp:Label ID="lblTitre" runat="server"></asp:Label>
    </h5>
    <p><ecom:RechercheCritereLabel runat="server" ID="lblActuel" /></p>
<asp:GridView ID="GridView1" runat="server" DataSourceID="CritereDataSource" AutoGenerateColumns="False" 
        ShowHeader="False" >
    <Columns>
        <asp:TemplateField>
        <ItemTemplate>
        <ecom:RechercherCritereModifierLink ID="RechercherCritereModifierLink1" runat="server" 
        CssClassIfActive='Remove'
        CacherLesNonSelectionnes='true'
        TextIfActive='Modifier'
        CritereGuid='<%# Eval("CritereGuid") %>'
        CritereValeurGuid='<%# Eval("ValueGuid") %>'
        Text='<%# Eval("ValueLabel") %>'
        />
        <ecom:CritereCountLabel ID="CritereCountLabel1" runat="server" 
        CssClassIfActive='Remove'
        CacherLesNonSelectionnes='true'
        TextIfActive='Modifier'
        CritereGuid='<%# Eval("CritereGuid") %>'
        ValeurGuid='<%# Eval("ValueGuid") %>'
        ValeurFormat='(0)'
        />
        </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    </asp:GridView>

<ecom:CriteresDataSource runat="server" ID="CritereDataSource" 
    onselecting="CritereDataSource_Selecting">
<Parameters>
    <asp:Parameter Name="CritereGuid" />
</Parameters>
</ecom:CriteresDataSource>
        
</div>

