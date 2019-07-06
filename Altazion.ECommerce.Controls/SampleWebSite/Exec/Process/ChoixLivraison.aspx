<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChoixLivraison.aspx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.Process.ChoixLivraison" MasterPageFile="~/Masters/DefaultTheme.Master"
    MaintainScrollPositionOnPostback="true" %>

<%@ OutputCache Location="None" %>
<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="server">
    <div id="Step1ProcessHeader">
    </div>
    <div id="ExecContent">
        <div id="ChoixLivraison">
            <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ChoixAdresseHeader">
                <Content>
                    <h1 class="TypeAdresseFacturation">
                        <span>Choisissez une adresse</span></h1>
                </Content>
            </ecom:ThemablePanelControl>
            <div class="SelectionAdresse">
                <ecom:CarnetAdressesLivraisonRepeater ID="CarnetAdressesFacturationRepeater" runat="server"
                    SkinID="CarnetAdressesFacturation"
                    DataSourceID="AdressesFactSource" OnItemCommand="CarnetAdressesFacturationRepeater_ItemCommand">
                    <ItemTemplate>
                        <div class="Adresse">
                            <table>
                                <tr>
                                    <td class="Nom">
                                        <asp:label id="Label5" runat="server" text='<%#Eval("adr_civil")%>' />
                                        <asp:label id="Label1" runat="server" text='<%#Eval("adr_nom")%>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Adresse">
                                        <asp:label id="Label2" runat="server" text='<%#Eval("adr_adresse")%>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Ville">
                                        <asp:label id="Label3" runat="server" text='<%#Eval("adr_cp")%>' />
                                        <asp:label id="Label4" runat="server" text='<%#Eval("adr_ville")%>' />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="Choix">
                                        <asp:linkbutton runat="server" text="Modifier" commandname="Modifier" CssClass="modifier" commandargument='<%#Eval("adr_guid")%>' />
                                        <asp:linkbutton runat="server" text="Choisir cette adresse" CssClass="choisir" typeadresse='<%#TypeAdresse%>'
                                            commandname="Choix" commandargument='<%#Eval("adr_guid")%>' />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </ecom:CarnetAdressesLivraisonRepeater>
                <ecom:AdressesDataSourceControl runat="server" ID="AdressesFactSource" OnSelecting="AdresseSource_Selecting">
                    <Parameters>
                        <asp:parameter name="AfficherAdressesLivraison" type="Boolean" defaultvalue="true" />
                        <asp:parameter name="AfficherAdressesFacturation" type="Boolean" defaultvalue="true" />
                        <asp:QueryStringParameter Name="CodePays" Type="string" defaultvalue=""  QueryStringField="CodePays" />
                    </Parameters>
                </ecom:AdressesDataSourceControl>
                <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ChoixAdresseFooter">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </div>
            <div class="NouvelleAdresse">
                <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="ChoixAdresseNouvelleHeader">
                    <Content>
                        <h2>
                            ajoutez une nouvelle adresse</h2>
                    </Content>
                </ecom:ThemablePanelControl>
                <table>
                    <tr>
                        <td class="Entete">
                            Civilité :
                        </td>
                        <td>
                            <asp:dropdownlist id="cboSalutations" runat="server">
                                <asp:listitem>M.</asp:listitem>
                                <asp:listitem>Mlle.</asp:listitem>
                                <asp:listitem>Mme.</asp:listitem>
                                <asp:listitem>---</asp:listitem>
                                <asp:listitem>Association</asp:listitem>
                                <asp:listitem>SARL</asp:listitem>
                                <asp:listitem>SA</asp:listitem>
                                <asp:listitem>EURL</asp:listitem>
                            </asp:dropdownlist>
                        </td>
                        <td>
                            <asp:requiredfieldvalidator id="RequiredFieldValidator1" runat="server" validationgroup="Creation"
                                errormessage="*" controltovalidate="cboSalutations">
                            </asp:requiredfieldvalidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Nom :
                        </td>
                        <td>
                            <asp:textbox id="txtName" runat="server" columns="30" cssclass="TextBox">
                            </asp:textbox>
                        </td>
                        <td>
                            <asp:requiredfieldvalidator id="RequiredFieldValidator2" runat="server" validationgroup="Creation"
                                errormessage="*" controltovalidate="txtName">
                            </asp:requiredfieldvalidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Prénom :
                        </td>
                        <td>
                            <asp:textbox id="txtFirstName" runat="server" cssclass="TextBox" columns="30" validationgroup="Creation">
                            </asp:textbox>
                        </td>
                        <td>
                            <asp:requiredfieldvalidator id="RequiredFieldValidator3" runat="server" validationgroup="Creation"
                                errormessage="*" controltovalidate="txtFirstName">
                            </asp:requiredfieldvalidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Adresse :
                        </td>
                        <td>
                            <asp:textbox id="txtAddressLine1" runat="server" cssclass="TextBox" columns="45"
                                validationgroup="Creation">
                            </asp:textbox>
                        </td>
                        <td>
                            <asp:requiredfieldvalidator id="RequiredFieldValidator4" runat="server" validationgroup="Creation"
                                errormessage="*" controltovalidate="txtAddressLine1">
                            </asp:requiredfieldvalidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Complément d&#39;adresse :
                        </td>
                        <td>
                            <asp:textbox id="txtAddressLine2" runat="server" cssclass="TextBox" columns="45"
                                validationgroup="Creation">
                            </asp:textbox>
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
                            <asp:textbox id="txtZipCode" runat="server" cssclass="TextBox" columns="10" validationgroup="Creation">
                            </asp:textbox>
                        </td>
                        <td>
                            <asp:requiredfieldvalidator id="RequiredFieldValidator5" display="Dynamic" runat="server"
                                validationgroup="Creation" errormessage="*" controltovalidate="txtZipCode">
                            </asp:requiredfieldvalidator>
                            <asp:regularexpressionvalidator id="RegularExpressionValidator2" runat="server" controltovalidate="txtZipCode"
                                display="Dynamic" skinid="ErreurCPInvalide" validationgroup="Creation" errormessage="Erreur"
                                validationexpression="\d{5}">
                            </asp:regularexpressionvalidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Ville :
                        </td>
                        <td>
                            <asp:textbox id="txtCity" runat="server" cssclass="TextBox" columns="30" validationgroup="Creation">
                            </asp:textbox>
                        </td>
                        <td>
                            <asp:requiredfieldvalidator id="RequiredFieldValidator6" runat="server" validationgroup="Creation"
                                errormessage="*" controltovalidate="txtCity">
                            </asp:requiredfieldvalidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Pays :
                        </td>
                        <td>
                            <asp:dropdownlist id="cboCountry" runat="server" validationgroup="Creation">
                                <asp:listitem text="France" value="FRA" />
                            </asp:dropdownlist>
                        </td>
                        <td>
                            <asp:requiredfieldvalidator id="RequiredFieldValidator7" runat="server" validationgroup="Creation"
                                errormessage="*" controltovalidate="cboCountry">
                            </asp:requiredfieldvalidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="Entete">
                            Téléphone:
                        </td>
                        <td>
                            <asp:textbox id="txtPhoneNumber" runat="server" columns="30" validationgroup="Creation">
                            </asp:textbox>
                        </td>
                        <td>
                            <asp:requiredfieldvalidator id="RequiredFieldValidator8" runat="server" validationgroup="Creation"
                                display="Dynamic" errormessage="*" controltovalidate="txtPhoneNumber">
                            </asp:requiredfieldvalidator>
                            <asp:regularexpressionvalidator id="RegularExpressionValidator3" runat="server" controltovalidate="txtPhoneNumber"
                                display="Dynamic" errormessage="Format : 00 00 00 00 00" validationexpression="(0( \d|\d ))?\d\d \d\d(\d \d| \d\d )\d\d"
                                validationgroup="Creation">
                            </asp:regularexpressionvalidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <ecom:AdresseCreationLink ID="AdresseCreationLink1" runat="server" Text="Enregistrer"
                                CssClass="Creer" PhoneTextBox="txtPhoneNumber" ValidationGroup="Creation" AddressLine1TextBox="txtAddressLine1"
                                AddressLine2TextBox="txtAddressLine2" CityTextBox="txtCity" CountryCombo="cboCountry"
                                FirstNameTextBox="txtFirstName" NameTextBox="txtName" SalutationCombo="cboSalutations"
                                ZipCodeTextBox="txtZipCode" OnAdresseCreee="AdresseCreation_AdresseCreee" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                <ecom:ThemablePanelControl ID="ThemablePanelControl5" runat="server" SkinID="ChoixAdresseNouvelleFooter" />
            </div>
        </div>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="ExecFooter" />
    </div>
</asp:content>
