<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PanierResumeAvecPopup.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.PanierResumeAvecPopup" %>

<div id="PanierResumeDiv">

    <ecom:PanierResume AsLink="false" runat="server" ID="cartResume" />
    <ecom:PanierJavascriptData runat="server" ID="hdnPanierResume" />

    <ecom:ThemablePanelControl runat="server" SkinID="ResumePanierPopupContent">
        <Content>


            <div id="ResumePanierPopup" data-bind="with: data">

                <div class="ResumePanierPopupContent">
                    <div data-bind="ifnot: Incitation == null">
                        <div class="incitation">
                            <span data-bind="text: Incitation"></span>
                        </div>
                    </div>
                    <div class="vide" data-bind="ifnot: Lignes.length > 0">
                    </div>
                    <div class="contenu" data-bind="if: Lignes.length > 0">

                        <div data-bind="visible: $root.lignesMagasins().length > 0">
                            <div class="titre-panier-PopUp titre-panier-magasin-PopUp">
                                <h2>Réservation en magasin</h2>
                                <p class="info-liv">
                                    Retirer <span>immédiatement</span><br />
                                    votre produit en magasin
                                </p>
                            </div>
                            <ul data-bind="foreach: $root.lignesMagasins()">
                                <li>
                                    <img data-bind="attr: { src: ImageUrl }" />
                                    <div class="panier-head-left">
                                        <p class="libelle">
                                            <span data-bind="text: Libelle"></span>
                                        </p>
                                        <p class="marque" data-bind="if: Marque">
                                            Marque : <span data-bind="text: Marque"></span>
                                        </p>
                                        <p class="quantite">
                                            Quantité :<span data-bind="text: Quantite"></span>
                                        </p>
                                    </div>
                                    <div class="panier-head-right">
                                        <span data-bind="html: PrixFormate"></span>
                                    </div>
                                    <%-- 
						Le champ "price" est formaté comme suit : 
							<span class='entier'>14</span><span class='euro'>&euro;</span><span class='decimal'>90</span>
                                    --%>
                                </li>
                            </ul>
                        </div>

                        <div data-bind="visible: $root.lignesWeb().length > 0">
                            <div class="titre-panier-PopUp titre-panier-ligne-PopUp">
                                <h2>Achats en ligne</h2>

                            </div>
                            <ul data-bind="foreach: $root.lignesWeb">
                                <li>
                                    <img data-bind="attr: { src: ImageUrl }" />
                                    <div class="panier-head-left">
                                        <p class="libelle">
                                            <span data-bind="text: Libelle"></span>
                                        </p>
                                        <p class="marque" data-bind="if: Marque">
                                            Marque : <span data-bind="text: Marque"></span>
                                        </p>
                                        <p class="quantite">
                                            Quantité :<span data-bind="text: Quantite"></span>
                                        </p>
                                    </div>
                                    <div class="panier-head-right">
                                        <span data-bind="html: PrixFormate"></span>
                                    </div>
                                    <%-- 
                        Le champ "price" est formaté comme suit : 
                            <span class='entier'>14</span><span class='euro'>&euro;</span><span class='decimal'>90</span>
                                    --%>
                                </li>
                            </ul>
                        </div>
                        <%-- 
                 fin de copie
                        --%>










                        <a href="/exec/panier.htm" class="termine-com">Terminer ma commande</a>
                    </div>

                </div>
            </div>



            <script type="text/javascript">

                $(document).ready(function () {
                    E.Panier.setupPanierPopupResume('ResumePanierPopup', 'PanierResumeDiv');
                });



            </script>

        </Content>
    </ecom:ThemablePanelControl>
</div>
