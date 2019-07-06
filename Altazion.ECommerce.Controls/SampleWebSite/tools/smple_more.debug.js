/// <reference path="~/tools/jquery-1.7.1-vsdoc.js" />

var JSON; if (!JSON) { JSON = {}; }
(function () {
    "use strict"; function f(n) { return n < 10 ? '0' + n : n; }
    if (typeof Date.prototype.toJSON !== 'function') {
        Date.prototype.toJSON = function (key) {
            return isFinite(this.valueOf()) ? this.getUTCFullYear() + '-' +
f(this.getUTCMonth() + 1) + '-' +
f(this.getUTCDate()) + 'T' +
f(this.getUTCHours()) + ':' +
f(this.getUTCMinutes()) + ':' +
f(this.getUTCSeconds()) + 'Z' : null;
        }; String.prototype.toJSON = Number.prototype.toJSON = Boolean.prototype.toJSON = function (key) { return this.valueOf(); };
    }
    var cx = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g, escapable = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g, gap, indent, meta = { '\b': '\\b', '\t': '\\t', '\n': '\\n', '\f': '\\f', '\r': '\\r', '"': '\\"', '\\': '\\\\' }, rep; function quote(string) { escapable.lastIndex = 0; return escapable.test(string) ? '"' + string.replace(escapable, function (a) { var c = meta[a]; return typeof c === 'string' ? c : '\\u' + ('0000' + a.charCodeAt(0).toString(16)).slice(-4); }) + '"' : '"' + string + '"'; }
    function str(key, holder) {
        var i, k, v, length, mind = gap, partial, value = holder[key]; if (value && typeof value === 'object' && typeof value.toJSON === 'function') { value = value.toJSON(key); }
        if (typeof rep === 'function') { value = rep.call(holder, key, value); }
        switch (typeof value) {
            case 'string': return quote(value); case 'number': return isFinite(value) ? String(value) : 'null'; case 'boolean': case 'null': return String(value); case 'object': if (!value) { return 'null'; }
                gap += indent; partial = []; if (Object.prototype.toString.apply(value) === '[object Array]') {
                    length = value.length; for (i = 0; i < length; i += 1) { partial[i] = str(i, value) || 'null'; }
                    v = partial.length === 0 ? '[]' : gap ? '[\n' + gap + partial.join(',\n' + gap) + '\n' + mind + ']' : '[' + partial.join(',') + ']'; gap = mind; return v;
                }
                if (rep && typeof rep === 'object') { length = rep.length; for (i = 0; i < length; i += 1) { if (typeof rep[i] === 'string') { k = rep[i]; v = str(k, value); if (v) { partial.push(quote(k) + (gap ? ': ' : ':') + v); } } } } else { for (k in value) { if (Object.prototype.hasOwnProperty.call(value, k)) { v = str(k, value); if (v) { partial.push(quote(k) + (gap ? ': ' : ':') + v); } } } }
                v = partial.length === 0 ? '{}' : gap ? '{\n' + gap + partial.join(',\n' + gap) + '\n' + mind + '}' : '{' + partial.join(',') + '}'; gap = mind; return v;
        }
    }
    if (typeof JSON.stringify !== 'function') {
        JSON.stringify = function (value, replacer, space) {
            var i; gap = ''; indent = ''; if (typeof space === 'number') { for (i = 0; i < space; i += 1) { indent += ' '; } } else if (typeof space === 'string') { indent = space; }
            rep = replacer; if (replacer && typeof replacer !== 'function' && (typeof replacer !== 'object' || typeof replacer.length !== 'number')) { throw new Error('JSON.stringify'); }
            return str('', { '': value });
        };
    }
    if (typeof JSON.parse !== 'function') {
        JSON.parse = function (text, reviver) {
            var j; function walk(holder, key) {
                var k, v, value = holder[key]; if (value && typeof value === 'object') { for (k in value) { if (Object.prototype.hasOwnProperty.call(value, k)) { v = walk(value, k); if (v !== undefined) { value[k] = v; } else { delete value[k]; } } } }
                return reviver.call(holder, key, value);
            }
            text = String(text); cx.lastIndex = 0; if (cx.test(text)) {
                text = text.replace(cx, function (a) {
                    return '\\u' +
('0000' + a.charCodeAt(0).toString(16)).slice(-4);
                });
            }
            if (/^[\],:{}\s]*$/.test(text.replace(/\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g, '@').replace(/"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']').replace(/(?:^|:|,)(?:\s*\[)+/g, ''))) { j = eval('(' + text + ')'); return typeof reviver === 'function' ? walk({ '': j }, '') : j; }
            throw new SyntaxError('JSON.parse');
        };
    }
}());

//Checking if ValidatorUpdateDisplay exists
if (typeof (ValidatorUpdateDisplay) != "undefined") {

    //Copy ValidatorValidate to BaseValidatorValidate
    OriginalValidatorUpdateDisplay = ValidatorUpdateDisplay;

    //Replacing ValidatorUpdateDisplay
    ValidatorUpdateDisplay = function (val) {
        //Calling original ValidatorUpdateDisplay function saved in OriginalValidatorUpdateDisplay
        OriginalValidatorUpdateDisplay(val);
        //Update CSS
        if (typeof ($get) != "undefined") {
            //Do it with ASP.NET ajax functions
            Sys.UI.DomElement[val.isvalid ? 'removeCssClass' : 'addCssClass']($get(val.controltovalidate), "validationError");
        }
        else {
            //Do it with standard javascript without ajax functions
            var el = document.getElementById(val.controltovalidate);
            if (el != null) {
                var flag = el.className.indexOf("validationError") != -1;
                if (val.isvalid && flag) {
                    el.className = el.className.replace(new RegExp("\\b" + "validationError" + "\\b", "i"), "").replace(/^\s+|\s(?=\s+)|\s+$/m, "");
                }
                else if (!flag1 && !flag2) {
                    el.className += (el.className.length != 0 ? " " : "") + "validationError";
                }
            }
        }
    }
}

function __E() {

}
function __EPanier() {
    this.Data = null;
}



__E.prototype.Panier = new __EPanier;

function __ECrossCanal() {

}
__E.prototype.CrossCanal = new __ECrossCanal;

function __ESuggest() {

}
__E.prototype.Suggest = new __ESuggest;


function __EProcessCommande() {
    this.Data = null;
}

function __ECustomer() {
}

__E.prototype.Customer = new __ECustomer;



__E.prototype.Process = new __EProcessCommande;

function __EInternalTools() {
}

__E.prototype.InternalTools = new __EInternalTools;

__EInternalTools.prototype.getParameterByName = function (name) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]").replace("$", "\\$");
    var regexS = "[\\?&]" + name + "=([^&#]*)";
    var regex = new RegExp(regexS);
    var results = regex.exec(window.location.search);
    if (results == null)
        return "";
    else
        return decodeURIComponent(results[1].replace(/\+/g, " "));
}

__EInternalTools.prototype.googleAnalyticsEvent = function (category, action, label) {
    if (ga == null)
        return;
    ga('send', 'event', category, action, label);
    return true;
}


__EInternalTools.prototype.registerInstanceChooser = function (chooserId) {
    if ($.isArray(chooserId)) {
        $.each(chooserId, function (z, v) {
            E.InternalTools.registerInstanceChooser(v);
        });
    }
    var ctl = null;
    if (typeof chooserId == "object") {
        ctl = $(chooserId);
    }
    else if (typeof chooserId == "string") {
        if (chooserId.charAt(0) != "#")
            chooserId = "#" + chooserId;
        ctl = $(chooserId);
    }

    if (ctl.is("select")) {
        ctl.change(function (e) {
            $("select option:selected").each(function () {
                var uid = $(this).val();
                $("table[data-e-instance-guid='list']").each(function () {
                    $("*[data-e-instance-guid*='-']").each(function () {
                        if ($(this).attr("data-e-instance-guid") == uid) {
                            $(this).show();
                        }
                        else {
                            $(this).hide();
                        }
                    });
                });
            });
        });
        ctl.change();
    }
    else if (ctl.is("a")) {
        ctl.change(function (e) {
            var uid = $(this).attr("data-e-instance-guid");
            $("table[data-e-instance-guid='list']").each(function () {
                $("*[data-e-instance-guid*='-']").each(function () {
                    if ($(this).attr("data-e-instance-guid") == uid) {
                        $(this).show();
                    }
                    else {
                        $(this).hode();
                    }
                });
            });
        });
    }
}


__E.prototype.RegisterPanierPopupDialogLink = function (e) {
    $(e).each(function (index) {
        $(this).click(function () {
            $("#PanierLivraisonChoixDestinationPopup").slideDown();
            $(this).hide();
            return false;
        });
    });
};




__E.prototype.ProductDetails = null;
__E.prototype.ProductsList = null;

__E.prototype.checkCookieForPanel = null;
__E.prototype.setCookieForPanel = null;

__E.prototype.checkCookieForPanel = function (ctl, hideIfSet) {
    if (hideIfSet == null)
        hideIfSet = true;

    ctl = $(ctl);
    var att = ctl.attr("data-e_cookiepanel");
    if (att != null) {
        att = getCookie(att);
        if (att != null && att != "") {
            if (hideIfSet) {
                ctl.hide();
            }
            else {
                ctl.show();
            }
        }
        else {
            if (!hideIfSet) {
                ctl.hide();
            }
            else {
                ctl.show();
            }
        }
    }
};

__E.prototype.setCookieForPanel = function (ctl, hideIfSet) {

    if (hideIfSet == null)
        hideIfSet = true;
    ctl = $(ctl);
    var cn = ctl.attr("data-e_cookiepanel");
    var cv = ctl.attr("data-e_cookiepanelvalue");
    setCookie(cn, cv, 750);
    ctl = $("div[data-e_cookiepanel='" + cn + "']");
    E.checkCookieForPanel(ctl);
};


function setCookie(cname, cvalue, exdays) {
    var d = new Date();
    d.setTime(d.getTime() + (exdays * 24 * 60 * 60 * 1000));
    var expires = "expires=" + d.toUTCString();
    document.cookie = cname + "=" + cvalue + "; " + expires;
}

function getCookie(cname) {
    var name = cname + "=";
    var ca = document.cookie.split(';');
    for (var i = 0; i < ca.length; i++) {
        var c = ca[i];
        while (c.charAt(0) == ' ') c = c.substring(1);
        if (c.indexOf(name) == 0) return c.substring(name.length, c.length);
    }
    return "";
}


__E.prototype.ParseProductDetails = function () {
    $("div[data-ekind='Product'] input[type=hidden]").each(function (index, item) {
        var v = $(item).val();
        v = JSON.parse(v);
        E.ProductDetails = v;
        if (typeof (_e_googletagenabled) != "undefined" && _e_googletagenabled && typeof(dataLayer) != "undefined") {
            dataLayer.push({
                'ecommerce': {
                    'detail': {
                        'actionField': { 'list': v.Segmentation },
                        'products': [{
                            'name': v.Libelle,
                            'id': v.Reference,
                            'brand': v.Marque,
                            'category': v.Segmentation
                        }]
                    }
                }
            });
        }
    });
};

__E.prototype.ParseProductsList = function () {
    E.ProductsList = new Array();
    $("div[data-ekind='Product'] input[type=hidden]").each(function (index, item) {
        var v = $(item).val();
        v = JSON.parse(v);
        E.ProductsList.push(v);
    });
};


__E.prototype.RootPath = null;

__EPanier.prototype.montantTtc = function () {
    if (E.Panier.Data == null)
        return 0.0;
    var sum = 0.0;

    return sum;
};

__EPanier.prototype.montantHt = function () {
    if (E.Panier.Data == null)
        return 0.0;
    var sum = 0.0;

    return sum;
};

__EPanier.prototype.nbArticles = function () {
    if (E.Panier.Data == null)
        return 0;
    return E.Panier.Data.length;
};

__EPanier.prototype.signalerAjoutLigneParDefaut = function (ligneAjoutee) {
    window.alert(ligneAjoutee.Quantite + "x " + ligneAjoutee.Libelle + " ajoutée");
}

__EPanier.prototype.apresModificationPanierParDefaut = function () {
    var elmQuantity = $('*[data-ekind="CartQuantity"]');
    if (elmQuantity != null && elmQuantity.length > 0) {
        var qte = 0;
        for (var i = 0; i < E.Panier.Data.Lignes.length; i++) {
            if (E.Panier.Data.Lignes[i].TypeArticle == 0)
                qte = qte + E.Panier.Data.Lignes[i].Quantite;
        }
        elmQuantity.text(qte);
    }
    var elmTotal = $('*[data-ekind="CartTotal"]');
    if (elmTotal != null && elmTotal.length > 0) {
        elmTotal.text(E.Panier.Data.MontantTTC.toString());
    }
    var elmTotal = $('*[data-ekind="CartTotalWithStore"]');
    if (elmTotal != null && elmTotal.length > 0) {
        elmTotal.text(E.Panier.Data.MontantTTCAvecMagasin.toString());
    }
}

/// <summary>
/// Modifie le gestionnaire qui est appelé à chaque fois que le panier local
/// est rafraichi : après modification ou après un simple refresh 
/// </summary>
/// <param name="e" type="function">
/// Le nouveau gestionnaire. Celui-ci ne prend aucun paramètre et doit utiliser E.Panier 
/// pour accéder aux données. Pensez à appeler E.Panier.apresModificationPanierParDefaut si
/// vous souhaitez que les comportements par défaut soient actifs
/// </param>
__EPanier.prototype.setOnApresModificationPanierHandler = function (e) {
    __EPanier.prototype.apresModificationPanier = e;
}

__EPanier.prototype.setOnSignalerAjoutLigneHandler = function (e) {
    __EPanier.prototype.signalerAjoutLigne = e;
}

__EPanier.prototype.rafraichirDepuisServeur = function () {
    $.ajax({ url: "/api/cart/nui", cache: false }).success(function (newData) {
        E.Panier.Data = newData;
        if (__EPanier.prototype.apresModificationPanier != undefined) {
            E.Panier.apresModificationPanier();
        }
        else
            E.Panier.apresModificationPanierParDefaut();
        if (newData.EstClientConnecte) {
            E.Process.rafraichirDepuisServeur();
        }
    }).fail(function (err) {
        window.location.reload();
    });
}

__EPanier.prototype.setupPanierPopupResume = function (popup, link) {

    if (E.Panier.apresModificationPanier == undefined) {
        E.Panier.setOnApresModificationPanierHandler(function () {
            if (E.Panier.elmPopupPanier != null && E.Panier.vwPopupPanier != null) {
                var viewModel = E.Panier.Data;
                var mag = new Array();
                var web = new Array();
                for (var i = 0; i < viewModel.Lignes.length; i++) {
                    if (viewModel.Lignes[i].MagasinGuid == null)
                        web.push(viewModel.Lignes[i]);
                    else
                        mag.push(viewModel.Lignes[i]);
                }

                E.Panier.vwPopupPanier.data(viewModel);

                E.Panier.vwPopupPanier.lignesWeb(web);
                E.Panier.vwPopupPanier.lignesMagasins(mag);
            }
            E.Panier.apresModificationPanierParDefaut();
            if (E.Panier.pageLivraisonPanierHandler != undefined) {
                E.Panier.pageLivraisonPanierHandler();
            }
        });
    }

    var elm = $("#" + popup).get(0);
    var timeoutPopup = -1;
    $("#" + link).hover(function (e) {
        if (timeoutPopup >= 0) {
            clearTimeout(timeoutPopup);
            timeoutPopup = -1;
        }
        $("#" + popup).show();
        $("#" + link).addClass("opened");
    }, function (e) {
        timeoutPopup = setTimeout(function () {
            $("#" + popup).hide();
            $("#" + link).removeClass("opened");
        }, 250);
    });

    this.elmPopupPanier = elm;

    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (e, a) {
        E.Panier.rafraichirDepuisServeur();
    });

    var viewModel = E.Panier.Data;
    var mag = new Array();
    var web = new Array();
    for (var i = 0; i < viewModel.Lignes.length; i++) {
        if (viewModel.Lignes[i].MagasinGuid == null)
            web.push(viewModel.Lignes[i]);
        else
            mag.push(viewModel.Lignes[i]);
    }

    this.vwPopupPanier = {
        data: ko.observable(viewModel),
        lignesWeb: ko.observable(web),
        lignesMagasins: ko.observable(mag)
    };
    ko.applyBindings(this.vwPopupPanier, elm);
    if (viewModel == null)
        E.Panier.rafraichirDepuisServeur();
}

__EPanier.prototype.associerMagasin = function (magasinGuid, onSuccess, onChangeNeeeded, onError) {
    var uri = "/api/cart/nui?action=setmagasin&type=cnm&magasinGuid=" + magasinGuid;

    $.ajax({ url: uri, cache: false }).done(function (newData) {
        onSuccess();
    }).fail(function (err, xhr) {
        if (err.status == 418) {
            if (onChangeNeeeded != null)
                onChangeNeeeded();
        }
        else {
            if (onError != null)
                onError(err);
        }
    });

}

__EPanier.prototype.associerContenuMagasin = function (magasinGuid, onSuccess, onChangeNeeeded, onError) {
    var uri = "/api/cart/nui?action=setmagasinpanier";
    if (magasinGuid != null) {
        uri += "&magasinGuid=" + magasinGuid;
    }

    $.ajax({ url: uri, cache: false }).done(function (newData) {
        onSuccess();
    }).fail(function (err, xhr) {
        if (err.status == 418) {
            if (onChangeNeeeded != null)
                onChangeNeeeded();
        }
        else {
            if (onError != null)
                onError(err);
        }
    });

}

__EPanier.prototype.verifierDispoMagasin = function (magasinGuid, onSuccess, onError) {
    var uri = "/api/cart/nui?action=verifdispomagasin&magasinGuid=" + magasinGuid;

    $.ajax({ url: uri, cache: false }).done(function (newData) {
        onSuccess(newData);
    }).fail(function (err, xhr) {
        if (onError != null)
            onError(err);
    });
}

__EPanier.prototype.verifierDispoMagasinEtPrix = function (magasinGuid, onSuccess, onError) {
    var uri = "/api/cart/nui?action=verifdispomagasin&magasinGuid=" + magasinGuid + "&prix=true";

    $.ajax({ url: uri, cache: false }).done(function (newData) {
        onSuccess(newData);
    }).fail(function (err, xhr) {
        if (onError != null)
            onError(err);
    });

}

__EPanier.prototype.ajouterProduit = function (refProduit, qte, controleDeclencheur, sit_pk, lesProduitsAssocies, associerMag, listeGuid) {
    try {
        var tmpClick = null;
        var t = null;
        var c = null;
        if (controleDeclencheur != null) {
            c = $('#' + controleDeclencheur);
            if (c != null) {
                c.addClass("disabled");
                t = c.get()[0]
                if (t != null) {
                    tmpClick = t.onclick;
                    t.onclick = function () { return false; }
                }
            }
        }

        var ctlRef = $('#' + refProduit);
        if (ctlRef != null && ctlRef.length == 1) {
            if (ctlRef.is("select")) {
                refProduit = ctlRef.val();
            }
            else if (ctlRef.is("span")) {
                refProduit = ctlRef.text();
            }
            else if (ctlRef.is("label")) {
                refProduit = ctlRef.html();
            }
            else if (ctlRef.is("input")) {
                refProduit = ctlRef.val();
            }
        }

        if (typeof (qte) === "string") {
            ctlRef = $('#' + qte);
            if (ctlRef != null && ctlRef.length == 1) {
                if (ctlRef.is("select")) {
                    qte = ctlRef.val();
                }
                else if (ctlRef.is("span")) {
                    qte = ctlRef.text();
                }
                else if (ctlRef.is("label")) {
                    qte = ctlRef.html();
                }
                else if (ctlRef.is("input")) {
                    qte = ctlRef.val();
                }
                var tmpQte = parseInt(qte);
                if (!isNaN(tmpQte)) {
                    qte = tmpQte;
                }
                else {
                    qte = null;
                }
            }
            else {
                var tmpQte = parseInt(qte);
                if (!isNaN(tmpQte)) {
                    qte = tmpQte;
                }
                else {
                    qte = null;
                }
            }
        }

        if (typeof (qte) === "number") {
            if (qte < 0)
                qte = 1;
        }

        var uri = "/api/cart/nui?action=add&s=" + sit_pk + "&reference=" + refProduit;

        if (qte != null) {
            uri = uri + "&qte=" + qte;
        }

        if (listeGuid != null) {
            uri = uri + "&liste=" + listeGuid;
        }

        if (true == associerMag) {
            uri = uri + "&associermag=true";
        }
        else if (associerMag == "auto") {
            uri = uri + "&associermag=auto";
        }
            
        var assoc1 = null, assoc2 = null, assoc3 = null, assoc4 = null;
        if (lesProduitsAssocies != null) {
            if ($.isArray(lesProduitsAssocies)) {
                for (zPrdAs = 0; zPrdAs < lesProduitsAssocies.length; zPrdAs++) {
                    var prd = lesProduitsAssocies[zPrdAs];
                    var ctl = $('#' + prd);
                    if (ctl != null && ctl.length == 1) {
                        var tmp = ctl.attr("data-e-typeassoc");
                        if (tmp == null || tmp == "")
                            tmp = ctl.parent().attr("data-e-typeassoc");

                        if (ctl.is('input:checkbox:checked')) {
                            if (assoc1 == null) assoc1 = tmp;
                            else if (assoc2 == null) assoc2 = tmp;
                            else if (assoc3 == null) assoc3 = tmp;
                            else if (assoc4 == null) assoc4 = tmp;
                        }
                    }
                    else {
                        if (assoc1 == null) assoc1 = prd;
                        else if (assoc2 == null) assoc2 = prd;
                        else if (assoc3 == null) assoc3 = prd;
                        else if (assoc4 == null) assoc4 = prd;
                    }
                }
            }
            else {
                var ctl = $('#' + lesProduitsAssocies);
                if (ctl != null && ctl.length == 1) {
                    var tmp = ctl.attr("data-e-typeassoc");
                    if (tmp == null || tmp == "")
                        tmp = ctl.parent().attr("data-e-typeassoc");
                    if (ctl.is('input:checkbox:checked')) {
                        if (assoc1 == null) assoc1 = tmp;
                        else if (assoc2 == null) assoc2 = tmp;
                        else if (assoc3 == null) assoc3 = tmp;
                        else if (assoc4 == null) assoc4 = tmp;
                    }
                }
                else {
                    if (assoc1 == null) assoc1 = lesProduitsAssocies;
                    else if (assoc2 == null) assoc2 = lesProduitsAssocies;
                    else if (assoc3 == null) assoc3 = lesProduitsAssocies;
                    else if (assoc4 == null) assoc4 = lesProduitsAssocies;
                }
            }
        }

        if (assoc1 != null)
            uri = uri + "&typeassoc1=" + assoc1;
        if (assoc2 != null)
            uri = uri + "&typeassoc2=" + assoc2;
        if (assoc3 != null)
            uri = uri + "&typeassoc3=" + assoc3;
        if (assoc4 != null)
            uri = uri + "&typeassoc4=" + assoc4;

        $.ajax({ url: uri, cache: false }).done(function (newData) {

            if (c != null) {
                c.removeClass("disabled");
            }
            if (t != null) {
                t.onclick = tmpClick;
            }

            var l = null;
            for (i = 0; i < newData.Lignes.length; i++) {
                if (newData.Lignes[i].LigneMiseAJour) {
                    l = newData.Lignes[i];
                }
            }

            if (__EPanier.prototype.signalerAjoutLigne != undefined) {
                E.Panier.signalerAjoutLigne(l, newData.ErreurPanier);
            }
            else
                E.Panier.signalerAjoutLigneParDefaut(l);

            E.Panier.Data = newData;

            if (E.Knowledge != null) {
                try {
                    E.Knowledge.traceAddToCartEvent(refProduit);
                }
                catch (e) {

                }
            }


            try {
                if (typeof (E.ProductDetails) != "undefined" && E.ProductDetails != null) {
                    var v = E.ProductDetails;
                    if (typeof (_e_googletagenabled) != "undefined" && _e_googletagenabled && typeof (dataLayer) != "undefined") {
                        dataLayer.push({
                            'event': 'addToCart',
                            'ecommerce': {
                                'currencyCode': 'EUR',
                                'add': {
                                    'products': [{
                                        'name': v.Libelle,
                                        'id': v.Reference,
                                        'brand': v.Marque,
                                        'category': v.Segmentation,
                                        'quantity': 1

                                    }]
                                }
                            }
                        });
                    }
                    else if (typeof (ga) != "undefined") {

                    }
                }
            } catch (e) {

            }

            if (__EPanier.prototype.apresModificationPanier != undefined) {
                E.Panier.apresModificationPanier();
            }
            else
                E.Panier.apresModificationPanierParDefaut();

        }).fail(function (err, xhr) {
            window.alert(err.message);
            if (c != null) {
                c.removeClass("disabled");
            }
            if (t != null) {
                t.onclick = tmpClick;
            }
        });
    }
    catch (e) {
        console.error(e);
    }
};


__EPanier.prototype.obtenirModesLivraisons = function (callback) {

    var uri = "/api/cart/nui?action=getmodeslivraison";
    $.ajax({ url: uri, cache: false }).done(function (newData) {
        if (callback != null) callback(newData);
    });
};

__EPanier.prototype.definirModeLivraison = function (modeLivraison, controleDeclencheur) {
    var tmpClick = null;
    var t = null;
    var c = null;

    if (controleDeclencheur != null) {
        c = $('#' + controleDeclencheur);
        if (c != null) {
            c.addClass("disabled");
            t = c.get()[0]
            if (t != null) {
                tmpClick = t.onclick;
                t.onclick = function () { return false; }
            }
        }
    }

    var uri = "/api/cart/nui?action=setModeLivraison&id=" + modeLivraison;

    $.ajax({ url: uri, cache: false }).done(function (newData) {

        E.Panier.Data = newData;

        if (__EPanier.prototype.apresModificationPanier != undefined) {
            E.Panier.apresModificationPanier();
        }
        else
            E.Panier.apresModificationPanierParDefaut();

        if (newData.EstClientConnecte) {
            E.Process.rafraichirDepuisServeur();
        }

        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }

    }).fail(function (err, xhr) {
        window.alert(err.message);
        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }
    });

}

__EPanier.prototype.definirModeLivraison = function (modeLivraison, callbackFunction, controleDeclencheur) {
    var tmpClick = null;
    var t = null;
    var c = null;

    if (controleDeclencheur != null) {
        c = $('#' + controleDeclencheur);
        if (c != null) {
            c.addClass("disabled");
            t = c.get()[0]
            if (t != null) {
                tmpClick = t.onclick;
                t.onclick = function () { return false; }
            }
        }
    }

    var uri = "/api/cart/nui?action=setModeLivraison&id=" + modeLivraison;

    $.ajax({ url: uri, cache: false }).done(function (newData) {

        E.Panier.Data = newData;

        if (__EPanier.prototype.apresModificationPanier != undefined) {
            E.Panier.apresModificationPanier();
        }
        else
            E.Panier.apresModificationPanierParDefaut();

        if (newData.EstClientConnecte) {
            E.Process.rafraichirDepuisServeur();
        }

        if (callbackFunction != undefined) {
            callbackFunction(newData);
        }

        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }

    }).fail(function (err, xhr) {
        window.alert(err.message);
        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }
    });

}

__EPanier.prototype.update = function (controleDeclencheur, ligneGuid, qty) {
    var tmpClick = null;
    var t = null;
    var c = null;

    if (controleDeclencheur != null) {
        c = $('#' + controleDeclencheur);
        if (c != null) {
            c.addClass("disabled");
            t = c.get()[0]
            if (t != null) {
                tmpClick = t.onclick;
                t.onclick = function () { return false; }
            }
        }
    }

    var uri = "/api/cart/nui?action=update&line=" + ligneGuid + "&qty=" + qty.toString();

    $.ajax({ url: uri, cache: false }).done(function (newData) {

        E.Panier.Data = newData;

        if (__EPanier.prototype.apresModificationPanier != undefined) {
            E.Panier.apresModificationPanier();
        }
        else
            E.Panier.apresModificationPanierParDefaut();

        if (newData.EstClientConnecte) {
            E.Process.rafraichirDepuisServeur();
        }

        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }

    }).fail(function (err, xhr) {
        window.alert(err.message);
        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }
    });

};

__EPanier.prototype.login = function (user, pwd, controleDeclencheur, callbackFunction, errorFunction) {
    var tmpClick = null;
    var t = null;
    var c = null;

    if (controleDeclencheur != null) {
        c = $('#' + controleDeclencheur);
        if (c != null) {
            c.addClass("disabled");
            t = c.get()[0]
            if (t != null) {
                tmpClick = t.onclick;
                t.onclick = function () { return false; }
            }
        }
    }

    var uri = "/api/process/nui?action=login";

    $.ajax({ url: uri, cache: false, type: 'POST', data: { username: user, password: pwd, mode: "interactive" } }).done(function (newData) {

        E.Process.Data = newData;
        if (__EProcessCommande.prototype.apresModification != undefined) {
            E.Process.apresModification();
        }

        if (callbackFunction != undefined) {
            callbackFunction(newData);
        }

        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }

    }).fail(function (err, xhr) {
        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }
        if (errorFunction != undefined) {
            errorFunction(err, xhr);
        }
    });

}


__EProcessCommande.prototype.getPointsLivraison = function (codePostal, ville, pays, callbackFunction, errorFunction, modeLivraison, controleDeclencheur) {

    if (modeLivraison == null || modeLivraison == undefined) {
        modeLivraison = E.Panier.Data.ModeLivraisonIdentifiant;
    }

    var tmpClick = null;
    var t = null;
    var c = null;

    if (controleDeclencheur != null) {
        c = $('#' + controleDeclencheur);
        if (c != null) {
            c.addClass("disabled");
            t = c.get()[0]
            if (t != null) {
                tmpClick = t.onclick;
                t.onclick = function () { return false; }
            }
        }
    }

    var uri = "/api/process/nui?action=getpointslivraison";

    $.ajax({ url: uri, cache: false, type: 'POST', data: { mlvGuid: modeLivraison, cp: codePostal, pays: pays, ville: ville } }).done(function (newData) {

        if (callbackFunction != undefined) {
            callbackFunction(newData);
        }

        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }

    }).fail(function (err, xhr) {
        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }
        if (errorFunction != undefined) {
            errorFunction(err, xhr);
        }
    });

}

__EProcessCommande.prototype.getPointLivraison = function (plvGuid, callbackFunction, errorFunction) {
    
    var uri = "/api/process/nui?action=getpointlivraison";

    $.ajax({ url: uri, cache: false, type: 'POST', data: { plvGuid: plvGuid } }).done(function (newData) {

        if (callbackFunction != undefined) {
            callbackFunction(newData);
        }

    }).fail(function (err, xhr) {
        if (errorFunction != undefined) {
            errorFunction(err, xhr);
        }
    });

}

__EProcessCommande.prototype.setPointLivraison = function (pointLivraison, callbackFunction, errorFunction, controleDeclencheur) {

    var tmpClick = null;
    var t = null;
    var c = null;

    if (controleDeclencheur != null) {
        if (typeof controleDeclencheur == "string") {
            c = $('#' + controleDeclencheur);
        }
        else {
            c = $(controleDeclencheur);
        }
        if (c != null) {
            c.addClass("disabled");
            t = c.get()[0]
            if (t != null) {
                tmpClick = t.onclick;
                t.onclick = function () { return false; }
            }
        }
    }

    var uri = "/api/process/nui?action=setpointlivraison";

    $.ajax({ url: uri, cache: false, type: 'POST', data: { plvGuid: pointLivraison } }).done(function (newData) {

        E.Process.Data = newData;
        if (__EProcessCommande.prototype.apresModification != undefined) {
            E.Process.apresModification();
        }

        if (callbackFunction != undefined) {
            callbackFunction(newData);
        }


        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }

    }).fail(function (err, xhr) {
        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }
        if (errorFunction != undefined) {
            errorFunction(err, xhr);
        }
    });

}

__EProcessCommande.prototype.verifierEmail = function (email, callbackFunction, errorFunction) {
    var uri = "/api/process/nui?action=checkemail";

    $.ajax({
        url: uri, cache: false, type: 'POST',
        data: { email: email }
    }).done(function (newData) {
        if (callbackFunction != undefined) {
            callbackFunction(newData);
        }

    }).fail(function (err, xhr) {
        if (errorFunction != undefined) {
            errorFunction(err, xhr);
        }
    });
}

__EProcessCommande.prototype.creerClient = function (email, motPasse, civilite, nom, prenom, adr1, adr2, cp, ville, pays, tel, mobile, newsletters, callbackFunction, errorFunction, controleDeclencheur, mode) {
    if (typeof (mode) == "undefined" || mode == null) {
        mode = "interactive";
    }
    var tmpClick = null;
    var t = null;
    var c = null;

    if (controleDeclencheur != null) {
        if (typeof controleDeclencheur == "string") {
            if (controleDeclencheur.charAt(0) != "#")
                controleDeclencheur = "#" + controleDeclencheur;
            c = $(controleDeclencheur);
        }
        else {
            c = $(controleDeclencheur);
        }
        if (c != null) {
            c.addClass("disabled");
            t = c.get()[0]
            if (t != null) {
                tmpClick = t.onclick;
                t.onclick = function () { return false; }
            }
        }
    }

    var uri = "/api/process/nui?action=creerclient";

    $.ajax({
        url: uri, cache: false, type: 'POST',
        data: {
            email: email, pwd: motPasse,
            civilite: civilite, nom: nom, prenom: prenom,
            adresse1: adr1, adresse2: adr2,
            cp: cp, ville: ville, pays: pays,
            tel: tel, mobile: mobile,
            newsletters: newsletters,
            mode: mode
        }
    }).done(function (newData) {

        E.Process.Data = newData;
        if (__EProcessCommande.prototype.apresModification != undefined) {
            E.Process.apresModification();
        }

        if (callbackFunction != undefined) {
            callbackFunction(newData);
        }


        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }

    }).fail(function (err, xhr) {
        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }
        if (errorFunction != undefined) {
            errorFunction(err, xhr);
        }
    });
}

__EProcessCommande.prototype.creerAdresseLivraison = function (email, motPasse, civilite, nom, prenom, adr1, adr2, cp, ville, pays, tel, mobile, newsletters, callbackFunction, errorFunction, controleDeclencheur) {
    var tmpClick = null;
    var t = null;
    var c = null;

    if (controleDeclencheur != null) {
        if (typeof controleDeclencheur == "string" && !controleDeclencheur.charAt(0)=="#") {
            c = $('#' + controleDeclencheur);
        }
        else {
            c = $(controleDeclencheur);
        }
        if (c != null) {
            c.addClass("disabled");
            t = c.get()[0]
            if (t != null) {
                tmpClick = t.onclick;
                t.onclick = function () { return false; }
            }
        }
    }

    var uri = "/api/process/nui?action=creeradresselivraison";

    $.ajax({
        url: uri, cache: false, type: 'POST',
        data: {
            civilite: civilite, nom: nom, prenom: prenom,
            adresse1: adr1, adresse2: adr2,
            cp: cp, ville: ville, pays: pays,
            tel: tel, mobile: mobile,
            mode: "createonly"
        }
    }).done(function (newData) {

        E.Process.Data = newData;
        if (__EProcessCommande.prototype.apresModification != undefined) {
            E.Process.apresModification();
        }

        if (callbackFunction != undefined) {
            callbackFunction(newData);
        }


        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }

    }).error(function (err, xhr) {
        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }
        if (errorFunction != undefined) {
            errorFunction(err, xhr);
        }
    });
}

__EProcessCommande.prototype.rafraichirDepuisServeur = function () {
    $.ajax({ url: "/api/process/nui", cache: false }).done(function (newData) {
        E.Process.Data = newData;
        if (__EProcessCommande.prototype.apresModification != undefined) {
            E.Process.apresModification();
        }
    }).fail(function (err) {
        $.ajax({ url: "/api/process/nui", cache: false }).done(function (newData) {
            E.Process.Data = newData;
            if (__EProcessCommande.prototype.apresModification != undefined) {
                E.Process.apresModification();
            }
        }).fail(function (err) {
            setTimeOut(function () {
                window.location = '/exec/panier.aspx';
            }, 250);
        });
    });
}

__EProcessCommande.prototype.setOnApresModificationHandler = function (e) {
    __EProcessCommande.prototype.apresModification = e;
}


__ECrossCanal.prototype.initPopup = function (popupId, max) {
    if (max == null || typeof (max) == "undefined")
        max = 10;
    E.CrossCanal.maxCount = max;
    E.CrossCanal.dataPopupMagasin = {
        items: ko.observableArray(null), selected: ko.observable()
    };

    var elm = $("#" + popupId).get(0);
    ko.applyBindings(this.dataPopupMagasin, elm);
}

__ECrossCanal.prototype.getForGeoLoc = function (success, error, count, uniquementMortar) {
    if (!navigator.geolocation) {
        error();
    }
    else {
        navigator.geolocation.getCurrentPosition(function (position) {

            var lat = position.coords.latitude.toString();
            var lng = position.coords.longitude.toString();
            var max = 500;
            if (E.CrossCanal.maxCount == null || typeof (E.CrossCanal.maxCount) == "undefined") {
                max = 500;
            }
            else
                max = E.CrossCanal.maxCount;

            if (uniquementMortar == null || typeof (uniquementMortar) == "undefined")
                uniquementMortar = true;
            if (count != null && typeof (count) != "undefined")
                max = count;

            var url = "/api/crosscanal/nui?action=storelocator" + (uniquementMortar ? "&mortarapp=true" : "") + "&latitude=" + lat + "&longitude=" + lng + "&max=" + max;
            $.ajax({ url: url, cache: false }).done(function (data) {
                E.CrossCanal.dataPopupMagasin.items(data);
                success(data);
            }).fail(function () {
                error();
            }).always(function () {

            });

        }, function (error) {
            if (error.code == 1) {

            }
            else {
                error();
            }
        });
    }
}

__ECrossCanal.prototype.getForZone = function (zoneCode, success, error, count, uniquementMortar) {

    if (E.CrossCanal.maxCount == null || typeof (E.CrossCanal.maxCount) == "undefined") {
        max = 500;
    }
    else
        max = E.CrossCanal.maxCount;

    if (count != null && typeof (count) != "undefined")
        max = count;
    if (uniquementMortar == null || typeof (uniquementMortar) == "undefined")
        uniquementMortar = true;


    var url = "/api/crosscanal/nui?action=storelocator" + (uniquementMortar ? "&mortarapp=true" : "") + "&zonegeo=" + zoneCode + "&max=" + max;
    $.ajax({ url: url, cache: false }).done(function (data) {
        E.CrossCanal.dataPopupMagasin.items(data);
        success(data);
    }).fail(function () {
        error();
    }).always(function () {

    });

}


__ECrossCanal.prototype.getForZipCode = function (countryCodeIso3, zipCode, success, error, count, uniquementMortar) {
    if (E.CrossCanal.maxCount == null || typeof (E.CrossCanal.maxCount) == "undefined") {
        max = 500;
    }
    else
        max = E.CrossCanal.maxCount;

    if (count != null && typeof (count) != "undefined")
        max = count;
    if (uniquementMortar == null || typeof (uniquementMortar) == "undefined")
        uniquementMortar = true;

    var url = "/api/crosscanal/nui?action=storelocator" + (uniquementMortar ? "&mortarapp=true" : "") + "&pays=" + countryCodeIso3 + "&cp=" + zipCode + "&max=" + max;
    $.ajax({ url: url, cache: false }).done(function (data) {
        E.CrossCanal.dataPopupMagasin.items(data);
        success(data);
    }).fail(function () {
        error();
    }).always(function () {

    });

}

__ECrossCanal.prototype.clearPopup = function () {
    E.CrossCanal.dataPopupMagasin.items(null);
}

__ECrossCanal.prototype.selectStore = function (data) {
    E.CrossCanal.dataPopupMagasin.selected(data);
    E.Panier.associerMagasin(data.Guid, function () {
        document.location.reload();
    },
    function () {
        document.location = "/exec/ChangementMagasin.aspx?guid=" + data.Guid;
    },
    function (err) {
        window.alert(err.message);
    });

}

__ECrossCanal.prototype.clearSelectedStore = function (onServer) {
    if (onServer == null || typeof (onServer) == "undefined")
        onServer = false;
    E.CrossCanal.dataPopupMagasin.selected(null);
    if (onServer == true) {
        E.Panier.associerMagasin("{00000000-0000-0000-0000-000000000000}", function () {
            document.location.reload();
        },
        function () {
            document.location = "/exec/ChangementMagasin.aspx?guid=" + data.Guid;
        },
        function (err) {
            window.alert(err.message);
        });
    }
}


__ECustomer.prototype.creerClient = function (email, motPasse, civilite, nom, prenom, adr1, adr2, cp, ville, pays, tel, mobile, newsletters, callbackFunction, errorFunction, controleDeclencheur, mode) {
    if (typeof (mode) == "undefined" || mode == null) {
        mode = "createonly";
    }

    var tmpClick = null;
    var t = null;
    var c = null;

    if (controleDeclencheur != null) {
        if (typeof controleDeclencheur == "string") {
            if (controleDeclencheur.charAt(0) != "#")
                controleDeclencheur = "#" + controleDeclencheur;
            c = $(controleDeclencheur);
        }
        else {
            c = $(controleDeclencheur);
        }
        if (c != null) {
            c.addClass("disabled");
            t = c.get()[0]
            if (t != null) {
                tmpClick = t.onclick;
                t.onclick = function () {
                    return false;
                }
            }
        }
    }

    var uri = "/api/process/nui?action=creerclient";

    $.ajax({
        url: uri, cache: false, type: 'POST',
        data: {
            email: email, pwd: motPasse,
            civilite: civilite, nom: nom, prenom: prenom,
            adresse1: adr1, adresse2: adr2,
            cp: cp, ville: ville, pays: pays,
            tel: tel, mobile: mobile,
            newsletters: newsletters,
            mode: mode
        }
    }).done(function (newData) {

        E.Process.Data = newData;
        if (__EProcessCommande.prototype.apresModification != undefined) {
            E.Process.apresModification();
        }

        if (callbackFunction != undefined) {
            callbackFunction(newData);
        }


        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }

    }).fail(function (err, xhr) {
        if (c != null) {
            c.removeClass("disabled");
        }
        if (t != null) {
            t.onclick = tmpClick;
        }
        if (errorFunction != undefined) {
            errorFunction(err, xhr);
        }
    });
}

__ECustomer.prototype.initSaisieAdresse = function (avecCompte, containerSelector, validationLinkSelector, callback, adresseActuelle, afterValidation) {

    var currPays = "FRA";
    var telRegex = null;
    var mobileRegex = null;
    var cpRegex = null;
    var cpRefuseRegex = null;

    if (adresseActuelle != null) {
        var adrs = new Array();
        if (adresseActuelle.adresse != null)
            adrs = adresseActuelle.adresse.split("\r");
        else {
            if (adresseActuelle.adresse1 != null)
                adrs.push(adresseActuelle.adresse1);
            if (adresseActuelle.adresse2 != null)
                adrs.push(adresseActuelle.adresse2);
        }
        currPays = adresseActuelle.pays;
        $(containerSelector + " select[data-adressechamp='pays']").val(adresseActuelle.pays);
        $(containerSelector + " select[data-adressechamp='pays']").attr("disabled", "disabled");
        $(containerSelector + " input[data-adressechamp='nom']").val(adresseActuelle.nom);
        $(containerSelector + " input[data-adressechamp='prenom']").val(adresseActuelle.prenom);
        if (adrs.length > 0)
            $(containerSelector + " input[data-adressechamp='adresse']").val(adrs[0]);
        if (adrs.length > 1)
            $(containerSelector + " input[data-adressechamp='adresse2']").val(adrs[1]);
        $(containerSelector + " input[data-adressechamp='codepostal']").val(adresseActuelle.cp);
        $(containerSelector + " input[data-adressechamp='ville']").val(adresseActuelle.ville);
        $(containerSelector + " input[data-adressechamp='telephone']").val(adresseActuelle.telephone);
        $(containerSelector + " input[data-adressechamp='mobile']").val(adresseActuelle.mobile);
        $(containerSelector + " input[data-adressechamp='guid']").val(adresseActuelle.guid);
        $(containerSelector + " select[data-adressechamp='civilite']").val(adresseActuelle.civilite);
    }

    function refreshConstraints() {
        $.ajax({ url: "/api/process/nui?action=getinfopaysvente&pay_pk=" + currPays, cache: false }).done(function (data) {
            if (data.PayPk == currPays) {
                mobileRegex = data.MobileRegex;
                telRegex = data.TelRegex;
                cpRegex = data.CodePostalRegex;
                cpRefuseRegex = data.CodePostalNonAcceptesRegex;
            }
            CheckCP();
        }).fail(function (e1, e2, e3) {

        }).always(function () {

        });;
    }

    refreshConstraints();

    $(containerSelector + " select[data-adressechamp='pays']").change(function () {
        var pay = $(this).val();
        if (currPays != pay) {
            currPays = pay;
            refreshConstraints();
        }
        CheckCP();
        CheckTelephones();
    });

    $(containerSelector + " input[data-adressechamp='codepostal']").change(function () {
        CheckCP();
    });

    $(containerSelector + " input[data-adressechamp='telephone']").change(function () {
        CheckTelephones();
    });

    $(containerSelector + " input[data-adressechamp='mobile']").change(function () {
        CheckTelephones();
    });


    $(containerSelector).show();
    $(containerSelector + " select[data-adressechamp='pays']").change();

    if (avecCompte) {
        $("*[data-adressechamp='email']").show();
        $("*[data-adressechamp='motdepasse']").show();
    }

    function CheckIfAllEmpty() {
        var isAllEmpty = true;
        $.each($("INPUT[data-adressechamp]"), function (idx, obj) {
            if ($(this).val() != "") {
                isAllEmpty = false;
            }
        });
        return isAllEmpty
    }

    function ClearIfAllEmpty(field, div, divAide) {
        var c = field.val();
        if (c == "") {
            if (CheckIfAllEmpty()) {
                field.removeClass("error");
                div.hide();
                if (divAide != null && divAide != undefined)
                    divAide.hide();
            }
        }
    }

    function CheckMandatoryField(field, div, divAide, canIgnore) {

        if (canIgnore == null || canIgnore == undefined) {
            canIgnore = true;
        }

        if (canIgnore) {
            if (CheckIfAllEmpty()) {
                field.removeClass("error");
                div.hide();
                if (divAide != null && divAide != undefined)
                    divAide.show();
                if (afterValidation != null && afterValidation != undefined)
                    afterValidation();
                return false;
            }
        }

        var c = field.val();
        field.removeClass("error");
        if (c == "" && field.is(":visible")) {
            field.addClass("error");
            div.show();
        }
        else {
            div.hide();
        }
        if (divAide != null && divAide != undefined)
            divAide.hide();
        if (afterValidation != null && afterValidation != undefined)
            afterValidation();

        return c == "";
    }
    function SetMandatoryField(field, div, divAide) {
        field.focusin(function (e) {
            if (divAide != null && divAide != undefined) {
                div.hide();
                divAide.show();
            }
        });
        field.focusout(function (e) {
            CheckMandatoryField($(this), div, divAide);

            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='nom']"), $(containerSelector + " *[data-adresseerreur='nomvide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='adresse']"), $(containerSelector + " *[data-adresseerreur='adressevide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='motdepasse']"), $(containerSelector + " *[data-adresseerreur='motdepassevide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='codepostal']"), $(containerSelector + " *[data-adresseerreur='codepostalvide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='ville']"), $(containerSelector + " *[data-adresseerreur='villevide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='email']"), $(containerSelector + " *[data-adresseerreur='emailvide']"), $(containerSelector + " *[data-adresseaide='email']"));


            var tel = $(containerSelector + " *[data-adressechamp='telephone']").val();
            var mobile = $(containerSelector + " *[data-adressechamp='mobile']").val();

            if (tel == "" && mobile == "") {
                if (CheckIfAllEmpty()) {
                    $(containerSelector + " input[data-adressechamp='telephone']").removeClass("error");
                    $(containerSelector + " *[data-adresseerreur='telephonevide']").hide();
                    if (afterValidation != null && afterValidation != undefined)
                        afterValidation();
                }
                else {

                }
            }
        });
    }
    function CheckCP() {
        if (cpRegex == null)
            return;
        var field = $(containerSelector + " input[data-adressechamp='codepostal']");
        var cp = field.val();
        var cpReg = new RegExp(cpRegex);
        var cpHorsMetropople = new RegExp(cpRefuseRegex);

        if (cp == "") {
            if (CheckIfAllEmpty()) {
                field.removeClass("error");
                $(containerSelector + " *[data-adresseerreur='codepostalvide']").hide();
                $(containerSelector + " *[data-adresseerreur='codepostal']").hide();
                $(containerSelector + " *[data-adresseerreur='codepostalrefuse']").hide();
            }
            else {
                field.addClass("error");
                $(containerSelector + " *[data-adresseerreur='codepostalvide']").show();
                $(containerSelector + " *[data-adresseerreur='codepostal']").hide();
                $(containerSelector + " *[data-adresseerreur='codepostalrefuse']").hide();
            }

            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='nom']"), $(containerSelector + " *[data-adresseerreur='nomvide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='adresse']"), $(containerSelector + " *[data-adresseerreur='adressevide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='motdepasse']"), $(containerSelector + " *[data-adresseerreur='motdepassevide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='codepostal']"), $(containerSelector + " *[data-adresseerreur='codepostalvide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='ville']"), $(containerSelector + " *[data-adresseerreur='villevide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='email']"), $(containerSelector + " *[data-adresseerreur='emailvide']"), $(containerSelector + " *[data-adresseaide='email']"));


        }
        else if (cpHorsMetropople.test(cp)) {
            field.addClass("error");
            $(containerSelector + " *[data-adresseerreur='codepostalvide']").hide();
            $(containerSelector + " *[data-adresseerreur='codepostal']").hide();
            $(containerSelector + " *[data-adresseerreur='codepostalrefuse']").show();
        }
        else if (!cpReg.test(cp) || RegExp.rightContext != "") {
            field.addClass("error");
            $(containerSelector + " *[data-adresseerreur='codepostalvide']").hide();
            $(containerSelector + " *[data-adresseerreur='codepostal']").show();
            $(containerSelector + " *[data-adresseerreur='codepostalrefuse']").hide();
        }
        else {
            field.removeClass("error");
            $(containerSelector + " *[data-adresseerreur='codepostal']").hide();
            $(containerSelector + " *[data-adresseerreur='codepostalvide']").hide();
            $(containerSelector + " *[data-adresseerreur='codepostalrefuse']").hide();
        }

        if (afterValidation != null && afterValidation != undefined)
            afterValidation();
    }

    //$(containerSelector + " *[data-adressechamp='linkreplaceemail']").click(function (e) {
    //    var email = $(this).html();
    //    $(containerSelector + "").val(email);
    //    E.Process.verifierEmail(email, function (data) {
    //        if (data.EstDejaExistante) {
    //            $(containerSelector + " *[data-adresseerreur='emailsuggestion']").hide();
    //            $(containerSelector + " *[data-adresseerreur='emailexistant']").show();
    //            $(containerSelector + " *[data-adressechamp='linkreplaceemail']").html('');
    //        }
    //        else if (data.Suggestion != null && data.Suggestion != email) {
    //            $(containerSelector + " *[data-adresseerreur='emailsuggestion']").show();
    //            $(containerSelector + " *[data-adresseerreur='emailexistant']").hide();
    //            $(containerSelector + " *[data-adressechamp='linkreplaceemail']").html(data.Suggestion);
    //        }
    //        else {
    //            $(containerSelector + " *[data-adresseerreur='emailsuggestion']").hide();
    //            $(containerSelector + " *[data-adresseerreur='emailexistant']").hide();
    //            $(containerSelector + " *[data-adressechamp='linkreplaceemail']").html('');
    //        }
    //    });
    //    return false;
    //});

    $(containerSelector).keypress(function (e) {
        if (e.which == 13) {
            setTimeout(function () {
                $(containerSelector + " input").blur();
                $(containerSelector + " select").blur();
                if (!$(validationLinkSelector).hasClass("disabled"))
                    $(validationLinkSelector).click();

            }, 100);
            return false;
        }
        else {
            $(containerSelector + " INPUT").removeClass("error");
        }
    });

    $(containerSelector + " input[data-adressechamp='email']").focusin(function (e) {
        if ($(containerSelector + " *[data-adresseerreur='emailinvalide']").is(":visible"))
            return false;
        if ($(containerSelector + " *[data-adresseerreur='emailexistant']").is(":visible"))
            return false;
        if ($(containerSelector + " *[data-adresseerreur='emailsuggestion']").is(":visible"))
            return false;
        $(containerSelector + " *[data-adresseerreur='emailvide']").hide();
        $(containerSelector + " *[data-adresseaide='email']").show();
    });

    $(containerSelector + " input[data-adressechamp='email']").blur(function (e) {
        $(containerSelector + " *[data-adresseaide='email']").hide();
        var email = $(this).val();
        var checkExp = /^([a-zA-Z0-9])([a-zA-Z0-9_\.\-])+\@([a-zA-Z0-9])(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
        if (email == "") {
            if (CheckIfAllEmpty()) {
                $(this).removeClass("error");
                $(containerSelector + " *[data-adresseerreur='emailvide']").hide();
                $(containerSelector + " *[data-adresseerreur='emailinvalide']").hide();
            }
            else {
                $(this).addClass("error");
                $(containerSelector + " *[data-adresseerreur='emailvide']").show();
                $(containerSelector + " *[data-adresseerreur='emailinvalide']").hide();
            }

            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='nom']"), $(containerSelector + " *[data-adresseerreur='nomvide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='adresse']"), $(containerSelector + " *[data-adresseerreur='adressevide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='motdepasse']"), $(containerSelector + " *[data-adresseerreur='motdepassevide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='codepostal']"), $(containerSelector + " *[data-adresseerreur='codepostalvide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='ville']"), $(containerSelector + " *[data-adresseerreur='villevide']"), null);
            ClearIfAllEmpty($(containerSelector + " *[data-adressechamp='email']"), $(containerSelector + " *[data-adresseerreur='emailvide']"), $(containerSelector + " *[data-adresseaide='email']"));

        }
        else if (checkExp.test(email)) {
            $(this).removeClass("error");
            $(containerSelector + " *[data-adresseerreur='emailvide']").hide();
            $(containerSelector + " *[data-adresseerreur='emailinvalide']").hide();

            E.Process.verifierEmail(email, function (data) {
                if (data.EstDejaExistante) {
                    $(this).addClass("error");
                    $(containerSelector + " *[data-adresseerreur='emailsuggestion']").hide();
                    $(containerSelector + " *[data-adresseerreur='emailexistant']").show();
                    $(containerSelector + " *[data-adressechamp='linkreplaceemail']").html('');
                }
                else if (data.Suggestion != null && data.Suggestion != email) {
                    $(containerSelector + " *[data-adresseerreur='emailsuggestion']").show();
                    $(containerSelector + " *[data-adresseerreur='emailexistant']").hide();
                    $(containerSelector + " *[data-adressechamp='linkreplaceemail']").html(data.Suggestion);
                }
                else {
                    $(containerSelector + " *[data-adresseerreur='emailsuggestion']").hide();
                    $(containerSelector + " *[data-adresseerreur='emailexistant']").hide();
                    $(containerSelector + " *[data-adressechamp='linkreplaceemail']").html('');
                }
            });

        }
        else {

            $(this).addClass("error");
            $(containerSelector + " *[data-adresseerreur='emailvide']").hide();
            $(containerSelector + " *[data-adresseerreur='emailinvalide']").show();
        }

        if (afterValidation != null && afterValidation != undefined)
            afterValidation();
    });

    SetMandatoryField($(containerSelector + " INPUT[data-adressechamp='motdepasse']"), $(containerSelector + " *[data-adresseerreur='motdepassevide']"), $(containerSelector + " *[data-adresseaide='motdepasse']"));
    SetMandatoryField($(containerSelector + " INPUT[data-adressechamp='nom']"), $(containerSelector + " *[data-adresseerreur='nomvide']"));
    SetMandatoryField($(containerSelector + " INPUT[data-adressechamp='adresse']"), $(containerSelector + " *[data-adresseerreur='adressevide']"));
    SetMandatoryField($(containerSelector + " INPUT[data-adressechamp='ville']"), $(containerSelector + " *[data-adresseerreur='villevide']"));

    //$(containerSelector + " *[data-adressechamp='ville']").focusin(function (e) {
    //    $(containerSelector + " *[data-adresseerreur='villevide']").hide();
    //    $(containerSelector + " *[data-adresseerreur='ville']").hide();
    //});
    //$(containerSelector + " *[data-adressechamp='ville']").focusout(function (e) {
    //    if (!CheckMandatoryField($(this), $(containerSelector + " *[data-adresseerreur='villevide']"))) {
    //        var ville = $(containerSelector + " *[data-adressechamp='ville']").val();
    //        var villeReg = /[a-zA-Z].*/;
    //        if (!villeReg.test(ville) || RegExp.rightContext != "" || RegExp.leftContext != "") {
    //            $(containerSelector + " *[data-adresseerreur='ville']").show();
    //        }
    //        else {
    //            $(containerSelector + " *[data-adresseerreur='ville']").hide();
    //        }

    //    }
    //});

    //$(containerSelector + " *[data-adressechamp='codepostal']").keypress(function (e) {
    //    if (e.which == 0) {
    //        return;
    //    }
    //    else if (e.which == 13) {
    //        return;
    //    }
    //    else if (e.which == 8) {
    //        return;
    //    }
    //    else if (e.which == 46) {
    //        return;
    //    }
    //    else if (e.which >= 35 && e.which <= 40) {
    //        return;
    //    }
    //    else if (e.which == 27) {
    //        return;
    //    }
    //    var pay = $(containerSelector + " select[data-adresseerreur='pays']").val();
    //    var cpact = $(containerSelector + " *[data-adressechamp='codepostal']").val().trimEnd().trimStart();
    //    var s = String.fromCharCode(e.which).toUpperCase();
    //    if (!isNaN(parseInt(s))) {
    //    }
    //    else if ((s == "A" || s == "B") && pay == "FRA" && cpact == "2") {
    //    }
    //    else {
    //        e.preventDefault();
    //        return false;
    //    }
    //});

    $(containerSelector + " *[data-adressechamp='telephone']").keypress(function (e) {
        if (e.which == 0) {
            return;
        }
        else if (e.which == 13) {
            return;
        }
        else if (e.which == 8) {
            return;
        }
        else if (e.which == 46) {
            return;
        }
        else if (e.which >= 35 && e.which <= 40) {
            return;
        }
        else if (e.which == 27) {
            return;
        }
        var act = $(containerSelector + " *[data-adressechamp='telephone']").val().trimEnd().trimStart();
        var s = String.fromCharCode(e.which).toUpperCase();
        if (!isNaN(parseInt(s))) {
        }
        else if (s == " " || s == "." || s == "-" || s == "/") {
        }
        else if (s == "+" && (act == "" || caretPosition($(containerSelector + " *[data-adressechamp='telephone']").get(0)) == 0)) {
        }
        else if (s == ")" || s == "(") {
        }
        else {
            e.preventDefault();
            return false;
        }
    });

    function caretPosition(ctrl) {
        var CaretPos = 0;
        if (document.selection) {
            ctrl.focus();
            var Sel = document.selection.createRange();
            Sel.moveStart('character', -ctrl.value.length);
            CaretPos = Sel.text.length;
        }
        else if (ctrl.selectionStart || ctrl.selectionStart == '0')
            CaretPos = ctrl.selectionStart;
        return (CaretPos);
    }


    $(containerSelector + " input[data-adressechamp='codepostal']").focusin(function (e) {
        $(containerSelector + " *[data-adresseerreur='codepostalvide']").hide();
        $(containerSelector + " *[data-adresseerreur='codepostalerreur']").hide();
    });
    $(containerSelector + " input[data-adressechamp='codepostal']").focusout(function (e) {
        if (!CheckMandatoryField($(this), $(containerSelector + " *[data-adresseerreur='codepostalvide']"))) {
            CheckCP();
        }
    });


    $(containerSelector + " input[data-adressechamp='telephone']").focusin(function (e) {
        if ($(containerSelector + " *[data-adresseerreur='telephonevide']").is(":visible"))
            return false;
        if ($(containerSelector + " *[data-adresseerreur='mobilevide']").is(":visible"))
            return false;
        if ($("#divCreationTelephoneErreur").is(":visible"))
            return false;
        if ($("#divCreationMobileErreurStyleTelephoneCHE").is(":visible"))
            return false;
        if ($("#divCreationMobileErreurStyleTelephone").is(":visible"))
            return false;
        $(containerSelector + " *[data-adresseaide='telephone']").show();
    });

    $(containerSelector + " input[data-adressechamp='telephone']").focusout(function (e) {

        CheckTelephones();
    });

    function CheckTelephones() {
        var telField = $(containerSelector + " *[data-adressechamp='telephone']");
        var tel = telField.val().trimEnd().trimStart();
        var mobileField = $(containerSelector + " *[data-adressechamp='mobile']");
        var mobile = mobileField.val().trimEnd().trimStart();
        var telReg = new RegExp(telRegex);
        var mobileReg = new RegExp(mobileRegex);
        $(containerSelector + " *[data-adresseerreur='telephonevide']").hide();
        $(containerSelector + " *[data-adresseaide='telephone']").hide();
        $(containerSelector + " *[data-adresseerreur='mobilevide']").hide();

        var pay = $(containerSelector + " select[data-adresseerreur='pays']").val();

        $("#divCreationMobileErreurStyleTelephone").hide();
        if (tel != "" && !telReg.test(tel) || RegExp.rightContext != "") {
            $(containerSelector + " *[data-adresseerreur='telephone']").show();
            telField.addClass("error");
        }
        else {
            $(containerSelector + " *[data-adresseerreur='telephone']").hide();
            telField.removeClass("error");
        }

        //if (mobile != "" && mobilePasReg.test(mobile)) {
        //    $("#divCreationMobileErreurPaysTelephone").hide();
        //    $("#divCreationMobileErreurStyleTelephone").show();
        //    $(containerSelector + " *[data-adresseerreur='mobilevide']").hide();
        //    mobileField.addClass("error");
        //}
        //else 
        if (mobile != "" && !mobileReg.test(mobile) || RegExp.rightContext != "") {
            mobileField.addClass("error");
            $(containerSelector + " *[data-adresseerreur='mobile']").show();
        }
        else {
            mobileField.removeClass("error");
            $(containerSelector + " *[data-adresseerreur='mobile']").hide();
        }


        if (afterValidation != null && afterValidation != undefined)
            afterValidation();

    }

    $(validationLinkSelector).click(function (e) {

        var ok = true;
        ok |= CheckMandatoryField($(containerSelector + " *[data-adressechamp='motdepasse']"), $(containerSelector + " *[data-adresseerreur='motdepassevide']"), $(containerSelector + " *[data-adresseaide='motdepasse']"), null, false);
        ok |= CheckMandatoryField($(containerSelector + " *[data-adressechamp='nom']"), $(containerSelector + " *[data-adresseerreur='nomvide']"), null, false);
        ok |= CheckMandatoryField($(containerSelector + " *[data-adressechamp='adresse']"), $(containerSelector + " *[data-adresseerreur='adressevide']"), null, false);
        ok |= CheckMandatoryField($(containerSelector + " *[data-adressechamp='codepostal']"), $(containerSelector + " *[data-adresseerreur='codepostalvide']"), null, false);
        ok |= CheckMandatoryField($(containerSelector + " *[data-adressechamp='ville']"), $(containerSelector + " *[data-adresseerreur='villevide']"), null, false);
        ok |= CheckMandatoryField($(containerSelector + " *[data-adressechamp='email']"), $(containerSelector + " *[data-adresseerreur='emailvide']"), $(containerSelector + " *[data-adresseaide='email']"), false);

        var tel = $(containerSelector + " *[data-adressechamp='telephone']").val();
        var mobile = $(containerSelector + " *[data-adressechamp='mobile']").val();

        if (tel == "" && mobile == "") {
            $(containerSelector + " *[data-adresseerreur='telephonevide']").show();
        }

        if (afterValidation != null && afterValidation != undefined)
            afterValidation();




        if ($(containerSelector + " *[data-adresseerreur='nom']").is(":visible")) {
            $(containerSelector + " input[data-adressechamp='nom']").focus();
            if (afterValidation != null && afterValidation != undefined)
                afterValidation();
            return false;
        }

        if ($(containerSelector + " *[data-adresseerreur='nomvide']").is(":visible")) {
            $(containerSelector + " input[data-adressechamp='nom']").focus();
            if (afterValidation != null && afterValidation != undefined)
                afterValidation();
            return false;
        }

        if ($(containerSelector + " *[data-adresseerreur='motdepassevide']").is(":visible")) {
            $(containerSelector + " input[data-adressechamp='motdepasse']").focus();
            if (afterValidation != null && afterValidation != undefined)
                afterValidation();
            return false;
        }

        if ($(containerSelector + " *[data-adresseerreur='emailinvalide']").is(":visible")
          || $(containerSelector + " *[data-adresseerreur='emailexistant']").is(":visible")) {
            $(containerSelector + " *[data-adressechamp='email']").focus();
            if (afterValidation != null && afterValidation != undefined)
                afterValidation();
            return false;
        }
        if ($(containerSelector + " *[data-adresseerreur='adresse']").is(":visible")) {
            $(containerSelector + " input[data-adressechamp='adresse']").focus();
            if (afterValidation != null && afterValidation != undefined)
                afterValidation();
            return false;
        }
        if ($(containerSelector + " *[data-adresseerreur='codepostal']").is(":visible")) {
            $(containerSelector + " input[data-adressechamp='codepostal']").focus();
            if (afterValidation != null && afterValidation != undefined)
                afterValidation();
            return false;
        }

        if ($(containerSelector + " *[data-adresseerreur='codepostalrefuse']").is(":visible")) {
            $(containerSelector + " input[data-adressechamp='codepostal']").focus();
            if (afterValidation != null && afterValidation != undefined)
                afterValidation();
            return false;
        }

        if ($(containerSelector + " *[data-adresseerreur='ville']").is(":visible")) {
            $(containerSelector + " input[data-adressechamp='ville']").focus();
            if (afterValidation != null && afterValidation != undefined)
                afterValidation();
            return false;
        }
        if ($(containerSelector + " *[data-adresseerreur='telephonevide']").is(":visible")) {
            $(containerSelector + " input[data-adressechamp='telephone']").focus();
            if (afterValidation != null && afterValidation != undefined)
                afterValidation();
            return false;
        }
        if ($(containerSelector + " *[data-adresseerreur='telephone']").is(":visible")) {
            $(containerSelector + " input[data-adressechamp='telephone']").focus();
            if (afterValidation != null && afterValidation != undefined)
                afterValidation();
            return false;
        }
        if ($(containerSelector + " *[data-adresseerreur='mobilevide']").is(":visible")) {
            $(containerSelector + " input[data-adressechamp='mobile']").focus();
            if (afterValidation != null && afterValidation != undefined)
                afterValidation();
            return false;
        }

        if ($(containerSelector + " *[data-adresseerreur='nom']").is(":visible")) {
            $(containerSelector + " *[data-adressechamp='telephone']").focus();
            if (afterValidation != null && afterValidation != undefined)
                afterValidation();

            return false;
        }

        $(containerSelector + " input").attr('disabled', 'disabled');
        $(containerSelector + " select").attr('disabled', 'disabled');

        var c = {
            email: $(containerSelector + " *[data-adressechamp='email']").val(),
            password: $(containerSelector + " *[data-adressechamp='motdepasse']").val(),
            civilite: $(containerSelector + " select[data-adressechamp='civilite']").val(),
            nom: $(containerSelector + " *[data-adressechamp='nom']").val(),
            prenom: $(containerSelector + " input[data-adressechamp='prenom']").val(),
            adresse1: $(containerSelector + " *[data-adressechamp='adresse']").val(),
            adresse2: $(containerSelector + " input[data-adressechamp='adresse2']").val(),
            cp: $(containerSelector + " *[data-adressechamp='codepostal']").val(),
            ville: $(containerSelector + " *[data-adressechamp='ville']").val(),
            pays: $(containerSelector + " select[data-adressechamp='pays']").val(),
            telephone: $(containerSelector + " *[data-adressechamp='telephone']").val(),
            mobile: $(containerSelector + " *[data-adressechamp='mobile']").val(),
            guid: $(containerSelector + " input[data-adressechamp='guid']").val()
        };
        if (typeof callback != "undefined") {
            callback(c);
        }
        return false;
    });

}

function ReactiverSaisieAdresse(viderLesChamps) {
    $(containerSelector + " input").removeAttr('disabled');
    $(containerSelector + " select").removeAttr('disabled');
    if (viderLesChamps) {
        $(containerSelector + " input").val("");
        $(containerSelector + " select").val(function (index, val) {
            if (index == 0)
                return true;
            return false;
        });
    }
}


__ECustomer.prototype.ReactiverSaisieAdresse = function (viderLesChamps) {
    $(containerSelector + " input").removeAttr('disabled');
    $(containerSelector + " select").removeAttr('disabled');
    if (viderLesChamps) {
        $(containerSelector + " input").val("");
        $(containerSelector + " select").val(function (index, val) {
            if (index == 0)
                return true;
            return false;
        });
    }
}


__ESuggest.prototype.init = function (popupSelector, searchTextBoxSelector, getDataCallBack) {

    E.Suggest.dataPopupMagasin = {
        elements: ko.observableArray(null)
    };
    E.Suggest.idPopupInterval = -1;
    E.Suggest.popupControl = $(popupSelector);
    var elm = E.Suggest.popupControl.get(0);
    ko.applyBindings(this.dataPopupMagasin, elm);

    var boxes = $(searchTextBoxSelector);
    boxes.keyup(function (e) {
        if (E.Suggest.idPopupInterval > 0)
            clearTimeout(E.Suggest.idPopupInterval);
        var self = $(this);
        var text = self.val();
        if (text == "") {
            E.Suggest.hidePopup();
        }
        else {
            E.Suggest.idPopupInterval = setTimeout(function () {
                text = self.val();
                if (getDataCallBack == null) {
                    E.Suggest.doSuggest(text);
                }
                else {
                    getDataCallBack(text);
                }
            }, 50);
        }
    });
    boxes.focusout(function () {
        setTimeout(function () {
            E.Suggest.hidePopup();
        }, 100);
    });
}

__ESuggest.prototype.get = function (observableArray, type) {
    var a = new Array();
    var r = observableArray();
    if (r == null)
        return a;
    for (var i = 0; i < r.length; i++) {
        if (type == r[i].Category)
            a.push(r[i]);
    }
    return a;
}

__ESuggest.prototype.hasElements = function (observableArray, type) {
    var r = observableArray();
    if (r == null)
        return false;
    for (var i = 0; i < r.length; i++) {
        if (type == r[i].Category)
            return true;
    }

    return false;
}

__ESuggest.prototype.doSuggest = function (value) {
    $.ajax("/api/catalog/nui/suggest?$search=" + encodeURIComponent(value), {
        cache: false
    }).done(function (data) {
        E.Suggest.showResults(data);
    }).fail(function () {

    });
}

__ESuggest.prototype.showResults = function (data) {
    if (typeof (data) == "string")
        data = JSON.parse(data);
    E.Suggest.dataPopupMagasin.elements(data);
    if (E.Suggest.popupControl != null)
        E.Suggest.popupControl.fadeIn();



}

__ESuggest.prototype.hidePopup = function () {
    if (E.Suggest.popupControl != null)
        E.Suggest.popupControl.fadeOut();
}


E = new __E();



$.fn.JQueryValidationHighlighter = function (control, classValid, classInvalid, classUnknown) {
    var $root = $(control);
    control.classValid = classValid;
    control.classInvalid = classInvalid;
    control.classUnknown = classUnknown;
};
$(document).ready(function () {
    if (window.ValidatorOnChange && !window._ValidatorOnChange) {
        window._ValidatorOnChange = window.ValidatorOnChange;
        window.ValidatorOnChange = function (ev) {
            window._ValidatorOnChange(ev);
            try { ev = $.event.fix(ev); } catch (err) { ev = null; }
            if (ev == null) { ev = $.event.fix(event); }
            var $input = $(ev.target);
            var $label = $("label[for='" + $input.attr("id") + "']");
            var $callout = $input.data("callout");
            var vals = $input.attr("Validators");
            $input.classValid = $input.attr("classValid");
            $input.classInvalid = $input.attr("classInvalid");
            $input.classUnknown = $input.attr("classUnknown");

            if (window.AllValidatorsValid && window.AllValidatorsValid(vals)) {
                if ($input.hasClass($input.classUnknown)) {
                    $input.removeClass($input.classUnknown);
                    $label.removeClass($input.classUnknown);
                }
                if ($input.hasClass($input.classInvalid)) {
                    $input.removeClass($input.classInvalid);
                    $label.removeClass($input.classInvalid);
                }
                if (!$input.hasClass($input.classValid)) {
                    $input.addClass($input.classValid);
                    $label.addClass($input.classValid);
                }
            }
            else {
                if ($input.hasClass($input.classUnknown)) {
                    $input.removeClass($input.classUnknown);
                    $label.removeClass($input.classUnknown);
                }
                if ($input.hasClass($input.classValid)) {
                    $input.removeClass($input.classValid);
                    $label.removeClass($input.classValid);
                }
                if (!$input.hasClass($input.classInvalid)) {
                    $input.addClass($input.classInvalid);
                    $label.addClass($input.classInvalid);
                }
            }
        };
    };
});

