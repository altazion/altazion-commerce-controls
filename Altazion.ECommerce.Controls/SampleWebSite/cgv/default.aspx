<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true"
    CodeBehind="default.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.cgv._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BodyStartPlaceHolder" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="BeforeContent" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <ecom:ThemablePanelControl runat="server" ID="ThemablePanelControl1" SkinID="CGVHomeHeader">
        <Content>
            <h1>
                <span>Conditions générales de ventes</span></h1>
        </Content>
    </ecom:ThemablePanelControl>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container_16 CGVHome">
        <div class="grid_16">
        </div>
        <div class="clear">
        </div>
        <div class="grid_16">
            <ecom:ThemablePanelControl runat="server" ID="thema1" SkinID="CGvHomeContent">
                <Content>
                    <p>
                        Les présentes conditions générales de vente, régissent les relations contractuelles
                        entre tout utilisateur du site
                        <ecom:SiteNom runat="server" />
                        (ci-après désigné le "Client" ou "Vous") et le marchand
                        <ecom:SiteNom ID="SiteNom1" runat="server" />
                        (ci-après désigné le "Marchand").
                    </p>
                    <h2>
                        Identification du marchand</h2>
                    <p>
                        <ecom:RaisonJuridiqueRaisonSociale runat="server" />
                        <br />
                        <ecom:RaisonJuridiqueAdresse runat="server" />
                        <br />
                        RCS :
                        <ecom:RaisonJuridiqueRCSNumero runat="server" />
                        à
                        <ecom:RaisonJuridiqueRCSLieu runat="server" />
                        (N° TVA Intracommunautaire :
                        <ecom:RaisonJuridiqueTVANumero runat="server" />
                        )
                    </p>
                    <h2>
                        Article 1 - Applicabilité</h2>
                    <p>
                        Sous réserve de disposition spécifique signées entre le Client et le Marchand ou
                        contraire à la loi, les conditions réputées applicables sont celles en vigueur à
                        la date de validation de la commande.
                    </p>
                    <h2>
                        Article 2 - Commandes</h2>
                    <p>
                        Les commandes sont passées exclusivement sur le site internet
                        <ecom:SiteHomeUrl runat="server" />.</p>
                    <p>
                        La poursuite des différentes étapes du processus de commande jusqu'à son terme constitue
                        l'acceptation du contrat electronique au sens des articles 1369-4 à 1369-6 du code
                        civil et lie de manière ferme et définitive le Client et le Marchand aux termes
                        des présentes conditions générales de ventes.</p>
                    <h2>
                        Article 3 - Informations produits et disponibilité</h2>
                    <p>
                        Le Marchand apporte le plus grand soin à l'exactitude des informations relatives
                        aux produits proposés sur le site, dans la limite de la technique et dans le respect
                        de bonnes pratiques. Les photos sont communiquées à titre indicatif et ne sauraient
                        être considérées comme contractuelles.</p>
                    <p>
                        En cas de produits pouvant présenter des caractéristiques variables (articles "génériques",
                        disponibles chez des fournisseurs différents ou dont les informations ne peuvent
                        être connues par le Marchand à la date de la commande), le Marchand s'engage, dans
                        la mesure du possible et dans un délai raisonnable après en avoir eu connaissance,
                        à porter mention de ce fait sur la fiche fiche descriptive du produit.</p>
                    <p>
                        Les produits en vente sur le site
                        <ecom:SiteNom runat="server" />
                        sont conformes à la législation française en vigueur. La responsabilité du Marchand
                        ne saurait être engagée en cas de non conformité avec la législation du pays destinataire
                        dans le cas d'un éventuel export.</p>
                    <br />
                    <p>
                        Les commandes seront honorées dans la limite des stocks disponibles. En cas de non
                        disponibilité d'un ou plusieurs produits, le Marchand s'engage à contacter au moyen
                        d'un courrier électronique le Client afin de l'informer des délais dans lesquels
                        ces produits pourraient, le cas échéant, être livrés. Dans l'hypothèse où ce délai
                        dépasserai 7 jours, le Marchand se réserve le droit d'annuler toute ou partie de
                        la commande, et s'engage alors à rembourser le Client du montant des produits annulés
                        dans un délai de 5 jours, soit au moyen d'un avoir, soit par remboursement direct.</p>
                         <h2>
                        Article 4 - Prix</h2>
                        <p>Les prix affichés sur le site <ecom:SiteNom runat="server" /> sont, sauf mention contraire, exprimés toutes taxes comprises et en euros.
                        Les frais de port ainsi que d'éventuels frais de préparation sont en sus et seront présenté au Client avant la validation de sa commande.</p>
                        <p>En cas d'affichage d'un prix manifestement erroné, qu'il s'agisse d'une incohérence ou d'un vil prix,  et quelqu'en soit la cause, le Marchand se réserve le droit de procéder à l'annulation de la commande nonobstant toute validation initiale. </p>
                        <p>Le Marchand se réserve le droit de modifier ses prix à tout moment. En cas de modification, les tarifs en vigueur lors de la validation de la commande
                        sont garantis par le Marchand.</p>
                        <h2>
                        Article 5 - Préparation et livraison</h2>
                        <p></p>
                        <h2>
                        Article 6 - Paiement</h2>
                        <p></p>
                        <h2>
                        Article 7 - Rétraction et retours</h2>
                        <p></p>
                        <h2>
                        Article 8 - Garanties et service après vente</h2>
                        <p></p>
                        <h2>
                        Article 9 - Litige et responsabilité</h2>
                        <p></p>
                        <h2>
                        Article 10 - Données personnelles</h2>
                        <p></p>
                </Content>
            </ecom:ThemablePanelControl>
        </div>
        <div class="grid_4">
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ftr" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="GoogleAnalytics" runat="server">
</asp:Content>
<asp:Content ID="Content8" ContentPlaceHolderID="XitiAnalytics" runat="server">
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="TrackersAffiliation" runat="server">
</asp:Content>
<asp:Content ID="Content10" ContentPlaceHolderID="AfterContent" runat="server">
</asp:Content>
