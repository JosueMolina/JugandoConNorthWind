using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JugandoConNorthWind.Repositorio;
using JugandoConNorthWind.ModeloNorthWind;
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

            //Pasando los datos a los controles
            if (!IsPostBack)
            {
                if (!DatosAControles(empleado))
                {
                    Label label = new Label();
                    label.Text = "Error al Convertir los datos del Empleado";
                    contenedor.Controls.Add(label);
                    System.Threading.Thread.Sleep(3000);
                    Response.Redirect("~/Empleados/Empleados.aspx");
                }
            }
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
                //inputPhotoPath.Value = empleado.PhotoPath ?? "";
                CalendarioHireDate.SelectedDate = empleado.HireDate.Value;
                CalendarioHireDate.VisibleDate = empleado.HireDate.Value;
                CalendarioBirthDate.SelectedDate = empleado.BirthDate.Value;
                CalendarioBirthDate.VisibleDate = empleado.BirthDate.Value;
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


    }
}