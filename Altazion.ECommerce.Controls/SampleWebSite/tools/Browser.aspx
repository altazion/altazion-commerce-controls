<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true"
 Inherits="CPointSoftware.ECommerce.Tools.ECommerceExecutablePage" %>
 
 <script runat="server">
 
     protected void Page_Load(object sender, EventArgs e)
     {
         lblBrowser.Text = Request.UserAgent;
         lblFamille.Text = Request.Browser.Browser;
         rptCapabilities.DataSource = Request.Browser.Capabilities;
         rptCapabilities.DataBind();
     }
    
     
 </script>
 
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        P { font-size:larger; }
        SPAN { display:block; float:left; }
        .Header { display:block; width:350px; float:left; font-weight:bold; }
        li { border-bottom:solid 1px gainsboro; }
        h3 { border-bottom:solid 3px whitesmoke; }
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<h3>Page d'identification du browser</h3>

<p style="margin-top:35px;">
    <span class="Header">Votre navigateur : </span><asp:Label runat="server" id="lblBrowser" />
</p>

<p style="clear:both;margin-bottom:50px;">
    <span class="Header">Famille : </span><asp:Label runat="server" id="lblFamille" />
</p>


<ul style="clear:both;">
<asp:Repeater runat="server" ID="rptCapabilities">
<ItemTemplate>
<li>
<asp:Label runat="server" CssClass="Header" Text='<%# Eval("Key") %>' />
<asp:Label runat="server" Text='<%# Eval("Value") %>' />
</li>
</ItemTemplate>
</asp:Repeater>

</ul>


</asp:Content>
