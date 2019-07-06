<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mortar_storelocator.aspx.cs"
    Inherits="CPointSoftware.ECommerce.Site.mortar_storelocator" MasterPageFile="~/Masters/DefaultTheme.Master"
    MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content2" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HiddenField runat="server" ID="hdn_e_listemag" ClientIDMode="Static" />
    <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="StoreLocatorContentHeader">
    </ecom:ThemablePanelControl>
    <ecom:ThemableMultiView runat="server" ID="mvMagasins" ActiveViewIndex="0">
        <ecom:ThemableView runat="server" ID="vwMagasins">

            <ecom:ThemablePanelControl SkinID="StoreLocatorSearchWasExtended" runat="server" ID="pnlRechercheExtended" Visible="false">
                <Content>
                    <p class="SansMagasins">Il n'y a aucun magasin dans le département que vous avez sélectionné.</p>
                </Content>
            </ecom:ThemablePanelControl>

            <ecom:MagasinsRepeater runat="Server" DataSourceID="MagasinsSource" ID="lstMagasins">
                <ItemTemplate>
                    <div itemscope itemtype="http://schema.org/Store">
                        <ecom:ThemablePanelControl runat="server" SkinID="MagasinListItem">
                            <Content>
                                <div class="Magasin">
                                    <h2>
                                        <ecom:MagasinLibelleLink runat="server" /></h2>
                                    <ecom:MagasinAdresse runat="server" />
                                    <ecom:MagasinCodePostal runat="server" />
                                    <ecom:MagasinVille runat="server" />
                                    <br />
                                    <ecom:MagasinPays runat="server" />
                                    <br />
                                    <span>Tel :
                                            <ecom:MagasinTelephone runat="server" /></span>
                                </div>
                            </Content>
                        </ecom:ThemablePanelControl>
                    </div>

                </ItemTemplate>
            </ecom:MagasinsRepeater>
        </ecom:ThemableView>
        <ecom:ThemableView runat="server" ID="vwNoMagasins">
            <div class="NoMag">Il n'y a aucun magasin dans cette zone.</div>
        </ecom:ThemableView>
    </ecom:ThemableMultiView>
    <ecom:MagasinsDataSource ID="MagasinsSource" Mode="Liste" runat="server"
        OnSelecting="MagasinsSource_Selecting"
        OnSelected="MagasinsSource_Selected">
        <Parameters>
            <asp:QueryStringParameter QueryStringField="zone" Name="Zone" Type="String" />
            <asp:QueryStringParameter QueryStringField="codepostal" Name="CodePostal" Type="String" />
        </Parameters>
    </ecom:MagasinsDataSource>
    <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="StoreLocatorContentFooter">
    </ecom:ThemablePanelControl>
</asp:Content>
