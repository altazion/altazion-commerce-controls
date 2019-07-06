<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RechercheResume.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.RechercheResume" %>
<ecom:ResumeContextePanel runat="server">
    <ecom:ThemablePanelControl runat="server" SkinID="RechercheResumeHeader">
        <Content>
        </Content>
    </ecom:ThemablePanelControl>

    <asp:MultiView runat="server" ID="mvResume">
        <asp:View runat="server" ID="vwTable">
            <asp:GridView runat="server" DataSourceID="ContexteSource" AutoGenerateColumns="false"
                BorderWidth="0" BorderColor="Transparent" ShowHeader="false">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <ecom:ThemablePanelControl ID="ThemablePanelControl1" runat="server" SkinID="RechercheResumeItem">
                                <Content>
                                    <div class="RechercheResumeCritere">
                                        <ecom:RechercherRetirerCritereLink runat="server" SkinID="RechercheResumeItem" />
                                    </div>
                                </Content>
                            </ecom:ThemablePanelControl>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </asp:View>
        <asp:View runat="server" ID="vwFlux">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="ContexteSource">
                <ItemTemplate>
                    <ecom:ThemablePanelControl runat="server" SkinID="RechercheResumeItem">
                        <Content>
                            <ecom:RechercherRetirerCritereLink ID="lnkRetirer" runat="server" SkinID="RechercheResumeItem" />
                        </Content>
                    </ecom:ThemablePanelControl>
                </ItemTemplate>
            </asp:Repeater>
        </asp:View>
    </asp:MultiView>
    <ecom:ContexteDataSource runat="server" ID="ContexteSource" />
    <ecom:ThemablePanelControl runat="server" SkinID="RechercheResumeFooter">
        <Content>
        </Content>
    </ecom:ThemablePanelControl>
</ecom:ResumeContextePanel>
