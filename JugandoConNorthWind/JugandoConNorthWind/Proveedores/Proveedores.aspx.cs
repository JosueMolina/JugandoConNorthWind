using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Web.UI;
using System.Web.UI.WebControls;
using JugandoConNorthWind.ModeloNorthWind;
using JugandoConNorthWind.Repositorio;
using JugandoConNorthWind.ClasesDTO;

namespace JugandoConNorthWind.Proveedores
{
    public partial class Proveedores : System.Web.UI.Page
    {
        ProveedoresRepositorio _pCRUD = new ProveedoresRepositorio(new NorthwindEntities());
        List<string> errores = new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LVProveedores.DataSource = _pCRUD.ListaProveedores();
                LVProveedores.DataBind();
            }
        }

        protected void BuscarProveedorInput_TextChanged(object sender, EventArgs e)
        {
            // Removiendo guiones y punto/Coma para evitar SQL INJECTION 
            string texto = BuscarProveedorInput.Text.Trim().Replace("-", "").Replace(";", "");
            LVProveedores.DataSource = _pCRUD.BuscarProveedor(texto);
            LVProveedores.DataBind();
        }

        public void btnGuardar_Click(object sender, EventArgs e)
        {

            ProveedoresDTO proveedorDTO = ControlesADatos();

            if (proveedorDTO == null || errores.Count > 0)
            {
                Label _label = new Label();
                _label.Text = "No se pudo agregar el Proveedor";
                phMensajeErrorEditar.Controls.Add(_label);

                if (errores.Count > 0)
                {
                    foreach (string error in errores)
                    {
                        phMensajeErrorEditar.Controls.Add(new LiteralControl("<br />"));
                        Label label = new Label();
                        phMensajeErrorEditar.Controls.Add(label);
                    }
                }

            }
            else 
            {
                if (_pCRUD.AgregarProveedor(proveedorDTO))
                {
                    ToastrLiteral.Text = "<script>toastr.info('Proveedor guardado Exitosamente')</script>";
                    LVProveedores.DataSource = _pCRUD.ListaProveedores();
                    LVProveedores.DataBind();
                }
                else 
                {
                    Label label = new Label();
                    label.Text = "No se pudo Agregar el Poveedor";
                    phMensajeErrorEditar.Controls.Add(label);
                }
            }
        }

        public ProveedoresDTO ControlesADatos()
        {
            ProveedoresDTO proveedorDTO = new ProveedoresDTO();

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

                var context = new ValidationContext(proveedorDTO, serviceProvider : null, items : null);
                var results = new List<ValidationResult>();

                var isValid = Validator.TryValidateObject(proveedorDTO, context, results);

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
                return null;
            }

            return proveedorDTO;
        }


    }
}