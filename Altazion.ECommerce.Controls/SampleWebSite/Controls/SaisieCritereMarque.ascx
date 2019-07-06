<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SaisieCritereMarque.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.SaisieCritereMarque" %>

<asp:UpdatePanel runat="server" ID="updPanel">
    <ContentTemplate>
        <div class="tout">
        
            <asp:RadioButton ID="rdoTout" AutoPostBack="true" runat="server" GroupName="SaisieCritereMarque"  Text="Tout sélectionner" CssClass="tout" />
            
        </div>
        <asp:Panel runat="server" ID="pnlCrit">
            <%--            <p class="cbox border">
                <asp:RadioButton GroupName="SaisieCritereMarque" Text="Action Man" /></p>
--%>
        </asp:Panel>
        <asp:Panel runat="server" ID="pnlSuppl" CssClass="Plus">
            <asp:Hyperlink onclick="$(this).next().toggle('fast');$(this).toggleClass('selected');return false;" NavigateUrl="~/recherche.htm" ID="lnkPlus" runat="server">Plus de marques</asp:Hyperlink>
            <asp:Panel runat="server" ID="pnlCritSuppl" style="display:none">
            </asp:Panel>
        </asp:Panel>
        </script>

    </ContentTemplate>
</asp:UpdatePanel>
