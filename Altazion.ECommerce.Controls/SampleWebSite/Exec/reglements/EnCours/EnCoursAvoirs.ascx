<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EnCoursAvoirs.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.EnCours.EnCoursAvoirs" %>
<asp:MultiView runat="server" ID="mviewPanel">
    <asp:View runat="server" ID="pnlOk">
        <asp:Panel ID="Panel1" runat="server" CssClass="TypeReglement">
            <div class="TypeReglementEnCoursAvoir">
                <ecom:ThemablePanelControl RenderWithNoTag="true" runat="server" ID="pnlModeReg" SkinID="ModeReglementEnCoursAvoirs">
                    <Content>
                        <div>
                            <h3>
                                Règlement en utilisant vos avoirs</h3>
                        </div>
                    </Content>
                </ecom:ThemablePanelControl>
                <p>
                </p>
                <ecom:ThemablePanelControl RenderWithNoTag="true" runat="server" ID="pnlAvoirSuffisant" Visible="false" SkinID="ModeReglementEnCoursAvoirsSuffisants"><Content>
                    <p>
                    <asp:Label ID="Label1" runat="server" SkinID="TypeReglementEnCoursAvoirsMontantLabel" Text="Vous avez des avoirs disponibles pour un montant de " />
                    <asp:Label runat="server" CssClass="Montant" ID="lblMontant" />
                        Le montant de vos avois est suffisant pour payer votre commande. En cliquant sur le bouton ci-dessous vous.
                    </p>
                </Content></ecom:ThemablePanelControl>
                <ecom:ThemablePanelControl RenderWithNoTag="true" runat="server" ID="pnlAvoirInsuffisant" Visible="false" SkinID="ModeReglementEnCoursAvoirsInsuffisants"><Content>
                    <p>
                    <asp:Label ID="Label2" runat="server" SkinID="TypeReglementEnCoursAvoirsMontantLabel" Text="Vous avez des avoirs disponibles pour un montant de " />
                    <asp:Label runat="server" CssClass="Montant" ID="lblMontant" />
                        Le montant de vos avoirs n'est pas suffisant pour payer votre commande. Vous devrez choisir un autre mode de paiement ci dessous.
                    </p>
                </Content></ecom:ThemablePanelControl>
                <ecom:ThemablePanelControl RenderWithNoTag="true" runat="server" ID="pnlAvoirUtilise" Visible="false" SkinID="ModeReglementEnCoursAvoirsUtilises"><Content>
                    <p>
                        Vous avez utilisé vos avoirs.
                    </p>
                </Content></ecom:ThemablePanelControl>  
                <asp:Panel runat="server" ID="pnlButton" class="ModeReglementBoutonOk">
                    <ecom:MouseOverImageButton runat="server" SkinID="ModeReglementAvoirButton" ImageUrl="~/images/standard/btnOk.gif" ID="btnPayer" OnClick="btnPayer_Click" />
               </asp:Panel>
            </div>
            
                <ecom:ThemablePanelControl RenderWithNoTag="true" runat="server" ID="ThemablePanelControl1" SkinID="ModeReglementEnCoursAvoirsFooter" />
        </asp:Panel>
    </asp:View>
</asp:MultiView>
