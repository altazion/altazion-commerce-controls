<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true"
    CodeBehind="Devis.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Clients.Devis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="pnlHeaderMy" runat="server" SkinID="ClientsAllPagesHeader" />
        <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="ClientsDevisHeader">
            <Content>
                <h1>
                    Vos devis</h1>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div id="ExecContent">
        <div id="ClientsDevis">
            <h2>
                En attente d'acceptation</h2>
            <asp:UpdatePanel runat="server" ID="updDevis">
                <ContentTemplate>
                    <div class="accountRightColumn">
                        <asp:Panel runat="server" CssClass="validerDevis" ID="pnlConfirmer" DefaultButton="lnkValider"
                            Visible="false">
                            <div class="background">
                            </div>
                            <p>
                                <span class="title">Veuillez saisir le code de validation présent sur le devis :</span>
                                <asp:Label ID="lblErr" runat="server" ForeColor="Firebrick" Text="Code invalide" />
                                <br />
                                <br />
                                <asp:TextBox runat="server" ID="txtValider" MaxLength="8" Columns="8" />
                                <asp:LinkButton runat="server" ID="lnkValider" OnClick="btnValider_Click">
                                <span>Valider</span>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="lnkAnnuler" OnClick="lnkAnnuler_Click"><span>Annuler</span></asp:LinkButton>
                            </p>
                            <div style="clear: both">
                            </div>
                        </asp:Panel>
                    </div>
                    <div class="accountLeftColumn">
                        <asp:GridView runat="server" ID="gdGrid" DataSourceID="ObjectDataSource1" CellPadding="4"
                            CssClass="dataTable devisTable" ForeColor="#333333" GridLines="None" Width="100%"
                            ShowHeader="True" AutoGenerateColumns="False" DataKeyNames="dev_pk" OnSelectedIndexChanged="gdGrid_SelectedIndexChanged">
                            <RowStyle BackColor="#FFFFFF" ForeColor="#333333" />
                            <Columns>
                                <asp:BoundField DataField="dev_numero" ItemStyle-CssClass="colonne1" />
                                <asp:BoundField DataField="dev_date" ItemStyle-CssClass="colonne2" DataFormatString="{0:dd/MM/yyyy}"
                                    HeaderStyle-Font-Bold="false" HeaderText="Date" HtmlEncode="False" SortExpression="fac_date">
                                    <HeaderStyle Font-Bold="False"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="dev_montant_ttc" ItemStyle-CssClass="colonne3" DataFormatString="{0:###,##0.00} €"
                                    HeaderStyle-Font-Bold="false" HeaderText="Montant" HtmlEncode="False" SortExpression="fac_montant_ttc">
                                    <HeaderStyle Font-Bold="False"></HeaderStyle>
                                    <ItemStyle HorizontalAlign="Right" />
                                </asp:BoundField>
                                <asp:BoundField DataField="dev_libelle" ItemStyle-CssClass="colonne4" />
                                <asp:CommandField ControlStyle-ForeColor="#0270bb" ItemStyle-CssClass="colonne5"
                                    SelectText="Valider ce devis" ShowSelectButton="True" />
                            </Columns>
                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#DCDCDC" Font-Bold="True" ForeColor="#494949" />
                            <EditRowStyle BackColor="#999999" />
                            <AlternatingRowStyle BackColor="#EFEFEF" ForeColor="#494949" />
                            <EmptyDataTemplate>
                                <div class="noDevis">
                                    Tous vos devis sont validés
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDevisAAccepter"
                            TypeName="CPointSoftware.Equihira.Business.Clients.DevisBll" OnObjectCreating="ObjectDataSource1_ObjectCreating"
                            OnSelecting="ObjectDataSource1_Selecting">
                            <SelectParameters>
                                <asp:Parameter DbType="Guid" Name="clientGuid" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style='clear: both'>
            </div>
            <h2>
                En cours de réalisation</h2>
            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                <ContentTemplate>
                    <asp:GridView runat="server" ID="GridView1" DataSourceID="ObjectDataSource2" CellPadding="4"
                        CssClass="dataTable devisTable" ForeColor="#333333" GridLines="None" Width="100%"
                        ShowHeader="True" AutoGenerateColumns="False" DataKeyNames="dev_pk" OnSelectedIndexChanged="gdGrid_SelectedIndexChanged">
                        <RowStyle BackColor="#FFFFFF" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="dev_numero" ItemStyle-CssClass="colonne1" />
                            <asp:BoundField DataField="dev_date" ItemStyle-CssClass="colonne2" DataFormatString="{0:dd/MM/yyyy}"
                                HeaderStyle-Font-Bold="false" HeaderText="Date" HtmlEncode="False" SortExpression="dev_date">
                                <HeaderStyle Font-Bold="False"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dev_montant_ttc" ItemStyle-CssClass="colonne3" DataFormatString="{0:###,##0.00} €"
                                HeaderStyle-Font-Bold="false" HeaderText="Montant" HtmlEncode="False" SortExpression="fac_montant_ttc">
                                <HeaderStyle Font-Bold="False"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dev_libelle" ItemStyle-CssClass="colonne4" />
                            <asp:BoundField DataField="dev_date_acceptation" ItemStyle-CssClass="colonne2" DataFormatString="{0:dd/MM/yyyy}"
                                HeaderStyle-Font-Bold="false" HeaderText="Accepté le" HtmlEncode="False" SortExpression="dev_date_acceptation">
                                <HeaderStyle Font-Bold="False"></HeaderStyle>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#DCDCDC" Font-Bold="True" ForeColor="#494949" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="#EFEFEF" ForeColor="#494949" />
                        <EmptyDataTemplate>
                            <div class="noDevis">
                                Vous n'avez aucun devis en cours de réalisation
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="GetDevisValides"
                        TypeName="CPointSoftware.Equihira.Business.Clients.DevisBll" OnObjectCreating="ObjectDataSource1_ObjectCreating"
                        OnSelecting="ObjectDataSource1_Selecting">
                        <SelectParameters>
                            <asp:Parameter DbType="Guid" Name="clientGuid" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
