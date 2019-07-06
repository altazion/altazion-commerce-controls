<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreationCompte.aspx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.Process.CreationCompte" MasterPageFile="~/Masters/DefaultTheme.Master"
    MaintainScrollPositionOnPostback="true" %>
<%@ OutputCache Location="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <div id="Step1ProcessHeader">
    </div>
    <div id="ExecContent">
        <div id="CreationCompteContent">
                    <ecom:ThemablePanelControl ID="pnlAvantIdentifiant" runat="server" SkinID="CreationCompteHeader" />
                    <div id="CreationCompteIdentifiant">
                        <ecom:ThemablePanelControl runat="server" ID="pnlCreationCompteEnteteHeader" SkinID="CreationCompteEnteteHeader">
                            <Content>
                                <h2>
                                    <asp:Label ID="Label1" runat="server" Text="Informations de connexion" /></h2>
                            </Content>
                        </ecom:ThemablePanelControl>
                        
                        <ecom:CompteCreation runat="server" ID="pnlInfoConnexion" />
                        <ecom:ThemablePanelControl runat="server" SkinID="CreationCompteEnteteFooter" />
                    </div>
            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                <ContentTemplate>
                    <ecom:ThemablePanelControl ID="pnlApresIdentifiant" runat="server" SkinID="CreationCompteOtherContent">
                        <Content>
                            <ecom:CompteCreationAdresse ID="CompteCreationAdresse1" runat="server" />
                        </Content>
                    </ecom:ThemablePanelControl>
                    <div id="CreationCompteButtons">
                        <table>
                            <tr>
                                <td class="Retour">
                                    <ecom:MouseOverHyperlink ID="MouseOverHyperlink1" runat="server" SkinID="CreationCompteRetour"
                                        NavigateUrl="~/exec/panier.aspx" Text="Retour" />
                                </td>
                                <td class="Continuer">
                                    <asp:LinkButton runat="server" ID="lnValider" CssClass="Continuer" ImageUrl="~/images/standard/btnOk.gif"
                                        SkinID="CreationCompteValider" OnClick="btnValider_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
