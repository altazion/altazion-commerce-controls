<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="touteslesmarques.aspx.cs"
    Inherits="CPointSoftware.ECommerce.Site.touteslesmarques" MasterPageFile="~/Masters/DefaultTheme.Master"
    MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ToutesLesMarques">
        <ecom:ToutesLesMarquesListe runat="server" RepeatColumns="1" SeparatorCssClass="Separator" />
    </div>
</asp:Content>
