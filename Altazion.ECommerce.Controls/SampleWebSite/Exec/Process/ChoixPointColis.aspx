<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChoixPointColis.aspx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Exec.Process.ChoixPointColis" MasterPageFile="~/Masters/DefaultTheme.Master"
    MaintainScrollPositionOnPostback="true" %>
<%@ OutputCache Location="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Step1ProcessHeader">
    </div>
    <div id="ExecContent">
        <div id="ChoixPointLivraison">
                               
            <asp:Panel runat="server" DefaultButton="btnRecheche">
                <div class="Header">
                    <ecom:ThemablePanelControl runat="server" SkinID="ChoixPointLivraisonHeader">
                        <Content>
                            <h1>
                                Choisissez votre relais de livraison</h1>
                        </Content>
                    </ecom:ThemablePanelControl>
                </div>
                <div class="ContentHeader">
                    <ecom:ThemablePanelControl runat="server" SkinID="ChoixPointLivraisonContentHeader">
                        <Content>
                            <p>
                                Pour choisir votre point relais, veuillez saisir votre code postal :</p>
                        </Content>
                    </ecom:ThemablePanelControl>
                    <div class="SaisieCodePostal">
                        <asp:TextBox runat="server" ID="txtCodePostal" Columns="7" CssClass="Textbox" />
                        <asp:DropDownList ID="cboPays" runat="server">
                            <asp:ListItem Text="France" Value="FRA" Selected="True" />
                        </asp:DropDownList>
                        &nbsp;
                        <ecom:MouseOverImageButton ID="btnRecheche" runat="server" SkinID="ChoixPointLivraisonCPSearch"
                            ImageUrl="~/images/standard/btnOk.gif" CssClass="Image" />
                    </div>
                    <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ChoixPointLivraisonCPFooter">
                        <Content>
                        </Content>
                    </ecom:ThemablePanelControl>
                </div>
            </asp:Panel>
            <div class="Liste">
                <ecom:PointsLivraisonList runat="server" ID="lstPoints" DataSourceID="PlvSource"
                    Visible="false" OnItemCommand="lstPoints_ItemCommand">
                    <ItemTemplate>
                        <div class="PointRelais">
                            <div class="Adresse">
                                <p class="Libelle">
                                    <ecom:PointsLivraisonLibelle ID="PointsLivraisonLibelle1" runat="server" /></p>
                                <p class="Adresse">
                                    <ecom:PointsLivraisonAdresse ID="PointsLivraisonLibelle2" runat="server" /></p>
                                <p class="Ville">
                                    <ecom:PointsLivraisonCodePostal runat="server" />
                                    <ecom:PointsLivraisonVille ID="PointsLivraisonLibelle4" runat="server" /></p>
                                <p class="Button">
                                    <ecom:PointsLivraisonLink runat="server" />
                                </p>
                            </div>
                            <div class="Horaires">
                                <ecom:PointsLivraisonHoraires runat="server" />
                            </div>
                        </div>
                    </ItemTemplate>
                </ecom:PointsLivraisonList>
                <ecom:PointsLivraisonSource runat="server" ID="PlvSource">
                    <Parameters>
                        <asp:ControlParameter Name="CodePostal" ControlID="txtCodePostal" PropertyName="Text" />
                    </Parameters>
                </ecom:PointsLivraisonSource>
            </div>
            <ecom:ThemablePanelControl ID="ThemablePanelControl2" runat="server" SkinID="ChoixPointLivraisonContentFooter">
                <Content>
                </Content>
            </ecom:ThemablePanelControl>
        </div>
    </div>
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ExecFooter" />
    </div>

</asp:Content>
