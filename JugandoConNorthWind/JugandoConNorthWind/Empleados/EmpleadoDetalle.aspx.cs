using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JugandoConNorthWind.Repositorio;
using JugandoConNorthWind.ModeloNorthWind;
using JugandoConNorthWind.Helpers;
using System.IO;

namespace JugandoConNorthWind.Empleados
{
    public partial class EmpleadoDetalle : System.Web.UI.Page
    {
        string idEmpleado;
        EmpleadosRepositorio _emCRUD = new EmpleadosRepositorio(new NorthwindEntities());

        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            Page.Title = Request.QueryString["empleado"];
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            idEmpleado = Request.QueryString["id"] ?? "-1";

            //Ver si el Id Existe en la URL
            if (idEmpleado == "-1")
                Response.Redirect("~/Empleados/Empleados.aspx");

            Employees empleado = _emCRUD.ObtenerEmpleado(idEmpleado);   

            //Ver si existe el Empleado con ese Id
            if (empleado == null)
                Response.Redirect("~/Empleados/Empleados.aspx");

            //Configurado User Control  para los mensajes del Modal
            AvisoModalsControl.UserControlButtonClicked += new EventHandler(btnEliminarClick);
            AvisoModalsControl.RetornoURLEvent += new EventHandler(retornoUrl);
            AvisoModalsControl.mensajeAviso = "Esta a punto de eliminar permanentemente un registro, todos los registros que dependan del mismo serán establecidos como articulos 'Sin Empleado'";
            AvisoModalsControl.mensajeNoExitoso = "Ha Ocurrido un problema al intentar borrar el registro, por lo tanto no se ha terminado la Operación Excitosamente.";
            AvisoModalsControl.mensajeExitoso = "Registro Eliminado Exitosamente.";
            AvisoModalsControl.mensajeExitosoAlternativo = "Registro Editado Correctamente";

            PHFNacimiento.HacerCombos();

            //Pasando los datos a los controles
            if (!IsPostBack)
            {
                PHFNacimiento.CargarCombosFechas();
                PHFNacimiento.VerificarFecha();
                if (!DatosAControles(empleado))
                {
                    Label label = new Label();
                    label.Text = "Error al Convertir los datos del Empleado";
                    contenedor.Controls.Add(label);
                    System.Threading.Thread.Sleep(3000);
                    Response.Redirect("~/Empleados/Empleados.aspx");
                }
            }
            else
            {
                PHFNacimiento.HabilitarCombos();
            }

            PHFNacimiento.CargarFechaPredefinida(Convert.ToDateTime(empleado.BirthDate));
        }

        public bool DatosAControles(Employees empleado)
        {
            bool convertidos = false;
            try
            {
                inputFirstName.Value = empleado.FirstName ?? "";
                inputLastName.Value = empleado.LastName ?? "";
                inputTitle.Value = empleado.Title ?? "";
                inputTitleOfCourtesy.Value = empleado.TitleOfCourtesy ?? "";
                inputAdress.Value = empleado.Address ?? "";
                inputCity.Value = empleado.City ?? "";
                inputRegión.Value = empleado.Country ?? "";
                inputPostalCode.Value = empleado.PostalCode ?? "";
                inputCountry.Value = empleado.Country ?? "";
                inputHomePhone.Value = empleado.HomePhone ?? "";
                inputExtension.Value = empleado.Extension ?? "";
                inputNotes.Value = empleado.Notes ?? "";

                if (empleado.Photo != null)
                {
                    byte[] arregloImag = empleado.Photo;
                    string ImagenString = Convert.ToBase64String(arregloImag);
                    Imagen.Src = String.Format("data:image/jpeg;base64,{0}", ImagenString);
                }

                convertidos = true;
            }
            catch (Exception)
            {
                
                throw;
            }
            return convertidos;
        }

        public void btnEliminarClick(object sender, EventArgs e)
        {
            EjecutarModel.Text = !_emCRUD.EliminarEmpleado(int.Parse(idEmpleado)) ?
                "<script>$('#modalNoExitoso').modal('toggle');</script>" : 
                "<script>$('#modalExitoso').modal('toggle');</script>";
        }

        public void retornoUrl(object sender, EventArgs e)
        {
            Response.Redirect("~/Empleados/Empleados.aspx");
        }

    }
}