<%@ Control Language="C#" AutoEventWireup="true" %>
<%@ Import Namespace="CPointSoftware.ECommerce.Tools" %>
<%@ Import Namespace="CPointSoftware.Equihira.Common" %>

<script runat="server">
    
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    
</script>

<script type="text/javascript">
document.write('<div id=\"cto_tr_1117_ac\" style=\"display:none\">');
document.write('<div class=\"ctoWidgetServer\">https:\/\/sslwidget.criteo.com\/pjl\/<\/div>');
document.write('<div class=\"ctoDataType\">transaction<\/div>');
<%
    Response.Write("document.write('<div class=\"ctoParams\">wi=1117&t="); 
    Response.Write("&s=1");
    int i=0;
    foreach(ElementPanier ligne in ECommerceServer.Panier.Contenu)
    {
        i++;
        Response.Write("&i");
        Response.Write(i);
        Response.Write("=");
        Response.Write(ligne.Reference);
    }
    Response.Write("<\\/div>');");
%>

document.write('<\/div>');
</script>
