<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SegmentsEnListe.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.SegmentsEnListe" %>

<asp:GridView ID="GridView1" runat="server" DataSourceID="SegSource" AutoGenerateColumns="False" 
        ShowHeader="False" GridLines="None" BorderWidth="0" >
    <Columns>
        <asp:TemplateField>
        <ItemTemplate>
        <span class="AvecPuce">
        <ecom:SegmentLink runat="server" 
        />
        </span>
        </ItemTemplate>
        </asp:TemplateField>
    </Columns>
    </asp:GridView>
<ecom:SegmentsSourceControl runat="server" ID="SegSource" Mode="ListeCompleteCodes"
    onselecting="SegSource_Selecting">
<Parameters>
    <asp:Parameter Name="SegPk" DefaultValue="-1" Type="Decimal" />
    <asp:Parameter Name="MaxCount" DefaultValue="10" Type="Int32" />
</Parameters>
</ecom:SegmentsSourceControl>
