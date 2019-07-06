<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PerteMotDePasse.aspx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.PerteMotDePasse" MasterPageFile="~/Masters/DefaultTheme.Master"
    MaintainScrollPositionOnPostback="true" %>

<%@ OutputCache Location="None" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ClientHeader">
        <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="PerteMotPasseHeader">
            <Content>
                <h2>
                    Mot de passe perdu</h2>
            </Content>
        </ecom:ThemablePanelControl>
    </div>
    <div id="ExecContent">
        <div class="PermetMotPasseContent">
            <ecom:ThemablePanelControl runat="server" ID="ThemablePanel1" SkinID="PerteMotPasseContentHeader">
                <Content>
                    <span>Utilisez ce formulaire si vous ne vous souvenez plus de votre mot de passe. <br />Un
                        nouveau mot de passe sera généré automatiquement et vous sera envoyé à votre adresse
                        e-mail.</span>
                </Content>
            </ecom:ThemablePanelControl>
            <div class="PerteMotPasseForm">
                <asp:MultiView runat="server" ID="mviewResultat" ActiveViewIndex="0">
                    <asp:View runat="server" ID="vwDemande">
                        <asp:Label ID="Label1" runat="server" SkinID="PerteMotPasseEmailLabel"><b>Votre adresse e-mail : </b></asp:Label><br />
                        <div class="col-md-12">
                        <asp:TextBox runat="server" SkinID="PerteMotPasseEmailTextbox" ID="txtEmail" CssClass="TextBox"></asp:TextBox>
                        <ecom:MouseOverImageButton runat="server" SkinID="PerteMotPasseGoButton" ID="btnChanger"
                            ImageUrl="~/images/standard/btnOk.gif" OnClick="btnChanger_Click" />
                                                        </div>

                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Adresse e-mail invalide" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    </asp:View>
                    <asp:View runat="server" ID="vwOK">
                        <ecom:ThemablePanelControl ID="pnlOk" runat="server" SkinID="PerteMotPasseOk">
                            <Content>
                                <div class="confirmation">
                                    <asp:Label runat="server" SkinID="PerteMotPasseMessageOk" Text="Votre nouveau mot de passe vous a été envoyé" />
                                </div>
                            </Content>
                        </ecom:ThemablePanelControl>
                    </asp:View>
                    <asp:View runat="server" ID="vwErreur">
                        <ecom:ThemablePanelControl ID="pnlErreur" runat="server" SkinID="PerteMotPasseError">
                            <Content>
                                <div class="erreur">
                                    <asp:Label runat="server" ID="txtErreur" SkinID="PerteMotPasseMessageErreur" />
                                    <br />
                                    <asp:HyperLink runat="server" NavigateUrl="~/Exec/PerteMotDePasse.aspx" Text="Corriger cette erreur" />
                                </div>
                            </Content>
                        </ecom:ThemablePanelControl>
                    </asp:View>
                </asp:MultiView>
            </div>
            <ecom:ThemablePanelControl runat="server" SkinID="PerteMotPasseContentFooter">
                <Content>
                </Content>
            </ecom:ThemablePanelControl>
        </div>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ExecFooter" />
    </div>





<style>
    .confirmation, .erreur{
        font-weight: bold;
    }
    .PerteMotPasseForm{
        margin-top: 10px;
    }
    #ClientHeader{
        text-align: center;
        margin-top: 20px;
    }
    #ExecContent{
        text-align: center;
        margin: 30px 30px;
    }
    @media (max-width: 650px){
        #ClientHeader{
        text-align: center;
        margin-top: 40px;
    }
        #ExecContent{
            margin: 25px 4px;
        }
    }
</style>
</asp:Content>
