using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Altazion.ECommerce.Controls
{
    public class TestLabel : Label
    {
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            this.Text = "ceci est un test coté github.";
        }
    }
}
