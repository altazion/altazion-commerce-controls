<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModificationAdresse.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Clients.ModificationAdresse"
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="pnlHeaderMy" runat="server" SkinID="ClientsAllPagesHeader" />
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ClientsAdressesModificationHeader">
            <Content> 
                <h1>
                    Votre adresse</h1>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div id="ExecContent">
        <div id="ModificationAdresse">
            <div class="blocForm">
                <div class="blocFormContent">
                                <ecom:CarnetAdressesLivraisonRepeater ID="rptCarnetAdressesFacturation" runat="server"
                    SkinID="CarnetAdressesFacturation" DataSourceID="AdressesFactSource" >
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
                                    <asp:Panel ID="Panel2" runat="server" Visible='<%# ! (bool)Eval("adr_par_defaut")%>'>
                                        <table width="100%">
                                            <tr>
                                                <td>
                                                    <asp:LinkButton ID="AdresseChoisirLink1" SkinID="AdresseDefinirParDefautButton" CssClass="adefaut"
                                                        runat="server" CommandName="ParDefaut" CommandArgument='<%# Eval("adr_guid")%>' 
                                                        ><span>Définir par défaut</span></asp:LinkButton>
                                                </td>
                                                    <td class="AutresCommandes">
                                                    </td>
                                                
                                            </tr>
                                        </table>
                                    </asp:Panel>
                                </td>
                            </tr>
                        </table>
                        </div>
                    </ItemTemplate>
                </ecom:CarnetAdressesLivraisonRepeater>
                <ecom:AdressesDataSourceControl runat="server" ID="AdressesFactSource" 
                                    onselected="AdressesFactSource_Selected">
                    <Parameters>
                        <asp:Parameter Name="AfficherAdressesLivraison" Type="Boolean" DefaultValue="true" />
                        <asp:Parameter Name="AfficherAdressesFacturation" Type="Boolean" DefaultValue="true" />
                        <asp:QueryStringParameter Name="AdresseGuid" Type="String" QueryStringField="AdresseGuid" />
                    </Parameters>
                </ecom:AdressesDataSourceControl>
                </div>

                <asp:UpdatePanel runat="server" ID="pnlSaisie"><ContentTemplate>
                <asp:Panel runat="server" ID="pnlModifierActive" Visible="false">
                Cette adresse est utilisée dans une ou plusieurs de vos commandes en cours de traitement. Celles-ci ne seront
                pas impactée par votre modification, qui ne sera prise en compte que pour les prochaines commandes
                
                <%-- Pour autoriser le changement d'adresse PENDANT la préparation d'une commande : 
                     mettre ce controle visible (et changer le texte ci dessus). Attention, il n'y 
                     aura aucun test pour vérifier que les conditions de livraisons sont toujours valides.
                 --%>
                <asp:CheckBox ID="chkModifierActive" runat="server" ValidationGroup="Creation"  Visible="false"
                                Text="Modifier cette adresse pour mes commandes en cours" 
                        AutoPostBack="true" oncheckedchanged="chkModifierActive_CheckedChanged" />
                </asp:Panel> 

                <%-- 
                     Ce lien permet de pointer sur l'espace "commandes" et éventuellement corriger l'adresse de
                     livraison depuis cet espace.
                --%>
                <asp:HyperLink runat="server" ID="lnkModifierActive" NavigateUrl="~/my/commandes.htm" Visible="false" />

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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" Display="Dynamic" runat="server" ValidationGroup="Creation"
                                ErrorMessage="*" ControlToValidate="txtZipCode"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                            ControlToValidate="txtZipCode" Display="Dynamic" SkinId="ErreurCPInvalide"  ValidationGroup="Creation"
                            ErrorMessage="Erreur" ValidationExpression="\d{5}"></asp:RegularExpressionValidator>
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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ValidationGroup="Creation" Display="Dynamic"
                                ErrorMessage="*" ControlToValidate="txtPhoneNumber"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                ControlToValidate="txtPhoneNumber" Display="Dynamic" 
                                ErrorMessage="Format : 00 00 00 00 00" 
                                ValidationExpression="(0( \d|\d ))?\d\d \d\d(\d \d| \d\d )\d\d" 
                                ValidationGroup="Creation"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td colspan="2">
                            <%--
                                laisser ce controle dans la page, même si il est invisible : il sert à "initialiser"
                                les données de la nouvelle adresse
                            --%>
                            <asp:CheckBox ID="chkAdresseFacturation" runat="server" ValidationGroup="Creation" Visible="false"
                                Text="Ceci est une adresse de facturation" />
                        </td>
                    </tr>
                    
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <ecom:AdresseCreationLink CssClass="btok2" ID="AdresseCreationLink1" 
                                runat="server" Text="Enregistrer"
                                ValidationGroup="Creation" AddressLine1TextBox="txtAddressLine1" AddressLine2TextBox="txtAddressLine2"
                                CityTextBox="txtCity" CountryCombo="cboCountry" FirstNameTextBox="txtFirstName"
                                NameTextBox="txtName" SalutationCombo="cboSalutations" 
                                ZipCodeTextBox="txtZipCode" PhoneTextBox="txtPhoneNumber"
                                EstFacturationCheckBox="chkAdresseFacturation" 
                                onadresseencreation="AdresseCreationLink1_AdresseEnCreation"
                                onadressecreee="AdresseCreationLink1_AdresseCreee" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                </ContentTemplate></asp:UpdatePanel>
            </div>
        </div>
    </div>
</asp:Content>
