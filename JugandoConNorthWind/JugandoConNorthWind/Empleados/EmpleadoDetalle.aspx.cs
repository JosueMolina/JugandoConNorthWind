using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using JugandoConNorthWind.Repositorio;
using JugandoConNorthWind.ModeloNorthWind;
using JugandoConNorthWind.Helpers;
using JugandoConNorthWind.ClasesDTO;
using System.ComponentModel.DataAnnotations;
using System.IO;



namespace JugandoConNorthWind.Empleados
{
    public partial class EmpleadoDetalle : System.Web.UI.Page
    {
        string idEmpleado;
        EmpleadosRepositorio _emCRUD = new EmpleadosRepositorio(new NorthwindEntities());
        Employees empleado;
        List<string> errores = new List<string>();
        byte[] arregloImagen;
        DropDownList[] ListaSelects;
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

            empleado = _emCRUD.ObtenerEmpleado(idEmpleado);   

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


            //Pasando los datos a los controles
            if (!IsPostBack)
            {
                CargarCombos();

                if (!DatosAControles(empleado))
                {
                    Label label = new Label();
                    label.Text = "Error al Convertir los datos del Empleado";
                    contenedor.Controls.Add(label);
                    System.Threading.Thread.Sleep(3000);
                    Response.Redirect("~/Empleados/Empleados.aspx");
                }

                HelperFechas.DefinirFechaPredefinida(Convert.ToDateTime(empleado.HireDate),
                selectDias, selectMeses, selectAnios);

                HelperFechas.DefinirFechaPredefinida(Convert.ToDateTime(empleado.BirthDate),
                selectDias2, selectMeses2, selectAnios2);
            }

            ListaSelects = new DropDownList[]
            {
                selectDias, selectMeses, selectAnios,
                selectDias2, selectMeses2, selectAnios2
            };



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
                HelperFechas.DefinirFechaPredefinida(Convert.ToDateTime(empleado.HireDate),
                selectDias, selectMeses, selectAnios);
                HelperFechas.DefinirFechaPredefinida(Convert.ToDateTime(empleado.BirthDate),
                selectDias2, selectMeses2, selectAnios2);

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

        public void CargarCombos()
        {
            selectDias.CargarDias();
            selectMeses.CargarMeses();
            selectAnios.CargarAnios();

            selectDias2.CargarDias();
            selectMeses2.CargarMeses();
            selectAnios2.CargarAnios();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            EmpleadosDTO empleadoDTO = ControlesADatos();

            if (empleadoDTO == null || errores.Count > 0)
            {
                Label labelError = new Label();
                labelError.Text = "No se pudo Editar el empleado";
                phMensajeErrorEditar.Controls.Add(labelError);

                if (errores.Count > 0)
                {
                    foreach (string error in errores)
                    {
                        phMensajeErrorEditar.Controls.Add(new LiteralControl("<br />"));
                        Label _label = new Label();
                        _label.Text = error;
                        phMensajeErrorEditar.Controls.Add(_label);
                    }
                }
            }
            else 
            {
                if (_emCRUD.EditarEmpleado(idEmpleado, empleadoDTO))
                {
                    toastrLiteral.Text = "<script> toastr.info('Empleado Editado Correctamente');</script>";
                    empleado = _emCRUD.ObtenerEmpleado(empleado.EmployeeID.ToString());
                    DatosAControles(empleado);
                }
                else 
                {
                    Label label = new Label();
                    label.Text = "No se pude editar el empleado";
                    phMensajeErrorEditar.Controls.Add(label);
                }
            }
        }

        public EmpleadosDTO ControlesADatos()
        {
            EmpleadosDTO empleadoDTO = new EmpleadosDTO();

            try
            {
                DateTime fecha;

                empleadoDTO.FirstName = inputFirstName.Value;
                empleadoDTO.LastName = inputLastName.Value;
                empleadoDTO.TitleOfCourtesy = inputTitleOfCourtesy.Value;
                empleadoDTO.Title = inputTitle.Value;
                empleadoDTO.BirthDate = HelperFechas.FechaDesdeCombo(out fecha, selectDias2, selectMeses2, selectAnios2) ? fecha : DateTime.Now;
                empleadoDTO.HireDate = HelperFechas.FechaDesdeCombo(out fecha, selectDias, selectMeses, selectAnios) ? fecha : DateTime.Now;
                empleadoDTO.Address = inputAdress.Value;
                empleadoDTO.City = inputCity.Value;
                empleadoDTO.Region = inputRegión.Value;
                empleadoDTO.PostalCode = inputPostalCode.Value;
                empleadoDTO.Country = inputCountry.Value;
                empleadoDTO.HomePhone = inputHomePhone.Value;
                empleadoDTO.Extension = inputExtension.Value;
                CapturarArregloImagen();
                empleadoDTO.Photo = arregloImagen;
                empleadoDTO.Notes = inputNotes.Value;
                empleadoDTO.PhotoPath = "http://accweb/employees/" + inputLastName.Value + inputFirstName.Value + ".jpg";
                
                var context = new ValidationContext(empleadoDTO, serviceProvider: null, items: null);
                List<ValidationResult> results = new List<ValidationResult>();
                bool isValid = Validator.TryValidateObject(empleadoDTO, context, results);

                if (!isValid)
                {
                    foreach (ValidationResult result in results)
                    {
                        errores.Add(result.ErrorMessage);
                    }

                    return null;
                }

            }
            catch (Exception)
            {}

            return empleadoDTO;
        }

        public void CapturarArregloImagen() 
        {
            if (inputFileImagen.HasFile)
            {
                if (inputFileImagen.PostedFile.ContentType == "image/jpeg" ||
                   inputFileImagen.PostedFile.ContentType == "image/png" &&
                   inputFileImagen.PostedFile.ContentLength < 102400)
                {
                    arregloImagen = inputFileImagen.FileBytes;
                }
            }
            else 
            {
                arregloImagen = empleado.Photo;
            }
        }

        protected void combos_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListaSelects.HabilitarCombos();
        }

        public void CargarValores(object sender, EventArgs e)
        {
            DatosAControles(empleado);
        }

    }
}