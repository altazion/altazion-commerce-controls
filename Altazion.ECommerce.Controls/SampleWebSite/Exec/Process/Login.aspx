<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Process.Login"
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>

<%@ OutputCache Location="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManagerProxy ID="ScriptManagerProxy1" runat="server">
    </asp:ScriptManagerProxy>
    <ecom:ThemablePanelControl ID="ThemablePanelControl5" runat="server" SkinID="LoginProcessHeader" />
    <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="LoginContent"
        RenderWithNoTag="true">
        <Content>
            <div class="LoginBox">
                <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="LoginBoxHeader"
                    RenderWithNoTag="true">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
                <asp:Panel ID="Panel1" runat="server" DefaultButton="Login1$LoginLinkButton">
                    <ecom:CustomerLogin ID="Login1" runat="server" InstructionText="Saisissez vos identifants"
                        SkinID="LoginBoxProcess" DisplayRememberMe="false"
                        LoginButtonText="Connexion" FailureText="E-mail/mot de passe inconnus"
                        InstructionTextStyle-CssClass="Instructions" TitleText="déjà client ?" TitleTextStyle-CssClass="Title"
                        TextBoxStyle-CssClass="TextBox" CheckBoxStyle-CssClass="CheckBox" UserNameLabelText="E-mail :"
                        PasswordRecoveryText="Mot de passe perdu ?" PasswordRecoveryUrl="~/Exec/PerteMotDePasse.aspx">
                    </ecom:CustomerLogin>
                </asp:Panel>
                <ecom:ThemablePanelControl runat="server" SkinID="LoginBoxFooter" />
            </div>
            <div class="NoAccountBox">
                <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="LoginCreationBoxHeader">
                    <Content>
                        <h1>premiere visite ?</h1>
                    </Content>
                </ecom:ThemablePanelControl>
                <ecom:ThemablePanelControl ID="ThemablePanelControl7" runat="server" SkinID="LoginCreationBox">
                    <Content>
                        <ecom:CompteCreationDebut UrlRetour="CreationCompte.aspx" ID="CompteCreationDebut1"
                            runat="Server" SkinID="LoginCreationForm" />
                    </Content>
                </ecom:ThemablePanelControl>
                <ecom:ThemablePanelControl ID="ThemablePanelControl8" runat="server" SkinID="LoginCreationBoxFooter" />
            </div>
        </Content>
    </ecom:ThemablePanelControl>
    <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="LoginProcessFooter"
        RenderWithNoTag="true" />
    <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="ExecFooter" />
</asp:Content>
