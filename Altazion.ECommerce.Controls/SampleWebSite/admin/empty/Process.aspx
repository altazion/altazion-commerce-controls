<%@ Page Language="C#" AutoEventWireup="true" MaintainScrollPositionOnPostback="true"  
    Inherits="CPointSoftware.ECommerce.Tools.ECommerceExecutablePage" 
    MasterPageFile="~/Masters/DefaultTheme.Master" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- remplacez l'id du div suivant par Step1ProcessHeader ou Step2ProcessHeader selon vos besoins -->
    <div id="Step3ProcessHeader"></div> 
    <div id="ExecContent">
        <!-- placez ici le contenu de votre page -->
    </div>
        <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="ExecFooter" />
    </div>

</asp:Content>