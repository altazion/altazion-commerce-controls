<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideoPlayer.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.VideoPlayer"
MasterPageFile="~/Masters/Empty.Master"
 %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
<ecom:ProductVideo runat="server" PlayerUrl= "~/clientbin/player_flv_mini.swf" ID="videoPlayer" />
</asp:Content>