<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProspectCreation.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.ProspectCreation" %>

 <tr>
        <td class="Header">
            <asp:Label ID="Label1" runat="server" text="Votre e-mail" SkinID="ProspectEmail" />
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