<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LotsListe.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.LotsListe" %>


<ecom:PromotionsLotsRepeater runat="server" MaxItemsCount="1" CacherLotSiNonDispo="true">
    <ItemTemplate>
        <div class="padding-0">
            <div class="bloc-lot-content">
                <ecom:ProduitsLotRepeater runat="server">
                    <ItemTemplate>
                        <ecom:ProductPanel runat="server" cssclass="lot-bloc-prod">
                            <Content>
                            <ecom:ProduitLotQuantite runat="server" CssClass="remise" FormatQuantite="{0:0}x"></ecom:ProduitLotQuantite>
                            <div class="image ">
                                <ecom:ProduitImageLink runat="server" ImageType="Petite" />
                            </div>

                            <div class="bloc-txt">
                                <h2><ecom:ProduitLibelleLink runat="server"></ecom:ProduitLibelleLink></h2>
                                <div class="prix bloc-produit">
                                    <span class="prix-bloc">
                                        <ecom:ProduitPrixHorsPromo runat="server" CssClass="remise" FormatPrix="{0:0.00}€"></ecom:ProduitPrixHorsPromo>
                                        <ecom:ProduitPrix runat="server" CssClass="pas-promo" FormatPrix="{0:0.00}€"></ecom:ProduitPrix>
                                    </span>
                                </div>
                            </div>
                            </Content>
                        </ecom:ProductPanel>
                    </ItemTemplate>
                    <SeparatorTemplate>
                        <div class="lot-bloc-sign">
                            <span>+</span>
                        </div>
                    </SeparatorTemplate>
                </ecom:ProduitsLotRepeater>
                <div class="lot-bloc-sign">
                    <span>
                        =
                    </span>
                </div>
                <div class="lot-bloc-total">
                    <p class="total"><span>Prix total :</span> <ecom:PromotionLotPrix runat="server" FormatPrix="{0:0.00}€"></ecom:PromotionLotPrix></p>
                    <ecom:PanierAjouterLotScriptLink cssclass="btn btn-orange" runat="server" UtiliserPageAddToCart="true" Style="" 
					     CacherSiNonDispo="True" TextFormat="Ajouter les {0:0} <span class='hidden-xs'><br></span>au panier">
					</ecom:PanierAjouterLotScriptLink>
                </div>
            </div>
        </div>
    </ItemTemplate>
</ecom:PromotionsLotsRepeater>