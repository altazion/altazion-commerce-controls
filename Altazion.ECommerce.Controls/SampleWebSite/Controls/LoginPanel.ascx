<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginPanel.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.LoginPanel" %>

<ecom:CustomerLogin ID="Login1" runat="server" InstructionText="Saisissez vos identifants"
   DisplayRememberMe="false"
    InstructionTextStyle-CssClass="Instructions" TitleText="déjà client ?" TitleTextStyle-CssClass="Title"
    TextBoxStyle-CssClass="TextBox" CheckBoxStyle-CssClass="CheckBox" UserNameLabelText="E-mail :"
    FailureText="sdfsd"
    PasswordRecoveryText="Mot de passe perdu ?" PasswordRecoveryUrl="~/Exec/PerteMotDePasse.aspx">
</ecom:CustomerLogin>
