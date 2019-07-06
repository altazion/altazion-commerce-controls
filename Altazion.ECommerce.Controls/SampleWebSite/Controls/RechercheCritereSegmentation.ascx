<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RechercheCritereSegmentation.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.RechercheCritereSegmentation" %>
<div class="Criteres">
    <ecom:ThemablePanelControl runat="server" ID="pnlHeader">
        <Content>
            <p class="CritereTitre">
                <asp:Label ID="lblTitre" runat="server"></asp:Label>
            </p>
        </Content>
    </ecom:ThemablePanelControl>
    <asp:Panel runat="server" ID="pnlLevel2" Visible="false" class="Selected">
        <asp:Label ID="lblLevel2" runat="server" />
    </asp:Panel>
    <asp:Panel runat="server" ID="pnlLevel3" Visible="false" class="Selected">
        <asp:Label ID="lblLevel3" runat="server" />
    </asp:Panel>
    <asp:MultiView runat="server" ID="mvTypeAffichage">
        <asp:View runat="server" ID="vwTable">
            <asp:GridView runat="server" DataSourceID="SegSource" AutoGenerateColumns="False"
                ShowHeader="False" GridLines="None" BorderWidth="0">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Label runat="server" CssClass='<%# "AvecPuce" + Eval("Level").ToString() %>'>
        <ecom:RechercherSegmentHyperLink runat="server" 
                                PourPageAmp='<%# PourPageAmp %>'
        SegmentPk='<%# Eval("Id") %>' 
        Text='<%# Eval("Label") %>'
        CssClassForLevel2="Level2"
        CssClassForLevel3="Level3"
        CssClassForLevel4="Level4"
        Level='<%# Eval("Level") %>'
        ParentSegmentPk='<%# Eval("ParentId") %>'
        />
        (<asp:Label runat="server" Text='<%# Eval("Count") %>' />)
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

        </asp:View>
        <asp:View runat="server" ID="vwListe">
            <asp:Repeater ID="GridView1" runat="server" DataSourceID="SegSource">
                <HeaderTemplate>
                    <ul class="RechercheCritereValeurs">
                </HeaderTemplate>
                <FooterTemplate>
                    </ul>
                </FooterTemplate>
                <ItemTemplate>
                    <li>
                        <asp:Label ID="Label1" runat="server" CssClass='<%# "AvecPuce" + Eval("Level").ToString() %>'>
                            <ecom:RechercherSegmentHyperLink ID="RechercherSegmentHyperLink1" runat="server"
                                PourPageAmp='<%# PourPageAmp %>'
                                SegmentPk='<%# Eval("Id") %>' Text='<%# Eval("Label") %>' CssClassForLevel2="Level2"
                                CssClassForLevel3="Level3" CssClassForLevel4="Level4" Level='<%# Eval("Level") %>'
                                ParentSegmentPk='<%# Eval("ParentId") %>' />
                            (<asp:Label ID="Label2" runat="server" Text='<%# Eval("Count") %>' />) </asp:Label></li>
                </ItemTemplate>

            </asp:Repeater>

        </asp:View>

    </asp:MultiView>
    <ecom:SegmentsSourceControl
        runat="server" ID="SegSource" Mode="PourRecherche"
        OnSelected="SegSource_Selected" OnSelecting="SegSource_Selecting">
        <Parameters>
            <ecom:ContexteParameter Field="SegmentPk" Name="SegPk" />
            <asp:Parameter Name="MaxCount" DefaultValue="5000" Type="Int32" />
        </Parameters>
    </ecom:SegmentsSourceControl>
    <asp:Panel runat="server" ID="pnlUp" class="RemoveSegmentation" Visible="false">
        <ecom:RechercherSegmentHyperLink ID="lnkUp" runat="server" CssClassIfActive='Remove'
            Text="Modifier" />
    </asp:Panel>

    <ecom:ThemablePanelControl runat="server" ID="pnlFooter">
        <Content>
        </Content>
    </ecom:ThemablePanelControl>

</div>
