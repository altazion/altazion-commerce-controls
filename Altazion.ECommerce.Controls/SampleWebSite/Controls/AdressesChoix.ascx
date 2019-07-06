<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdressesChoix.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.AdressesChoix" %>

<asp:DataList runat="server" ID="ListeAdresses" DataSourceID="AdressesSource">
    <ItemTemplate>
<%--    <ecom:ThemablePanelControl runat="server" SkinID="AffichageAdresse">
    <Content>
--%>        <table>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("adr_civil") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Eval("adr_nom") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("adr_adresse1") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("adr_adresse2") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("adr_cp") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("adr_ville") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2"><ecom:AdresseSelectionLink runat="server" Text="Utiliser cette adresse" AdresseGuid='<%# Eval("adr_guid") %>' TypeAdresse='<%#TypeAdresse%>' />
                   </td>
            </tr>
        </table>
<%--        </Content></ecom:ThemablePanelControl>
--%>
    </ItemTemplate>

</asp:DataList>
<ecom:AdressesDataSourceControl runat="server" ID="AdressesSource" 
    onselecting="AdressesSource_Selecting" 
    onselected="AdressesSource_Selected">
</ecom:AdressesDataSourceControl>