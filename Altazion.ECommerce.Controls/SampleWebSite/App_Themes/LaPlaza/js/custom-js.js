


//script Hamburger Nav dupliqué pour le mobile
		(function() {
		// old browser or not ?
		if ( !('querySelector' in document && 'addEventListener' in window) ) {
		return;
		}
		window.document.documentElement.className += ' js-enabled';		

		function toggleNav() {		

		// Define targets by their class or id
		var button = document.querySelector('.nav-button');
		var target = document.querySelector('.top2');
		// click-touch event
		if ( button ) {
		  button.addEventListener('click',
		  function (e) {
		      button.classList.toggle('is-opened');
		    target.classList.toggle('menu-ouvert');
		    e.preventDefault();
		  }, false );
		}
		} // end toggleNav()
		toggleNav();
}());

$(".nav-mobile .niv1 a").click(function () {
    $(".top2").removeClass("menu-ouvert");
    $(".nav-button").removeClass('is-opened');
    return true;
});



	//script menu compte client
	$('.accueil-home').on('click', function (e) {
		$('.compte-row').toggleClass("compte-row-accueil");
});

	//script  compte client - ajouter nouvelle adresse
	$('.ajouter-ad ').on('click', function (e) {
		$('.bloc-ajouter-ad').toggleClass("bloc-ajouter-ad-ouvert");
});

 
 

	//script bloc adresse du compte client de mm hauteur

    var heights = [];
$('.ad-bloc').each(function(){ heights.push( $(this).height() ); });
var max_height = Math.max.apply(null, heights);
$('.ad-bloc').css( {'height': max_height+'px'} );

function formatCurrency(decimal) {
    var inte = Math.floor(decimal);
    var dec = Math.round((decimal - Math.floor(decimal)) * 100);
    return inte + "," + dec;
}

E.Panier.setOnSignalerAjoutLigneHandler(function (l, err) {
    try {
        var tmp = "";
        if (l.AttributsDifferentiants != null && l.AttributsDifferentiants.length > 0) {
            tmp = l.AttributsDifferentiants[0];
        }
        $("#ajout-panier .poids").text(tmp);
        $("#ajout-panier img").attr("src", l.ImageUrl);
        $("#ajout-panier .libelle").text(l.Libelle);
        $("#ajout-panier .choix-qt-detail span").text("x" + l.Quantite);

        if (l.PuOriginalTTC != null && l.PuOriginalTTC != 0 && l.PuOriginalTTC != l.PuFinalTTC) {
            $("#ajout-panier .prix-promo").show();
            $("#ajout-panier .prix-promo .barre").text(formatCurrency(l.PuOriginalTTC) + "€");
        }
        else {
            $("#ajout-panier .prix-promo").hide();
        }
        $("#ajout-panier .prix-normal").text(formatCurrency(l.PuFinalTTC) + "€");

        $("#ajout-panier").modal();
    }
    catch (e) {
        console.error(e);
    }
});
