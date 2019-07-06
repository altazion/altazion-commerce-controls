<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CompteCreationDebut.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.CompteCreationDebut" %>

<ecom:ThemablePanelControl runat="server" SkinID="CompteCreationDebutHeader" />
<asp:Panel runat="server" DefaultButton="btnCreer">
<table class="VerificationEmail">
<tr class="email">
<td class="Header"><label><asp:Label SkinID="CompteCreationDebutEmailLabel" ValidationGroup="CreationCompteBox" runat="server" Text="e-mail : " /></label></td>
<td><asp:TextBox runat="server" ID="txtEmail" CssClass="TextBox" Type="email" />
<%--		<ajax:TextBoxWatermarkExtender ID="txtEmail_TextBoxWatermarkExtender" runat="server"
            TargetControlID="txtEmail" WatermarkCssClass="TextBox" WatermarkText="<indiquez votre adresse e-mail>">
        </ajax:TextBoxWatermarkExtender>
--%></td>
</tr>
<tr class="erreur">
<td colspan="2">
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ErrorMessage="Veuillez saisir une adresse e-mail valide" ValidationGroup="CreationCompteBox"
        ControlToValidate="txtEmail" SkinID="CompteCreationDebutErreurEmailInvalide"
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
<br />
<asp:Label runat="server" ID="lblErreur" Visible="false" SkinID="CompteCreationDebutErreurEmailDejaUtilise"  />
</td>
</tr>

<tr class="okButton">
<td colspan="2">
    <asp:LinkButton runat="server" ID="btnCreer" ValidationGroup="CreationCompteBox" CausesValidation="true"
        SkinID="CompteCreationDebutButton" onclick="btnCreer_Click" Text="Continuer" />
</td>
</tr>
</table>
</asp:Panel>