<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RecuperationBonAchat.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Clients.RecuperationBonAchat"
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <ecom:ThemablePanelControl ID="ThemablePanelControl6" runat="server" SkinID="ClientsEnCoursAvantBonsAchats" />
            <div class="bonsAchats">
                <asp:multiview runat="server" activeviewindex="0" id="mvBonsAchats">
                    <asp:view runat="server" id="vwAvecBA">
                        <ecom:BonsAchatsGridView runat="server" ID="gdvBons" SkinID="ClientsEnCoursBonsAchats">
                            <Columns>
                                <ecom:BonAchatsLabelGridColumn runat="server" />
                                <ecom:BonAchatsConditionsGridColumn runat="server" />
                                <ecom:BonAchatsOriginalAmountGridColumn runat="server" Format="{0:0.00} €" />
                                <ecom:BonAchatsAmountGridColumn runat="server" Format="{0:0.00} €" />
                            </Columns>
                        </ecom:BonsAchatsGridView>

                        
                            <ecom:BonAchatsRecupereLink runat="server" OnBonsAchatsRecupe="lnk_BonsAchatsRecupe">Débloquer les bons d'achats</ecom:BonAchatsRecupereLink>
                        
                    </asp:view>
                    <asp:view runat="server" id="vwSansBA">
            
            Vous n'avez pas de bons d'achats susceptible d'être débloqués
            
            </asp:view>
                </asp:multiview>
            </div>
            <ecom:ThemablePanelControl ID="ThemablePanelControl5" runat="server" SkinID="ClientsEnCoursApresBonsAchats" />

</asp:Content>