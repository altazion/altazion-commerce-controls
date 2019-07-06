<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true" CodeBehind="ChoixAdresseLivraison.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Process.ChoixAdresseLivraison" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

                <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ChoixAdresseHeader">
                <Content>
                    <h1 class="TypeAdresseLivraison">
                        Choisissez votre adresse</h1>
                </Content>
            </ecom:ThemablePanelControl>


    <asp:Panel runat="server" ID="pnlFacturation">
                <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="ChoixAdresseUtiliserFacturationHeader">
                <Content>
    
                Si vous souhaitez vous faire livrer à votre adresse principale : 
                    
                </Content>
            </ecom:ThemablePanelControl>

<asp:DataList runat="server" ID="ListeAdresses" DataSourceID="AdressesSourceF" OnItemCommand="AdressesList_ItemCommand" >
    <ItemTemplate>
<table>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("adr_civil") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Eval("adr_nom") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("adr_adresse") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("adr_cp") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("adr_ville") %>'></asp:Label>
                </td>
            </tr>
                        <tr>
                            <td class="Choix" colspan="2">
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="Choisir cette adresse"
                                    CommandName="Choix" CommandArgument='<%#Eval("adr_guid")%>' />
                            </td>
                        </tr>
        </table>
    </ItemTemplate>

</asp:DataList>
<ecom:AdressesDataSourceControl runat="server" ID="AdressesSourceF" 
    >
    <Parameters>
        <asp:Parameter Name="AfficherAdressesFacturation" DefaultValue="true" />
        <asp:Parameter Name="AfficherAdressesLivraison" DefaultValue="false" />
        <asp:Parameter Name="UniquementParDefaut" DefaultValue="true" />
    </Parameters>
</ecom:AdressesDataSourceControl>




                <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ChoixAdresseUtiliserFacturationFooter">
                <Content>
    
        
                </Content>
            </ecom:ThemablePanelControl>

    </asp:Panel>


    <asp:Panel runat="server" ID="pnlChoixLivraison">
                <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="ChoixAdresseUtiliserDerniereLivraisonHeader">
                <Content>
    
                Si vous préférez vous faire livrer à votre dernière adresse de livraison :
        
                </Content>
            </ecom:ThemablePanelControl>

<asp:DataList runat="server" ID="DataList1" DataSourceID="AdressesSourceL" OnItemCommand="AdressesList_ItemCommand">
    <ItemTemplate>
<table>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label6" runat="server" Text='<%# Eval("adr_civil") %>'></asp:Label>
                    &nbsp;<asp:Label ID="Label1" runat="server" Text='<%# Eval("adr_nom") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("adr_adresse") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label4" runat="server" Text='<%# Eval("adr_cp") %>'></asp:Label>
                </td>
                <td>
                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("adr_ville") %>'></asp:Label>
                </td>
            </tr>
                        <tr>
                            <td class="Choix" colspan="2">
                                <asp:LinkButton ID="LinkButton2" runat="server" Text="Choisir cette adresse" 
                                    CommandName="Choix" CommandArgument='<%#Eval("adr_guid")%>' />
                            </td>
                        </tr>
        </table>
    </ItemTemplate>

</asp:DataList>
<ecom:AdressesDataSourceControl runat="server" ID="AdressesSourceL" onselected="AdressesSourceL_Selected" 
    >
    <Parameters>
        <asp:Parameter Name="AfficherAdressesFacturation" DefaultValue="false" />
        <asp:Parameter Name="AfficherAdressesLivraison" DefaultValue="true" />
        <asp:Parameter Name="UniquementParDefaut" DefaultValue="true" />
    </Parameters>
</ecom:AdressesDataSourceControl>

                <ecom:ThemablePanelControl ID="ThemablePanelControl5" runat="server" SkinID="ChoixAdresseUtiliserDerniereLivraisonFooter">
                <Content>
    
        
                </Content>
            </ecom:ThemablePanelControl>

    </asp:Panel>


                <asp:Panel runat="server" ID="pnlNouvelle" class="NouvelleAdresse">
                <ecom:ThemablePanelControl ID="ThemablePanelControl6" runat="server" SkinID="ChoixAdresseNouvelleHeader">
                    <Content>
                        <p>
                            Ou saissez une nouvelle adresse</p>
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
                            <asp:TextBox ID="txtName" runat="server" Columns="30" CssClass="TextBox"></asp:TextBox>
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
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="TextBox" Columns="30" ValidationGroup="Creation"></asp:TextBox>
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
                            <asp:TextBox ID="txtAddressLine1" runat="server" CssClass="TextBox" Columns="45" ValidationGroup="Creation"></asp:TextBox>
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
                            <asp:TextBox ID="txtAddressLine2" runat="server" CssClass="TextBox" Columns="45" ValidationGroup="Creation"></asp:TextBox>
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
                            <asp:TextBox ID="txtZipCode" runat="server" CssClass="TextBox" Columns="10" ValidationGroup="Creation"></asp:TextBox>
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
                            Ville :
                        </td>
                        <td>
                            <asp:TextBox ID="txtCity" runat="server" CssClass="TextBox" Columns="30" ValidationGroup="Creation"></asp:TextBox>
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
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <ecom:AdresseCreationLink ID="AdresseCreationLink1" runat="server" Text="Enregistrer"
                                CssClass="Creer"
                                ValidationGroup="Creation" AddressLine1TextBox="txtAddressLine1" AddressLine2TextBox="txtAddressLine2"
                                CityTextBox="txtCity" CountryCombo="cboCountry" FirstNameTextBox="txtFirstName"
                                NameTextBox="txtName" SalutationCombo="cboSalutations" ZipCodeTextBox="txtZipCode"
                                OnAdresseCreee="AdresseCreation_AdresseCreee" />
                        </td>
                        <td>
                            &nbsp;
                        </td>
                    </tr>
                </table>
                
                <ecom:ThemablePanelControl ID="ThemablePanelControl7" runat="server" SkinID="ChoixAdresseNouvelleFooter" />
            </asp:Panel>


</asp:Content>
