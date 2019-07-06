<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mortar_details.aspx.cs"
    Inherits="CPointSoftware.ECommerce.Site.mortar_details" MasterPageFile="~/Masters/DefaultTheme.Master"
    MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="StoreDetailsContentHeader">
        <Content>
        </Content>
    </ecom:ThemablePanelControl>
    <ecom:MagasinForm runat="server" ID="frmMagasin" DataSourceID="MagasinSource" SkinID="MagasinDetail" RenderOuterTable="false">
        <ItemTemplate>
            <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="StoreDetailsContent">
                <Content>
                    <div>
                        <h2>
                            <ecom:MagasinLibelle runat="server" /></h2>
                        <ecom:MagasinAdresse runat="server" /><br />
                        <ecom:MagasinCodePostal runat="server" />
                        <ecom:MagasinVille runat="server" />
                    </div>
                </Content>
            </ecom:ThemablePanelControl>
        </ItemTemplate>
    </ecom:MagasinForm>
    <ecom:MagasinsDataSource ID="MagasinSource" Mode="Details" runat="server"
         OnSelecting="MagasinsSource_Selecting"
         OnSelected="MagasinsSource_Selected">
        <Parameters>
            <asp:QueryStringParameter Name="Guid" QueryStringField="mag_guid" Type="String" />
            <asp:QueryStringParameter Name="Code" QueryStringField="code" Type="String" />
        </Parameters>
    </ecom:MagasinsDataSource>
</asp:Content>
