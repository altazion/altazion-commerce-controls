<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaisieCadeaux.aspx.cs" Inherits="CPointSoftware.ECommerce.Site.Exec.Process.SaisieCadeaux" 
    MasterPageFile="~/Masters/DefaultTheme.Master" MaintainScrollPositionOnPostback="true" %>
<%@ OutputCache Location="None" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="Step1ProcessHeader">
        
    </div>
    <div id="ExecContent">
        <p>Merci d’indiquer pour chacun des cadeaux le prénom de l’enfant.</p>
        <div style="margin-left:200px; width:450px;">
    
        <asp:GridView ID="GridView1" runat="server" DataSourceID="CartSource"
            AutoGenerateColumns="False" DataKeyNames="LigneGuid" BorderWidth="0px">
            <Columns>
                <asp:TemplateField >
                    <ItemTemplate>
                        <ecom:RewrittenImage runat="server" ImageUrl='<%# Eval("ThumbImage") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                    </asp:TemplateField>
                <asp:BoundField DataField="Libelle" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:TextBox ID="txtDest" Width="140px" runat="server" Text='<%# Eval("Commentaire") %>'></asp:TextBox>
                        <asp:HiddenField ID="hdGuid" runat="server" Value='<%# Eval("LigneGuid") %>' />
                    </ItemTemplate>
                    <ItemStyle Width="140px" />
                </asp:TemplateField>
              
            </Columns>
        </asp:GridView>
    
        <br />
        
        <ecom:MouseOverImageButton runat="server" SkinID="PanierConfirmerCommande" 
            ToolTip="Valider les modifications" onclick="Unnamed1_Click" ImageUrl="~/App_Themes/sit_2/button_continuerfleche.gif"
            MouseOverImageUrl="~/App_Themes/sit_2/button_continuerfleche_hover.gif" />
            
            </div>
    <ecom:PanierSourceControl runat="server" ID="CartSource">
        <Parameters>
            <asp:SessionParameter SessionField="rjs_id" Name="RjsId" Type="Int32" DefaultValue="-1" />
            <asp:SessionParameter SessionField="sit_pk" Name="SitPk" Type="Int32" DefaultValue="-1" />
        </Parameters>
    </ecom:PanierSourceControl>            
    </div>
        <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl4" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>