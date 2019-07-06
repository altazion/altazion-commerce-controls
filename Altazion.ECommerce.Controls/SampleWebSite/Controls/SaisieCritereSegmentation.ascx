<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SaisieCritereSegmentation.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.SaisieCritereSegmentation" %>

<div class="tout">
    <asp:RadioButton ID="rdoTout" runat="server"  cssclass="tout"/> Tout sélectionner
</div>

<asp:Panel runat="server" ID="pnlSeg" CssClass="accordeon">

<%--<asp:Repeater runat="server" ID="rptRoot">
<ItemTemplate>
    <asp:Repeater ID="Repeater1" DataSource='<%@ Eval("Items")%>' runat="server">
    <HeaderTemplate>
        <div class="segheader"><asp:HyperLink ID="HyperLink1" NavigateUrl="#" runat="server" Text='<%@Eval("Libelle")%>' /></div>
        <div class="segcontent">
    </HeaderTemplate>
    <FooterTemplate></div></FooterTemplate>
    <ItemTemplate>
        <ecom:SaisieCritereSegmentationRadioButton ID="SaisieCritereSegmentationRadioButton1" runat="server" />
    </ItemTemplate>
    </asp:Repeater>
</ItemTemplate>
</asp:Repeater>

--%>
</asp:Panel>
<script type="text/javascript" language="javascript">
	$(function() {
	    $('#<%=pnlSeg.ClientID %>').accordion({ header: 'div.<%=HeaderCssClass%>', autoHeight: false, collapsible: true });
	    $('#<%=pnlSeg.ClientID %>').accordion('activate', false);
	    $('#<%=pnlSeg.ClientID %>').show();	    
    });
	</script>


