<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsletterChangeEtat.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.NewsletterChangeEtat" %>
<div id="NewsletterChangeEtat">
    <ecom:ThemablePanelControl SkinID="NewsletterChangeEtatHeader" runat="server">
        <Content>
            <h1>
                Abonnez-vous à la newsletter</h1>
        </Content>
    </ecom:ThemablePanelControl>
    <div id="NewsletterChangeEtatEMail">
        <p>
            <span class="Header">Votre adresse e-mail :</span>
            <asp:Label CssClass="Input" runat="server" ID="txtEmail" /></p>
    </div>
    <div id="NewsletterChangeEtatList">
        <asp:DataList ID="DataList1" runat="server" DataSourceID="AbonnementSource" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <h2>
                    <asp:Label ID="Label2" CssClass="Libelle" runat="server" Text='<%# Eval("LibelleNewsletter") %>'></asp:Label></h2>
                <p>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("DescriptionNewsletter") %>'></asp:Label></p>
                <asp:Panel ID="Panel1" runat="server" Visible='<%# (bool)(Eval("EstDesabonnable")) && (bool)(Eval("EstAbonne")) %>'>
                    <div class="EtatAbonnement">
                        <span class="NewsletterEtatAbonne"><b>Etat :</b>
                            <asp:Label runat="server" SkinID="NewsletterEtatAbonne" Text="Vous etes abonné" /></span>
                        <asp:LinkButton runat="server" SkinID="NewsletterDesinscriptionOkButton" Text="Me désabonner    " CommandArgument='<%# Eval("NewsletterId") %>'
                            CommandName="Desabonner" />
                    </div>
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Visible='<%# ! (bool)(Eval("EstAbonne")) %>'>
                    <span class="NewsletterEtatNonAbonne" ><b>Etat :</b>
                        <asp:Label ID="Label3" runat="server" SkinID="NewsletterEtatNonAbonne" Text="Vous n'êtes pas abonné" /></span>
                    <asp:LinkButton ID="ImageButton1" runat="server" SkinID="NewsletterInscriptionOkButton" Text="M'abonner"
                        CommandArgument='<%# Eval("NewsletterId") %>' CommandName="Abonner" />
                </asp:Panel>
            </ItemTemplate>
        </asp:DataList>
    </div>
    <ecom:AbonnementNewsletterSource runat="server" ID="AbonnementSource">
        <Parameters>
            <asp:ControlParameter ControlID="txtEmail" PropertyName="Text" Name="Email" />
        </Parameters>
    </ecom:AbonnementNewsletterSource>
    <ecom:ThemablePanelControl runat="server" SkinID="NewsletterChangeEtatHeaderFooter" />
</div>
