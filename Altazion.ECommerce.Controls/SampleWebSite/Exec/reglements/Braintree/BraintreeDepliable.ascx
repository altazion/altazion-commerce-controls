<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BraintreeDepliable.ascx.cs" 
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.Braintree.BraintreeDepliable" %>

<div class="TypeReglement">
    <asp:Panel runat="server" ID="pnlMain">
        <ecom:ThemableMultiView runat="server" ActiveViewIndex="0" ID="mvReglement">
            <ecom:ThemableView runat="server" ID="vwFerme">
                <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementBraintreeFerme">
                    <Content>
                        

                        
                       <h3>
                        <ecom:ReglementOuvrirLinkButton ID="ReglementChoixLinkButton1" runat="server" CssClass="butt1">
                            <i></i> Braintree <span class="small">(paiement sécurisé)</span> 
                        </ecom:ReglementOuvrirLinkButton>
                        </h3>



                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwOuvert">
                <ecom:ThemablePanelControl runat="server" ID="pnlOuvert" SkinID="ModeReglementBraintreeOuvert">
                    <Content>
 
                      <h3>
                        <ecom:ReglementFermerLinkButton ID="ReglementFermerLinkButton1" runat="server" CssClass="butt1 orange">                      
                            <span class="orange icon-radio-checked"></span> Braintree <span class="small">(paiement sécurisé)</span>
                        </ecom:ReglementFermerLinkButton>
                     </h3>
                        
                            <section>
                        <div id="dropin-container"></div>
                        <div id="checkout-message"></div>
                                </section>
                        <button id="submit-button">Payer</button>
                        
                    <div class="modal fade" id="brainTreeModal">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-body" id="brainTreeModalBody">
                                        
                                    </div>
                                </div>
                            </div>
                        </div>

                      </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwNonDisponible">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="ModeReglementBraintreeNonDispo">
                    <Content>
                        Carte bancaire non disponible
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwEnErreur">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="ModeReglementBraintreeEnErreur">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
        </ecom:ThemableMultiView>
    </asp:Panel>
</div>