using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using JugandoConNorthWind.ModeloNorthWind;
using JugandoConNorthWind.Repositorio;
using JugandoConNorthWind.ClasesDTO;
using System.ComponentModel.DataAnnotations;

namespace JugandoConNorthWind.Empleados
{
    public partial class Empleados : System.Web.UI.Page
    {
        EmpleadosRepositorio _empCRUD = new EmpleadosRepositorio(new NorthwindEntities());
        byte[] arregloImagen;
        List<string> errores = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            LVEmpleados.DataSource = _empCRUD.ListaEmpleados();
            LVEmpleados.DataBind();
        }

        public EmpleadosDTO ControlesADatos()
        {
            EmpleadosDTO empleadoDTO = new EmpleadosDTO();
            try
            {

                empleadoDTO.FirstName = inputFirstName.Value;
                empleadoDTO.LastName = inputLastName.Value;
                empleadoDTO.TitleOfCourtesy = inputTitleOfCourtesy.Value;
                empleadoDTO.Title = inputTitle.Value;
                empleadoDTO.BirthDate = inputBirthDate.Value != "" ? Convert.ToDateTime(inputBirthDate.Value) : DateTime.Now;
                empleadoDTO.HireDate = inputHireDate.Value != "" ? Convert.ToDateTime(inputHireDate.Value) : DateTime.Now;
                empleadoDTO.Address = inputAdress.Value;
                empleadoDTO.City = inputCity.Value;
                empleadoDTO.Region = inputRegión.Value;
                empleadoDTO.PostalCode = inputPostalCode.Value;
                empleadoDTO.Country = inputCountry.Value;
                empleadoDTO.HomePhone = inputHomePhone.Value;
                empleadoDTO.Extension = inputExtension.Value;
                CapturarArregloDeImagen();
                empleadoDTO.Photo = arregloImagen;
                empleadoDTO.Notes = inputNotes.Value;
                empleadoDTO.PhotoPath = "http://accweb/employees/" + inputLastName.Value + inputFirstName.Value + ".jpg";

                var context = new ValidationContext(empleadoDTO, serviceProvider: null, items: null);
                List<ValidationResult> results = new List<ValidationResult>();
                bool isValid = Validator.TryValidateObject(empleadoDTO,context, results);

                if (!isValid)
                {
                    foreach (ValidationResult error in results)
                    {
                        errores.Add(error.ErrorMessage);
                    }

                    return null;
                }

            }
            catch (Exception)
            {
                throw;
            }
            return empleadoDTO;
        }

        protected void CapturarArregloDeImagen()
        {
            if (inputFileImagen.HasFile)
            {
                try
                {
                    if (inputFileImagen.PostedFile.ContentType == "image/jpeg" ||
                        inputFileImagen.PostedFile.ContentType == "image/png" && 
                        inputFileImagen.PostedFile.ContentLength < 102400)
                    {
                       
                        //MemoryStream ms = new MemoryStream();
                        //imagen.Save(ms, System.Drawing.Imaging.ImageFormat.Jpeg);
                        arregloImagen = inputFileImagen.FileBytes;
                    }
                }
                catch (Exception)
                {
                    
                    throw;
                }
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            EmpleadosDTO empleadoDTO = ControlesADatos();

            if (empleadoDTO == null || errores.Count > 0)
            {
                Label _label = new Label();
                _label.Text = "No se guardar el empleado";
                phMensajeErrorEditar.Controls.Add(_label);

                if (errores.Count > 0)
                {
                    foreach (string error in errores)
                    {
                        phMensajeErrorEditar.Controls.Add(new LiteralControl("<br />"));
                        Label label = new Label();
                        label.Text = error;
                        phMensajeErrorEditar.Controls.Add(label);
                    }
                }
            }
            else
            {
                if (_empCRUD.AgregarEmpleado(empleadoDTO))
                {
                    ToastrLiteral.Text = "<script>toastr.info('Empleado Agregado Exitosamente')</script>";
                    LVEmpleados.DataSource = _empCRUD.ListaEmpleados();
                    LVEmpleados.DataBind();
                }
                else 
                {
                    Label label = new Label();
                    label.Text = "No se pudo agregar el empleado";
                    phMensajeErrorEditar.Controls.Add(label);
                }
            }     

        }

        public void DesplegarImagen_Click()
        {
            CapturarArregloDeImagen();

            if (arregloImagen != null)
            {
                string data = Convert.ToBase64String(arregloImagen);
                Imagen.Src = String.Format("data:image/jpeg;base64,{0}", data);
            }
        }

        protected void BuscarEmpleadoInput_TextChanged(object sender, EventArgs e)
        {
            string texto = BuscarEmpleadoInput.Text.Replace("--", "").Replace(";", "").Trim();
            LVEmpleados.DataSource = _empCRUD.BuscarEmpleados(texto);
            LVEmpleados.DataBind();
        }
    }
}