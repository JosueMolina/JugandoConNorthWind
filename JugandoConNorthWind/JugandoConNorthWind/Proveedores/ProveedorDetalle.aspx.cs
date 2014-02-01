using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.ComponentModel.DataAnnotations;
using System.Web.UI.WebControls;
using JugandoConNorthWind.ModeloNorthWind;
using JugandoConNorthWind.Repositorio;
using JugandoConNorthWind.ClasesDTO;

namespace JugandoConNorthWind.Proveedores
{
    public partial class ProveedorDetalle : System.Web.UI.Page
    {
        ProveedoresRepositorio _pRepo = new ProveedoresRepositorio(new NorthwindEntities());
        string IdDelProveedor;
        List<string> errores = new List<string>();
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            Page.Title = Request.QueryString["proveedor"];
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            //Recuperando el Id de la URL 
            IdDelProveedor = Request.QueryString["id"] ?? "-1";
            if (IdDelProveedor == "-1")
                Response.Redirect("~/Proveedores/Proveedores.aspx");

            //Obteniendo el Proveedor en base al Id Enviado
            var proveedor = _pRepo.ObtenerProveedor(IdDelProveedor);
            if (proveedor == null)
                Response.Redirect("~/Proveedores/Proveedores.aspx");

            //Configurando UserControl Para los Modal de Mensajes de Eliminado
            AvisoEliminarRegistroControl.UserControlButtonClicked += new EventHandler(btnEliminar_Click);
            AvisoEliminarRegistroControl.EliminadoRetornoURLEvent += new EventHandler(btnRedireccionar);
            AvisoEliminarRegistroControl.mensaje = "Esta a punto de eliminar permanentemente un registro, todos los registros que dependan del mismo serán establecidos como articulos 'Sin Proveedor'";
            AvisoEliminarRegistroControl.mensajeNoEliminado = "Ha Ocurrido un problema al intentar borrar el registro, por lo tanto no se ha terminado la Operación Excitosamente.";
            AvisoEliminarRegistroControl.mesajeEliminado = "Registro Eliminado Exitosamente.";
            AvisoEliminarRegistroControl.mensajeEditado = "Registro Editado Correctamente";

            if (!IsPostBack)
            {
                //Pasando los datos del Proveedor a los Controles
                if (!DatosAControles(proveedor))
                {
                    //formulario.Style.Add("display", "none");
                    Label span = new Label();
                    span.Text = "Error al convertir Datos del Proveedor";
                    contenedor.Controls.Add(span);
                    System.Threading.Thread.Sleep(3000);
                    Response.Redirect("~/Proveedores/Proveedores.aspx");
                }
            }

            
        }

        protected bool DatosAControles(Suppliers proveedor)
        {
            bool conversionExitosa = false;
            try
            {
                inputCompanyName.Value = (proveedor.CompanyName != null) ? proveedor.CompanyName.ToString() : "";
                inputContactName.Value = (proveedor.ContactName != null) ? proveedor.ContactName.ToString() : "";
                inputContactTitle.Value = (proveedor.ContactTitle != null) ? proveedor.ContactTitle.ToString() : "";
                inputAdress.Value = (proveedor.Address != null) ? proveedor.Address.ToString() : "";
                inputCity.Value = (proveedor.City != null) ? proveedor.City.ToString() : "";
                inputRegion.Value = (proveedor.Region != null) ? proveedor.Region.ToString() : "";
                inputPostalCode.Value = (proveedor.PostalCode != null) ? proveedor.PostalCode.ToString() : "";
                inputCountry.Value = (proveedor.Country != null) ? proveedor.Country.ToString() : "";
                inputPhone.Value = (proveedor.Phone != null) ? proveedor.Phone.ToString() : "";
                inputFax.Value = (proveedor.Fax != null) ? proveedor.Fax.ToString() : "";
                inputHomePage.Value = (proveedor.HomePage != null) ? proveedor.HomePage.ToString() : "";

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
        public void btnGuardar_Click(object sender, EventArgs e)
        {
            ProveedoresDTO proveedorDTO = new ProveedoresDTO();

            //Valida los campos con los requerimientos Establecidos en los DATA ANNOTATINOS
            proveedorDTO = ControlesADatos(proveedorDTO);

            if (proveedorDTO == null || errores.Count > 0)
            {
                Label label = new Label();
                label.Text = "No se pudeo Editar el Registro...";
                phMensajeErrorEditar.Controls.Add(label);

                if (errores.Count() > 0)
                {
                    foreach (string error in errores)
                    {

                        phMensajeErrorEditar.Controls.Add(new LiteralControl("<br />"));
                        Label _label = new Label();
                        _label.Text = error;
                        phMensajeErrorEditar.Controls.Add(_label);
                    }
                }
                var proveedor = _pRepo.ObtenerProveedor(IdDelProveedor);
                DatosAControles(proveedor);
            }
            else 
            {
                _pRepo.EditarProveedor(int.Parse(IdDelProveedor), proveedorDTO);
                EjecutarModel.Text = "<script>$('#modalEditado').modal('toggle');</script>";
            }
        }

        protected ProveedoresDTO ControlesADatos(ProveedoresDTO proveedorDTO)
        {
            try
            {
                proveedorDTO.CompanyName = inputCompanyName.Value;
                proveedorDTO.ContactName = inputContactName.Value;
                proveedorDTO.ContactTitle = inputContactTitle.Value;
                proveedorDTO.Address = inputAdress.Value;
                proveedorDTO.City = inputCity.Value;
                proveedorDTO.Region = inputRegion.Value;
                proveedorDTO.PostalCode = inputPostalCode.Value;
                proveedorDTO.Country = inputCountry.Value;
                proveedorDTO.Phone = inputPhone.Value;
                proveedorDTO.Fax = inputFax.Value;
                proveedorDTO.HomePage = inputHomePage.Value;

                var context = new ValidationContext(proveedorDTO, serviceProvider: null, items: null);
                var results = new List<ValidationResult>();

                var isValid = Validator.TryValidateObject(proveedorDTO, context, results);

                if (!isValid)
                {
                    foreach (var validationResult in results)
                    {
                        errores.Add(validationResult.ErrorMessage);
                    }

                    return null;
                }
            }
            catch (Exception)
            {
                
                return null;
            }
            
            return proveedorDTO;
        }
    }
}