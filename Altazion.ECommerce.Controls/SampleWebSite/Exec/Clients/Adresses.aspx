<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adresses.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Clients.Adresses"
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="pnlHeaderMy" runat="server" SkinID="ClientsAllPagesHeader" />
        <ecom:ThemablePanelControl runat="server" SkinID="ClientsAdressesHeader">
            <Content>
              
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div id="ExecContent">
        <ecom:ThemablePanelControl runat="server" SkinID="ClientsAdressesContentHeader" />
        <div id="CarnetAdresse">
            <div class="Facturation">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanel1" SkinID="CarnetAdressesFacturationHeader">
                    <Content>
                        <h1>
                            Vos adresses de facturation</h1>
                    </Content>
                </ecom:ThemablePanelControl>
                <ecom:CarnetAdressesFacturationRepeater ID="rptCarnetAdressesFacturation" runat="server"
                    SkinID="CarnetAdressesFacturation" DataSourceID="AdressesFactSource" OnItemCommand="rptCarnetAdressesFacturation_ItemCommand">
                    <ItemTemplate>
                        <table class="Adresse">
                            <tr>
                                <td class="Nom">
                                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("adr_civil")%>' />
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("adr_nom")%>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="Adresse">
                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("adr_adresse")%>' />
                                </td>
                            </tr>
                            <tr>
                                <td class="Ville">
                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("adr_cp")%>' />
                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("adr_ville")%>' />
                                </td>
                            </tr>
                            <tr>
                                
                                <td class="Choix">
                                    <ecom:AdresseModificationLink ID="AdresseModificationLink" CommandName="Modifier"
                                        CssClass="modif" AdresseGuid='<%#Eval("adr_guid")%>' runat="server"><span>Modifier</span>
                                    </ecom:AdresseModificationLink>
                                    <asp:Panel ID="Panel2" runat="server" Visible='<%# ! (bool)Eval("adr_par_defaut")%>'>
                                        <table width="100%">
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="AdresseChoisirLink1" SkinID="AdresseDefinirParDefautButton" CssClass="adefaut"
                                                        runat="server" CommandName="ParDefaut" CommandArgument='<%# Eval("adr_guid")%>'><span>Définir par défaut</span></asp:LinkButton>
                                                </td>
                                                <td class="AutresCommandes">
                                                    <ecom:AdresseSuppressionLink ID="AdresseSuppressionLink" CommandName="Supprimer"
                                                        CssClass="asuppr" AdresseGuid='<%#Eval("adr_guid")%>' runat="server"><span>Supprimer</span>
                                                    </ecom:AdresseSuppressionLink>
                                                </td>
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                        </div>
                    </ItemTemplate>
                </ecom:CarnetAdressesFacturationRepeater>
                <ecom:AdressesDataSourceControl runat="server" ID="AdressesFactSource">
                    <Parameters>
                        <asp:Parameter Name="AfficherAdressesLivraison" Type="Boolean" DefaultValue="false" />
                        <asp:Parameter Name="AfficherAdressesFacturation" Type="Boolean" DefaultValue="true" />
                    </Parameters>
                </ecom:AdressesDataSourceControl>
            </div>
            <div class="Livraison">
                <ecom:ThemablePanelControl runat="server" SkinID="CarnetAdressesLivraisonHeader">
                    <Content>
                        <h1>
                            Vos adresses de livraison</h1>
                    </Content>
                </ecom:ThemablePanelControl>
                <ecom:CarnetAdressesLivraisonRepeater runat="server" SkinID="CarnetAdressesLivraison"
                    ID="rptCarnetAdressesLivraison" OnItemCommand="rptCarnetAdressesLivraison_ItemCommand"
                    DataSourceID="AdressesLivSource">
                    <ItemTemplate>
                        <div class="Adresse">
                            <table class="Adresse">
                                <tr>
                                    <td class="Nom">
                                        <asp:Label ID="Label5" runat="server" Text='<%#Eval("adr_civil")%>' />
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("adr_nom")%>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Adresse">
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("adr_adresse")%>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Ville">
                                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("adr_cp")%>' />
                                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("adr_ville")%>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Choix">
                                        <ecom:AdresseModificationLink ID="AdresseModificationLink" CommandName="Modifier"
                                            CssClass="modif" AdresseGuid='<%#Eval("adr_guid")%>' runat="server"><span>Modifier</span>
                                        </ecom:AdresseModificationLink>
                                        <asp:Panel ID="Panel1" runat="server" Visible='<%# ! (bool)Eval("adr_par_defaut")%>'>
                                            <table width="100%">
                                                <tr>
                                                    <td>
                                                        <asp:LinkButton ID="AdresseChoisirLink1" SkinID="AdresseDefinirParDefautButton" CssClass="adefaut"
                                                            runat="server" CommandName="ParDefaut" CommandArgument='<%# Eval("adr_guid")%>'>
								<span>Définir par défaut</span></asp:LinkButton>
                                                    </td>
                                                    <td class="AutresCommandes">
                                                        <ecom:AdresseSuppressionLink ID="AdresseSuppressionLink" CommandName="Supprimer"
                                                            CssClass="asuppr" AdresseGuid='<%#Eval("adr_guid")%>' runat="server">
							<span>Supprimer</span>
                                                        </ecom:AdresseSuppressionLink>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                    </ItemTemplate>
                </ecom:CarnetAdressesLivraisonRepeater>
                <ecom:AdressesDataSourceControl runat="server" ID="AdressesLivSource">
                    <Parameters>
                        <asp:Parameter Name="AfficherAdressesLivraison" Type="Boolean" DefaultValue="true" />
                        <asp:Parameter Name="AfficherAdressesFacturation" Type="Boolean" DefaultValue="false" />
                    </Parameters>
                </ecom:AdressesDataSourceControl>
                <ecom:ThemablePanelControl runat="server" SkinID="CarnetAdressesLivraisonFooter" />

            </div>
            <div class="NouvelleAdresse">
                <ecom:ThemablePanelControl runat="server" SkinID="CarnetAdressesNouvelleHeader">
                    <Content>
                        <div class="NouvelleAdresseHeader">
                            <h5>
                                Ajouter une adresse</h5>
                        </div>
                    </Content>
                </ecom:ThemablePanelControl>
                <table>
                    <tr>
                        <td class="Entete">
                            Civilité :
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
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="Creation"
                                ErrorMessage="*" ControlToValidate="cboSalutations"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Nom :
                        </td>
                        <td>
                            <asp:TextBox ID="txtName" runat="server" Columns="30"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ValidationGroup="Creation"
                                ErrorMessage="*" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Prénom :
                        </td>
                        <td>
                            <asp:TextBox ID="txtFirstName" runat="server" Columns="30" ValidationGroup="Creation"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ValidationGroup="Creation"
                                ErrorMessage="*" ControlToValidate="txtFirstName"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Adresse :
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddressLine1" runat="server" Columns="45" ValidationGroup="Creation"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="Creation"
                                ErrorMessage="*" ControlToValidate="txtAddressLine1"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Complément d&#39;adresse :
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddressLine2" runat="server" Columns="45" ValidationGroup="Creation"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Code Postal :
                        </td>
                        <td>
                            <asp:TextBox ID="txtZipCode" runat="server" Columns="10" ValidationGroup="Creation"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" runat="server"
                                ValidationGroup="Creation" ErrorMessage="*" ControlToValidate="txtZipCode"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtZipCode"
                                Display="Dynamic" SkinID="ErreurCPInvalide" ValidationGroup="Creation" ErrorMessage="Erreur"
                                ValidationExpression="\d{5}"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Ville:
                        </td>
                        <td>
                            <asp:TextBox ID="txtCity" runat="server" Columns="30" ValidationGroup="Creation"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="Creation"
                                ErrorMessage="*" ControlToValidate="txtCity"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Pays :
                        </td>
                        <td>
                            <asp:DropDownList ID="cboCountry" runat="server" ValidationGroup="Creation">
                                <asp:ListItem Text="France" Value="FRA" />
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ValidationGroup="Creation"
                                ErrorMessage="*" ControlToValidate="cboCountry">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Téléphone:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPhoneNumber" runat="server" Columns="30" ValidationGroup="Creation"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="Creation"
                                Display="Dynamic" ErrorMessage="*" ControlToValidate="txtPhoneNumber"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtPhoneNumber"
                                Display="Dynamic" ErrorMessage="Format : 00 00 00 00 00" ValidationExpression="(0( \d|\d ))?\d\d \d\d(\d \d| \d\d )\d\d"
                                ValidationGroup="Creation"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td colspan="2">
                            <asp:CheckBox ID="chkAdresseFacturation" runat="server" ValidationGroup="Creation"
                            Checked="true"
                                Text="Ceci est une adresse de facturation" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <ecom:AdresseCreationLink CssClass="btok2" ID="AdresseCreationLink1" runat="server"
                                Text="Enregistrer" ValidationGroup="Creation" AddressLine1TextBox="txtAddressLine1"
                                AddressLine2TextBox="txtAddressLine2" CityTextBox="txtCity" CountryCombo="cboCountry"
                                FirstNameTextBox="txtFirstName" NameTextBox="txtName" SalutationCombo="cboSalutations"
                                ZipCodeTextBox="txtZipCode" PhoneTextBox="txtPhoneNumber" EstFacturationCheckBox="chkAdresseFacturation"
                                OnAdresseCreee="AdresseCreation_AdresseCreee" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <ecom:ThemablePanelControl runat="server" SkinID="ClientsAdressesContentFooter" />
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
