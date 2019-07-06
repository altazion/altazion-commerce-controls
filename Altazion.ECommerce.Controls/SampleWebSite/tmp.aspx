<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"
    Inherits="CPointSoftware.ECommerce.Tools.ECommercePage" MasterPageFile="~/Masters/Mobile.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div id='ctl00_ContentPlaceHolder1_frmMagasin_ThemablePanelControl1_ctl00_ctl00' class='magasin-map-detail' style="background:red;width:300px;height:300px;"></div>
    <script type='text/javascript'>var magasinMap = null; function initGoogleMapMagasin() {
    magasinMap = new google.maps.Map(document.getElementById('ctl00_ContentPlaceHolder1_frmMagasin_ThemablePanelControl1_ctl00_ctl00'),
        { center: {lat: 46.7, lng: 1.5},
            zoom: 5
        });
    //    { center: { lat: 10.357, lng: 10.524 } });
    //var marker = new google.maps.Marker({
    //    map: magasinMap, position: { lat: 50.357, lng: 3.524 }, title: 'MiamMiam - Valenciennes'
    //});
}</script>

    <script src='https://maps.googleapis.com/maps/api/js?key=AIzaSyDrKZ5RP1MW_OUxe47kLV35QFi6Z53MOIk&callback=initGoogleMapMagasin'></script>


</asp:Content>



<%--!DOCTYPE html>
<html>
  <head runat="server">
    <title>Simple Map</title>
    <meta name="viewport" content="initial-scale=1.0">
    <meta charset="utf-8">
    <style>
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #map {
        height: 100%;
      }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>

var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: -34.397, lng: 150.644},
    zoom: 8
  });
}

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDrKZ5RP1MW_OUxe47kLV35QFi6Z53MOIk&callback=initMap"
        async defer></script>
  </body>
</html>--%>
