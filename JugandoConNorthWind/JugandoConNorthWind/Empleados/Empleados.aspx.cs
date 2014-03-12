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
using JugandoConNorthWind.Helpers;
namespace JugandoConNorthWind.Empleados
{
    public partial class Empleados : System.Web.UI.Page
    {
        EmpleadosRepositorio _empCRUD = new EmpleadosRepositorio(new NorthwindEntities());
        byte[] arregloImagen;
        List<string> errores = new List<string>();
        DropDownList[] ListaSelects;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            GridListaEmpleados.DataSource = _empCRUD.ListaEmpleados();
            GridListaEmpleados.DataBind();
            EjecutarModel.Text = "";
            ToastrLiteral.Text = "";
            AvisoModalsControl.mensajeAviso = "Esta a punto de eliminar un empleado, esta seguro de ello?";
            AvisoModalsControl.UserControlButtonClicked += new EventHandler(eliminandoEmpleado);
            GridListaEmpleados.PageIndex = 0;

            if (!IsPostBack)
            {
                CargarCombos();

                HelperFechas.DefinirFechaPredefinida(Convert.ToDateTime(DateTime.Now),
                selectDias, selectMeses, selectAnios);

                HelperFechas.DefinirFechaPredefinida(Convert.ToDateTime(DateTime.Now.AddYears(-18)),
                selectDias2, selectMeses2, selectAnios2);
            }

            ListaSelects = new DropDownList[]
            {
                selectDias, selectMeses, selectAnios,
                selectDias2, selectMeses2, selectAnios2
            };

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
                _label.Text = "No se pudo guardar el empleado";
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
                    GridListaEmpleados.DataSource = _empCRUD.ListaEmpleados();
                    GridListaEmpleados.DataBind();
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
            GridListaEmpleados.DataSource = _empCRUD.BuscarEmpleados(texto);
            GridListaEmpleados.DataBind();
            GridListaEmpleados.PageIndex = 0;
        }

        protected void GridListaEmpleados_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridListaEmpleados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridListaEmpleados.PageIndex = e.NewPageIndex;
            GridListaEmpleados.DataSource = _empCRUD.ListaEmpleados();
            GridListaEmpleados.DataBind();
        }

        protected void GridListaEmpleados_EditarEmpleado(object sender, EventArgs e)
        {
            
        }

        protected void GridListaEmpleados_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            EjecutarModel.Text = "";
            if (e.CommandName == "EditandoEmpleado")
            {
                string[] informacionEmpleado = e.CommandArgument.ToString().Split(';');
                Response.Redirect("~/Empleados/EmpleadoDetalle.aspx?id=" + informacionEmpleado[0] +
                "&empleado=" + informacionEmpleado[1] + " " + informacionEmpleado[2]);
            }
            if (e.CommandName == "EliminandoEmpleado")
            {
                HttpContext.Current.Session["IDEmpleadoEliminando"] = e.CommandArgument.ToString();
                EjecutarModel.Text = "<script>$('#modalAviso').modal('toggle');</script>";
            }
            
        }

        protected void eliminandoEmpleado(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["IDEmpleadoEliminando"] != null)
            {
                if (_empCRUD.EliminarEmpleado(int.Parse(HttpContext.Current.Session["IDEmpleadoEliminando"].ToString())))
                {
                    HttpContext.Current.Session["IDEmpleadoEliminando"] = null;
                    GridListaEmpleados.DataSource = _empCRUD.ListaEmpleados();
                    GridListaEmpleados.DataBind();
                }
                else
                {
                    string script = "toastr.danger('Problema al eliminar Registro');";
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "script", script, true);
                }
            }
        }

        protected void btnListarTodos_Click(object sender, EventArgs e)
        {
            GridListaEmpleados.DataSource = _empCRUD.ListaEmpleados();
            GridListaEmpleados.DataBind();
            GridListaEmpleados.PageIndex = 0;
        }


        protected void combos_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListaSelects.HabilitarCombos();
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
    }
}