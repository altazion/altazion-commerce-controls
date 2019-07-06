<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="KlikAndPayDepliable.ascx.cs" 
    Inherits="CPointSoftware.ECommerce.Site.Exec.reglements.KlikAndPay.KlikAndPayDepliable" %>
<div class="TypeReglement">
    <asp:Panel runat="server" ID="pnlMain">
        <ecom:ThemableMultiView runat="server" ActiveViewIndex="0" ID="mvReglement">
            <ecom:ThemableView runat="server" ID="vwFerme">
                <ecom:ThemablePanelControl runat="server" ID="pnlFerme" SkinID="ModeReglementKlikAndPayFerme">
                    <Content>
                        
                        
                        <%---Paiement CB par KlikAndPay :
                        <ecom:ReglementOuvrirLinkButton ID="ReglementChoixLinkButton1" runat="server" Text="Choisir le paiement CB" />
                           --%>

                        
                       <h3>
                        <ecom:ReglementOuvrirLinkButton ID="ReglementChoixLinkButton1" runat="server" CssClass="butt1">
                            <i></i> Klik&Pay <span class="small">(paiement sécurisé)</span>  <img border="0" src="https://www.klikandpay.com/images/logokp4.gif" alt=""/>
                        </ecom:ReglementOuvrirLinkButton>
                        </h3>



                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwOuvert">
                <ecom:ThemablePanelControl runat="server" ID="pnlOuvert" SkinID="ModeReglementKlikAndPayOuvert">
                    <Content>
 
                      <h3>
                        <ecom:ReglementFermerLinkButton ID="ReglementFermerLinkButton1" runat="server" CssClass="butt1 orange">                      
                            <span class="orange icon-radio-checked"></span> Klik&Pay <span class="small">(paiement sécurisé)</span>   <img border="0" src="https://www.klikandpay.com/images/logokp4.gif" width="86" height="23" alt=""/>             
                        </ecom:ReglementFermerLinkButton>
                     </h3>
                        <p>En choisissant ce mode de règlement vous allez être redirigé vers le site de paiement sécurisé Klik&Pay.<br />
			  <b>La transaction s'effectuera ainsi de façon 100% sécurisée. </b>
                        </p>

                        <asp:HyperLink runat="server" ID="btnPayerKlikAndPay"
                            Text="Payer" />
                        <%--<iframe runat="server" id="iFrameKlikAndPay" frameborder="0" allowtransparency="true" />--%>
                      </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwNonDisponible">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl2" SkinID="ModeReglementKlikAndPayNonDispo">
                    <Content>
                        Carte bancaire non disponible
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
            <ecom:ThemableView runat="server" ID="vwEnErreur">
                <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl3" SkinID="ModeReglementKlikAndPayEnErreur">
                    <Content>
                    </Content>
                </ecom:ThemablePanelControl>
            </ecom:ThemableView>
        </ecom:ThemableMultiView>
    </asp:Panel>
</div>