<%@ Control Language="C#"  AutoEventWireup="true" CodeBehind="RechercheAffichageMeilleures.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.RechercheAffichageMeilleures" %>


<asp:DataList ID="DataList1" runat="server" DataSourceID="RechercheSource" 
    RepeatDirection="Horizontal" RepeatLayout="Flow">
    <ItemTemplate>
        <ecom:RechercherKeywordLink ID="HyperLink1" runat="server" Keyword='<%# XPath("@value") %>' Text='<%# XPath("@value") %>' />
    </ItemTemplate>
</asp:DataList>
<ecom:RedirectedXmlDataSource runat="server" ID="RechercheSource"
    DataFile="top-recherches.xml" RedirectedFolder="Data" 
    XPath="/Recherches/Recherche">
</ecom:RedirectedXmlDataSource>
