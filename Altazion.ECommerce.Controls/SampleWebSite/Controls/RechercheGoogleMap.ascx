<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RechercheGoogleMap.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.RechercheGoogleMap" %>
<script src="/tools/knockout-2.2.0.js"></script>

<div id="divRechercheGoogleMap">

<script type="text/javascript">
    var laMapGoogle = null;
    var mdl = { points: ko.observableArray(), detail: ko.observable() };

    var markers = [];

    function initGlobalMap(map) {
        laMapGoogle = map;
    }

    function doMap(pts) {
        var totLat = 0.0, totLng = 0.0;
        for (var i = 0; i < pts.length; i++) {
            var loc = pts[i].Localisation

            if (loc == null || loc.Lattitude == null || loc.Longitude == null)
                continue;

            var coord = { lat: loc.Lattitude, lng: loc.Longitude };

            var mk = new google.maps.Marker({
                position: coord,
                map: laMapGoogle,
                title: pts[i].Nom,
                //url: mags[i].url,
                //icon:logokj
            });

            let pt = pts[i];

            if (rgmActionOnMarkerClick != null) {
                mk.addListener('click', function () { rgmActionOnMarkerClick(pt) });
            }

            markers.push(mk);

            totLat += coord.lat; totLng += coord.lng;
        }
        coord = { lat: totLat / pts.length, lng: totLng / pts.length };

        laMapGoogle.setCenter(coord);
        laMapGoogle.setZoom(12);
    }

    function backToForm() {
        mdl.points(null);
        clearMarkers();

        var coord = { lat: 46.7, lng: 1.5 };
        laMapGoogle.setCenter(coord);
        laMapGoogle.setZoom(5);
        return false;
    }

    $(document).ready(function () {
        ko.applyBindings(mdl, $("#divRechercheGoogleMap").get()[0]);

        $("#btDoSearch").click(function (e) {
            $("#errorCodePostal").hide();
            var c = $("#txtCodePostal").val();
           
            doSearch(c);
            
            return false;
        });
        
    });

    function deleteMarkers() {
        for (var i = 0; i < markers.length; i++) {
            markers[i].setMap(null);
        }
        markers = [];
    }

    function doSearch(codePostal) {
        var rg = /0[1-9]\d{3}|([1]|[3-8])\d{4}|2[0-9|A|B|a|b]\d{3}|9[0-5]\d{3}/;

        mdl.points(null);
        if (!rg.test(codePostal) || RegExp.rightContext != "") {
            $("#errorCodePostal").show();
        }
        else {
            E.Process.getPointsLivraison(codePostal, '', '', function (pts) {
                mdl.points(pts);
                doMap(pts);
            }, function () {

            }, '<%=mlvGuid%>', null);
        }
    }

    function getDetail(plv) {

        E.Process.getPointLivraison(plv, function (pt) {
            mdl.detail(pt);
        }, function () {

        });
    
    }

    var rgmSaisieCP = '#txtCodePostal';
    var rgmErrorCP = '#errorCodePostal';
    var rgmBtDoSearch = '#btDoSearch';
    var rgmBtSelectPoint = '#txtCodePostal';
    var rgmActionOnMarkerClick = null;

    function initRechercheGoogleMap(saisieCP, errorCP, btDoSearch, btSelectPoint, actionOnMarkerClick) {
        rgmSaisieCP = saisieCP;

        $(rgmSaisieCP).keypress(function (e) {
            if (e.which == 13) {
                $(rgmBtDoSearch).click();
                e.preventDefault();
                return false;
            }
        });

        rgmErrorCP = errorCP;
        rgmBtDoSearch = btDoSearch;
        rgmBtSelectPoint = btSelectPoint;
        rgmActionOnMarkerClick = actionOnMarkerClick;
    }

    function setPointLivraisonRelais(plv) {
        E.Panier.definirModeLivraison('<%=mlvGuid%>', function () {
            E.Process.setPointLivraison(plv, function () {
                var url = window.location.href.replace('#', '');
                url = url.substring(0, url.charAt('?'));
                window.location = url+'?s=42';
            }, function () {
            }, null);
        }, null);

    }

</script>


<ecom:ThemablePanelControl runat="server" SkinID="RechercheGoogleMapPage">
<Content>

    <section class="page-b magasin-search bg-gris">
        <div class="container">

            <div class="row">

                <div class="col-md-7  hidden-xs hidden-sm">
                            <ecom:GoogleMap runat="server" ApiKey="AIzaSyD9ThPHYy9YT_-DI8Fs5lzwj7sIF3-3HPE" MoreInitJavascript="initGlobalMap(map);" />
                </div>


                <div class="page-b-cta col-md-5">

                    <div id="saisieCP" class="col-md-12">
                        
                                <div class="col-md-12">
                                    <div class="col-md-12 indi-code">
                                        <p class="icon"><span class="icon-search"></span>Indiquez votre code postal</p>
                                        <div class="form-input">
                                            <input id="txtCodePostal" type="text" placeholder="CP">
                                            <a href="#" id="btDoSearch" class="btn btn-vert">OK</a>

                                        </div>

                                        <span class='errorCodePostal' style='display: none'>Code postal invalide</span>
                                    </div>
                                </div>
                            
                    </div>



                    
                            <div class="row pop-list-mag magasin-liste-1 col-md-12" style="display: none" data-bind='visible: points() != null && points().length == 0'>
                                <div class="col-md-6">
                                    Il n'y a aucun magasin dans la localisation que vous avez sélectionnée. Lancez une nouvelle recherche ou cliquez sur le département de votre choix ci-dessous.
                                </div>

                                <div class="col-md-6">
                                    <a href="#" class="btn btn-default" data-bind="click: backToForm">lancer une autre recherche</a>
                                </div>

                            </div>
                        
                    <div class="row pop-list-mag magasin-liste-1" style="display: none" data-bind='visible: points() != null && points().length > 0'>

                        <a href="#" class="btn" data-bind="click: backToForm">Retour</a>

                        <div itemscope itemtype="http://schema.org/LocalBusiness" data-bind='foreach: points'>
                            <%--<ecom:ThemablePanelControl runat="server" SkinID="MagasinListItem">
                                <Content>--%>
                                    <div class="magasin-liste-2 row">


                                        <div class="col-lg-9 col-sm-12 col-xs-12 col-md-12">
                                            <div class="Magasin" itemprop="address" itemscope itemtype="http://schema.org/PostalAddress">


                                                <h2>
                                                  
                                                        <span itemprop="name" class="icon-5 rouge"></span><b data-bind='text: Nom'></b>
                                                </h2>


                                                <span class="icon-location vert"></span>
                                                <span data-bind='html: Adresse' itemprop="streetAddress"></span>
                                                -
                                                <span data-bind='text: CP' itemprop="postalCode"></span>
                                                -
                                                <span data-bind='text: Ville' itemprop="addressLocality"></span>
                                                <br>
                                                <span>
                                                    <i class="icon-phone vert"></i>
                                                    <span itemprop="telephone" data-bind='text: Telephone'></span>
                                                </span>


                                            </div>

                                        </div>
                                                                               
                                    </div>
                                <%--</Content>
                            </ecom:ThemablePanelControl>--%>
                        </div>

                    </div>
                    
                </div>

            </div>

        </div>

    </section>
</Content>
</ecom:ThemablePanelControl>

    

</div>