<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.login" 
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>

<%@ OutputCache Location="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <div id="ClientHeader">
        <ecom:ThemablePanelControl runat="server" SkinID="LoginSimpleHeader">
            <Content>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div id="ExecContent">
            <ecom:ThemablePanelControl runat="server" SkinID="LoginContent">
                <Content>
                    <div class="LoginBox">
                        <ecom:ThemablePanelControl runat="server" SkinID="LoginBoxHeader">
                            <Content>
                                <ecom:FacebookLoginLink runat="server" ID="lnkFacebook">connexion par facebook</ecom:FacebookLoginLink>
                            </Content>
                        </ecom:ThemablePanelControl>

                        <asp:Panel ID="Panel1" runat="server" DefaultButton="Login2$LoginLinkButton">
                            <ecom:CustomerLogin ID="Login2" runat="server" InstructionText="Saisissez vos identifants"
                                InstructionTextStyle-CssClass="Instructions" TitleText="déjà client ?" TitleTextStyle-CssClass="Title"
                                TextBoxStyle-CssClass="TextBox" CheckBoxStyle-CssClass="CheckBox" UserNameLabelText="E-mail :"
                                DisplayRememberMe="false" LoginButtonType="Link" LoginButtonStyle-CssClass="LoginButton" 
                                PasswordRecoveryText="Mot de passe perdu ?" PasswordRecoveryUrl="~/Exec/PerteMotDePasse.aspx">
                            </ecom:CustomerLogin>
                        </asp:Panel>
                        <ecom:ThemablePanelControl runat="server" SkinID="LoginBoxFooter" />
                    </div>
                    <div class="NoAccountBox">
                        <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="LoginCreationBoxHeader">
                            <Content>
                                <h1>
                                    premiere visite ?</h1>
                            </Content>
                        </ecom:ThemablePanelControl>
                        <ecom:ThemablePanelControl runat="server" SkinID="LoginCreationBox"><Content>
                            <ecom:CompteCreationDebut UrlRetour="CreationCompteSansCommande.aspx" ID="CompteCreationDebut1"
                                runat="Server" SkinID="LoginCreationForm" />
                        </Content></ecom:ThemablePanelControl>
                        <ecom:ThemablePanelControl runat="server" SkinID="LoginCreationBoxFooter" />
                    </div>
                </Content>
            </ecom:ThemablePanelControl>
                        <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="LoginFooter"
                RenderWithNoTag="true" />
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
