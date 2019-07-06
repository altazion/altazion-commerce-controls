<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.admin.login" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="resources/admin.css" rel="stylesheet" type="text/css" />
</head>
<body class="login">
    <form id="form1" runat="server">
        <article>
            <h1>
                <asp:Label runat="server" ID="lblTitle">Module e-commerce</asp:Label></h1>


            <asp:Panel ID="Panel1" runat="server" DefaultButton="Login1$LoginLinkButton">
                <ecom:CustomerLogin ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate"
                    OnLoggedIn="Login1_LoggedIn">
                    <LayoutTemplate>
                        <div class="loginBox">
                            <p class="title">
                                Connectez-vous
                            </p>
                            <p class="instructions">
                                Veuillez saisir vos identifiants pour accèder à vos outils
                            </p>
                            <p>
                                <asp:Label ID="UserNameLabel" CssClass="entete" runat="server" AssociatedControlID="UserName">E-mail :</asp:Label>
                                <asp:TextBox ID="UserName" runat="server" CssClass="TextBox" Type="email" ClientIDMode="Static" AutoCompleteType="Email"></asp:TextBox>
                                <div class="erreurDiv">
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server"
                                        ControlToValidate="UserName" ErrorMessage="Veuillez saisir votre e-mail" CssClass="erreur" Display="Dynamic"
                                        ToolTip="Veuillez saisir votre e-mail" ValidationGroup="Login1">Veuillez saisir votre e-mail</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="UserNameIsEmail" runat="server"
                                        ControlToValidate="UserName" ErrorMessage="Veuillez vérifier votre e-mail"
                                        CssClass="erreur" Display="Dynamic"
                                        ToolTip="Veuillez vérifier votre e-mail" ValidationGroup="Login1"
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">Veuillez vérifier votre e-mail</asp:RegularExpressionValidator>
                                </div>
                                <p>
                                </p>
                                <p>
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password"
                                        CssClass="entete">Mot de passe:</asp:Label>
                                    <asp:TextBox ID="Password" runat="server" CssClass="TextBox" ClientIDMode="Static"
                                        TextMode="Password"></asp:TextBox>
                                    <div class="erreurDiv">
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server"
                                            ControlToValidate="Password" CssClass="erreur" Display="Dynamic"
                                            ErrorMessage="Veuillez saisir votre mot de passe"
                                            ToolTip="Veuillez saisir votre mot de passe" ValidationGroup="Login1">Veuillez saisir votre mot de passe</asp:RequiredFieldValidator>
                                    </div>
                                    <p>
                                    </p>
                                    <p class="erreur">
                                        <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                    </p>
                                    <p>
                                        <asp:LinkButton ID="LoginLinkButton" runat="server" CommandName="Login"
                                            CssClass="loginButton" ValidationGroup="Login1">Connexion</asp:LinkButton>
                                    </p>
                                </p>
                            </p>
                        </div>
                    </LayoutTemplate>
                </ecom:CustomerLogin>
            </asp:Panel>

        </article>
    </form>
</body>
</html>
