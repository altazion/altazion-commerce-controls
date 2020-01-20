using CPointSoftware.Framework.Errors;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;
using CPointSoftware.ECommerce.Tools;

namespace Altazion.ECommerce.Controls
{
    [Obsolete("Veuillez utiliser PanierTotalLabel", true)]
    public class PanierTotalTtcLabel : PanierTotalLabel
    {

    }


    public class PanierTotalLabel : Label
    {
        public PanierTotalLabel()
        {
            Format = "0.00";
            AssocieMagasin = null;
            IgnorerFraisDePort = false;
        }
        public string Format { get; set; }

        public bool? AssocieMagasin { get; set; }

        public bool IgnorerFraisDePort { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            decimal montant = 0;
            var prv = ECommerceServer.Panier;
            foreach(var r in prv.TousLesElements)
            {
                if (prv.EstEnHT)
                {
                    if (AssocieMagasin.HasValue)
                    {
                        if (r.MagasinGuid.HasValue == AssocieMagasin.Value)
                            montant += (r.MontantHT);
                    }
                    else
                        montant += (r.MontantHT);
                }
                else
                {
                    if (AssocieMagasin.HasValue)
                    {
                        if (r.MagasinGuid.HasValue == AssocieMagasin.Value)
                            montant += (r.MontantTTC);
                    }
                    else
                        montant += (r.MontantTTC);
                }
            }

            if (IgnorerFraisDePort)
            {
                if (AssocieMagasin != true)
                {
                    if (!prv.EstEnHT)
                        montant -= prv.MontantFraisPort;
                    else
                    {
                        throw new BusinessException("Cas non géré : panier sans frais de port en HT");
                    }
                }
            }

            this.Text = montant.ToString(Format);
        }
    }

    public class PanierTotalRemise : Label
    {
        public PanierTotalRemise()
        {
            Format = "0.00";
            AssocieMagasin = null;
            IgnorerFraisDePort = false;
        }
        public string Format { get; set; }

        public bool? AssocieMagasin { get; set; }

        public bool IgnorerFraisDePort { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            decimal montant = 0;
            var prv = ECommerceServer.Panier;
            foreach (var r in prv.TousLesElements)
            {
                if (prv.EstEnHT)
                {
                    if (AssocieMagasin.HasValue)
                    {
                        if (r.MagasinGuid.HasValue == AssocieMagasin.Value)
                            montant += (r.RemiseHT * r.Quantite);
                    }
                    else
                        montant += (r.RemiseHT * r.Quantite);
                }
                else
                {
                    if (AssocieMagasin.HasValue)
                    {
                        if (r.MagasinGuid.HasValue == AssocieMagasin.Value)
                            montant += (r.RemiseTTC * r.Quantite);
                    }
                    else
                        montant += (r.RemiseTTC * r.Quantite);
                }
            }

            if (IgnorerFraisDePort)
            {
                if (AssocieMagasin != true)
                {
                    if (!prv.EstEnHT)
                        montant -= prv.MontantFraisPort;
                    else
                    {
                        throw new BusinessException("Cas non géré : panier sans frais de port en HT");
                    }
                }
            }

            this.Text = montant.ToString(Format);
        }
    }

    public class PanierTotalHorsRemise : Label
    {
        public PanierTotalHorsRemise()
        {
            Format = "0.00";
            AssocieMagasin = null;
            IgnorerFraisDePort = false;
        }
        public string Format { get; set; }

        public bool? AssocieMagasin { get; set; }

        public bool IgnorerFraisDePort { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            decimal montant = 0;
            var prv = ECommerceServer.Panier;
            foreach (var r in prv.TousLesElements)
            {
                if (prv.EstEnHT)
                {
                    if (AssocieMagasin.HasValue)
                    {
                        if (r.MagasinGuid.HasValue == AssocieMagasin.Value)
                            montant += (r.PuHorsRemiseHT * r.Quantite);
                    }
                    else
                        montant += (r.PuHorsRemiseHT * r.Quantite);
                }
                else
                {
                    if (AssocieMagasin.HasValue)
                    {
                        if (r.MagasinGuid.HasValue == AssocieMagasin.Value)
                            montant += (r.PuHorsRemiseTTC * r.Quantite);
                    }
                    else
                        montant += (r.PuHorsRemiseTTC * r.Quantite);
                }
            }

            if (IgnorerFraisDePort)
            {
                if (AssocieMagasin != true)
                {
                    if (!prv.EstEnHT)
                        montant -= prv.MontantFraisPort;
                    else
                    {
                        throw new BusinessException("Cas non géré : panier sans frais de port en HT");
                    }
                }
            }

            this.Text = montant.ToString(Format);
        }
    }

    public class PanierRemisesPanel : Panel
    {
        public PanierRemisesPanel()
        {
            AssocieMagasin = null;
            IgnorerFraisDePort = false;
        }
        public bool? AssocieMagasin { get; set; }

        public bool IgnorerFraisDePort { get; set; }

        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            decimal montant = 0;
            var prv = ECommerceServer.Panier;
            foreach (var r in prv.TousLesElements)
            {
                if (prv.EstEnHT)
                {
                    if (AssocieMagasin.HasValue)
                    {
                        if (r.MagasinGuid.HasValue == AssocieMagasin.Value)
                            montant += (r.RemiseHT * r.Quantite);
                    }
                    else
                        montant += (r.RemiseHT * r.Quantite);
                }
                else
                {
                    if (AssocieMagasin.HasValue)
                    {
                        if (r.MagasinGuid.HasValue == AssocieMagasin.Value)
                            montant += (r.RemiseTTC * r.Quantite);
                    }
                    else
                        montant += (r.RemiseTTC * r.Quantite);
                }
            }

            if (IgnorerFraisDePort)
            {
                if (AssocieMagasin != true)
                {
                    if (!prv.EstEnHT)
                        montant -= prv.MontantFraisPort;
                    else
                    {
                        throw new BusinessException("Cas non géré : panier sans frais de port en HT");
                    }
                }
            }

            this.Visible = (montant != 0M);
        }
    }
}
