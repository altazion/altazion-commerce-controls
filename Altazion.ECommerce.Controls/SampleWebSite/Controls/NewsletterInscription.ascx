<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsletterInscription.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.NewsletterInscription" %>
<div id="NewsletterInscription">
    <ecom:ThemablePanelControl runat="server" SkinID="NewsletterSubscribeHeader">
        <Content>
            <h1>
                Abonnez-vous à la newsletter</h1>
        </Content>
    </ecom:ThemablePanelControl>
    <p>
        <span class="Header">Votre e-mail :</span>
        <asp:TextBox runat="server" ID="txtEmailInscription" class="text" />
        <asp:LinkButton runat="server" SkinID="NewsletterInscriptionOkButton" Text="M'abonner"
             OnClick="btnSubscribe_Click" />
    </p>
    <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="NewsletterSubscribeFooter">
    </ecom:ThemablePanelControl>
</div>
<div id="NewsletterDesinscription">
    <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="NewsletterUnsubscribeHeader">
        <Content>
            <h1>
                Vous souhaitez vous désabonner</h1>
        </Content>
    </ecom:ThemablePanelControl>
    <p>
        <span class="Header">Votre e-mail :</span>
        <asp:TextBox runat="server" ID="txtEmailDesinscription" class="text" />
        <asp:LinkButton SkinID="NewsletterDesinscriptionOkButton" Text="Me désabonner"
            runat="server" OnClick="btnUnsubscribe_Click" />
    </p>
    <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="NewsletterUnsubscribeFooter">
    </ecom:ThemablePanelControl>
</div>
