using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JugandoConNorthWind.ModeloNorthWind;

namespace JugandoConNorthWind.Proveedores
{
    public partial class Proveedores : System.Web.UI.Page
    {
        private NorthwindEntities _ctx = new NorthwindEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LVProveedores.DataSource = ListaProveedores();
                LVProveedores.DataBind();
            }
        }

        protected void BuscarProveedorInput_TextChanged(object sender, EventArgs e)
        {
            LVProveedores.DataSource = BuscarProveedor(BuscarProveedorInput.Text);
            LVProveedores.DataBind();
        }

        public IEnumerable<Suppliers> ListaProveedores()
        {
            var proveedores = _ctx.Suppliers.ToList();
            return proveedores;
        }

        public IEnumerable<Suppliers> BuscarProveedor(string text)
        {
            var proveedores = _ctx.Suppliers.Where(p => p.CompanyName.Contains(text)).ToList(); ;
            return proveedores;
        }
    }
}