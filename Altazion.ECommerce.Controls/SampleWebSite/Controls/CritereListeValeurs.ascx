<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CritereListeValeurs.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.CritereListeValeurs" %>

    <p><ecom:RechercheCritereLabel runat="server" ID="lblActuel" CssClass="Selected" /></p>
<asp:GridView ID="GridView1" runat="server" DataSourceID="CritereDataSource" GridLines="None" AutoGenerateColumns="False" 
        ShowHeader="False" BorderWidth="0" > 
    <Columns>
        <asp:TemplateField>
        <ItemTemplate>
        <span class="AvecPuce">
        <ecom:CritereValeurLink ID="SegmentLink1" runat="server" 
        />
        </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate>Aucun filtre pour ce critère</EmptyDataTemplate>
    </asp:GridView>

<ecom:CriteresDataSource runat="server" ID="CritereDataSource" 
    onselecting="CritereDataSource_Selecting" Mode="ListeComplete" MaxCount="10">
<Parameters>
    <asp:Parameter Name="CritereGuid" />
</Parameters>
</ecom:CriteresDataSource>
       