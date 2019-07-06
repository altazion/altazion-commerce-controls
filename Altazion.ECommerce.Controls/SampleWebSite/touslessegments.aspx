<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="touslessegments.aspx.cs"
    Inherits="CPointSoftware.ECommerce.Site.touslessegments" MasterPageFile="~/Masters/DefaultTheme.Master"
    MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="ToutesLesMarques">
        <ecom:TousLesSegments runat="server" RepeatColumns="2" SeparatorCssClass="Separator" /> 
    </div>
</asp:Content>
