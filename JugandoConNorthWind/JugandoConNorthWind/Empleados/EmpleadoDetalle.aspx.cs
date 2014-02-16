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
        List<object[]> Meses = new List<object[]>();

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

            Meses.Add(new object[] { "01", 31 });
            Meses.Add(new object[] { "02", 28 });
            Meses.Add(new object[] { "03", 31 });
            Meses.Add(new object[] { "04", 30 });
            Meses.Add(new object[] { "05", 31 });
            Meses.Add(new object[] { "06", 30 });
            Meses.Add(new object[] { "07", 31 });
            Meses.Add(new object[] { "08", 31 });
            Meses.Add(new object[] { "09", 30 });
            Meses.Add(new object[] { "10", 31 });
            Meses.Add(new object[] { "11", 30 });
            Meses.Add(new object[] { "12", 31 });


            //Pasando los datos a los controles
            if (!IsPostBack)
            {

                cargarCombosFecha();

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
                //CalendarioHireDate.SelectedDate = empleado.HireDate.Value;
                //CalendarioHireDate.VisibleDate = empleado.HireDate.Value;
                //CalendarioBirthDate.SelectedDate = empleado.BirthDate.Value;
                //CalendarioBirthDate.VisibleDate = empleado.BirthDate.Value;
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

        protected void cargarCombosFecha()
        {
            
            if (selectMeses.Items.Count == 0)
            {
                foreach (object[] Mes in Meses)
                {
                    string text = Mes[0].ToString();
                    selectMeses.Items.Add(new ListItem(text, text));

                }
            }

            int numeroDias = int.Parse((Meses[(selectMeses.SelectedIndex)][1]).ToString());

            for (int i = 1; i <= numeroDias ; i++)
            {
                string dia = i.ToString().Length < 2 ? "0" + i.ToString() : i.ToString();
                selectDias.Items.Add(new ListItem(dia, dia));
            }


            for (int i = 1950; i < DateTime.Now.Year; i++)
            {
                selectAnios.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }

        protected void selectMeses_SelectedIndexChanged(object sender, EventArgs e)
        {
            int diaSeleccionado = Convert.ToInt16(selectDias.SelectedValue);
            int diasDelMesSeleccionado = Convert.ToInt16(Meses[selectMeses.SelectedIndex][1]);
            int numeroDias = int.Parse((Meses[(selectMeses.SelectedIndex)][1]).ToString());
            

            if (diaSeleccionado > diasDelMesSeleccionado)
            {
                selectDias.SelectedIndex = numeroDias - 1;        
            }
            
            string script = "$('#MainPlaceHolder_selectDias').attr('disabled', false);"
                          + "$('#MainPlaceHolder_selectMeses').attr('disabled', false);"
                          + "$('#MainPlaceHolder_selectAnios').attr('disabled', false); console.log('Hola Mundo');";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scripHablitarDias", script, true);
        }

        protected void selectDias_SelectedIndexChanged(object sender, EventArgs e)
        {
            int diaSeleccionado = Convert.ToInt16(selectDias.SelectedValue);
            int diasDelMesSeleccionado = Convert.ToInt16(Meses[selectMeses.SelectedIndex][1]);
            int numeroDias = int.Parse((Meses[(selectMeses.SelectedIndex)][1]).ToString());
            

            if (diaSeleccionado > diasDelMesSeleccionado)
            {
                selectDias.SelectedIndex = numeroDias - 1; 
            }

            string script = "$('#MainPlaceHolder_selectDias').attr('disabled', false);"
                          + "$('#MainPlaceHolder_selectMeses').attr('disabled', false);"
                          + "$('#MainPlaceHolder_selectAnios').attr('disabled', false); console.log('Hola Mundo');";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scripHablitarDias", script, true);
        }

    }
}