<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="RechercheCritereMarque.ascx.cs"
    Inherits="CPointSoftware.ECommerce.Site.Controls.RechercheCritereMarque" %>

<div class="Criteres">
<p class="CritereTitre">
    <asp:Label ID="lblTitre" runat="server"></asp:Label>
</p>
<ecom:RechercheMarqueLabel runat="server" ID="lblActuelle" CssClass="Selected" />
<asp:MultiView runat="server" ID="mvTypeAffichage">
    <asp:View runat="server" ID="vwTable">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False"
            GridLines="None" BorderWidth="0">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <span class="AvecPuce">
                            <ecom:RechercherMarqueHyperLink ID="RechercherMarqueHyperLink" runat="server" CssClassIfActive='Remove'
                                PourPageAmp='<%# PourPageAmp %>'
                                TextIfActive="Modifier" />
                            (<asp:Label ID="Label1" runat="server" Text='<%# Eval("Count") %>' />)
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                Aucun filtre pour ce critère</EmptyDataTemplate>
        </asp:GridView>
    </asp:View>
    <asp:View runat="server" ID="vwListe">
        <asp:Repeater ID="Repeater1" runat="server">
            <HeaderTemplate>
                <ul class="RechercheCritereValeurs">
            </HeaderTemplate>
            <FooterTemplate>
                </ul></FooterTemplate>
            <ItemTemplate>
                <li>
                    <ecom:RechercherMarqueHyperLink ID="RechercherMarqueHyperLink" runat="server" CssClassIfActive='Remove'
                                PourPageAmp='<%# PourPageAmp %>'
                        TextIfActive="Modifier" />
                    (<asp:Label ID="Label1" runat="server" Text='<%# Eval("Count") %>' />) </li>
            </ItemTemplate>
        </asp:Repeater>
                <asp:Panel runat="server" ID="pnlLienListeComplementaire" Visible="false" CssClass="CritereMore">

            <script type="text/javascript">
                jQuery(document).ready(function() {
                    $('#<%=lnkPlus.ClientID%>').click(function() {
                        $(this).next().toggle('fast');
                        $(this).toggleClass('selected');
                        return false;
                    }).next().hide();
                });
            </script>

            <asp:HyperLink runat="server" ID="lnkPlus" href="#" Text="Plus de valeurs" />
            <asp:Panel runat="server" ID="pnlContentListeSupplementaire" Style="display: none;" >
                <asp:Repeater ID="Repeater2" runat="server">
                    <HeaderTemplate>
                        <ul class="RechercheCritereValeurs">
                    </HeaderTemplate>
                    <FooterTemplate>
                        </ul></FooterTemplate>
                    <ItemTemplate>
                        <li>
                            <ecom:RechercherMarqueHyperLink ID="RechercherMarqueHyperLink" runat="server" CssClassIfActive='Remove'
                                PourPageAmp='<%# PourPageAmp %>'
                                TextIfActive="Modifier" />
                            (<asp:Label ID="Label1" runat="server" Text='<%# Eval("Count") %>' />)
                        
                        
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </asp:Panel>
            </asp:Panel>
        </asp:View>
    </asp:MultiView>
    <ecom:MarquesSource runat="server" ID="MarqueSource" Mode="PourRecherche" MaxRows="5"
        OnSelected="MarqueSource_Selected" />
</div>
