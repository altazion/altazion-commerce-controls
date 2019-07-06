<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AvisAffichage.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.AvisAffichage" %>

<asp:Repeater runat="server" ID="rptAvis">
    <ItemTemplate>
        <ecom:ThemablePanelControl runat="server" SkinID="AvisDetails">
            <Content>
                <div class="Avis">
                    <div class="Entete">
                        <ecom:AvisNom runat="server" />
                        <ecom:AvisNote runat="server" TypeAffichage="Texte"  />
                    </div>
                    <div>
                        <ecom:AvisMessage runat="server" />
                    </div>
                </div>
            </Content>
        </ecom:ThemablePanelControl>
    </ItemTemplate>
</asp:Repeater>