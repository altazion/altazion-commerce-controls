<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PanierTotalGeneral.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.PanierTotalGeneral" %>
<asp:gridview runat="server" AutoGenerateColumns="False" GridLines="None"
    DataSourceID="PanierSourceControl1" ShowHeader="False" ID="GridView1" CellSpacing="0" CellPadding="0">
    <Columns>
        <asp:BoundField DataField="Libelle" HeaderText="Libelle" ItemStyle-CssClass="TotauxPanierLibelle"
            SortExpression="Libelle">
<ItemStyle CssClass="TotauxPanierLibelle"></ItemStyle>
        </asp:BoundField>
        <asp:BoundField DataField="Montant" DataFormatString="{0:###,##0.00} €" ItemStyle-CssClass="PanierMontant"
            HeaderText="Montant" HtmlEncode="False" SortExpression="Montant">
<ItemStyle CssClass="PanierMontant"></ItemStyle>
        </asp:BoundField>
    </Columns>
</asp:gridview>
<ecom:PanierSourceControl ID="PanierSourceControl1" runat="server" 
    TypeAffichage="Totaux">
</ecom:PanierSourceControl>

<ecom:ThemablePanelControl runat="server" ID="pnlTotalGeneral" SkinID="PanierTotalGeneral"><Content>
<div id="PanierTotalGeneral">
<table>
<tr><td class="TotauxPanierLibelle"><asp:Label runat="server">Montant TTC</asp:Label></td>
<td class="PanierMontant">
    <asp:Label ID="lblTotalGeneral" runat="server" Text="Label"></asp:Label></td></tr>
</table>
</div>
</Content></ecom:ThemablePanelControl>