using CPointSoftware.Equihira.Business.ECommerce.Data;
using CPointSoftware.Equihira.Business.Integrations;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    /// <summary>
    /// Classe de base des controles d'affichage TrustPilot
    /// </summary>
    [DefaultProperty("Text")]
    [ToolboxData("<{0}:TrustPilotBaseControl runat=server></{0}:TrustPilotBaseControl>")]
    public abstract class TrustPilotBaseControl : WebControl, IEquihiraBindable
    {
        /// <summary>
        /// Obtient ou définit la référence de l'article data-bindé
        /// </summary>
        protected string ArticleReference { get; set; }

        /// <summary>
        /// Obtient ou définit le libellé de l'article data-bindé
        /// </summary>
        protected string ArticleLibelle { get; set; }
        
        /// <summary>
        /// Obtien ou définit l'identifiant de l'article data-bindé
        /// </summary>
        protected Guid ArticleGuid { get; set; }
        
        /// <summary>
        /// Obtient ou définit l'identifiant du compte chez TrustPilot
        /// </summary>
        public string BusinessUnitId { get; set; }

        /// <summary>
        /// Initialise le contrôle dans la page, en récupérant
        /// le businessUnitId de la base si il n'est pas définit
        /// </summary>
        /// <param name="e">Les détails de l'event</param>
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);

            if (string.IsNullOrEmpty(BusinessUnitId))
            {
                var ds = ECommerceServer.DataCache.Integrations;
                var r = (from z in ds.sysparams_integrations_config
                         where z.itg_type.Equals("TRUSTPILOT", StringComparison.InvariantCultureIgnoreCase)
                         select z).FirstOrDefault();
                if (r != null)
                {
                    var cfg = TrustPilotBll.GetConfiguration(r);
                    BusinessUnitId = cfg.BusinessUnitId;
                }
            }

        }

        /// <summary>
        /// Prépare le contenu du contrôle et enregistre le
        /// script d'init dans la page
        /// </summary>
        /// <param name="e">Les détails de l'event</param>
        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            Page.ClientScript.RegisterStartupScript(typeof(TrustPilotBaseControl),
                "TrustPilotJS",
                "<script type='text/javascript' src='//widget.trustpilot.com/bootstrap/v5/tp.widget.bootstrap.min.js' async></script>",
                false);
        }

        /// <summary>
        /// Effectue le databinding de contrôle
        /// </summary>
        /// <param name="o"></param>
        public virtual void BindTo(object o)
        {
            if (o == null)
                return;
            if (o is ArticlesDataSourceResult)
            {
                ArticlesDataSourceResult res = o as ArticlesDataSourceResult;
                VueArticlesWebDS.ecommerce_articles_webRow r = res.Article.ecommerce_articles_web[0];
                BindTo(r);
            }
            else if (o is VueArticlesWebDS.ecommerce_articles_webRow)
            {
                VueArticlesWebDS.ecommerce_articles_webRow r = o as VueArticlesWebDS.ecommerce_articles_webRow;

                ArticleGuid = r.art_guid;
                ArticleReference = r.art_ref;
                ArticleLibelle = r.arw_libelle;
            }
        }
    }


    /// <summary>
    /// Controle affichant un widget standard TrustPilot
    /// </summary>
    public class TrustPilotWidget : TrustPilotBaseControl
    {
        /// <summary>
        /// Initialise une nouvelle instance, en utilisant
        /// le widget standard d'id "57177697fdb1180308e3815f"
        /// et le thème "light"
        /// </summary>
        public TrustPilotWidget()
        {
            TemplateId = "57177697fdb1180308e3815f";
            Theme = "light";
        }

        /// <summary>
        /// Obtient ou définit le template standard à afficher
        /// </summary>
        public string TemplateId { get; set; }

        /// <summary>
        /// Obtient ou définit le thème d'affichage
        /// </summary>
        public string Theme { get; set; }


        /// <summary>
        /// Effectue l'affichage
        /// </summary>
        /// <param name="writer"></param>
        protected override void Render(HtmlTextWriter writer)
        {
            writer.Write("<div class='trustpilot-widget' data-locale='fr-FR' data-template-id='");
            writer.Write(TemplateId);
            writer.Write("' data-businessunit-id='");
            writer.Write(BusinessUnitId);
            if (Height != null)
            {
                writer.Write("' data-style-height='");
                writer.Write(Height.ToString());
            }
            if (Width != null)
            {
                writer.Write("' data-style-width='");
                writer.Write(Width.ToString());
            }
            writer.Write("' data-theme='");
            writer.Write(Theme);
            if (!string.IsNullOrEmpty(ArticleLibelle))
            {
                writer.Write("' data-name=");
                writer.Write(JsonConvert.ToString(ArticleLibelle));
            }
            else
            {
                writer.Write("'");
            }
            writer.Write(" data-sku='");
            writer.Write(ArticleReference);
            writer.Write("'>");
            writer.Write("<a href='https://fr.trustpilot.com/review/www.king-jouet.com' target='_blank'>Trustpilot</a>");
            writer.Write("</div>");

        }
    }

    public class TrustPilot : TrustPilotBaseControl
    {
        public TrustPilot()
        {
        }

        private ITemplate _standardTemplate;

        /// <summary>
        /// Obtient ou définit le contenu du contrôle
        /// </summary>
        [PersistenceMode(PersistenceMode.InnerDefaultProperty), TemplateContainer(typeof(ThemablePanelTemplate))]
        public ITemplate Content
        {
            get
            {
                return this._standardTemplate;
            }
            set
            {
                this._standardTemplate = value;
            }
        }

        public override void BindTo(object o)
        {
            base.BindTo(o);

            if(_standardTemplate != null && _standardTemplate is IEquihiraBindable)
                (_standardTemplate as IEquihiraBindable).BindTo(o);
        }

        protected override void Render(HtmlTextWriter writer)
        {
            writer.Write("<div ");
            foreach (string attK in this.Attributes.Keys)
            {
                var att = this.Attributes[attK];
                writer.Write(attK);
                writer.Write("='");
                writer.Write(att.ToString());
                writer.Write("'");
            }

            writer.Write(" data-businessunit-id='");
            writer.Write(BusinessUnitId);
            if (!string.IsNullOrEmpty(ArticleLibelle))
            {
                writer.Write("' data-name=");
                writer.Write(JsonConvert.ToString(ArticleLibelle));
            }
            else
                writer.Write("'");

            writer.Write(" data-sku = '");
            writer.Write(ArticleReference);
            writer.Write("'>");

            if(_standardTemplate!=null)
                _standardTemplate.InstantiateIn(this);

            writer.Write("</div>");

        }
    }
}
