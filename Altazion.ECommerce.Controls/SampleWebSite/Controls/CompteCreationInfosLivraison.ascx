<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CompteCreationInfosLivraison.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.CompteCreationInfosLivraison" %>
<div>
    <asp:updatepanel runat="server">
        <contenttemplate>
            <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="CompteCreationTypeLivraisonHeader" />
            <div id="CompteCreationTypeLivraison">
                <ecom:ThemablePanelControl runat="server" SkinID="CompteCreationTypeLivraisonTitle">
                    <Content>
                        <h2>
                            Votre livraison</h2>
                    </Content>
                </ecom:ThemablePanelControl>
                <ul>
                    <li>
                        <asp:RadioButton runat="server" ID="chkAdresseFacturation" GroupName="CompteCreationChoixLivraison"
                            Checked="true" Text="à mon adresse de facturation" AutoPostBack="true" OnCheckedChanged="chkAdresseFacturation_CheckedChanged" /></li>
                    <li>
                        <asp:RadioButton runat="server" ID="chkPointRelais" GroupName="CompteCreationChoixLivraison"
                            Checked="false" Text="dans le point relais suivant" AutoPostBack="true" OnCheckedChanged="chkPointRelais_CheckedChanged" /></li>
                    <li>
                        <asp:RadioButton runat="server" ID="chkAutreAdresse" GroupName="CompteCreationChoixLivraison"
                            Checked="false" Text="à une autre adresse" AutoPostBack="true" OnCheckedChanged="chkAutreAdresse_CheckedChanged" />
                    </li>
                </ul>
            </div>
            <asp:MultiView runat="server" ID="mvLivraison">
                <asp:View runat="server" ID="vwRelais">
                    <asp:TextBox runat="server" ID="txtCodePostal" Columns="7" />
                    <asp:DropDownList ID="cboPays" runat="server">
                        <asp:ListItem Text="FRANCE" Value="FRA" Selected="True" />
                    </asp:DropDownList>
                    &nbsp;
                    <ecom:MouseOverImageButton ID="btnRecheche" runat="server" SkinID="ChoixPointLivraisonCPSearch"
                        ImageUrl="~/images/standard/btnOk.gif" />
                </asp:View>
                <asp:View runat="server" ID="vwAdresse">
                    <div id="CompteCreationAdresseLivraison">
                        <ecom:ThemablePanelControl runat="server" SkinID="CompteCreationAdresseLivraisonHeader">
                            <Content>
                                <h2>
                                    Votre adresse de livraison</h2>
                            </Content>
                        </ecom:ThemablePanelControl>
                        <table>
                            <tr>
                                <td class="Header">
                                    Civilité
                                </td>
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
                                        Display="Dynamic" CssClass="ErrorMessage" ControlToValidate="cboSalutations"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="Header">
                                    Nom
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" Columns="30" CssClass="TextBox"></asp:TextBox>
                                    <asp:RequiredFieldValidator SkinID="ErreurNomObligatoire" ID="RequiredFieldValidator2"
                                        Display="Dynamic" CssClass="ErrorMessage" runat="server" ErrorMessage="*" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="Header">
                                    Prénom
                                </td>
                                <td>
                                    <asp:TextBox ID="txtFirstName" runat="server" Columns="30" CssClass="TextBox"></asp:TextBox>
                                    <asp:RequiredFieldValidator SkinID="ErreurPrenomObligatoire" ID="RequiredFieldValidator3"
                                        Display="Dynamic" CssClass="ErrorMessage" runat="server" ErrorMessage="*" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="Header">
                                    Adresse
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAddressLine1" runat="server" Columns="45" CssClass="TextBox"></asp:TextBox>
                                    <asp:RequiredFieldValidator SkinID="ErreurAdresseObligatoire" ID="RequiredFieldValidator4"
                                        Display="Dynamic" CssClass="ErrorMessage" runat="server" ErrorMessage="*" ControlToValidate="txtAddressLine1"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="Header">
                                    Complément d&#39;adresse
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAddressLine2" runat="server" Columns="45" CssClass="TextBox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="Header">
                                    Code Postal
                                </td>
                                <td>
                                    <asp:TextBox ID="txtZipCode" runat="server" Columns="10" CssClass="TextBox"></asp:TextBox>
                                    <asp:RequiredFieldValidator SkinID="ErreurCPObligatoire" ID="RequiredFieldValidator5"
                                        Display="Dynamic" CssClass="ErrorMessage" runat="server" ErrorMessage="*" ControlToValidate="txtZipCode"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="Header">
                                    Ville
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCity" runat="server" Columns="30" CssClass="TextBox"></asp:TextBox>
                                    <asp:RequiredFieldValidator SkinID="ErreurVilleObligatoire" ID="RequiredFieldValidator6"
                                        Display="Dynamic" CssClass="ErrorMessage" runat="server" ErrorMessage="*" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="Header">
                                    Pays
                                </td>
                                <td>
                                    <asp:DropDownList ID="cboCountry" runat="server">
                                        <asp:ListItem Text="France" Value="FRA" />
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator SkinID="ErreurPaysObligatoire" ID="RequiredFieldValidator7"
                                        Display="Dynamic" CssClass="ErrorMessage" runat="server" ErrorMessage="*" ControlToValidate="cboCountry">
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <asp:MultiView runat="server" ID="mvTelephone" ActiveViewIndex="0">
                                <asp:View runat="server" ID="vwTelephone">
                                    <tr>
                                        <td class="Header">
                                            <asp:Label ID="Label8" runat="server" Text="Téléphone" SkinID="CompteCreationAdresseTelephone" />
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTelephone" runat="server" Columns="16" CssClass="TextBox" SkinID="CompteCreationAdresseAdresseTelephone"
                                                AutoCompleteType="HomePhone"></asp:TextBox>
                                            <asp:RequiredFieldValidator SkinID="ErreurTelephoneObligatoire" Display="Dynamic"
                                                CssClass="ErrorMessage" ID="RequiredFieldValidator8" runat="server" ErrorMessage="*"
                                                ControlToValidate="txtTelephone" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtTelephone"
                                                Display="Dynamic" SkinID="ErreurTelephoneInvalide" ErrorMessage="Format : XX XX XX XX XX"
                                                CssClass="ErrorMessage" ValidationExpression="(\d|\s)+"></asp:RegularExpressionValidator>
                                        </td>
                                    </tr>
                                </asp:View>
                                <asp:View runat="server" ID="vwPasTelephone">
                                
                                </asp:View>
                            </asp:MultiView>
                            <asp:MultiView runat="server" ID="mvMobile" ActiveViewIndex="0">
                                <asp:View runat="server" ID="vwMobile">

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
                                                    </asp:View>
                                <asp:View runat="server" ID="vwPasMobile">
                                
                                </asp:View>
                            </asp:MultiView>

                </tr>

                        </table>
                    </div>
                </asp:View>
            </asp:MultiView>
            <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="CompteCreationTypeLivraisonFooter" />
        </contenttemplate>
    </asp:updatepanel>
</div>
