<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.contact"
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>

<%@ OutputCache Location="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ContactHeader" />
    </div>
    <div id="ExecContent">
        <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="ContactContentHeader">
            <Content>
            </Content>
        </ecom:ThemablePanelControl>
        <asp:MultiView runat="server" ID="mviewContact">
            <asp:View ID="View1" runat="server">
                <asp:Panel CssClass="ContactForm contenuFormulaire" runat="server" ID="pnlContact" DefaultButton="btnValider">
                    <ecom:ThemablePanelControl ID="ThemablePanelControl5" runat="server" SkinID="ContactFormHeader">
                        <Content>
                        </Content>
                    </ecom:ThemablePanelControl>
                    <p class="ContactNom">
                        <label class="Entete">
                            <asp:Label ID="Label1" runat="server" SkinID="ContactFormNomLabel" Text="Votre nom : " /></label>
                        <asp:TextBox runat="server" ID="txtNom" SkinID="ContactFormNomInput" />
                        <span class="Error">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" SkinID="ErrorNomObligatoire"
                                ErrorMessage="Merci de nous préciser votre nom." Display="Dynamic" ControlToValidate="txtNom"></asp:RequiredFieldValidator></span>
<%--                        <ecom:JQueryValidationHighlighterExtender ID="JQueryValidationHighlighterExtender1"
                            runat="server" ControlToExtend="txtNom" CssClassIfValid="Valide" CssClassIfInvalid="EnErreur" />--%>
                    </p>
                    <p class="ContactEmail">
                        <label class="Entete">
                            <asp:Label ID="Label2" runat="server" SkinID="ContactFormEmailLabel" Text="Votre e-mail : " /></label>
                        <asp:TextBox runat="server" ID="txtEMail" SkinID="ContactFormEmailInput" />
                        <span class="Error">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" SkinID="ErrorNomObligatoire"
                                ErrorMessage="L'adresse e-mail est obligatoire pour pouvoir vous répondre." Display="Dynamic"
                                ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Display="Dynamic"
                                ErrorMessage="Veuillez vérifier votre e-mail" ControlToValidate="txtEMail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            <%--<ecom:JQueryValidationHighlighterExtender runat="server" ControlToExtend="txtEMail"
                                CssClassIfValid="Valide" CssClassIfInvalid="EnErreur" />--%>
                        </span>
                    </p>
                    <p class="ContactRaison" runat="server" id="ctlRaison">
                        <label class="Entete">
                            <asp:Label ID="Label3" runat="server" SkinID="ContactFormRaisonLabel" Text="Raison de votre demande : " /></label>
                        <asp:DropDownList runat="server" ID="cboRaison" SkinID="ContactFormRaisonInput">
                        </asp:DropDownList>
                    </p>
                    <p class="ContactNumCommande">
                        <label class="Entete">
                            <asp:Label ID="Label4" runat="server" SkinID="ContactFormNumCommandeLabel" Text="Votre n° de commande : " /></label>
                        <asp:TextBox runat="server" ID="txtNumCommande" SkinID="ContactFormNumCommandeInput"
                            AutoCompleteType="Email" />
                    </p>
                    <p class="ContactText">
                        <label class="Entete">
                            <asp:Label ID="Label5" runat="server" SkinID="ContactFormTexteLabel" Text="Votre demande : " /></label>
                        <asp:TextBox runat="server" ID="txtDetails" SkinID="ContactFormTexteInput" Rows="5"
                            AutoCompleteType="DisplayName" Columns="40" TextMode="MultiLine" />
                    </p>
                    <p class="ContactSubmit submit">
                        <asp:LinkButton ID="btnValider" SkinID="ContactFormSubmit" runat="server" CssClass="Valider"
                            Text="Envoyer" ImageUrl="images/standard/btnOk.gif" OnClick="Unnamed3_Click" />
                    </p>
                </asp:Panel>
                <asp:Panel runat="server" ID="pnlInstructions" CssClass="instructions">
                    <ecom:ThemablePanelControl ID="ThemablePanelControl6" runat="server" SkinID="ContactInstructions">
                        <Content>
                        </Content>
                    </ecom:ThemablePanelControl>
                </asp:Panel>

                <div class="finFormulaire">
                    <ecom:ThemablePanelControl ID="ThemablePanelControl7" runat="server" SkinID="FinFormulaireContact">
                        <Content>
                        </Content>
                    </ecom:ThemablePanelControl>
                </div>

            </asp:View>
            <asp:View ID="View2" runat="server">
                <div class="ContactForm">
                    <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="ContactOkMessage">
                        <Content>
                            <p class="MessageOk">
                                Votre message a bien été enregistré.</p>
                        </Content>
                    </ecom:ThemablePanelControl>
                </div>
            </asp:View>
        </asp:MultiView>
        <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ContactContentFooter">
            <Content>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
