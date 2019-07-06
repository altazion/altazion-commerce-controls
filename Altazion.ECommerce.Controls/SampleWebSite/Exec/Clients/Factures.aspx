<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true"
    CodeBehind="Factures.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Clients.Factures" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="pnlHeaderMy" runat="server" SkinID="ClientsAllPagesHeader" />
        <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="ClientsDevisHeader">
            <Content>
                <h1>
                    Vos factures</h1>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div id="ExecContent">
        <div id="ClientsFactures">
            
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  CssClass="dataTable factureTable"
    CellPadding="4" DataKeyNames="fac_pk" DataSourceID="FacturesSource" 
    ForeColor="#333333" GridLines="None" Width="100%">
    <RowStyle BackColor="#FFFFFF" ForeColor="#333333" />
    <Columns>
        <asp:BoundField DataField="fac_numero" HeaderText="N° facture" 
            SortExpression="fac_numero" />
        <asp:BoundField DataField="fac_date" DataFormatString="{0:dd/MM/yyyy}" 
            HeaderText="Date" HtmlEncode="False" SortExpression="fac_date">
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="fac_montant_ttc" DataFormatString="{0:###,##0.00} €" 
            HeaderText="Montant" HtmlEncode="False" SortExpression="fac_montant_ttc">
        <ItemStyle HorizontalAlign="Right" />
        </asp:BoundField>
        <asp:BoundField DataField="fac_date_echeance" DataFormatString="{0:dd/MM/yyyy}" 
            HeaderText="Echéance" HtmlEncode="False" SortExpression="fac_date_echeance">
        <ItemStyle HorizontalAlign="Center" />
        </asp:BoundField>
        <asp:BoundField DataField="fac_montant_restant" DataFormatString="{0:###,##0.00} €" 
            HeaderText="Restant à payer" HtmlEncode="False" 
            SortExpression="fac_montant_restant">
        <ItemStyle HorizontalAlign="Right" />
        </asp:BoundField>
<%--
        <asp:BoundField DataField="fac_ref_client" ItemStyle-Width="25%"
            HeaderText="Vos références"
            SortExpression="fac_ref_client">
        </asp:BoundField>
       --%>

        <asp:HyperLinkField DataNavigateUrlFields="fac_pk" 
            DataNavigateUrlFormatString="Facture.ashx?fac_pk={0}" 
            Text="Imprimer" />

       

    </Columns>
    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    <HeaderStyle BackColor="#DCDCDC" Font-Bold="True" ForeColor="#494949" />
    <EditRowStyle BackColor="#999999" />
    <AlternatingRowStyle BackColor="#EFEFEF" ForeColor="#494949" />
</asp:GridView>
<asp:ObjectDataSource ID="FacturesSource" runat="server" 
    OldValuesParameterFormatString="original_{0}" 
    onobjectcreating="FacturesSource_ObjectCreating" 
    
    SelectMethod="GetFacturesPourClient" 
    TypeName="CPointSoftware.Equihira.Business.Clients.FacturesBll" 
                onselecting="FacturesSource_Selecting">
    <SelectParameters>
        <asp:Parameter DbType="Guid" Name="cli_guid" />
        <asp:Parameter DefaultValue="10" Name="maxRows" Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>


        </div>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
