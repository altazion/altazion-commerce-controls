<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MicroSiteGlobalInfos.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.MicroSiteGlobalInfos" %>
<ecom:MagasinForm runat="server" ID="frmMagasin" DataSourceID="MagasinSource" SkinID="MicroSiteHoraires">
    <ItemTemplate>
        <div>
             <h2><ecom:MagasinLibelle ID="MagasinLibelle1" runat="server" /></h2>
             <p> <ecom:MagasinCodePostal ID="MagasinCodePostal1" runat="server" />
                        <ecom:MagasinVille ID="MagasinVille1" runat="server" /></p>
        </div>
    </ItemTemplate>
</ecom:MagasinForm>
<ecom:MagasinsDataSource ID="MagasinSource" Mode="Details" runat="server" OnSelected="MagasinsSource_Selected">
    <Parameters>
        <ecom:ServerParameter Name="Guid" Field="MagasinGuid" />
    </Parameters>
</ecom:MagasinsDataSource>
