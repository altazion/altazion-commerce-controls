<%@ Page Title="Donnez votre avis" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true"
    Inherits="CPointSoftware.ECommerce.Tools.ECommerceBasePage"
    MaintainScrollPositionOnPostback="true" %>

<%@ Import Namespace="CPointSoftware.Equihira.Business.ECommerce" %>
<%@ Import Namespace="CPointSoftware.Equihira.Common.Sys" %>
<%@ Import Namespace="CPointSoftware.Equihira.Business.Common" %>

<script runat="server">

    public override ECommercePageType TypePage
    {
        get
        {
            return ECommercePageType.CompteClient;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(Request["sit_pk"]))
            {
                int sit_pk = -1;
                if (!int.TryParse(Request["sit_pk"], out sit_pk))
                    return;

                if (sit_pk == ECommerceServer.CurrentSite.Id)
                {
                    if (ECommerceServer.CurrentMiniSite != null)
                    {
                        ECommerceServer.ActiverMiniSite(null);
                        Response.Redirect(Request.RawUrl, true);
                        return;
                    }
                }
                else if (ECommerceServer.CurrentMiniSite == null || ECommerceServer.CurrentMiniSite.Id != sit_pk)
                {

                    ServerConfigSection s = EConfigurationManager.GetConfig(ECommerceServer.CurrentSite);
                    if (s.ECommerce.MiniSites != null && s.ECommerce.MiniSites.Count > 0)
                    {
                        foreach (ECommerceMiniSiteElement elm in s.ECommerce.MiniSites)
                        {
                            if (elm.Id == sit_pk)
                            {
                                ECommerceServer.ActiverMiniSite(sit_pk);
                                Response.Redirect(Request.RawUrl, true);
                                return;
                            }
                        }
                    }

                }
            }
        }
        catch
        {

        }
    }

    protected void lnkValider_Click(object sender, EventArgs e)
    {
        if (!Page.User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/", true);
            return;
        }
        Guid g = new Guid(Request["art_guid"]);
        TextBox txtCommentaires = FormView1.FindControl("ProductPanel1").FindControl("AvisSaisie1_txtCommentaires") as TextBox;
        string note = (FormView1.FindControl("ProductPanel1").FindControl("lnkNote") as HiddenField).Value;
        string prenom = ECommerceServer.User.Nom;
        MultiView mv = FormView1.FindControl("ProductPanel1").FindControl("mvAvis") as MultiView;
        PanierProvider prv = ECommerceServer.Panier;
        AvisBll bll = new AvisBll(ECommerceServer.RjsId, ECommerceServer.SiteId);
        bll.AjouterAvis(g,
                Page.User.Identity.IsAuthenticated ? prv.ClientGuid : (Guid?)null,
                prenom,
                Page.User.Identity.Name,
                decimal.Parse(note),
                txtCommentaires.Text);
        mv.ActiveViewIndex = 1;
    }

    protected void ArticleSource_Selected(object sender, SiteDataSourceSelectedEventArgs e)
    {
        if (e.ResultCount == 0)
        {
            Response.Redirect("~/", true);
            return;
        }
    }
</script>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <ecom:ScriptLinkControl runat="server" ScriptFilePath="~/tools/jquery.rating.pack.js" />

    <style type="text/css">
        div.rating-cancel, div.star-rating {
            float: left;
            width: 17px;
            height: 15px;
            text-indent: -999em;
            cursor: pointer;
            display: block;
            background: transparent;
            overflow: hidden;
        }

            div.rating-cancel, div.rating-cancel a {
                display: none;
            }

            div.star-rating, div.star-rating a {
                background: url(/ECommerce/App_Themes/sit_2/medias/img/etoile-avis.gif) no-repeat 0 0px;
            }

                div.rating-cancel a, div.star-rating a {
                    display: block;
                    width: 16px;
                    height: 100%;
                    background-position: 0 0px;
                    border: 0;
                }

        div.star-rating-on a {
            background-position: -16px -0!important;
        }

        div.star-rating-hover a {
            background-position: -32px -0;
        }

        div.star-rating-readonly a {
            cursor: default !important;
        }

        div.star-rating {
            background: transparent!important;
            overflow: hidden!important;
        }
    </style>

</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:UpdatePanel runat="server" ID="updAvis">
        <ContentTemplate>
            <asp:FormView ID="FormView1" runat="server" DataSourceID="ArticleSource" RenderOuterTable="false">
                <ItemTemplate>
                    <ecom:ProductPanel ID="ProductPanel1" runat="server">
                        <Content>
                            <div class="Avis">
                                <ecom:ProduitImageLink runat="server" ID="imgPr" ImageType="Petite" />

                                <div class="Avis-donner">
                                    <p class="titre-avis">
                                        Donnez votre avis
                                    </p>
                                    <p class="titre-avis2">
                                        Nous vous invitons à soumettre des commentaires sur les produits que vous avez achetés.
                                Votre contribution aidera les clients à choisir les meilleurs produits.
                                    </p>
                                    <asp:MultiView runat="server" ID="mvAvis" ActiveViewIndex="0">
                                        <asp:View runat="server" ID="vwFormulaire">
                                            <div class="Avis-noter">
                                                <p class="Avis-noter-g">
                                                    <span>Noter le produit</span><br>
                                                    Cliquez pour évaluer le produit
                                                </p>
                                                <div class="Avis-noter-c">
                                                    <div class="Avis-noter-etoile">
                                                        <input class="auto-submit-star" type="radio" name="ratings" value="1" />
                                                        <input class="auto-submit-star" type="radio" name="ratings" value="2" />
                                                        <input class="auto-submit-star" type="radio" name="ratings" value="3" checked="checked" />
                                                        <input class="auto-submit-star" type="radio" name="ratings" value="4" />
                                                        <input class="auto-submit-star" type="radio" name="ratings" value="5" />
                                                    </div>
                                                </div>

                                                <asp:HiddenField runat="server" ID="lnkNote" Value="3" />

                                                <script language="javascript" type="text/javascript">
                                                    $(function () {
                                                        $('.auto-submit-star').rating({
                                                            callback: function (value, link) {
                                                                $('#<%Response.Write(FormView1.FindControl("ProductPanel1").FindControl("lnkNote").ClientID);%>')[0].value = value;
                                                    }
                                                });
                                            });
                                                </script>


                                                <p class="Avis-noter-d">
                                                    (La note 5 correspond à la meilleurenote et 1 la plus mauvaise)
                                                </p>
                                            </div>
                                            <div class="Avis-commentaire">
                                                <p>
                                                    Vos commentaires :
                                                </p>
                                                <asp:TextBox runat="server" TextMode="MultiLine" ID="AvisSaisie1_txtCommentaires" Columns="30" Rows="5" name="txtCommentaires" />
                                            </div>
                                            <asp:LinkButton runat="server" ID="lnkValider" CssClass="Avis-valide" Text="valider" ToolTip="valider" OnClick="lnkValider_Click" />
                                        </asp:View>
                                        <asp:View runat="server" ID="vwMerci">
                                            <p class="Avis-merci">
                                                Merci pour votre avis.
                                            </p>
                                            <a class="Avis-retour" title="valider" href="/" alt="valider">Retour à la boutique</a>
                                        </asp:View>
                                    </asp:MultiView>
                                </div>
                            </div>
                        </Content>
                    </ecom:ProductPanel>
                </ItemTemplate>
            </asp:FormView>
            <ecom:ArticlesDataSourceControl ID="ArticleSource" runat="server"
                Mode="Pour404" OnSelected="ArticleSource_Selected">
                <Parameters>
                    <asp:QueryStringParameter Name="ArticleGuid" QueryStringField="art_guid" />
                </Parameters>
            </ecom:ArticlesDataSourceControl>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
