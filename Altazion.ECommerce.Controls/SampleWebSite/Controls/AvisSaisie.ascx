<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AvisSaisie.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.AvisSaisie" %>
<ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="SaisieAvisContentHeader">
    <Content>
    </Content>
</ecom:ThemablePanelControl>
<div class="SaisieAvis">
    <asp:MultiView runat="server" ID="mvSaisieAvis" ActiveViewIndex="1">

        <asp:View runat="server" ID="vwSaisie">
            <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="SaisieAvisSaisieHeader" />
            <div class="Saisie">
                <p class="LigneNom">
                    <span class="entete">Votre nom
                    </span>
                    <asp:TextBox runat="server" ID="txtNom" Columns="40" placeholder="ex : Pierre D." />
                </p>
                <p class="LigneEmail">
                    <span class="entete">Votre e-mail
                    </span>
                    <asp:TextBox runat="server" ID="txtEmail" Columns="40" placeholder="Ne sera pas publié - ex : (pierre@mondomaine.fr)" />
                </p>
                <p class="LigneNote">
                    <span class="entete">Notez le produit
                    </span>
                    <asp:MultiView runat="server" ID="mvTypeEtoile">
                        <asp:View ID="vwCombo" runat="server">
                            <asp:DropDownList runat="server" ID="cboNote">
                                <asp:ListItem Text="5/5" Value="5" />
                                <asp:ListItem Text="4/5" Value="4" />
                                <asp:ListItem Text="3/5" Value="3" Selected="True" />
                                <asp:ListItem Text="2/5" Value="2" />
                                <asp:ListItem Text="1/5" Value="1" />
                                <asp:ListItem Text="0/5" Value="0" />
                            </asp:DropDownList>
                        </asp:View>
                        <asp:View runat="server" ID="vwRateIt">
                            <asp:Panel ID="pnlRateIt" CssClass='rateit' runat="server" />
                            <asp:HiddenField ID="txtRateIt" runat="server" />
                        </asp:View>
                    </asp:MultiView>

                </p>
                <p class="LigneCommentaires">
                    <span class="entete">Vos commentaires
                    </span>
                    <asp:TextBox runat="server" Columns="30" Rows="5" ID="txtCommentaires" TextMode="MultiLine" />
                </p>
                <p class="LigneOk">
                    <asp:LinkButton runat="server" ID="btnOk" SkinID="SaisieAvisEnregistrerBouton"
                        Text="Déposer votre avis"
                        OnClick="btnOk_Click" />
                </p>
            </div>
        </asp:View>
        <asp:View runat="server" ID="vwEnregistre">
            <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="AvisSaisieConfirmation">
                <Content>
                    <div class="Confirmation">

                        <h2>Merci pour votre commentaire.</h2>
                        <p>
                            Votre avis a bien été enregistré, il apparaîtra dans quelques minutes.
                        </p>
                    </div>
                </Content>
            </ecom:ThemablePanelControl>
        </asp:View>
    </asp:MultiView>
    <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="SaisieAvisContentFooter">
        <Content>
        </Content>
    </ecom:ThemablePanelControl>

</div>
