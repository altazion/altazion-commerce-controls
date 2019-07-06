<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProduitMailDisponibilite.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.ProduitMailDisponibilite" %>
<asp:UpdatePanel runat="server" ID="upMailDispo">
    <ContentTemplate>
        <asp:MultiView runat="server" ID="mvMailDispo" ActiveViewIndex="0">
            <asp:View runat="server" ID="vwFerme">
                <%// cette vue correspond à la version "fermée" du formulaire %>
                <%// avec un header personnalisable %>
                <ecom:ThemablePanelControl ID="ThemablePanelControl1" SkinID="ProduitMailDisponibiliteDemandeHeader"
                    runat="server">
                </ecom:ThemablePanelControl>
                <%// un lien %>
                <asp:LinkButton runat="server" ID="lnkOuvrir" Text="Etre averti lorsque ce produit sera de nouveau disponible"
                    SkinID="ProduitMailDisponibiliteDemandeLink" OnClick="lnkOuvrir_Click" CausesValidation="False" />
                <%// avec un "footer" personnalisable %>
                <ecom:ThemablePanelControl ID="ThemablePanelControl2" SkinID="ProduitMailDisponibiliteDemandeFooter"
                    runat="server">
                </ecom:ThemablePanelControl>
            </asp:View>
            <asp:View runat="server" ID="vwOuvert">
                <%// cette vue correspond à la version "formulaire", et n'est pas encore personnalisable %>
                Votre prénom :
                <asp:TextBox runat="server" ID="txtPrenom" ValidationGroup="MailDispo" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Merci de préciser votre prénom"
                    ValidationGroup="MailDispo" ControlToValidate="txtPrenom" Display="Dynamic"></asp:RequiredFieldValidator>
                Votre e-mail :
                <asp:TextBox runat="server" ID="txtEmail" ValidationGroup="MailDispo" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Merci de préciser votre e-mail"
                    ValidationGroup="MailDispo" ControlToValidate="txtEmail" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Veuillez vérifier votre e-mail"
                    ValidationGroup="MailDispo" Display="Dynamic" ControlToValidate="txtEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:LinkButton runat="server" ID="lnkCreer" Text="Valider" ValidationGroup="MailDispo"
                    OnClick="lnkCreer_Click" />
                <asp:LinkButton runat="server" ID="lnkAnnuler" Text="x" CausesValidation="false"
                    OnClick="lnkAnnuler_Click" />
            </asp:View>
            <asp:View runat="server" ID="vwDeja">
                <%// le message de confirmation de l'enregistrement de la demande %>
                <ecom:ThemablePanelControl ID="lcol" SkinID="ProduitMailDisponibiliteOK" runat="server">
                    <Content>
                        Vous serez averti quand ce produit sera de nouveau disponible
                    </Content>
                </ecom:ThemablePanelControl>
            </asp:View>
        </asp:MultiView>
    </ContentTemplate>
</asp:UpdatePanel>
