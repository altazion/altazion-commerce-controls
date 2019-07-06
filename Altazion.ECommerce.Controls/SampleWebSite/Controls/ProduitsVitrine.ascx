<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProduitsVitrine.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.ProduitsVitrine" %>

<%@ Register TagPrefix="uc1" TagName="ProduitsEnListe" Src="~/Controls/ProduitsEnListe.ascx" %>

<asp:formview runat="server" datasourceid="SearchSource" id="resultView" RenderOuterTable="false">
    <itemtemplate>
<uc1:ProduitsEnListe ID="ProduitsEnListe1" runat="server" Data='<%#Eval("Articles")%>' Mode="Small" Orientation="Vertical" RepeatColumns="1" />
</itemtemplate>
</asp:formview>
<ecom:RechercheDataSourceControl ID="SearchSource" runat="server" 
    onselecting="SearchSource_Selecting">
    <Parameters>
        <asp:sessionparameter defaultvalue="-1" name="RjsId" sessionfield="rjs_id" 
            type="Int32" />
        <asp:sessionparameter defaultvalue="-1" name="SitPk" sessionfield="sit_pk" 
            type="Int32" />
        <asp:Parameter Name="VitGuid" />
    </Parameters>
</ecom:RechercheDataSourceControl>
