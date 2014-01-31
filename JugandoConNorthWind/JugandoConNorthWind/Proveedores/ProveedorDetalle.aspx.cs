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
    public partial class ProveedorDetalle : System.Web.UI.Page
    {
        ProveedoresRepositorio _pRepo = new ProveedoresRepositorio(new NorthwindEntities());
        string IdDelProveedor;
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            Page.Title = Request.QueryString["proveedor"];
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //Configurando UserControl Para los Modal de Mensajes de Eliminado
            if (!IsPostBack)
            {
                AvisoEliminarRegistroControl.UserControlButtonClicked += new EventHandler(btnEliminar_Click);
                AvisoEliminarRegistroControl.EliminadoRetornoURLEvent += new EventHandler(btnRedireccionar);
                AvisoEliminarRegistroControl.mensaje = "Esta a punto de eliminar permanentemente un registro, todos los registros que dependan del mismo serán establecidos como articulos 'Sin Proveedor'";
                AvisoEliminarRegistroControl.mensajeNoEliminado = "Ha Ocurrido un problema al intentar borrar el registro, por lo tanto no se ha terminado la Operación Excitosamente.";
                AvisoEliminarRegistroControl.mesajeEliminado = "Registro Eliminado Exitosamente.";
            }
            //Recuperando el Id de la URL 
            IdDelProveedor = Request.QueryString["id"] ?? "-1";
            if (IdDelProveedor == "-1")
                Response.Redirect("~/Proveedores/Proveedores.aspx");

            //Obteniendo el Proveedor en base al Id Enviado
            var proveedor = _pRepo.ObtenerProveedor(IdDelProveedor);
            if (proveedor == null)
                Response.Redirect("~/Proveedores/Proveedores.aspx");

            //Pasando los datos del Proveedor a los Controles
            if (!DatosAControles(proveedor))
            {
                formulario.Style.Add("display", "none");
                Label span = new Label();
                span.Text = "Error al convertir Datos del Proveedor";
                contenedor.Controls.Add(span);
                System.Threading.Thread.Sleep(3000);
                Response.Redirect("~/Proveedores/Proveedores.aspx");
            }
        }

        protected bool DatosAControles(Suppliers proveedor)
        {
            bool conversionExitosa = false;
            try
            {
                inputCompanyName.Value = (proveedor.CompanyName != null) ? proveedor.CompanyName.ToString() : "Sin Datos";
                inputContactName.Value = (proveedor.ContactName != null) ? proveedor.ContactName.ToString() : "Sin Datos";
                inputContactTitle.Value = (proveedor.ContactTitle != null) ? proveedor.ContactTitle.ToString() : "Sin Datos";
                inputAdress.Value = (proveedor.Address != null) ? proveedor.Address.ToString() : "Sin Datos";
                inputCity.Value = (proveedor.City != null) ? proveedor.City.ToString() : "Sin Datos";
                inputRegion.Value = (proveedor.Region != null) ? proveedor.Region.ToString() : "Sin Datos";
                inputPostalCode.Value = (proveedor.PostalCode != null) ? proveedor.PostalCode.ToString() : "Sin Datos";
                inputCountry.Value = (proveedor.Country != null) ? proveedor.Country.ToString() : "Sin Datos";
                inputPhone.Value = (proveedor.Phone != null) ? proveedor.Phone.ToString() : "Sin Datos";
                inputFax.Value = (proveedor.Fax != null) ? proveedor.Fax.ToString() : "Sin Datos";
                inputHomePage.Value = (proveedor.HomePage != null) ? proveedor.HomePage.ToString() : "Sin Datos";

                conversionExitosa = true;
            }
            catch (Exception)
            {
                   
            }
            return conversionExitosa;
        }

        protected void btnRedireccionar(object sender, EventArgs e)
        {
            Response.Redirect("~/Proveedores/Proveedores.aspx");
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Hola Mundo");
            EjecutarModel.Text = !_pRepo.RemoverProveedor(int.Parse(IdDelProveedor)) ?
                                  "<script>$('#modalNoEliminado').modal('toggle')</script>" :
                                  "<script>$('#modalEliminado').modal('toggle')</script>";
        }


    }
}