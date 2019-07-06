<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreationCompteSansCommande.aspx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.CreationCompteSansCommande" MasterPageFile="~/Masters/DefaultTheme.Master"
    MaintainScrollPositionOnPostback="true" %>
<%@ OutputCache Location="None" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <div id="ClientHeader">
        <ecom:ThemablePanelControl runat="server" SkinID="CreationCompteSansCommandeHeader">
            <Content>
                <h2>
                    Création d'un compte</h2>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div id="ExecContent">
        <div id="CreationCompteContent">
            <ecom:ThemablePanelControl ID="pnlAvantIdentifiant" runat="server" SkinID="CreationCompteHeader" />
            <div id="CreationCompteIdentifiant">
                <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="CreationCompteEnteteHeader">
                    <Content>
                        <h2>
                            <asp:Label ID="Label1" runat="server" Text="Informations de connexion" /></asp:Label></h2>
                    </Content>
                </ecom:ThemablePanelControl>
                <ecom:CompteCreation runat="server" ID="pnlInfoConnexion" />
                <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="CreationCompteEnteteFooter" />
            </div>
            <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                <ContentTemplate>
                    <ecom:ThemablePanelControl ID="pnlApresIdentifiant" runat="server" SkinID="CreationCompteOtherContent">
                        <Content>
                            <ecom:CompteCreationAdresse ID="CompteCreationAdresse1" runat="server" />
                        </Content>
                    </ecom:ThemablePanelControl>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div id="CreationCompteButtons">
                <table>
                    <tr>
                        <td class="Retour">
                            <ecom:MouseOverHyperlink runat="server" SkinID="CreationCompteRetour" NavigateUrl="~/"
                                Text="Retour" />
                        </td>
                        <td class="Continuer">
                            <ecom:MouseOverImageButton runat="server" ID="btnValider" ImageUrl="~/images/standard/btnOk.gif"
                                SkinID="CreationCompteValider" OnClick="btnValider_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
