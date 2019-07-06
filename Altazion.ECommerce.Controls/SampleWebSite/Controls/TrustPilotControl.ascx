<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TrustPilotControl.ascx.cs" Inherits="CPointSoftware.ECommerce.Site.Controls.TrustPilotControl" %>



<div class='trustpilot-widget' data-locale='fr-FR' 
    data-businessunit-id='<%= this.BusinessUnitId %>'
    data-theme='<%= this.Theme%>'
    data-style-width="100%;"
    data-style-height="700px"
    data-sku='<%= this.ArticleReference %>'
    data-template-id='<%= this.TemplateId %>' >
    <a href='https://fr.trustpilot.com/review/www.king-jouet.com' target='_blank'>Trustpilot</a>
</div>