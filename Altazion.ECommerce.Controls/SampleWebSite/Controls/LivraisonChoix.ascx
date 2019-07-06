<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LivraisonChoix.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.LivraisonChoix" %>
<div id="LivraisonChoix">
    <ecom:ThemablePanelControl ID="ThemablePanelControl0" runat="server" SkinID="LivraisonChoixHeader">
    </ecom:ThemablePanelControl>
    <asp:MultiView ID="mvMode" runat="server">
        <asp:View runat="server" ID="vwRadio">
            <asp:MultiView ID="pnlAdresse" runat="server">
                <asp:View ID="pnlAdresseNonRenseignee" runat="server">
                    <div id="AdresseNonRenseignee">
                        <p>
                            <asp:HyperLink runat="server" NavigateUrl="~/login.aspx">Connectez vous</asp:HyperLink>
                            pour connaître le detail des frais de ports de votre commande
                        </p>
                        <p>
                            Vous pouvez aussi estimer le montant de vos frais de port en renseignant les champs
                            suivants :</p>
                        <span class="HeaderLabel">Code Postal de livraison</span>
                        <asp:TextBox ID="txtCP" runat="server" Columns="6" />
                        <asp:DropDownList ID="cboPays" runat="server">
                            <asp:ListItem Text="Belgique" Value="BEL" />
                            <asp:ListItem Text="France" Value="FRA" Selected="True" />
                            <asp:ListItem Text="Suisse" Value="CHS" />
                        </asp:DropDownList>
                        &nbsp;
                        <asp:Button ID="Button1" runat="server" Text="Modifier" OnClick="Button1_Click" />
                    </div>
                </asp:View>
                <asp:View ID="pnlAdresseRenseignee" runat="server">
                </asp:View>
            </asp:MultiView>
            <ecom:ModesLivraisonsRadioList ID="ModesLivraisonList" AutoPostBack="True" runat="server"
                DataSourceID="ModesLivraisonSource" DataTextField="Libelle" CssClass="ModeLivraisonRadioList"
                DataValueField="ModeLivraisonGuid" OnDataBound="ModesLivraisonList_DataBound"
                OnSelectedIndexChanged="ModesLivraisonList_SelectedIndexChanged" />
        </asp:View>
        <asp:View runat="server" ID="vwRepeater">
            
            <ecom:ModesLivraisonsRepeater ID="ModesLivraisonsRepeater1" runat="server"
                DataSourceID="ModesLivraisonSource" SkinId="ModesLivraisonsRepeater">
                <ItemTemplate>
                    <ecom:ThemablePanelControl runat="server" SkinID="ModesLivraisonsRepeaterItem" />
                </ItemTemplate>
            </ecom:ModesLivraisonsRepeater>
        </asp:View>
        <asp:View runat="server" ID="vwCombo">
            <ecom:ModesLivraisonsCombo AutoPostBack="true" runat="server" SkinID="PanierModesLivraisonsCombo"
                ID="ModesLivraisonsCombo" OnDataBound="ModesLivraisonsCombo_DataBound" DataSourceID="ModesLivraisonSource"
                DataValueField="ModeLivraisonGuid" DataTextField="Details" OnSelectedIndexChanged="ModesLivraisonsCombo_SelectedIndexChanged" />
            <div id="PanierLivraisonChoixDestinationPopup" style="display: none;">
                <ecom:ThemablePanelControl runat="server" SkinID="PanierLivraisonChoixDestinationPopupHeader" />
                <asp:Panel runat="server" DefaultButton="btnChangerDest" class="PopupContent">
                    <span class="HeaderLabel">Code Postal de livraison</span>
                    <asp:TextBox ID="txtCPDest" runat="server" Columns="6" />
                    <asp:DropDownList ID="cboPaysDest" runat="server">
                        <asp:ListItem Text="Belgique" Value="BEL" />
                        <asp:ListItem Text="France" Value="FRA" Selected="True" />
                        <asp:ListItem Text="Suisse" Value="CHS" />
                    </asp:DropDownList>
                    &nbsp;
                    <asp:LinkButton ID="btnChangerDest" runat="server" Text="Modifier" OnClick="btnChangerDest_Click" />
                </asp:Panel>
                <ecom:ThemablePanelControl runat="server" SkinID="PanierLivraisonChoixDestinationPopupFooter" />
            </div>
        </asp:View>
    </asp:MultiView>
    <ecom:ModesLivraisonDataSource runat="server" ID="ModesLivraisonSource" />
    <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="LivraisonChoixFooter">
    </ecom:ThemablePanelControl>
</div>
