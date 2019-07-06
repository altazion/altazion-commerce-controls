<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RechercheCritere.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.RechercheCritere" %>
<div class="Criteres">
    <ecom:ThemablePanelControl runat="server" ID="pnlHeader">
        <Content>
            <p class="CritereTitre">
                <asp:Label ID="lblTitre" runat="server"></asp:Label>
            </p>
        </Content>
    </ecom:ThemablePanelControl>
    <ecom:RechercheCritereLabel runat="server" ID="lblActuel" CssClass="Selected" />
    <asp:MultiView runat="server" ID="mvTypeAffichage">
        <asp:View runat="server" ID="vwTable">
            <asp:GridView ID="GridView1" runat="server" GridLines="None" AutoGenerateColumns="False"
                ShowHeader="False" BorderWidth="0">
                <Columns>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <span class="CritereItem">
                                <ecom:RechercheCritereHyperLink ID="RechercherCritereModifierLink1" runat="server"
                                    CacherLesNonSelectionnes='true' TextIfActive='Modifier'
                                    PourPageAmp='<%# PourPageAmp %>'
                                    CssClassIfActive='<%# Eval("CritereGuid", "N") + " Remove"%>'
                                    CssClass='<%# Eval("CritereGuid", "N") %>'
                                    CritereGuid='<%# Eval("CritereGuid") %>' CritereValeurGuid='<%# Eval("ValueGuid") %>'>
            <asp:Label runat="server" CssClass="AvecPuce" Text='<%# Eval("ValueLabel") %>' />
                                </ecom:RechercheCritereHyperLink>
                                <ecom:CritereCountLabel runat="server" CritereGuid='<%# Eval("CritereGuid") %>' ValeurGuid='<%# Eval("ValueGuid") %>'
                                    ValeurFormat='(0)' /></span>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    Aucun filtre pour ce critère
                </EmptyDataTemplate>
            </asp:GridView>
        </asp:View>
        <asp:View runat="server" ID="vwListe">
            <ul class="RechercheCritereValeurs">
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                    <ItemTemplate>
                        <li>
                            <ecom:RechercheCritereHyperLink runat="server"
                                CssClassIfActive='<%# Eval("CritereGuid", "N") + " Remove"%>'
                                CssClass='<%# Eval("CritereGuid", "N") %>'
                                PourPageAmp='<%# PourPageAmp %>'
                                CacherLesNonSelectionnes='false'
                                TextIfActive='Modifier' CritereGuid='<%# Eval("CritereGuid") %>' CritereValeurGuid='<%# Eval("ValueGuid") %>'>
                            <asp:Label ID="Label1" runat="server" CssClass="AvecPuce" Text='<%# Eval("ValueLabel") %>' />
                            </ecom:RechercheCritereHyperLink>
                            <ecom:CritereCountLabel runat="server"
                                CritereGuid='<%# Eval("CritereGuid") %>' ValeurGuid='<%# Eval("ValueGuid") %>'
                                ValeurFormat='(0)' />
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
            <asp:Panel runat="server" ID="pnlLienListeComplementaire" Visible="false" CssClass="CritereMore">

                <script language="javascript" type="text/javascript">
                    jQuery(document).ready(function () {
                        $('#<%=lnkPlus.ClientID%>').click(function () {
                            $(this).next().toggle('fast');
                            $(this).toggleClass('selected');
                            return false;
                        }).next().hide();
                    });
                </script>

                <asp:HyperLink runat="server" ID="lnkPlus" href="#" Text="Plus de valeurs" />
                <asp:Panel runat="server" ID="pnlContentListeSupplementaire" Style="display: none;">
                    <asp:Repeater ID="Repeater2" runat="server">
                        <HeaderTemplate>
                            <ul class="RechercheCritereValeurs">
                        </HeaderTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                        <ItemTemplate>
                            <li>
                                <ecom:RechercheCritereHyperLink ID="RechercheCritereHyperLink1" runat="server"
                                    CssClassIfActive='<%# Eval("CritereGuid", "N") + " Remove"%>'
                                    CssClass='<%# Eval("CritereGuid", "N") %>'
                                    PourPageAmp='<%# PourPageAmp %>'
                                    CacherLesNonSelectionnes='true' TextIfActive='Modifier' CritereGuid='<%# Eval("CritereGuid") %>'
                                    CritereValeurGuid='<%# Eval("ValueGuid") %>'>
                            <asp:Label ID="Label1" runat="server" CssClass="AvecPuce" Text='<%# Eval("ValueLabel") %>' />
                                </ecom:RechercheCritereHyperLink>
                                <ecom:CritereCountLabel ID="CritereCountLabel1" runat="server" CritereGuid='<%# Eval("CritereGuid") %>'
                                    ValeurGuid='<%# Eval("ValueGuid") %>' ValeurFormat='(0)' />
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>
            </asp:Panel>
        </asp:View>
    </asp:MultiView>

    <ecom:ThemablePanelControl runat="server" ID="pnlFooter">
        <Content>
        </Content>
    </ecom:ThemablePanelControl>

    <ecom:CriteresDataSource runat="server" ID="CritereDataSource" OnSelecting="CritereDataSource_Selecting"
        OnSelected="CritereDataSource_Selected">
        <Parameters>
            <asp:Parameter Name="CritereGuid" />
        </Parameters>
    </ecom:CriteresDataSource>
</div>
