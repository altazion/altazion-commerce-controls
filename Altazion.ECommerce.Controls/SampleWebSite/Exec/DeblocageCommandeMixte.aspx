<%@ Page Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true" CodeBehind="DeblocageCommandeMixte.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.DeblocageCommandeMixte" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <h3><asp:Literal runat="server" meta:resourceKey="TitreDeblocageCommandeMixte">Déblocage commande mixte</asp:Literal></h3>

    <asp:MultiView runat="server" ID="mvDeblocageMixte" ActiveViewIndex="0">
        <asp:View runat="server" ID="vwClearPanier">
            <asp:HiddenField runat="server" id="hdnAddType" />
            <asp:HiddenField runat="server" id="hdnMagId" />
            <asp:HiddenField runat="server" id="hdnArtGuid" />
            <p><asp:Literal runat="server" ID="MessageClearPanier"></asp:Literal></p>
            
            <asp:LinkButton runat="server" ID="lnkClearAndAdd" Visible="false" CssClass="btn btn-orange" OnClick="lnkClearAndAdd_Click">Remplacer</asp:LinkButton>
            <asp:LinkButton runat="server" ID="lnkClearPanier" CssClass="btn btn-orange" OnClick="lnkClearPanier_Click">Vider</asp:LinkButton>

            <h3>Votre Panier</h3>
            <ecom:PanierLignes ID="ResumePanier" runat="server" ShowAs="Repeater" AssociesMagasin="true" Type="Produit" IsEditable="false" />

        </asp:View>
        
    </asp:MultiView>

   <%-- <asp:Panel runat="server" ID="pnlClearPanier">
        <p><asp:Literal runat="server" meta:resourceKey="messageClearPanier">
            Voulez vous vider le panier?
        </asp:Literal></p>
        <asp:LinkButton runat="server" ID="lnkClearPanier" OnClick="lnkClearPanier_Click"></asp:LinkButton>
    </asp:Panel>
    
    <asp:Panel runat="server" ID="pnlWebToMag" Visible="false">
        <p><asp:Literal runat="server" meta:resourceKey="messageClearPanier">
            Voulez vous vider le panier?
        </asp:Literal></p>
        <asp:LinkButton runat="server" ID="LinkButton1" OnClick="lnkClearPanier_Click"></asp:LinkButton>
    </asp:Panel>

    <asp:Panel runat="server" ID="pnlMagToWeb" Visible="false">
        <p><asp:Literal runat="server" meta:resourceKey="messageClearPanier">
            Voulez vous vider le panier?
        </asp:Literal></p>
        <asp:LinkButton runat="server" ID="LinkButton2" OnClick="lnkClearPanier_Click"></asp:LinkButton>
    </asp:Panel>--%>

</asp:Content>

