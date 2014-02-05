using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JugandoConNorthWind.ModeloNorthWind;
using JugandoConNorthWind.Repositorio;

namespace JugandoConNorthWind.Empleados
{
    public partial class Empleados : System.Web.UI.Page
    {
        EmpleadosRepositorio _empCRUD = new EmpleadosRepositorio(new NorthwindEntities());
        protected void Page_Load(object sender, EventArgs e)
        {
            LVEmpleados.DataSource = _empCRUD.ListaEmpleados();
            LVEmpleados.DataBind();
        }
    }
}