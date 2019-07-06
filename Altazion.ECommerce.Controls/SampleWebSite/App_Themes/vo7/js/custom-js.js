


//script Hamburger transformation
var forEach = function (t, o, r) { if ("[object Object]" === Object.prototype.toString.call(t)) for (var c in t) Object.prototype.hasOwnProperty.call(t, c) && o.call(r, t[c], c, t); else for (var e = 0, l = t.length; l > e; e++)o.call(r, t[e], e, t) };

var hamburgers = document.querySelectorAll(".hamburger");
if (hamburgers.length > 0) {
    forEach(hamburgers, function (hamburger) {
        hamburger.addEventListener("click", function () {
            this.classList.toggle("is-active");
        }, false);
    });
}


//script Hamburger ouverture menu
(function () {
    // old browser or not ?
    if (!('querySelector' in document && 'addEventListener' in window)) {
        return;
    }
    window.document.documentElement.className += ' js-enabled';

    function toggleNav() {

        // Define targets by their class or id
        var button = document.querySelector('.hamburger ');
        var target = document.querySelector('.top');
        // click-touch event
        if (button) {
            button.addEventListener('click',
                function (e) {
                    button.classList.toggle('is-opened');
                    target.classList.toggle('menu-ouvert');
                    e.preventDefault();
                }, false);
        }
    } // end toggleNav()
    toggleNav();
}());



//script  ouverture sous menu mobile
(function () {
    // old browser or not ?
    if (!('querySelector' in document && 'addEventListener' in window)) {
        return;
    }
    window.document.documentElement.className += ' js-enabled';

    function toggleNav() {

        // Define targets by their class or id
        var button = document.querySelector('.sousmenu-sport ');
        var target = document.querySelector('.menu-univers-sous');
        var sousMenu = document.querySelector('#sport');
        var buttonL = document.querySelector('.sousmenu-legend ');
        var targetL = document.querySelector('.menu-univers-sous');
        var sousMenuL = document.querySelector('#legend');
        var tab = document.querySelector('.sport-tab-item a');
        var tabL = document.querySelector('.legend-tab-item a');
        // click-touch event
        if (button) {
            button.addEventListener('click',
                function (e) {
                    button.classList.toggle('is-opened');
                    target.classList.toggle('menu-ouvert');
                    sousMenu.classList.add('active', 'show');
                    sousMenuL.classList.remove('active');
                    sousMenuL.classList.remove('show');
                    tab.classList.add('active');
                    tabL.classList.remove('active');
                    e.preventDefault();
                }, false);
        }


        // click-touch event
        if (buttonL) {
            buttonL.addEventListener('click',
                function (e) {
                    buttonL.classList.toggle('is-opened');
                    targetL.classList.toggle('menu-ouvert');
                    sousMenuL.classList.add('active', 'show');
                    sousMenu.classList.remove('active');
                    sousMenu.classList.remove('show');
                    tabL.classList.add('active');
                    tab.classList.remove('active');
                    e.preventDefault();
                }, false);
        }

    } // end toggleNav()
    toggleNav();
}());



/*
//script  ouverture menu desktop
(function () {
    // old browser or not ?
    if (!('querySelector' in document && 'addEventListener' in window)) {
        return;
    }
    window.document.documentElement.className += ' js-enabled';

    function toggleNav() {

        // Define targets by their class or id
        var button = document.querySelector('.nav-desktop-1 ');
        var target = document.querySelector('.top');
        // click-touch event
        if (button) {
            button.addEventListener('click',
                function (e) {
                    button.classList.toggle('is-opened');
                    target.classList.toggle('menu-desktop-ouvert');
                    e.preventDefault();
                }, false);
        }
    } // end toggleNav()
    toggleNav();
}());
*/



//script menu compte client
$('.accueil-home').on('click', function (e) {
    $('.compte-row').toggleClass("compte-row-accueil");
});

//script  compte client - ajouter nouvelle adresse
$('.ajouter-ad ').on('click', function (e) {
    $('.bloc-ajouter-ad').toggleClass("bloc-ajouter-ad-ouvert");
});




//script bloc adresse du compte client de mm hauteur

//    var heights = [];
// $('.ad-bloc').each(function(){ heights.push( $(this).height() ); });
// var max_height = Math.max.apply(null, heights);
// $('.ad-bloc').css( {'height': max_height+'px'} );






//script  page livraison : info visible sur desktop et caché sur mobile
$(document).ready(function () {
    if (matchMedia) {
        var mq = window.matchMedia("(max-width: 768px)");
        mq.addListener(WidthChange);
        WidthChange(mq);
    }

    function WidthChange(mq) {
        if (mq.matches) {
            $(".info-plus").removeClass("show");
        }
    }
});





//select 2 material 
$(document).ready(() => {

    $('.select-desc ').select2();
    // console.log("working");
    var $selectbox = $('.floating-label').select2({
        placeholder: "",
        allowClear: true,
    })
        .on('select2:select', function () {
            $('label[for="label-material"]').addClass('filled active');
        })
        .on('select2:unselect', function () {
            $('label[for="label-material"]').removeClass('filled');
        });

    $selectbox.on('blur', function () {
        $('label[for="label-material"]').removeClass('active');
    })
    $selectbox.val("").trigger("change");
});

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
        $("#ajout-panier .diff1").text(tmp);
        $("#ajout-panier .img-fluid").attr("src", l.ImageUrl);
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
