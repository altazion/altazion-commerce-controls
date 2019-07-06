<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CompteCreationAdresse.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.CompteCreationAdresse" %>
        <asp:MultiView runat="server" ID="mvAdresse" ActiveViewIndex="0">
            <asp:View runat="server" ID="vwCreation">
                <tr>
                    <td class="Header">
                        <asp:Label runat="server" Text="Civilité" SkinID="CompteCreationAdresseCivilite" />
                    </td>
                    <td>
                        <asp:DropDownList ID="cboSalutations" runat="server" SkinID="CompteCreationAdresseCivilite">
                            <asp:ListItem>M.</asp:ListItem>
                            <asp:ListItem>Mlle.</asp:ListItem>
                            <asp:ListItem>Mme.</asp:ListItem>
                            <asp:ListItem>---</asp:ListItem>
                            <asp:ListItem>Association</asp:ListItem>
                            <asp:ListItem>SARL</asp:ListItem>
                            <asp:ListItem>SA</asp:ListItem>
                            <asp:ListItem>EURL</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                            Display="Dynamic" CssClass="ErrorMessage" ValidationGroup="CompteCreation" ControlToValidate="cboSalutations"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Header">
                        <asp:Label ID="Label1" runat="server" Text="Nom" SkinID="CompteCreationAdresseNom" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" Columns="30" SkinID="CompteCreationAdresseNom"
                            CssClass="TextBox"></asp:TextBox>
                        <asp:RequiredFieldValidator SkinID="ErreurNomObligatoire" ID="RequiredFieldValidator2"
                            CssClass="ErrorMessage" runat="server" ValidationGroup="CompteCreation" Display="Dynamic" ErrorMessage="Veuillez saisir votre nom" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Header">
                        <asp:Label ID="Label2" runat="server" Text="Prénom" SkinID="CompteCreationAdressePrenom" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtFirstName" runat="server" Columns="30" SkinID="CompteCreationAdressePrenom"
                            CssClass="TextBox"></asp:TextBox>
                        <asp:RequiredFieldValidator SkinID="ErreurPrenomObligatoire" ID="RequiredFieldValidator3"
                            Display="Dynamic" CssClass="ErrorMessage" ValidationGroup="CompteCreation" runat="server" ErrorMessage="*" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Header">
                        <asp:Label ID="Label3" runat="server" Text="Adresse" SkinID="CompteCreationAdresseAdresse" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddressLine1" runat="server" Columns="45" SkinID="CompteCreationAdresseAdresse"
                            CssClass="TextBox"></asp:TextBox>
                        <asp:RequiredFieldValidator SkinID="ErreurAdresseObligatoire" ID="RequiredFieldValidator4"
                            Display="Dynamic" CssClass="ErrorMessage" ValidationGroup="CompteCreation" runat="server" ErrorMessage="Veuillez saisir votre adresse" ControlToValidate="txtAddressLine1"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Header">
                        <asp:Label ID="Label4" runat="server" Text="Complément d&#39;adresse" SkinID="CompteCreationAdresseAdresseComplement" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtAddressLine2" runat="server" Columns="45" SkinID="CompteCreationAdresseAdresseComplement"
                            CssClass="TextBox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="Header">
                        <asp:Label ID="Label6" runat="server" Text="Code Postal" SkinID="CompteCreationAdresseCodePostal" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtZipCode" runat="server" Columns="10" SkinID="CompteCreationAdresseCodePostal"
                            CssClass="TextBox" AutoCompleteType="HomeZipCode" />
                        <%--                            AutoPostBack="true" ontextchanged="txtZipCode_TextChanged" />--%>
                        <asp:RequiredFieldValidator ValidationGroup="CompteCreation" SkinID="ErreurCPObligatoire" Display="Dynamic" ID="RequiredFieldValidator5"
                            CssClass="ErrorMessage" runat="server" ErrorMessage="Veuillez saisir votre code postal" ControlToValidate="txtZipCode"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ValidationGroup="CompteCreation" ID="valCodePostalCorrect" runat="server" ControlToValidate="txtZipCode"
                            CssClass="ErrorMessage" Display="Dynamic" SkinID="ErreurCPInvalide" ErrorMessage="Code postal incorrect."
                            ValidationExpression="\d{5}"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Header">
                        <asp:Label ID="Label5" runat="server" Text="Ville" SkinID="CompteCreationAdresseVille" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtCity" runat="server" Columns="30" SkinID="CompteCreationAdresseVille"
                            CssClass="TextBox" AutoCompleteType="HomeCity"></asp:TextBox>
                        <asp:RequiredFieldValidator SkinID="ErreurVilleObligatoire" Display="Dynamic" ID="RequiredFieldValidator6"
                            CssClass="ErrorMessage" ValidationGroup="CompteCreation" runat="server" ErrorMessage="Veuillez saisir votre ville" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Header">
                        <asp:Label ID="Label7" runat="server" Text="Pays" SkinID="CompteCreationAdressePays" />
                    </td>
                    <td>
                        <asp:DropDownList ID="cboCountry" runat="server" SkinID="CompteCreationAdressePays">
                            <%--
                        AutoPostBack="True" OnSelectedIndexChanged="cboCountry_SelectedIndexChanged"
--%>
                          
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator SkinID="ErreurPaysObligatoire" Display="Dynamic" ID="RequiredFieldValidator7"
                            runat="server" ErrorMessage="*" ValidationGroup="CompteCreation" ControlToValidate="cboCountry">
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Header">
                        <asp:Label ID="Label8" runat="server" Text="Téléphone" SkinID="CompteCreationAdresseTelephone" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtTelephone" runat="server" Columns="16" CssClass="TextBox" SkinID="CompteCreationAdresseAdresseTelephone"
                            AutoCompleteType="HomePhone"></asp:TextBox>
                        <asp:RequiredFieldValidator SkinID="ErreurTelephoneObligatoire" Display="Dynamic"
                            CssClass="ErrorMessage" ValidationGroup="CompteCreation" ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                            ControlToValidate="txtTelephone" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTelephone"
                            Display="Dynamic" SkinID="ErreurTelephoneInvalide" ErrorMessage="Format : XX XX XX XX XX"
                            CssClass="ErrorMessage" ValidationGroup="CompteCreation" ValidationExpression="(\d|\s)+"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="Header">
                        <asp:Label ID="Label9" runat="server" Text="Mobile" SkinID="CompteCreationAdresseMobile" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtMobile" runat="server" Columns="16" CssClass="TextBox" SkinID="CompteCreationAdresseAdresseMobile"
                            AutoCompleteType="HomePhone"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtMobile"
                            Display="Dynamic" SkinID="ErreurTelephoneInvalide" ErrorMessage="Format : XX XX XX XX XX"
                            CssClass="ErrorMessage" ValidationGroup="CompteCreation" ValidationExpression="(\d|\s)+"></asp:RegularExpressionValidator>
                    </td>
                </tr>

<%--                <tr>
                    <td class="Header">
                        <asp:Label ID="Label9" runat="server" Text="Mobile" SkinID="CompteCreationAdresseMobile" />
                    </td>
                    <td>
                        <asp:TextBox ID="txtMobile" runat="server" Columns="16" CssClass="TextBox" SkinID="CompteCreationAdresseMobile"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtMobile"
                            Display="Dynamic" SkinID="ErreurTelephoneInvalide" ErrorMessage="Format : XX XX XX XX XX"
                            CssClass="ErrorMessage" ValidationExpression="(\d|\s)+"></asp:RegularExpressionValidator>
                    </td>
                </tr>
--%>
            </asp:View>
        </asp:MultiView>
