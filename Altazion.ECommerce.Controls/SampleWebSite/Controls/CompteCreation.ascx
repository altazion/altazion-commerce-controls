<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CompteCreation.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.CompteCreation" %>

    <tr>
        <td class="Header">
            <asp:Label runat="server" text="Votre e-mail" SkinID="CompteCreationEmail" />
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtEmail" class="TextBox"  />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="txtEmail" Display="Dynamic" CssClass="ErrorMessage"
                ValidationGroup="CompteCreation"
                ErrorMessage="<p>Veuillez saisir votre e-mail</p>" SkinID="ErreurEmailObligatoire"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="txtEmail" Display="Dynamic" 
                ValidationGroup="CompteCreation"
                ErrorMessage="<p>Veuillez vérifier votre e-mail</p>" SkinID="ErreurEmailInvalide"
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="ErrorMessage"></asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="Header">
            <asp:Label runat="server" text="Choisissez votre mot de passe" SkinID="CompteCreationMotPasse" />
            
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password"  class="TextBox" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ValidationGroup="CompteCreation"
                ControlToValidate="txtPassword" Display="Dynamic"  SkinID="ErreurPasswordObligatoire" CssClass="ErrorMessage"
                ErrorMessage="<p>Veuillez saisir un mot de passe</p>"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <asp:MultiView runat="server" ID="mvConfirmation">
    <asp:View runat="server" id="vwAvecConfirmation">
    
    <tr>
        <td class="Header">
            <asp:Label runat="server" text="Confirmez le " SkinID="CompteCreationMotPasseConfirmation" />
            
        </td>
        <td>
            <asp:TextBox runat="server" ID="txtPassword2" TextMode="Password"  class="TextBox" />
            <asp:CompareValidator ID="CompareValidator1" runat="server" SkinID="ErreurPasswordNonIdentiques" CssClass="ErrorMessage"
                ErrorMessage="<p>Les mots de passe ne correspondent pas</p>" 
                ValidationGroup="CompteCreation"
                ControlToCompare="txtPassword" ControlToValidate="txtPassword2" 
                Display="Dynamic"></asp:CompareValidator>
        </td>
    </tr>
    </asp:View>
    
    <asp:View runat="server" id="vwSansConfirmation">
    
    </asp:View></asp:MultiView>

