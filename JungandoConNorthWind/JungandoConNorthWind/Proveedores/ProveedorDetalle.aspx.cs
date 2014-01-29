using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JugandoConNorthWind.ModeloNorthWind;

namespace JugandoConNorthWind.Proveedores
{
    public partial class ProveedorDetalle : System.Web.UI.Page
    {
        NorthwindEntities _ctx = new NorthwindEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            string IdDelProveedor = Request.QueryString["id"] ?? "No hay Nada Recibido =(";

            var proveedor = ObtenerProveedor(IdDelProveedor);

            if (proveedor == null)
                Response.Redirect("~/Proveedores/Proveedores.aspx");

            inputCompanyName.Value = proveedor.CompanyName.ToString();
            inputContactName.Value = proveedor.ContactName.ToString();
            inputContactTitle.Value = proveedor.ContactTitle.ToString();

        }

        protected Suppliers ObtenerProveedor(string Parmid) 
        {
            Suppliers proveedor;
            try
            {
                int id;
                bool convertido = int.TryParse(Parmid, out id);
                if (!convertido)
                    return null;

               proveedor = _ctx.Suppliers.Where(p => p.SupplierID == id).FirstOrDefault();
            }
            catch (Exception)
            {
                proveedor = null;
            }
            
            return proveedor;
        }
    }
}