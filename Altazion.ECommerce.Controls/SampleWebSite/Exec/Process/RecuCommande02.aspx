<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuCommande02.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Process.RecuCommande02" MasterPageFile="~/Masters/DefaultTheme.Master"
    MaintainScrollPositionOnPostback="true" %>

<%@ OutputCache Location="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="RecuVideHeader">
    </ecom:ThemablePanelControl>
    <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="RecuVideContent">
        <Content>
            <div class="content">
                <section class="main">
                    <div class="contenu-recu">
                        <div class="container">
                            <div class="row recu-content">
                                <div class="col-md-12">
                                    <h1>Merci pour votre commande !</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </Content>
    </ecom:ThemablePanelControl>
    <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="RecuVideFooter">
    </ecom:ThemablePanelControl>
    <ecom:ThemablePanelControl ID="ThemablePanelControl5" runat="server" SkinID="ExecVideFooter" />
</asp:Content>
