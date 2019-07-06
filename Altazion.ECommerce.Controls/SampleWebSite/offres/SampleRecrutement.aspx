<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/DefaultTheme.Master" AutoEventWireup="true"
    Inherits="CPointSoftware.ECommerce.Tools.CreationProspectPage" %>
<%--<%@ Register Src="~/Controls/Custom/KJNoelEnMagEnfants.ascx" TagPrefix="kj1"  TagName="Enfants" %>
<%@ Register Src="~/Controls/Custom/KJOpeNoelMagEntete.ascx" TagPrefix="kj1"  TagName="Entete" %>
<%@ Register Src="~/Controls/Custom/KJOpeNoelEnMagTypeHab.ascx" TagPrefix="kj1"  TagName="Infos" %>
<%@ Register Src="~/Controls/Custom/KJOpeNoelEnMagAdresse.ascx" TagPrefix="kj1"  TagName="Adresse" %>
<%@ Register Src="~/Controls/Custom/KJOpeNoelEnMagMagasin.ascx" TagPrefix="kj1"  TagName="Magasin" %>
 
<script runat="server">

    protected void btnValider_Click(object sender, EventArgs e)
    {
        if (base.ValiderCreation(pnlMain, new Control[] { pnlAdresse, pnlEnfants, pnlInfos, pnlMagasins }))
            mvProspect.SetActiveView(vwOK);
    }
    
</script>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <asp:MultiView runat="server" ID="mvProspect" ActiveViewIndex="0">
		
            <asp:View ID="View1" runat="server">

			<div id="ExecContent" class="SampleRecrutement">
			<div id="ClientHeader">
					<div Class="dixpourcenttitle">
						<span class="span1">Inscrivez vous à la newsletter King Jouet et recevez</span><br />
						<span class="span2">un bon de réduction de 10%</span><br />
						<span class="span3"> sur votre prochaine commande en magasin*</span><br />
						<span class="span4">à valoir uniquement en magasin King-Jouet du 03/01/11 au 31/01/11, hors promos, hors vidéos, hors soldes</span>
					</div>
					<asp:image ID="Image1" runat="server" imageurl="/App_Themes/sit_2/medias/img/10pourcent.png" alt="Recevez un bon de réduction de 10% " width="248" height="172" class="dixpourcent" />

			</div>

			
                <div id="ProspectSaisieContent">
					
					<div class="SampleRecrutementDetail">
						<div class="textexplic">
							<b>King Jouet est toujours à l'écoute de vos attentes et de vos habitudes.</b><br /> Aidez-nous à mieux vous connaître en renseignant, si vous le souhaitez, les formulaires ci-dessous.
						</div>

                        <asp:UpdatePanel runat="server" ID="updEntete"><ContentTemplate>
	                    <table class="infoperso">
	                        <kj1:Entete runat="server" id="pnlMain" CampagneGuid="DA86FB2D-D9B4-46CB-BD69-497D0E0A8C4D" />
	                    </table>

                        </ContentTemplate></asp:UpdatePanel>

                        <table class="infoperso">
                            <kj1:Adresse runat="server" EstPourProspect="true" ID="pnlAdresse" SansTableTag="true" />
                        </table>
						<div class="TypHab">
	                        <kj1:Infos runat="server" ID="pnlInfos" EstPourProspect="true" />
						</div>	


						<div class="message-incit">
							<p>Pour recevoir votre bon de réduction, remplissez correctement ce champ.<br />Un email vous sera envoyé sur cette adresse</p>
						</div>
						<div class="sampleEnfants">
							<div class="textexplic3">
Si vous le souhaitez, <b>vous pouvez inscrire vos enfants ou des enfants de votre entourage </b>(amis, petit-enfants, cousins).<br><b>3 semaines avant leurs anniversaires vous recevrez une surprise</b> ainsi que des idées pour être sûr(e) de leur faire plaisir.
</div>
							
							
							<asp:UpdatePanel runat="server" ID="updEnfants"><ContentTemplate>
	                        <kj1:Enfants runat="server" ID="pnlEnfants" EstPourProspect="true" />
                            </ContentTemplate></asp:UpdatePanel>
						</div>
				
                						<div class="TypHab">
	                        <kj1:Magasin runat="server" ID="pnlMagasins" EstPourProspect="true" />
						</div>	

												
						<span style="clear:both; display:block"></span>
					</div>	
					<p style="padding: 0 30px 15px">
					Attention les magasins King Jouet suivants ne sont pas concernés par cette opération : Belley (01), Lannion/St Quay Perros (22 ), St Lo/Agneaux (50), Cherbourg (50), Granville (50), Flers (61), Albertville (73), Epagny (74)</p>
                </div>
			</div>	
			
			<div id="ProspectSaisieButtons">
                <div class="btLeft"><a href="/"><span>Retour</span></a></div>
				<div class="btRight">
                                <ecom:MouseOverImageButton runat="server" ID="btnValider" ImageUrl="~/App_Themes/sit_2/medias/img/bt_ok.gif"
                                    SkinID="ProspectSaisieValider" OnClick="btnValider_Click" />
									
			</div>					
<!--
/App_Themes/sit_2/medias/img/bt_ok_roll.gif'-->
									
									
									
                            </td>
                        </tr>
                    </table>
            </div>
            </asp:View>

			
			
			
            <asp:View runat="server" ID="vwOK">
			<div id="ExecContent" class="SampleRecrutement">
			
			<img style="height: 130px; width: 117px; border-width: 0px; float:left;margin:0 15px 0 200px;" src="/App_Themes/sit_2/medias/img/modifcation-effectuee.jpg"  alt="Validation" title="Validation">
			
			
            	<p style="float:left;font-size:26px;font-weight:bold;margin-top:49px;" >Vous avez été enregistré !</p>
				<span style="clear:both; display:block"></span>
			</div>	
			
			<div id="ProspectSaisieButtons">
                <div class="btLeft"><a href="/"><span>Retour</span></a></div>					
			</div>	
            </asp:View>

        </asp:MultiView>
    
	
	
    <div id="ExecFooter">
        <ecom:ThemablePanelControl ID="ThemablePanelControl3" runat="server" SkinID="ExecFooter" />
    </div>
</asp:Content>--%>
