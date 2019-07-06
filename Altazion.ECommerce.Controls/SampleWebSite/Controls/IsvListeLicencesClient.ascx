<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IsvListeLicencesClient.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.IsvListeLicencesClient" %>
<asp:ObjectDataSource ID="LicenceSource" runat="server" OldValuesParameterFormatString="original_{0}"
    OnObjectCreating="LicenceSource_ObjectCreating" SelectMethod="GetLicencePourClient"
    TypeName="CPointSoftware.Equihira.Business.Clients.IsvBll">
    <SelectParameters>
        <ecom:PanierParameter Name="guid" DbType="Guid" Field="ClientGuid" />
    </SelectParameters>
</asp:ObjectDataSource>
<asp:Repeater ID="Repeater1" runat="server" DataSourceID="LicenceSource" 
    onitemcreated="Repeater1_ItemCreated">
    <ItemTemplate>
        <ecom:ThemablePanelControl runat="server" ID="thmLicence" SkinID="LicenceClient">
            <Content>
                <div class="isvLicence">
                    <p><ecom:IsvLicenceLibelle runat="server" /></p>
                    <p>Clef produit : <ecom:IsvLicenceCode runat="server" /></p>
                    <p>Date d'expiration de la licence : <ecom:IsvLicenceDateFinValidite runat="server" /></p>
                    <p>Date de fin de la garantie : <ecom:IsvLicenceDateFinGarantie runat="server" /></p>
                </div>
            </Content>
        </ecom:ThemablePanelControl>
    </ItemTemplate>
</asp:Repeater>
