<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true"
    CodeBehind="AddIns.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Clients.ISV.AddIns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="pnlHeaderMy" runat="server" SkinID="ClientsAllPagesHeader" />
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ClientIsvAddInsHeader">
            <Content>
                <h1>
                   Add-ins et outils complémentaires</h1>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div id="ExecContent">
        <div id="ClientIsvAddIns">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ObjectDataSource1">
                <HeaderTemplate>
                    <h2>
                        Classeurs Excel</h2>
                </HeaderTemplate>
                <ItemTemplate>
                    <div style="border-bottom: solid 1px #dcdcdc; padding-bottom: 10px; width: 100%;
                        margin-bottom: 10px;">
                        <p style="float: right; width: 75px; margin: 5px 0px 0px 0px">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("exm_url")%>'
                                Text="Installer" /></p>
                        <h3 style="margin: 5px 0px 0px 0px;">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("exm_titre") %>' /></h3>
                        <p style="margin: 2px 0px 0px 0px">
                            Catégorie :
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("exm_categorie") %>' /></p>
                        <p style="margin: 2px 0px 0px 0px">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("exm_description") %>' />
                        </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetExtensionsPourClient" TypeName="CPointSoftware.Equihira.Business.Clients.IsvBll"
                OnObjectCreating="ObjectDataSource_ObjectCreating" OnSelecting="ObjectDataSource_Selecting"
                OnSelected="ObjectDataSource1_Selected">
                <SelectParameters>
                    <asp:Parameter DbType="Guid" Name="cli_guid" />
                    <asp:Parameter DefaultValue="Classeur excel" Name="type" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Repeater ID="Repeater2" runat="server" DataSourceID="ObjectDataSource2">
                <HeaderTemplate>
                    <h2>
                        Rapports ReportServer 2008</h2>
                </HeaderTemplate>
                <ItemTemplate>
                    <div style="border-bottom: solid 1px #dcdcdc; padding-bottom: 10px; width: 100%;
                        margin-bottom: 10px;">
                        <p style="float: right; width: 75px; margin: 5px 0px 0px 0px">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("exm_url")%>'
                                Text="Télécharger" /></p>
                        <h3 style="margin: 5px 0px 0px 0px;">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("exm_titre") %>' /></h3>
                        <p style="margin: 2px 0px 0px 0px">
                            Catégorie :
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("exm_categorie") %>' /></p>
                        <p style="margin: 2px 0px 0px 0px">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("exm_description") %>' />
                        </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetExtensionsPourClient" TypeName="CPointSoftware.Equihira.Business.Clients.IsvBll"
                OnObjectCreating="ObjectDataSource_ObjectCreating" OnSelecting="ObjectDataSource_Selecting"
                OnSelected="ObjectDataSource2_Selected">
                <SelectParameters>
                    <asp:Parameter DbType="Guid" Name="cli_guid" />
                    <asp:Parameter DefaultValue="Report 2008" Name="type" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Repeater ID="Repeater3" runat="server" DataSourceID="ObjectDataSource3">
                <HeaderTemplate>
                    <h2>
                        Rapports ReportServer 2005</h2>
                </HeaderTemplate>
                <ItemTemplate>
                    <div style="border-bottom: solid 1px #dcdcdc; padding-bottom: 10px; width: 100%;
                        margin-bottom: 10px;">
                        <p style="float: right; width: 75px; margin: 5px 0px 0px 0px">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("exm_url")%>'
                                Text="Télécharger" /></p>
                        <h3 style="margin: 5px 0px 0px 0px;">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("exm_titre") %>' /></h3>
                        <p style="margin: 2px 0px 0px 0px">
                            Catégorie :
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("exm_categorie") %>' /></p>
                        <p style="margin: 2px 0px 0px 0px">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("exm_description") %>' />
                        </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetExtensionsPourClient" TypeName="CPointSoftware.Equihira.Business.Clients.IsvBll"
                OnObjectCreating="ObjectDataSource_ObjectCreating" OnSelecting="ObjectDataSource_Selecting"
                OnSelected="ObjectDataSource3_Selected">
                <SelectParameters>
                    <asp:Parameter DbType="Guid" Name="cli_guid" />
                    <asp:Parameter DefaultValue="Report 2005" Name="type" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
            <asp:Repeater ID="Repeater4" runat="server" DataSourceID="ObjectDataSource4">
                <HeaderTemplate>
                    <h2>
                        Add-on pour la gestion commerciale</h2>
                </HeaderTemplate>
                <ItemTemplate>
                    <div style="border-bottom: solid 1px #dcdcdc; padding-bottom: 10px; width: 100%;
                        margin-bottom: 10px;">
                        <p style="float: right; width: 75px; margin: 5px 0px 0px 0px">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("exm_url")%>'
                                Text="Installer" /></p>
                        <h3 style="margin: 5px 0px 0px 0px;">
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("exm_titre") %>' /></h3>
                        <p style="margin: 2px 0px 0px 0px">
                            Catégorie :
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("exm_categorie") %>' /></p>
                        <p style="margin: 2px 0px 0px 0px">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("exm_description") %>' />
                        </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <asp:ObjectDataSource ID="ObjectDataSource4" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetExtensionsPourClient" TypeName="CPointSoftware.Equihira.Business.Clients.IsvBll"
                OnObjectCreating="ObjectDataSource_ObjectCreating" OnSelecting="ObjectDataSource_Selecting"
                OnSelected="ObjectDataSource4_Selected">
                <SelectParameters>
                    <asp:Parameter DbType="Guid" Name="cli_guid" />
                    <asp:Parameter DefaultValue="Addon" Name="type" Type="String" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </div>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
