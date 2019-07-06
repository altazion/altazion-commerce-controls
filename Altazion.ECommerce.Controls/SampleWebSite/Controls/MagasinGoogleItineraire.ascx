<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MagasinGoogleItineraire.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.MagasinGoogleItineraire" %>

<div id="googleItineraire">

    <p class="source">
        <span>Votre lieu de départ</span>
        <asp:TextBox runat="server" ID="txtSource" />
    </p>

    <p class="destination">
        <ecom:MagasinLibelle runat="server" />
    </p>

    <p class="actions">
        <asp:HyperLink runat="server" ID="lnkGoogleLink" Target="_blank" NavigateUrl="#" Text="calculer" />
    </p>

    <script type="text/javascript">
        $(document).ready(function () {
            $("#googleItineraire .actions a").click(function (e) {
                var url = $("#googleItineraire .actions a").attr("href");
                var dest = $("#googleItineraire .source input").val();
                url = url.replace("[src]", encodeURI(dest));
                $("#googleItineraire .actions a").attr("href", url);
                return true;
            });
        });
    </script>

</div>
