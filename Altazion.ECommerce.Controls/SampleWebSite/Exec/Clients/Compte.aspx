<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Compte.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Clients.Compte"
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="pnlHeaderMy" runat="server" SkinID="ClientsAllPagesHeader" />

        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ClientsCompteHeader" />
    </div>
    <div id="ExecContent">
        <div id="ClientCompteContent">
            <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ClientsCompteContentHeader" />
            <asp:UpdatePanel runat="server" ID="updEmail">
                <ContentTemplate>
                    <asp:MultiView runat="server" ID="mvGlobal">
                        <asp:View runat="server" ID="vwDebut">
                            <asp:Panel runat="server" ID="pnlMaj" DefaultButton="btnChangerMotPasse">
                                <ecom:ThemablePanelControl ID="ThemablePanelControl12" runat="server" SkinID="ClientsFormulaireHeader" />
                                <div id="CompteAdresseEmail">
                                    <ecom:ThemablePanelControl runat="server" SkinID="CompteAdresseEmailHeader" class="EnteteLigne" />
                                    <asp:MultiView ID="mvEmail" runat="server">
                                        <asp:View runat="server" ID="vwEmailNonModifie">
                                            <ecom:ThemablePanelControl ID="ThemablePanelControl5" runat="server" SkinID="ClientsCompteContentEMailNonModifieHeader" />
                                            <p class="LigneEMail">
                                                <asp:Label CssClass="Entete" SkinID="CompteAdresseEmailLabel" runat="server" Text="Votre e-mail : " />
                                                <asp:Label runat="server" ID="txtEMail" />
                                                <asp:LinkButton runat="server" ID="lnkChangerEmail" SkinID="ClientsCompteContentEMailModifierLink"
                                                    OnClick="lnkChangerEmail_Click" CausesValidation="false">modifier</asp:LinkButton>
                                            </p>
                                            <ecom:ThemablePanelControl ID="ThemablePanelControl6" runat="server" SkinID="ClientsCompteContentEMailNonModifieFooter" />
                                        </asp:View>
                                        <asp:View runat="server" ID="vwEmailModifie">
                                            <ecom:ThemablePanelControl ID="ThemablePanelControl7" runat="server" SkinID="ClientsCompteContentEMailModifieHeader" />
                                            &nbsp;<p class="LigneEMail">
                                                <asp:Label ID="Label4" CssClass="Entete" SkinID="CompteAdresseEmailLabel" runat="server"
                                                    Text="Votre e-mail actuel : " />
                                                <asp:Label runat="server" ID="txtEMail2" />
                                            </p>
                                            <ecom:ThemablePanelControl ID="ThemablePanelControl9" runat="server" SkinID="ClientsCompteContentEMailModifieCenter" />
                                            <p class="LigneEMailNouveau">
                                                <asp:Label ID="Label6" CssClass="Entete" SkinID="CompteAdresseNouvelEmailLabel" runat="server"
                                                    Text="Votre e-mail : " />
                                                <asp:TextBox runat="server" ID="txtNewEmail" AutoCompleteType="Email" CssClass="TextBox" />
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewEmail"
                                                    Display="Static" ErrorMessage="</br> Veuillez saisir votre nouvel e-mail" />
                                            </p>
                                            <ecom:ThemablePanelControl ID="ThemablePanelControl8" runat="server" SkinID="ClientsCompteContentEMailModifieFooter" />
                                        </asp:View>
                                    </asp:MultiView>
                                    <ecom:ThemablePanelControl runat="server" SkinID="CompteAdresseEmailFooter" />
                                </div>
                                <div id="CompteMotDePasse">
                                    <ecom:ThemablePanelControl runat="server" SkinID="CompteMotDePasseHeader" />
                                    <p class="LigneAncienMotPasse">
                                        <asp:Label CssClass="Entete" ID="Label1" SkinID="CompteMotDePasseAncienLabel" runat="server"
                                            Text="Mot de passe actuel : " class="EnteteLigne" />
                                        <asp:TextBox runat="server" ID="txtOldPassword" TextMode="Password" CssClass="TextBox" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPassword"
                                            Display="Static" ErrorMessage="</br> Veuillez saisir votre mot de passe actuel" />
                                        <asp:Label runat="server" ID="lblMsgErreur" Visible="false" ForeColor="Red" />
                                    </p>
                                    <asp:MultiView runat="server" ID="mvNouveauxMotDePasse" ActiveViewIndex="0" >
                                    <asp:View runat="server" ID="vwSaisiePwd">
                                    <p class="LigneNouveauMotPasse">
                                        <asp:Label CssClass="Entete" ID="Label2" SkinID="CompteMotDePasseNouveauLabel" runat="server"
                                            Text="Nouveau mot de passe : " class="EnteteLigne" />
                                        <asp:TextBox runat="server" ID="txtNewPassword" PlaceHolder="Votre nouveau mot de passe" TextMode="Password" CssClass="TextBox" />
                                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNewPassword" Display="Static"
                                            ErrorMessage="</br> Veuillez saisir votre nouveau mot de passe" />
                                    </p>
                                    <p class="LigneConfirmationMotPasse">
                                        <asp:Label CssClass="Entete" ID="Label3" SkinID="CompteMotDePasseConfirmerLabel"
                                            runat="server" Text="Confirmer votre mot de passe : " class="EnteteLigne" />
                                        <asp:TextBox runat="server" ID="TextBox2" PlaceHolder="Confirmez votre mot de passe" TextMode="Password" CssClass="TextBox" />
                                        <asp:CompareValidator runat="server" ControlToCompare="TextBox2" ControlToValidate="txtNewPassword"
                                            Display="Static" ErrorMessage="<br />Les mots de passe ne correspondent pas" />
                                    </p>
                                    </asp:View>
                                    <asp:View runat="server" ID="vwSansSaisiePwd">
                                    
                                    </asp:View>
                                    </asp:MultiView>
                                </div>
                                <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="CompteMotDePasseFooter" />
                                <p class="LigneBoutonModifierMotPasse">
                                    <asp:LinkButton runat="server" SkinID="CompteMotDePasseChange" Text="Enregistrer"
                                        ID="btnChangerMotPasse" OnClick="btnChangerMotPasse_Click" />
                                </p>
                                <ecom:ThemablePanelControl ID="ThemablePanelControl11" runat="server" SkinID="CompteFormulaireFooter" />
                            </asp:Panel>
                        </asp:View>
                        <asp:View runat="server" ID="vwFin">
                            <ecom:ThemablePanelControl ID="ThemablePanelControl10" runat="server" SkinID="ClientsCompteModificationEffectuee">
                                <Content>
                                    Modification effectuée.
                                </Content>
                            </ecom:ThemablePanelControl>
                        </asp:View>
                    </asp:MultiView>
                    <ecom:ThemablePanelControl SkinID="CompteContentFooter" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <ecom:ThemablePanelControl ID="ThemablePanelControl13" runat="server" SkinID="ClientsCompteContentFooter" />
        </div>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>
