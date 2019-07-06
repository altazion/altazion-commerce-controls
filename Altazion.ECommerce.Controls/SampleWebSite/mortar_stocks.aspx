<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mortar_stocks.aspx.cs"
    Inherits="CPointSoftware.ECommerce.Site.mortar_stocks" MasterPageFile="~/Masters/DefaultTheme.Master"
    MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="StoreStockHeader">
            <Content>
                <asp:FormView ID="FormView1" runat="server" RenderOuterTable="false" DataSourceID="ArticleSource">
                    <ItemTemplate>
                        <ecom:ProductPanel ID="ProductPanel1" runat="server" SkinID="ProductStock">
                            <Content>
                                <b>
                                    <ecom:ProduitLibelle ID="ProduitLibelle1" runat="server" /></b>
                            </Content>
                        </ecom:ProductPanel>
                    </ItemTemplate>
                </asp:FormView>
                <ecom:ArticlesDataSourceControl ID="ArticleSource" runat="server">
                    <Parameters>
                        <asp:QueryStringParameter Name="Reference" QueryStringField="Reference" />
                    </Parameters>
                </ecom:ArticlesDataSourceControl>
            </Content>
        </ecom:ThemablePanelControl>
        <asp:MultiView runat="server" ID="mvMagasins" ActiveViewIndex="0">
            <asp:View runat="server" ID="vwListe">
                <div id="StockMagasinCriteres">
                <asp:Panel runat="server" DefaultButton="lnRechercher">
                    <span>Entrez votre code postal </span>
                    <asp:TextBox runat="server" ID="txtCodePostal" Columns="7" />
                    <span>ou choisissez un département </span>
                    <asp:DropDownList runat="server" ID="cboZone">
                        <asp:ListItem Value='01' Text='Ain' />
                        <asp:ListItem Value='02' Text='Aisne' />
                        <asp:ListItem Value='03' Text='Allier' />
                        <asp:ListItem Value='04' Text='Alpes-de-Haute-Provence' />
                        <asp:ListItem Value='05' Text='Hautes-Alpes' />
                        <asp:ListItem Value='06' Text='Alpes-Maritimes' />
                        <asp:ListItem Value='07' Text='Ardèche' />
                        <asp:ListItem Value='08' Text='Ardennes' />
                        <asp:ListItem Value='09' Text='Ariège' />
                        <asp:ListItem Value='10' Text='Aube' />
                        <asp:ListItem Value='11' Text='Aude' />
                        <asp:ListItem Value='12' Text='Aveyron' />
                        <asp:ListItem Value='13' Text='Bouches-du-Rhône' />
                        <asp:ListItem Value='14' Text='Calvados' />
                        <asp:ListItem Value='15' Text='Cantal' />
                        <asp:ListItem Value='16' Text='Charente' />
                        <asp:ListItem Value='17' Text='Charente-Maritime' />
                        <asp:ListItem Value='18' Text='Cher' />
                        <asp:ListItem Value='19' Text='Corrèze' />
                        <asp:ListItem Value='2A' Text='Corse-du-Sud' />
                        <asp:ListItem Value='2B' Text='Haute-Corse' />
                        <asp:ListItem Value='21' Text="Côte-d'Or" />
                        <asp:ListItem Value='22' Text="Côtes-d'Armor" />
                        <asp:ListItem Value='23' Text='Creuse' />
                        <asp:ListItem Value='24' Text='Dordogne' />
                        <asp:ListItem Value='25' Text='Doubs' />
                        <asp:ListItem Value='26' Text='Drôme' />
                        <asp:ListItem Value='27' Text='Eure' />
                        <asp:ListItem Value='28' Text='Eure-et-Loir' />
                        <asp:ListItem Value='29' Text='Finistère' />
                        <asp:ListItem Value='30' Text='Gard' />
                        <asp:ListItem Value='31' Text='Haute-Garonne' />
                        <asp:ListItem Value='32' Text='Gers' />
                        <asp:ListItem Value='33' Text='Gironde' />
                        <asp:ListItem Value='34' Text='Hérault' />
                        <asp:ListItem Value='35' Text='Ille-et-Vilaine' />
                        <asp:ListItem Value='36' Text='Indre' />
                        <asp:ListItem Value='37' Text='Indre-et-Loire' />
                        <asp:ListItem Value='38' Text='Isère' />
                        <asp:ListItem Value='39' Text='Jura' />
                        <asp:ListItem Value='40' Text='Landes' />
                        <asp:ListItem Value='41' Text='Loir-et-Cher' />
                        <asp:ListItem Value='42' Text='Loire' />
                        <asp:ListItem Value='43' Text='Haute-Loire' />
                        <asp:ListItem Value='44' Text='Loire-Atlantique' />
                        <asp:ListItem Value='45' Text='Loiret' />
                        <asp:ListItem Value='46' Text='Lot' />
                        <asp:ListItem Value='47' Text='Lot-et-Garonne' />
                        <asp:ListItem Value='48' Text='Lozère' />
                        <asp:ListItem Value='49' Text='Maine-et-Loire' />
                        <asp:ListItem Value='50' Text='Manche' />
                        <asp:ListItem Value='51' Text='Marne' />
                        <asp:ListItem Value='52' Text='Haute-Marne' />
                        <asp:ListItem Value='53' Text='Mayenne' />
                        <asp:ListItem Value='54' Text='Meurthe-et-Moselle' />
                        <asp:ListItem Value='55' Text='Meuse' />
                        <asp:ListItem Value='56' Text='Morbihan' />
                        <asp:ListItem Value='57' Text='Moselle' />
                        <asp:ListItem Value='58' Text='Nièvre' />
                        <asp:ListItem Value='59' Text='Nord' />
                        <asp:ListItem Value='60' Text='Oise' />
                        <asp:ListItem Value='61' Text='Orne' />
                        <asp:ListItem Value='62' Text='Pas-de-Calais' />
                        <asp:ListItem Value='63' Text='Puy-de-Dôme' />
                        <asp:ListItem Value='64' Text='Pyrénées-Atlantiques' />
                        <asp:ListItem Value='65' Text='Hautes-Pyrénées' />
                        <asp:ListItem Value='66' Text='Pyrénées-Orientales' />
                        <asp:ListItem Value='67' Text='Bas-Rhin' />
                        <asp:ListItem Value='68' Text='Haut-Rhin' />
                        <asp:ListItem Value='69' Text='Rhône' />
                        <asp:ListItem Value='70' Text='Haute-Saône' />
                        <asp:ListItem Value='71' Text='Saône-et-Loire' />
                        <asp:ListItem Value='72' Text='Sarthe' />
                        <asp:ListItem Value='73' Text='Savoie' />
                        <asp:ListItem Value='74' Text='Haute-Savoie' />
                        <asp:ListItem Value='75' Text='Paris' />
                        <asp:ListItem Value='76' Text='Seine-Maritime' />
                        <asp:ListItem Value='77' Text='Seine-et-Marne' />
                        <asp:ListItem Value='78' Text='Yvelines' />
                        <asp:ListItem Value='79' Text='Deux-Sèvres' />
                        <asp:ListItem Value='80' Text='Somme' />
                        <asp:ListItem Value='81' Text='Tarn' />
                        <asp:ListItem Value='82' Text='Tarn-et-Garonne' />
                        <asp:ListItem Value='83' Text='Var' />
                        <asp:ListItem Value='84' Text='Vaucluse' />
                        <asp:ListItem Value='85' Text='Vendée' />
                        <asp:ListItem Value='86' Text='Vienne' />
                        <asp:ListItem Value='87' Text='Haute-Vienne' />
                        <asp:ListItem Value='88' Text='Vosges' />
                        <asp:ListItem Value='89' Text='Yonne' />
                        <asp:ListItem Value='90' Text='Territoire de Belfort' />
                        <asp:ListItem Value='91' Text='Essonne' />
                        <asp:ListItem Value='92' Text='Hauts-de-Seine' />
                        <asp:ListItem Value='93' Text='Seine-Saint-Denis' />
                        <asp:ListItem Value='94' Text='Val-de-Marne' />
                        <asp:ListItem Value='95' Text="Val-d'Oise" />
                        <asp:ListItem Value='97' Text='DOM-TOM' />
                    </asp:DropDownList>
                    
                    <asp:LinkButton SkinID="StoreStockSearchButton" runat="server" ID="lnRechercher"
                        ClientIdMode="Static" Text=">"
                        OnClick="lnkRechercher_Click" />
                </asp:Panel>
                    <asp:Panel runat="server" ID="pnlGeoLocal" ClientIDMode="Static" style="display:none;" CssClass="StoreStockGeoLoc">
                        <asp:HiddenField runat="server" ClientIDMode="Static" ID="hdnLong" value="-5000" />
                        <asp:HiddenField runat="server" ClientIDMode="Static" ID="hdnLat" value="-5000" />
                        <ecom:ThemablePanelControl runat="server" SkinID="StoreStockGeoLocHeader"></ecom:ThemablePanelControl>
                        <asp:HyperLink runat="server"  NavigateUrl="#" ClientIDMode="Static" SkinID="StoreStockUseGeoLocalisation" id="lnkUtiliserGeoLocalisation">Rechercher les magasins les plus proches de ma position</asp:HyperLink>
                        <div id="divErrorGeoLoc" style="display:none;">
                            <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="StoreStockGeoLocFooter">
                                <Content>
                                    Une erreur est survenue pendant l'obtention de votre emplacement géographique.
                                </Content>
                            </ecom:ThemablePanelControl>
                        </div>
                        <ecom:ThemablePanelControl runat="server" SkinID="StoreStockGeoLocFooter"></ecom:ThemablePanelControl>
                    </asp:Panel>
                    <script type="text/javascript">
                        if (navigator.geolocation) {
                            $("#pnlGeoLocal").show();
                            $("#lnkUtiliserGeoLocalisation").click(function (e) {
                                $("#divErrorGeoLoc").hide();
                                $("#lnkUtiliserGeoLocalisation").attr("disabled","disabled");
                                navigator.geolocation.getCurrentPosition(function (position) {
                                    $("#lnkUtiliserGeoLocalisation").removeAttr("disabled");
                                    $("#hdnLat").val(position.coords.latitude.toString().replace(".", ","));
                                    $("#hdnLong").val(position.coords.longitude.toString().replace(".", ","));
                                    var name = $("#lnRechercher").attr("name");
                                    __doPostBack(name, '')
                                }, function (error) {
                                    if (error.code == 1) {
                                        $("#lnkUtiliserGeoLocalisation").removeAttr("disabled");
                                    }
                                    else {
                                        $("#divErrorGeoLoc").show();
                                    }
                                });
                                return false;
                            });
                        }
                        else {
                            $("#pnlGeoLocal").hide();
                        }
                    </script>
                </div>
                <div class="ListeMagasins">
                    <ecom:MagasinsList runat="Server" DataSourceID="MagasinsSource" ID="lstMagasins">
                        <ItemTemplate>
                            <div class="Magasin">
                                <table>
                                    <tr>
                                        <td class="MagasinInfos">
                                            <h2>
                                                <ecom:MagasinLibelleLink ID="MagasinLibelleLink1" runat="server" /></h2>
                                            <ecom:MagasinAdresse ID="MagasinAdresse1" runat="server" />
                                            <br />
                                            <ecom:MagasinCodePostal ID="MagasinCodePostal1" runat="server" />
                                            <ecom:MagasinVille ID="MagasinVille1" runat="server" /><br />
                                            Tel :
                                            <ecom:MagasinTelephone runat="server" />
                                        </td>
                                        <td class="StockInfos">
                                            <ecom:StockMagasinLibelle runat="server" TextIfAvailable="Disponible" TextIfUnavailable="Non disponible"
                                                TextIfUnknow="Aucune information, contactez votre magasin" />
                                        </td>
                                        <td class="MagasinLink">
                                            <ecom:ReserverEnMagasinLink SkinID="MagasinReserverLink" runat="server" Text="Réserver en magasin" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </ecom:MagasinsList>
                    <ecom:MagasinsDataSource ID="MagasinsSource" Mode="Stock" runat="server">
                        <Parameters>
                            <asp:QueryStringParameter QueryStringField="Reference" Name="Reference" Type="String" />
                            <asp:Parameter  Name="MaxCountForGeoLoc" Type="Int32" DefaultValue="5" />
                            <asp:ControlParameter ControlID="hdnLat" Name="Latitude" PropertyName="Value" Type="Decimal" DefaultValue="-5000" />
                            <asp:ControlParameter ControlID="hdnLong" Name="Longitude" PropertyName="Value" Type="Decimal" DefaultValue="-5000" />
                            <asp:ControlParameter ControlID="cboZone" Name="Zone" Type="String" />
                            <asp:ControlParameter ControlID="txtCodePostal" Name="CodePostal" Type="String" />
                        </Parameters>
                    </ecom:MagasinsDataSource>
                </div>
            </asp:View>
            <asp:View runat="server" ID="vwSeul">
                <div class="MagasinSeul">
                    <ecom:MagasinsList runat="Server" DataSourceID="MagasinsDataSource2" ID="MagasinsList1">
                        <ItemTemplate>
                            <div class="Magasin">
                                <table>
                                    <tr>
                                        <td class="MagasinInfos">
                                            <h2>
                                                <ecom:MagasinLibelleLink ID="MagasinLibelleLink1" runat="server" /></h2>
                                            <ecom:MagasinAdresse ID="MagasinAdresse1" runat="server" />
                                            <br />
                                            <ecom:MagasinCodePostal ID="MagasinCodePostal1" runat="server" />
                                            <ecom:MagasinVille ID="MagasinVille1" runat="server" /><br />
                                            Tel :
                                            <ecom:MagasinTelephone ID="MagasinTelephone1" runat="server" />
                                        </td>
                                        <td class="StockInfos">
                                            <ecom:StockMagasinLibelle ID="StockMagasinLibelle1" runat="server" TextIfAvailable="Disponible"
                                                TextIfUnavailable="Non disponible" TextIfUnknow="Aucune information, contactez votre magasin" />
                                        </td>
                                        <td class="MagasinLink">
                                            <ecom:ReserverEnMagasinLink ID="ReserverEnMagasinLink1" SkinID="MagasinReserverLink"
                                                runat="server" Text="Réserver en magasin" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </ItemTemplate>
                    </ecom:MagasinsList>
                    <ecom:MagasinsDataSource ID="MagasinsDataSource2" Mode="Stock" runat="server">
                        <Parameters>
                            <asp:QueryStringParameter QueryStringField="Reference" Name="Reference" Type="String" />
                            <asp:Parameter Name="Guid" Type="String" />
                        </Parameters>
                    </ecom:MagasinsDataSource>
                    
                    <p class="Modifier">
                        <asp:LinkButton runat="server" ID="lnkModifier" Text="Choisir un autre magasin" OnClick="lnkModifier_Click" />
                    </p>
                    
                </div>
            </asp:View>
        </asp:MultiView>
</asp:Content>
