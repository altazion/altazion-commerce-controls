<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MarquesListe.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.MarquesListe" %>
    
    
<asp:GridView ID="GridView1" runat="server" DataSourceID="CritereDataSource" GridLines="None" AutoGenerateColumns="False" 
        ShowHeader="False" BorderWidth="0" > 
    <Columns>
        <asp:TemplateField>
        <ItemTemplate>
        <span class="AvecPuce">
        <ecom:MarqueLink ID="SegmentLink1" runat="server" 
        />
        </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    <EmptyDataTemplate></EmptyDataTemplate>
    </asp:GridView>

<ecom:MarquesSource runat="server" ID="CritereDataSource" 
     Mode="ListeComplete" MaxRows="10">
<Parameters>
</Parameters>
</ecom:MarquesSource>