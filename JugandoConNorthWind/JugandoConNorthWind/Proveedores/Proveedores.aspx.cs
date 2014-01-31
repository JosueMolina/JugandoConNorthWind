using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JugandoConNorthWind.ModeloNorthWind;
using JugandoConNorthWind.Repositorio;

namespace JugandoConNorthWind.Proveedores
{
    public partial class Proveedores : System.Web.UI.Page
    {
        ProveedoresRepositorio _pCRUD = new ProveedoresRepositorio(new NorthwindEntities());

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LVProveedores.DataSource = _pCRUD.ListaProveedores();
                LVProveedores.DataBind();
            }
        }

        protected void BuscarProveedorInput_TextChanged(object sender, EventArgs e)
        {
            // Removiendo guiones y punto/Coma para evitar SQL INJECTION 
            string texto = BuscarProveedorInput.Text.Trim().Replace("-", "").Replace(";", "");
            LVProveedores.DataSource = _pCRUD.BuscarProveedor(texto);
            LVProveedores.DataBind();
        }


    }
}