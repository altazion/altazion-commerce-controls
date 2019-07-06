<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MicroSiteHoraires.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.MicroSiteHoraires" %>
<ecom:MagasinForm runat="server" ID="frmMagasin" DataSourceID="MagasinSource" SkinID="MicroSiteHoraires">
    <ItemTemplate>
        <div>
            <ecom:MagasinsHoraires ID="GoogleMap1" runat="Server" AfficherAm="true" />
        </div>
    </ItemTemplate>
</ecom:MagasinForm>
<ecom:MagasinsDataSource ID="MagasinSource" Mode="Details" runat="server" OnSelected="MagasinsSource_Selected">
    <Parameters>
        <ecom:ServerParameter Name="Guid" Field="MagasinGuid" />
    </Parameters>
</ecom:MagasinsDataSource>
