<%@ Control Language="C#" AutoEventWireup="true" %>
<%@ Assembly Name="CPointSoftware.ECommerce.Tools" %>
<%@ Import Namespace="CPointSoftware.ECommerce.Tools" %>

<script runat="server">

    public string CodePays { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PanierProvider prv = ECommerceServer.Panier;

            if (string.IsNullOrEmpty(CodePays))
            {
                cboCreationPays.Items.Add(new ListItem("France", "FRA"));

            }
            else
            {
                switch (CodePays.ToUpper())
                {
                    default:
                        cboCreationPays.Items.Add(new ListItem("France", "FRA"));
                        break;
                }
            }


            try
            {
                cboCreationPays.SelectedValue = prv.AdresseLivraisonCodePays;
            }
            catch
            {
            }
        }
    }
</script>

<div class="row" id="divSaisieAdresseContainer">
    <div class="col-md-6 bloc-info">
        <h4>Vos informations</h4>
        <div class="form-group form-icon">
            <div class="icon">
                <i class="fas fa-envelope"></i>
            </div>
            <div class="input-group">
                <input type="e-mail" id="txtCreationEMail" maxlength="100" />
                <label for="input" class="control-label">Votre email</label>
                <i class="bar"></i>
            </div>
        </div>
        <div class="error-messages-saisie-adresse">
            <div id="divCreationEMailDejaExistant" class="erreur" style="display: none">Cet e-mail existe déjà</div>
            <div id="divCreationEMailVide" class="erreur" style="display: none">Merci de saisir votre e-mail</div>
            <div id="divCreationEMailErreur" class="erreur" style="display: none">E-mail non valide </div>
            <div id="divCreationEMailAide" class="aide" style="display: none">Votre email vous permettra de vous connecter à votre espace client</div>
            <div id="divCreationEMailSuggestions" class="suggestion" style="display: none">
                Vouliez vous dire : <a href="#" id="lnkCreationEMailReplace"></a>?
            </div>
        </div>


        <div class="form-group form-icon" id="pCreatePassword" style="display: none">
            <div class="icon">
                <i class="fas fa-lock"></i>
            </div>
            <div class="input-group">

                <input type="password" id="txtCreationPassword" maxlength="40" />
                <label for="input" class="control-label">Votre mot de passe</label>
                <i class="bar"></i>
            </div>
        </div>
        <div class="error-messages-saisie-adresse">
            <div id="divCreationPasswordAide" class="aide" style="display: none">Le mot de passe doit comporter 5 caractères minimum (au moins une lettre et un chiffre)</div>
            <div id="divCreationPasswordVide" class="erreur" style="display: none">
                Mot de passe non valide
            </div>
        </div>

        <div class=" select-material form-icon">
            <div class="icon">
                <i class="fas fa-user"></i>
            </div>
            <div class="input-group">
                <label for="label-material">Civilité</label>
                <div class="sel-wrap">
                    <select id="cboCreationCivilite" style="width:100%" class="js-select2 floating-label">
                        <option selected="selected">M.</option>
                        <option>Mlle.</option>
                        <option>Mme.</option>
                        <option>---</option>
                        <option>Association</option>
                        <option>SARL</option>
                        <option>SA</option>
                        <option>EURL</option>
                    </select>
                    <div class='bar'>
                        <span></span>
                    </div>
                </div>
            </div>
        </div>

        <div class="form-group form-icon">
            <div class="icon">
                <i class="fas fa-user"></i>
            </div>
            <div class="input-group">
                <input type="text" id="txtCreationNom" maxlength="100" autocomplete="on" />
                <label for="input" class="control-label">Nom</label>
                <i class="bar"></i>
            </div>
        </div>

        <div class="form-group form-icon">
            <div class="icon">
                <i class="fas fa-user"></i>
            </div>
            <div class="input-group">
                <input type="text" id="txtCreationPrenom" maxlength="100" autocomplete="on" placeholder="" />
                <label for="input" class="control-label">Prénom</label>
                <i class="bar"></i>
            </div>
        </div>
        <div class="form-group error-messages-saisie-adresse">
            <div id="divCreationNomVide" class="erreur" style="display: none">Merci de saisir votre nom</div>
            <div id="divCreationPrenomVide" class="erreur" style="display: none">Merci de saisir votre prénom</div>
        </div>


        <div class="checkbox" id="pNewsletters">
            <label>
                <input type="checkbox" name="newsletter" value="3,11" id="rdoNewsletters1">
                <i class="helper"></i>
                M'inscrire à la newsletter
            </label>
        </div>

    </div>


    <!-- 2eme colonne -->


    <div class="col-md-6 bloc-adresse">
        <h4>Adresse du domicile de livraison</h4>


        <div class=" select-material form-icon">
            <div class="icon">
                <i class="fas fa-map-marker-alt"></i>
            </div>
            <div class="input-group">
                <label for="label-material">Pays</label>
                <div class="sel-wrap">
                    <asp:DropDownList runat="server" ID="cboCreationPays" ClientIDMode="static" style="width:100%" class="js-select2 floating-label">
                    </asp:DropDownList>
                    <div class='bar'>
                        <span></span>
                    </div>
                </div>
            </div>
        </div>


        <div class="form-group form-icon">
            <div class="icon">
                <i class="fas fa-home"></i>
            </div>
            <div class="input-group">
                <input type="text" id="txtCreationAdr1" maxlength="100" autocomplete="on" />
                <label for="input" class="control-label">Votre adresse</label>
                <i class="bar"></i>
            </div>
        </div>

        <div class="error-messages-saisie-adresse">
            <div id="divCreationAdr1Vide" class="erreur" style="display: none">Merci de saisir votre adresse</div>
        </div>

        <div class="form-group form-icon">
            <div class="icon"></div>
            <div class="input-group">
                <input type="text" id="txtCreationAdr2" maxlength="100" autocomplete="on" />
                <i class="bar"></i>
            </div>
        </div>

        <div class="form-group form-icon">
            <div class="icon">
                <i class="fas fa-map-signs"></i>
            </div>
            <div class="row">
                <div class="input-group col-4">
                    <input type="tel" id="txtCreationCP" maxlength="5" autocomplete="on" />
                    <label for="input" class="control-label">Code postal</label>
                    <i class="bar"></i>
                </div>
                <div class="input-group col-8">
                    <input type="text" id="txtCreationVille" maxlength="100" autocomplete="on" />
                    <label for="input" class="control-label">Ville</label>
                    <i class="bar"></i>
                </div>
            </div>
        </div>

        <div class="error-messages-saisie-adresse">
            <div id="divCreationCPVide" class="erreur" style="display: none">Merci de saisir votre code postal</div>
            <div id="divCreationCPErreur" class="erreur" style="display: none">Vérifiez votre code postal</div>
            <div id="divCreationCPErreurHorsFrance" class="erreur" style="display: none">Livraison en France Metropolitaine seulement</div>
            <div id="divCreationCPErreurRdv" class="erreur" style="display: none">Les livraisons sur rendez-vous ne sont disponibles que sur Paris, veuillez choisir un autre mode de livraison.</div>
            <div id="divCreationVilleVide" class="erreur" style="display: none">Merci de saisir votre ville</div>
            <div id="divCreationVilleErreur" class="erreur" style="display: none">Veuillez saisir une ville valide</div>
        </div>



        <div class="form-group form-icon">
            <div class="icon">
                <i class="fas fa-phone"></i>
            </div>
            <div class="input-group">
                <input type="tel" class="tel" id="txtCreationTelephone" maxlength="20" autocomplete="on" />
                <label for="input" class="control-label">Téléphone</label>
                <i class="bar"></i>
            </div>
        </div>

        <div class="form-group form-icon">
            <div class="icon">
                <i class="fas fa-phone"></i>
            </div>
            <div class="input-group">
                <input type="tel" class="tel" id="txtCreationMobile" maxlength="20" autocomplete="on" />
                <label for="input" class="control-label">Mobile</label>
                <i class="bar"></i>
            </div>
        </div>
        <div class="error-messages-saisie-adresse">

            <div id="divCreationTelVide" class="erreur" style="display: none">Merci de saisir au moins un numéro de téléphone.</div>
            <div id="divCreationTelephoneErreurPaysTelephone" class="erreur" style="display: none">Votre numéro de téléphone ne semble pas correspondre à votre pays</div>
            <div id="divCreationTelephoneErreur" class="erreur" style="display: none">
                Votre numéro de téléphone n'est pas valide.<br />
                Merci de le vérifier
            </div>
            <div id="divCreationMobileErreur" class="erreur" style="display: none">
                Votre numéro de mobile n'est pas valide.<br />
                Merci de le vérifier
            </div>
            <div id="divCreationMobileErreurStyleTelephoneCHE" class="erreur" style="display: none">Le n° mobile doit commencer par 07</div>
            <div id="divCreationMobileErreurStyleTelephone" class="erreur" style="display: none">Le n° mobile doit commencer par 06 ou 07</div>
            <div id="divCreationMobileErreurPaysTelephone" class="erreur" style="display: none">Votre numéro de mobile ne semble pas correspondre à votre pays</div>
            <div id="divCreationTelAide" class="aide" style="display: none">Pour la livraison merci de nous fournir un numéro de téléphone ou mobile</div>
        </div>

    </div>
</div>
<script type="text/javascript">
    function SaisieAdresse(avecCompte, linkSelector, callback, adresseActuelle) {

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
            $("#cboCreationPays").val(adresseActuelle.pays);
            $("#cboCreationPays").attr("disabled", "disabled");
            $("#txtCreationNom").val(adresseActuelle.nom);
            $("#txtCreationPrenom").val(adresseActuelle.prenom);
            if (adrs.length > 0)
                $("#txtCreationAdr1").val(adrs[0]);
            if (adrs.length > 1)
                $("#txtCreationAdr2").val(adrs[1]);
            $("#txtCreationCP").val(adresseActuelle.cp);
            $("#txtCreationVille").val(adresseActuelle.ville);
            $("#txtCreationTelephone").val(adresseActuelle.telephone);
            $("#txtCreationMobile").val(adresseActuelle.mobile);
            $("#hdnGuid").val(adresseActuelle.guid);
        }

        $("#rdoNewsletters1").change(function () {
            Adresse_CheckNewsletters();
        });
        $("#rdoNewsletters2").change(function () {
            Adresse_CheckNewsletters();
        });

        $("#cboCreationPays").change(function () {
            var pay = $(this).val();
            var cpField = $("#txtCreationCP");
            if (pay == "FRA") {
                $("#pCreationCP label").text("*Code Postal :");
                cpField.attr("maxlength", "5");
                cpField.val("");
            }
            else {
                $("#pCreationCP label").text("NPA");
                cpField.attr("maxlength", "4");
                cpField.val("");
            }
            Adresse_CheckTelephones();
        });

        $("#divSaisieAdresseContainer").show();
        $("#cboCreationPays").change();

        if (avecCompte) {
            $("#pCreateEmail").show();
            $("#pCreatePassword").show();
        }
        else {
            $("#pNewsletters").hide();
        }

        function Adresse_CheckMandatoryField(field, div, divAide) {
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
            return c == "";
        }
        function Adresse_SetMandatoryField(field, div, divAide) {
            field.focusin(function (e) {
                div.hide();
                if (divAide != null && divAide != undefined)
                    divAide.show();
            });
            field.focusout(function (e) {
                Adresse_CheckMandatoryField($(this), div, divAide);
            });
        }
        function Adresse_CheckCP() {
            var field = $("#txtCreationCP");
            var cp = field.val();
            var cpReg = /0[1-9]\d{3}|([1]|[3-8])\d{4}|2[0-9|A|B|a|b]\d{3}|9[0-5]\d{3}/;
            var cpRegChe = /[1-4]\d{3}|[5|7][0-7]\d{2}|9[0-6]\d{2}/;
            var cpHorsMetropople = /00\d{3}|9[6-9]\d{3}/;

            var pay = $("#cboCreationPays").val();

            if (pay == "") {
            }
            else if (pay == "FRA") {
                if (cp == "") {

                }
                else if (cpHorsMetropople.test(cp)) {
                    field.addClass("error");
                    $("#divCreationCPErreur").hide();
                    $("#divCreationCPErreurHorsFrance").show();
                }
                else if (!cpReg.test(cp) || RegExp.rightContext != "") {
                    field.addClass("error");
                    $("#divCreationCPErreur").show();
                    $("#divCreationCPErreurHorsFrance").hide();
                }


                else {
                    field.removeClass("error");
                    $("#divCreationCPErreurHorsFrance").hide();
                    $("#divCreationCPErreur").hide();
                }
            }
            else {
                if (cp == "") {
                }
                else if (!cpRegChe.test(cp) || RegExp.rightContext != "") {
                    field.addClass("error");
                    $("#divCreationCPErreur").show();
                    $("#divCreationCPErreurHorsFrance").hide();
                }
                else {
                    field.removeClass("error");
                    $("#divCreationCPErreurHorsFrance").hide();
                    $("#divCreationCPErreur").hide();
                }
            }
        }
        $("#lnkCreationEMailReplace").click(function (e) {
            var email = $(this).html();
            $("#txtCreationEMail").val(email);
            E.Process.verifierEmail(email, function (data) {
                if (data.EstDejaExistante) {
                    $("#divCreationEMailSuggestions").hide();
                    $("#divCreationEMailDejaExistant").show();
                    $("#lnkCreationEMailReplace").html('');
                }
                else if (data.Suggestion != null && data.Suggestion != email) {
                    $("#divCreationEMailSuggestions").show();
                    $("#divCreationEMailDejaExistant").hide();
                    $("#lnkCreationEMailReplace").html(data.Suggestion);
                }
                else {
                    $("#divCreationEMailSuggestions").hide();
                    $("#divCreationEMailDejaExistant").hide();
                    $("#lnkCreationEMailReplace").html('');
                }
            });
            return false;
        });

        $("#divSaisieAdresseContainer").keypress(function (e) {
            if (e.which == 13) {
                setTimeout(function () {
                    $("#divSaisieAdresseContainer input").blur();
                    $("#divSaisieAdresseContainer select").blur();
                    if (!$(linkSelector).hasClass("disabled"))
                        $(linkSelector).click();

                }, 100);
                return false;
            }
            else {
                $("#divSaisieAdresseContainer INPUT").removeClass("error");
            }
        });

        $("#txtCreationEMail").focusin(function (e) {
            if (!$("#txtCreationEMail").is(":visible")) {
                $("#divCreationEMailSuggestions").hide();
                $("#divCreationEMailSuggestions").hide();
                $("#divCreationEMailDejaExistant").hide();
                $("#divCreationEMailVide").hide();
                $("#divCreationEMailErreur").hide();
                return true;
            }

            if ($("#divCreationEMailErreur").is(":visible"))
                return false;
            if ($("#divCreationEMailDejaExistant").is(":visible"))
                return false;
            if ($("#divCreationEMailSuggestions").is(":visible"))
                return false;
            $("#divCreationEMailVide").hide();
            $("#divCreationEMailAide").show();
        });

        $("#txtCreationEMail").focusout(function (e) {

            if (!$("#txtCreationEMail").is(":visible")) {
                $("#divCreationEMailSuggestions").hide();
                $("#divCreationEMailSuggestions").hide();
                $("#divCreationEMailDejaExistant").hide();
                $("#divCreationEMailVide").hide();
                $("#divCreationEMailErreur").hide();
                return true;
            }

            $("#divCreationEMailAide").hide();
            var email = $(this).val();
            var checkExp = /^([a-zA-Z0-9])([a-zA-Z0-9_\.\-])+\@([a-zA-Z0-9])(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            if (email == "") {
                $("#divCreationEMailVide").show();
                $("#divCreationEMailErreur").hide();
            }
            else if (checkExp.test(email)) {
                $(this).removeClass("error");
                $("#divCreationEMailVide").hide();
                $("#divCreationEMailErreur").hide();
                estUR = false;
                E.Process.verifierEmail(email, function (data) {
                    estUR = false;
                    if (data.EstDejaExistante && (data.Source == null || data.Source == "[e]" || data.Source == "[E]")) {
                        $("#divCreationEMailSuggestions").hide();
                        $("#divCreationEMailDejaExistant").show();
                        $("#lnkCreationEMailReplace").html('');
                    }
                    else if (data.EstDejaExistante && (data.Source == "EXT")) {
                        estUR = true;
                        $("#divCreationEMailSuggestions").hide();
                        $("#divCreationEMailDejaExistant").hide();
                        $("#lnkCreationEMailReplace").html('');
                    }
                    else if (data.Suggestion != null && data.Suggestion != email) {
                        $("#divCreationEMailSuggestions").show();
                        $("#divCreationEMailDejaExistant").hide();
                        $("#lnkCreationEMailReplace").html(data.Suggestion);
                    }
                    else {
                        $("#divCreationEMailSuggestions").hide();
                        $("#divCreationEMailDejaExistant").hide();
                        $("#lnkCreationEMailReplace").html('');
                    }
                });

            }
            else {
                $(this).addClass("error");
                $("#divCreationEMailVide").hide();
                $("#divCreationEMailErreur").show();
            }
        });

        Adresse_SetMandatoryField($("#txtCreationPassword"), $("#divCreationPasswordVide"), $("#divCreationPasswordAide"));
        Adresse_SetMandatoryField($("#txtCreationNom"), $("#divCreationNomVide"));
        Adresse_SetMandatoryField($("#txtCreationPrenom"), $("#divCreationPrenomVide"));
        Adresse_SetMandatoryField($("#txtCreationAdr1"), $("#divCreationAdr1Vide"));

        $("#txtCreationVille").focusin(function (e) {
            $("#divCreationVilleVide").hide();
            $("#divCreationVilleErreur").hide();
        });
        $("#txtCreationVille").focusout(function (e) {
            if (!Adresse_CheckMandatoryField($(this), $("#divCreationVilleVide"))) {
                var ville = $("#txtCreationVille").val();
                var villeReg = /[a-zA-Z].*/;
                if (!villeReg.test(ville) || RegExp.rightContext != "" || RegExp.leftContext != "") {
                    $("#divCreationVilleErreur").show();
                }
                else {
                    $("#divCreationVilleErreur").hide();
                }

            }
        });

        $("#txtCreationCP").keypress(function (e) {
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
            var pay = $("#cboCreationPays").val();
            var cpact = $("#txtCreationCP").val().trimEnd().trimStart();
            var s = String.fromCharCode(e.which).toUpperCase();
            if (!isNaN(parseInt(s))) {
            }
            else if ((s == "A" || s == "B") && pay == "FRA" && cpact == "2") {
            }
            else {
                e.preventDefault();
                return false;
            }
        });

        $("#txtCreationTelephone").keypress(function (e) {
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
            var act = $("#txtCreationTelephone").val().trimEnd().trimStart();
            var s = String.fromCharCode(e.which).toUpperCase();
            if (!isNaN(parseInt(s))) {
            }
            else if (s == " " || s == "." || s == "-" || s == "/") {
            }
            else if (s == "+" && (act == "" || caretPosition($("#txtCreationTelephone").get(0)) == 0)) {
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


        $("#txtCreationCP").focusin(function (e) {
            $("#divCreationCPVide").hide();
            $("#divCreationCPErreur").hide();
            $("#divCreationCPErreurRdv").hide();
        });
        $("#txtCreationCP").focusout(function (e) {
            if (!Adresse_CheckMandatoryField($(this), $("#divCreationCPVide"))) {
                Adresse_CheckCP();
            }
        });


        $("#divSaisieAdresseContainer input.tel").focusin(function (e) {
            if ($("#divCreationTelVide").is(":visible"))
                return false;
            if ($("#divCreationMobileErreur").is(":visible"))
                return false;
            if ($("#divCreationTelephoneErreur").is(":visible"))
                return false;
            if ($("#divCreationMobileErreurStyleTelephoneCHE").is(":visible"))
                return false;
            if ($("#divCreationMobileErreurStyleTelephone").is(":visible"))
                return false;
            $("#divCreationTelAide").show();
        });

        $("#divSaisieAdresseContainer input.tel").focusout(function (e) {

            Adresse_CheckTelephones();
        });

        function Adresse_CheckNewsletters() {
            if (!$("#pNewsletters").is(":visible")) {
                $("#divCreationNewsletterObligatoire").hide();
            }
            else if ($("#rdoNewsletters1").is(":checked") || $("#rdoNewsletters2").is(":checked")) {
                $("#divCreationNewsletterObligatoire").hide();
            }
            else {
                $("#divCreationNewsletterObligatoire").show();
            }
        }

        function Adresse_CheckTelephones() {
            var telField = $("#txtCreationTelephone");
            var tel = telField.val().trimEnd().trimStart();
            var mobileField = $("#txtCreationMobile");
            var mobile = mobileField.val().trimEnd().trimStart();
            var telReg = /^0[0-9]{1}(([\s|-]{0,1}[0-9]{2}){4})|^0(([\s|-]{0,1}[0-9]{3}){3})|^\+33[\s|-]{0,1}(\(0\)){0,1}(([\s|-]{0,1}[0-9]{3}){3})|^\+33[\s|-]{0,1}(\(0\)){0,1}[\s|-]{0,1}[0-9]{1}(([\s|-]{0,1}[0-9]{2}){4})$/;
            var telCheReg = /^0[0-9]{2}([\s|-]{0,1}[0-9]{3})(([\s|-]{0,1}[0-9]{2}){2})|^0(([\s|-]{0,1}[0-9]{3}){3})|^\+41[\s|-]{0,1}(\(0\)){0,1}(([\s|-]{0,1}[0-9]{3}){3})|^\+41[\s|-]{0,1}(\(0\)){0,1}[\s|-]{0,1}[0-9]{2}([\s|-]{0,1}[0-9]{3})(([\s|-]{0,1}[0-9]{2}){2})$/;
            var mobileReg = /^0[6-7]{1}(([\s|-]{0,1}[0-9]{2}){4})|^0(([\s|-]{0,1}[6-7][0-9]{2}){1})(([\s|-]{0,1}[0-9]{3}){2})|^\+33[\s|-]{0,1}(\(0\)){0,1}(([\s|-]{0,1}[6-7]{1}[0-9]{2}){3})|^\+33[\s|-]{0,1}(\(0\)){0,1}[\s|-]{0,1}[6-7]{1}(([\s|-]{0,1}[0-9]{2}){4})$/;
            var mobileCheReg = /^0[7]{1}[0-9]{2}([\s|-]{0,1}[0-9]{3})(([\s|-]{0,1}[0-9]{2}){2})|^0(([\s|-]{0,1}[7][0-9]{2}){1})(([\s|-]{0,1}[0-9]{3}){2})|^\+41[\s|-]{0,1}(\(0\)){0,1}(([\s|-]{0,1}[7]{1}[0-9]{2}){3})|^\+41[\s|-]{0,1}(\(0\)){0,1}[\s|-]{0,1}[7]{1}[0-9]{2}([\s|-]{0,1}[0-9]{3})(([\s|-]{0,1}[0-9]{2}){2})$/;
            var mobilePasReg = /^0[0-5,9]{1}(([\s|-]{0,1}[0-9]{2}){4})|^0(([\s|-]{0,1}[0-5,9][0-9]{2}){1})(([\s|-]{0,1}[0-9]{3}){2})|^\+33[\s|-]{0,1}(\(0\)){0,1}(([\s|-]{0,1}[0-5,9]{1}[0-9]{2}){3})|^\+33[\s|-]{0,1}(\(0\)){0,1}[\s|-]{0,1}[0-5,9]{1}(([\s|-]{0,1}[0-9]{2}){4})$/;
            var mobileChePasReg = /^0[0-6,8-9]{1}[0-9]{2}([\s|-]{0,1}[0-9]{3})(([\s|-]{0,1}[0-9]{2}){2})|^0(([\s|-]{0,1}[0-6,8-9][0-9]{2}){1})(([\s|-]{0,1}[0-9]{3}){2})|^\+41[\s|-]{0,1}(\(0\)){0,1}(([\s|-]{0,1}[0-6,8-9]{1}[0-9]{2}){3})|^\+41[\s|-]{0,1}(\(0\)){0,1}[\s|-]{0,1}[0-6,8-9]{1}[0-9]{2}([\s|-]{0,1}[0-9]{3})(([\s|-]{0,1}[0-9]{2}){2})$/;

            $("#divCreationTelVide").hide();
            $("#divCreationTelAide").hide();
            $("#divCreationMobileErreur").hide();

            var pay = $("#cboCreationPays").val();

            $("#divCreationMobileErreurStyleTelephoneCHE").hide();
            $("#divCreationMobileErreurStyleTelephone").hide();
            if (pay == "FRA") {

                $("#divCreationMobileErreurStyleTelephoneCHE").hide();

                if ((tel != "" && !telReg.test(tel)) || (RegExp.rightContext != null && RegExp.rightContext.trimEnd().trimStart() != "")) {
                    if (tel.length > 3 && tel.substr(0, 3) == "+41") {
                        $("#divCreationTelephoneErreurPaysTelephone").show();
                        $("#divCreationTelephoneErreur").hide();
                        telField.addClass("error");
                    }
                    else {
                        $("#divCreationTelephoneErreurPaysTelephone").hide();
                        $("#divCreationTelephoneErreur").show();
                        telField.addClass("error");
                    }
                }
                else {
                    $("#divCreationTelephoneErreurPaysTelephone").hide();
                    $("#divCreationTelephoneErreur").hide();
                    telField.removeClass("error");
                }

                if (mobile != "" && mobilePasReg.test(mobile)) {
                    $("#divCreationMobileErreurPaysTelephone").hide();
                    $("#divCreationMobileErreurStyleTelephone").show();
                    $("#divCreationMobileErreur").hide();
                    mobileField.addClass("error");
                }
                else if ((mobile != "" && !mobileReg.test(mobile)) || (RegExp.rightContext != null && RegExp.rightContext.trimEnd().trimStart() != "")) {
                    if (mobile.length > 3 && mobile.substr(0, 3) == "+41") {
                        $("#divCreationMobileErreurPaysTelephone").show();
                        $("#divCreationMobileErreurStyleTelephone").hide();
                        $("#divCreationMobileErreur").hide();
                        mobileField.addClass("error");
                    }
                    else {
                        mobileField.addClass("error");
                        $("#divCreationMobileErreurPaysTelephone").hide();
                        $("#divCreationMobileErreur").show();
                        $("#divCreationMobileErreurStyleTelephone").hide();
                    }
                }
                else {
                    mobileField.removeClass("error");
                    $("#divCreationMobileErreurPaysTelephone").hide();
                    $("#divCreationMobileErreur").hide();
                    $("#divCreationMobileErreurStyleTelephone").hide();

                }
            }
            else {
                $("#divCreationMobileErreurStyleTelephone").hide();

                if (tel != "" && !telCheReg.test(tel) || RegExp.rightContext != "") {
                    if (tel.length > 3 && tel.substr(0, 3) == "+33") {
                        $("#divCreationTelephoneErreurPaysTelephone").show();
                        $("#divCreationTelephoneErreur").hide();
                        telField.addClass("error");
                    }
                    else {
                        $("#divCreationTelephoneErreurPaysTelephone").hide();
                        $("#divCreationTelephoneErreur").show();
                        telField.addClass("error");
                    }
                }

                else {
                    $("#divCreationTelephoneErreurPaysTelephone").hide();
                    $("#divCreationTelephoneErreur").hide();
                    telField.removeClass("error");
                }

                if (mobile != "" && mobileChePasReg.test(mobile)) {
                    $("#divCreationMobileErreurPaysTelephone").hide();
                    $("#divCreationMobileErreurStyleTelephoneCHE").show();
                    $("#divCreationMobileErreur").hide();
                    mobileField.addClass("error");
                }
                else if (mobile != "" && !mobileCheReg.test(mobile) || RegExp.rightContext != "") {
                    if (mobile.length > 3 && mobile.substr(0, 3) == "+33") {
                        $("#divCreationMobileErreurPaysTelephone").show();
                        $("#divCreationMobileErreurStyleTelephone").hide();
                        $("#divCreationMobileErreur").hide();
                        mobileField.addClass("error");
                    }
                    else {
                        mobileField.addClass("error");
                        $("#divCreationMobileErreurPaysTelephone").hide();
                        $("#divCreationMobileErreur").show();
                        $("#divCreationMobileErreurStyleTelephone").hide();
                    }
                }
                else {
                    mobileField.removeClass("error");
                    $("#divCreationMobileErreurPaysTelephone").hide();
                    $("#divCreationMobileErreur").hide();
                    $("#divCreationMobileErreurStyleTelephone").hide();

                }
            }
        }

        $(linkSelector).click(function (e) {

            Adresse_CheckMandatoryField($("#txtCreationPassword"), $("#divCreationPasswordVide"), $("#divCreationPasswordAide"));
            Adresse_CheckMandatoryField($("#txtCreationNom"), $("#divCreationNomVide"));
            Adresse_CheckMandatoryField($("#txtCreationAdr1"), $("#divCreationAdr1Vide"));
            Adresse_CheckMandatoryField($("#txtCreationCP"), $("#divCreationCPVide"));
            Adresse_CheckMandatoryField($("#txtCreationVille"), $("#divCreationVilleVide"));
            Adresse_CheckMandatoryField($("#txtCreationEMail"), $("#divCreationEMailVide"), $("#divCreationEMailAide"));
            Adresse_CheckNewsletters();


            var tel = $("#txtCreationTelephone").val();
            var mobile = $("#txtCreationMobile").val();
            if (tel == "" && mobile == "") {
                $("#divCreationTelVide").show();
            }

            if ($("#divCreationNewsletterObligatoire").is(":visible")) {
                e.preventDefault();
                return false;
            }

            if ($("#divCreationEMailErreur").is(":visible") || $("#divCreationEMailDejaExistant").is(":visible")) {
                $("#txtCreationEMail").focus();
                e.preventDefault();
                return false;
            }

            if ($("#divCreationPasswordErreur").is(":visible") || $("#divCreationPasswordVide").is(":visible")) {
                $("#txtCreationPassword").focus();
                e.preventDefault();
                return false;
            }
            if ($("#divCreationNomErreur").is(":visible")) {
                $("#txtCreationNom").focus();
                e.preventDefault();
                return false;
            }

            if ($("#divCreationNomVide").is(":visible")) {
                $("#txtCreationPrenom").focus();
                e.preventDefault();
                return false;
            }
            if ($("#divCreationPrenomVide").is(":visible")) {
                $("#txtCreationPrenom").focus();
                e.preventDefault();
                return false;
            }


            if ($("#divCreationAdr1Erreur").is(":visible")) {
                $("#txtCreationAdr1").focus();
                e.preventDefault();
                return false;
            }
            if ($("#divCreationCPErreur").is(":visible")) {
                $("#txtCreationCP").focus();
                e.preventDefault();
                return false;
            }
            if ($("#divCreationCPVide").is(":visible")) {
                $("#txtCreationCP").focus();
                e.preventDefault();
                return false;
            }

            if ($("#divCreationCPErreurHorsFrance").is(":visible")) {
                $("#txtCreationCP").focus();
                return false;
            }

            if ($("#divCreationCPErreurRdv").is(":visible")) {
                $("#txtCreationCP").focus();
                e.preventDefault();
                return false;
            }
            if ($("#divCreationVilleErreur").is(":visible")) {
                $("#txtCreationVille").focus();
                e.preventDefault();
                return false;
            }
            if ($("#divCreationVilleVide").is(":visible")) {
                $("#txtCreationVille").focus();
                e.preventDefault();
                return false;
            }
            if ($("#divCreationTelephoneErreur").is(":visible")) {
                $("#txtCreationTelephone").focus();
                e.preventDefault();
                return false;
            }
            if ($("#divCreationMobileErreur").is(":visible")) {
                $("#txtCreationMobile").focus();
                e.preventDefault();
                return false;
            }

            if ($("#divCreationMobileErreurStyleTelephone").is(":visible")) {
                $("#txtCreationMobile").focus();
                e.preventDefault();
                return false;
            }

            if ($("#divCreationMobileErreurStyleTelephoneCHE").is(":visible")) {
                $("#txtCreationMobile").focus();
                e.preventDefault();
                return false;
            }



            if (tel == "" && mobile == "") {
                $("#divCreationTelVide").show();
                $("#txtCreationTelephone").focus();
                e.preventDefault();
                return false;
            }

            $("#divSaisieAdresseContainer input").attr('disabled', 'disabled');
            $("#divSaisieAdresseContainer select").attr('disabled', 'disabled');

            var nl = "";
            if ($("#rdoNewsletters1").length > 0) {
                if ($("#rdoNewsletters1").is(":visible")) {
                    if ($("#rdoNewsletters1").is(":checked")) {
                        nl = "3,11";
                    }
                    else {
                        nl = "";
                    }
                }
            }

            if (!$("#txtCreationEMail").is(":visible")) {
                if ($("#txtCreationEMail").val() == null || $("#txtCreationEMail").val() == "") {
                    e.preventDefault();
                    return false;
                }
            }
            if ($("#txtCreationNom").val() == null || $("#txtCreationNom").val() == "") {
                e.preventDefault();
                return false;
            }

            if (!$("#txtCreationPassword").is(":visible")) {
                if ($("#txtCreationPassword").val() == null || $("#txtCreationPassword").val() == "") {
                    e.preventDefault();
                    return false;
                }
            }

            if ($("#txtCreationCP").val() == null || $("#txtCreationCP").val() == "") {
                e.preventDefault();
                return false;
            }
            if ($("#txtCreationVille").val() == null || $("#txtCreationVille").val() == "") {
                e.preventDefault();
                return false;
            }

            var c = {
                email: $("#txtCreationEMail").val(),
                password: $("#txtCreationPassword").val(),
                civilite: $("#cboCreationCivilite").val(),
                nom: $("#txtCreationNom").val(),
                prenom: $("#txtCreationPrenom").val(),
                adresse1: $("#txtCreationAdr1").val(),
                adresse2: $("#txtCreationAdr2").val(),
                cp: $("#txtCreationCP").val(),
                ville: $("#txtCreationVille").val(),
                pays: $("#cboCreationPays").val(),
                telephone: $("#txtCreationTelephone").val(),
                mobile: $("#txtCreationMobile").val(),
                guid: $("#hdnGuid").val(),
                newsletters: nl,
                type: estUR ? "UR" : "E"
            };
            if (typeof callback != "undefined") {
                callback(c);
            }
            return false;
        });

    }

    var estUR = false;

    function ReactiverSaisieAdresse(viderLesChamps) {
        $("#divSaisieAdresseContainer input").removeAttr('disabled');
        $("#divSaisieAdresseContainer select").removeAttr('disabled');
        if (viderLesChamps) {
            $("#divSaisieAdresseContainer input").val("");
            $("#divSaisieAdresseContainer select").val(function (index, val) {
                if (index == 0)
                    return true;
                return false;
            });
        }
    }

</script>
