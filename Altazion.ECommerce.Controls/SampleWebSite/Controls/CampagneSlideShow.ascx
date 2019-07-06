<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CampagneSlideShow.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.CampagneSlideShow" %>
<asp:Panel cssclass="EPubliciteMultiImage" runat="server" ID="pnl">
    <asp:Repeater ID="pnlImgs" runat="server">
        <ItemTemplate>
            <div class='EPubliciteMultiImage<%#Eval("Ordre")%>'>
                <ecom:MouseOverHyperlink SkinId="EPubliciteMultiImage" runat="server" 
                    Width='<%#Eval("Width")%>' Height='<%#Eval("Height")%>'
                    Text='<%#Eval("AltData")%>' ToolTip='<%#Eval("AltData")%>'
                    ImageUrl='<%#Eval("ImageUrl")%>' NavigateUrl='<%#Eval("LinkUrl")%>' />
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <asp:Repeater ID="pnlTabs" runat="server">
        <HeaderTemplate>
            <ul class="EPubliciteListeImages">
        </HeaderTemplate>
        <ItemTemplate>
            <li><a class='EPubliciteMultiImage<%#Eval("Ordre")%>' href='#<%#Eval("Ordre")%>'><asp:Label runat="server" Text='<%#Eval("Ordre")%>' /></a></li>
        </ItemTemplate>
        <FooterTemplate>
            </ul></FooterTemplate>
    </asp:Repeater>
</asp:Panel>
