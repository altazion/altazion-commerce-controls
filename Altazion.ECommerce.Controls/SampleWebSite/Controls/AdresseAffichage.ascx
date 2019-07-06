<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdresseAffichage.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.AdresseAffichage" %>
<asp:multiview ID="adresseMultiView" runat="server">
    <asp:View ID="viewNonConnecte" runat="server">
        
        Vous n&#39;êtes pas connecté, veuillez
        <asp:LoginStatus ID="LoginStatus1" runat="server" LoginText="vous identifier" 
            LogoutText="vous connecter avec un autre compte" />
        &nbsp;pour choisir votre adresse.
        
    </asp:View>
    <asp:View ID="viewAucuneAdresse" runat="server">
        
        <table>
            <tr>
                <td>
                    Civilité</td>
                <td>
                    <asp:DropDownList ID="cboSalutations" runat="server">
                        <asp:ListItem>M.</asp:ListItem>
                        <asp:ListItem>Mlle.</asp:ListItem>
                        <asp:ListItem>Mme.</asp:ListItem>
                        <asp:ListItem>---</asp:ListItem>
                        <asp:ListItem>Association</asp:ListItem>
                        <asp:ListItem>SARL</asp:ListItem>
                        <asp:ListItem>SA</asp:ListItem>
                        <asp:ListItem>EURL</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="*" ControlToValidate="cboSalutations" ></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Nom</td>
                <td>
                    <asp:TextBox ID="txtName" runat="server" Columns="30"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ErrorMessage="*" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Prénom</td>
                <td>
                    <asp:TextBox ID="txtFirstName" runat="server" Columns="30"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ErrorMessage="*" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Adresse</td>
                <td>
                    <asp:TextBox ID="txtAddressLine1" runat="server" Columns="45"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="*" ControlToValidate="txtAddressLine1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Complément d&#39;adresse</td>
                <td>
                    <asp:TextBox ID="txtAddressLine2" runat="server" Columns="45"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    Code Postal</td>
                <td>
                    <asp:TextBox ID="txtZipCode" runat="server" Columns="10"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ErrorMessage="*" ControlToValidate="txtZipCode"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Ville</td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server" Columns="30"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ErrorMessage="*" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Pays</td>
                <td>
                    <asp:DropDownList ID="cboCountry" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ErrorMessage="*" ControlToValidate="cboCountry"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <ecom:AdresseCreationLink runat="server" Text="Enregistrer" 
                        AddressLine1TextBox="txtAddressLine1" AddressLine2TextBox="txtAddressLine2" 
                        CityTextBox="txtCity" CountryCombo="adresseMultiView" 
                        FirstNameTextBox="txtFirstName" NameTextBox="txtName" 
                        SalutationCombo="cboCountry" ZipCodeTextBox="txtZipCode" /></td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        
    </asp:View>
    <asp:View ID="viewAdresseChoisie" runat="server">
        <ecom:AdresseChoisie runat="server" ID="AdresseChoisie1" />
        
        <ecom:MouseOverHyperlink runat="server" SkinID="AdresseAffichageChoisir" ID="lnkChoisir" />
    </asp:View>
</asp:multiview>