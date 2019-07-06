<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Retractation.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Clients.Retractation"
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="pnlHeaderMy" runat="server" SkinID="ClientsAllPagesHeader" />
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ClientsRetractationHeader">
            <Content>
                <h1>
                    Votre demande de retractation</h1>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div id="ExecContent">
        <div id="ExecRetractationContent">
            <asp:MultiView ID="mvRetraction" runat="server" ActiveViewIndex="0">
                <asp:View runat="server" ID="vwDemande">
                    <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="ClientsRetractationContentHeader">
                        <Content>
                        </Content>
                    </ecom:ThemablePanelControl>
                    <div class="RetractationForm">
                        <p class="RetractationNumCommande">
                            <span class="Entete">
                                <asp:Label ID="Label1" runat="server" SkinID="RetractationFormNumCommandeLabel" Text="N° de commande : " /></span>
                            <asp:TextBox runat="server" Columns="10" ID="txtNumCommande" SkinID="RetractationFormNumCommandeInput"
                                ReadOnly="true" />
                        </p>
                        <p class="RetractationRaison">
                            <span class="Entete">
                                <asp:Label ID="Label3" runat="server" SkinID="RetractationFormRaisonLabel" Text="Raison de votre demande : " /></span>
                            <asp:DropDownList runat="server" ID="cboRaison" SkinID="RetractationFormRaisonInput">
                                <asp:ListItem Value="AV" Selected="True">Changement d'avis</asp:ListItem>
                                <asp:ListItem Value="AB">Abimé</asp:ListItem>
                                <asp:ListItem Value="NC">Ne correspond pas</asp:ListItem>
                                <asp:ListItem Value="RE">Arrivé trop tard</asp:ListItem>
                            </asp:DropDownList>
                        </p>
                        <p class="RetractationText">
                            <span class="Entete">
                                <asp:Label ID="Label5" runat="server" SkinID="RetractationFormTexteLabel" Text="Votre demande : " /></span>
                            <asp:TextBox runat="server" ID="txtDetails" SkinID="RetractationFormTexteInput" Rows="5"
                                Columns="40" TextMode="MultiLine" />
                        </p>
                        <p class="RetractationSubmit">
                            <ecom:MouseOverImageButton ID="btnEnregistrer" SkinID="RetractationFormSubmit" runat="server"
                                ImageUrl="images/standard/btnOk.gif" OnClick="btnEnregistrer_Click" />
                        </p>
                    </div>
                    <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ClientsRetractationContentHeader">
                        <Content>
                        </Content>
                    </ecom:ThemablePanelControl>
                </asp:View>
                <asp:View runat="server">
                    <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="RetractationOkMessage">
                        <Content>
                            <p class="MessageOk">
                                Votre demande a été enregistrée, un e-mail de confirmation vous sera envoyé d'ici
                                quelques minutes.</p>
                        </Content>
                    </ecom:ThemablePanelControl>
                </asp:View>

                <asp:View ID="vwImpossiblePrepaExterieure" runat="server">
                    <ecom:ThemablePanelControl ID="ThemablePanelControl6" runat="server" SkinID="RetractationKoMessagePrepaExterieure">
                        <Content>
                            <p class="MessageKo">
                                Impossible d'annuler cette commande : sa préparation est en cours.</p>
                        </Content>
                    </ecom:ThemablePanelControl>
                </asp:View>

            </asp:MultiView>
        </div>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl5" runat="server" SkinID="ExecFooter" />
    </div>

</asp:Content>
