<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="sogenactifDepliable.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.SIPS.sogenactifDepliable" %>
<div class="TypeReglement">
    <asp:Panel runat="server" ID="pnlMain">
        <ecom:ThemableMultiView runat="server" ActiveViewIndex="0" ID="mvReglement">
            <ecom:ThemableView runat="server" ID="vwFerme">
                <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementSogenactifFerme">
                    <Content>
                        
                        
                        <%---Paiement CB par Sogenactif :
                        <ecom:ReglementOuvrirLinkButton ID="ReglementChoixLinkButton1" runat="server" Text="Choisir le paiement CB" />
                           --%>

                        
                       <h3>
                        <ecom:ReglementOuvrirLinkButton ID="ReglementChoixLinkButton1" runat="server" CssClass="butt1">
                            <i></i> Carte Bancaire <span class="small">(paiement sécurisé)</span>  <img src="/App_Themes/sit_2/img/p-cb.png" alt=""/>
                        </ecom:ReglementOuvrirLinkButton>
                        </h3>



                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwOuvert">
                <ecom:ThemablePanelControl runat="server" ID="pnlOuvert" SkinID="ModeReglementSogenactifOuvert">
                    <Content>
 
                      <h3>
                        <ecom:ReglementFermerLinkButton ID="ReglementFermerLinkButton1" runat="server" CssClass="butt1 orange">                      
                            <span class="orange icon-radio-checked"></span> Carte Bancaire <span class="small">(paiement sécurisé)</span>   <img src="/App_Themes/sit_2/img/p-cb.png" alt=""/>             
                        </ecom:ReglementFermerLinkButton>
                     </h3>
                        <p>En choisissant ce mode de règlement vous allez être redirigé vers le site de paiement sécurisé de la Société Générale.<br />
			  <b>La transaction s'effectuera ainsi de façon 100% sécurisée. </b>
                        </p>

                        <iframe runat="server" id="iFrameSIPS" frameborder="0" allowtransparency="true" />
                      </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwNonDisponible">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="ModeReglementSogenactifNonDispo">
                    <Content>
                        Carte bancaire non disponible
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwEnErreur">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="ModeReglementSogenactifEnErreur">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
        </ecom:ThemableMultiView>
    </asp:Panel>
</div>
