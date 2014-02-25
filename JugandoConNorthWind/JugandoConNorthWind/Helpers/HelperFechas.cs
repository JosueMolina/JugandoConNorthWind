using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JugandoConNorthWind.Helpers
{
    public static class HelperFechas
    {
        public static void HacerCombos(this PlaceHolder content)
        {
            DropDownList ddlDias = new DropDownList();
            ddlDias.CssClass = "form-control";
            ddlDias.ID = content.ID + "_ddlDias";
            ddlDias.Attributes["disabled"] = "disabled";
            
            System.Web.UI.HtmlControls.HtmlGenericControl divDias =
                new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            divDias.Attributes["class"] = "col-lg-3";
            divDias.Controls.Add(ddlDias);
            content.Controls.Add(divDias);

            DropDownList ddlMeses = new DropDownList();
            ddlMeses.CssClass = "form-control";
            ddlMeses.ID = content.ID + "_ddlMeses";
            ddlMeses.Attributes["disabled"] = "disabled";

            System.Web.UI.HtmlControls.HtmlGenericControl divMeses = 
                new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            divMeses.Attributes["class"] = "col-lg-3";
            divMeses.Controls.Add(ddlMeses);
            content.Controls.Add(divMeses);

            DropDownList ddlAnios = new DropDownList();
            ddlAnios.CssClass = "form-control";
            ddlAnios.ID = content.ID + "_ddlAnios";
            ddlAnios.Attributes["disabled"] = "disabled";

            System.Web.UI.HtmlControls.HtmlGenericControl divAnios = 
                new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
            divAnios.Attributes["class"] = "col-lg-4";
            divAnios.Controls.Add(ddlAnios);
            content.Controls.Add(divAnios);

        }

        public static void CargarCombosFechas( this PlaceHolder content)
        {
            try
            {
                DropDownList _ddlDias = (DropDownList)content.FindControl(content.ID + "_ddlDias");
                DropDownList _ddlMeses = (DropDownList)content.FindControl(content.ID + "_ddlMeses");
                DropDownList _ddlAnios = (DropDownList)content.FindControl(content.ID + "_ddlAnios");

                for (int i = 1; i <= 31; i++)
                {
                    if (i < 10)
                    {
                        _ddlDias.Items.Add(new ListItem("0" + i.ToString(), "0" + i.ToString()));
                        continue;
                    }

                    _ddlDias.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }

                for (int i = 1; i <= 12; i++)
                {
                    if (i < 10)
                    {
                        _ddlMeses.Items.Add(new ListItem("0" + i.ToString(), "0" + i.ToString()));
                        continue;
                    }
                    _ddlMeses.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }

                for (int i = 1950; i <= DateTime.Now.Year; i++)
                {
                    _ddlAnios.Items.Add(new ListItem(i.ToString(), i.ToString()));
                }
            }
            catch (Exception ex)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl mensajeError =
                    new System.Web.UI.HtmlControls.HtmlGenericControl("P");

                mensajeError.ID = content.ID + "_mensajeError";
                mensajeError.InnerText = "Problema al cargar los datos";
                mensajeError.Style.Add("color", "red");
                content.Controls.Add(mensajeError);

                string error = ex.Message;

            }
            
        }

        public static void VerificarFecha(this PlaceHolder content)
        {
            DateTime fecha = new DateTime();
            DropDownList _ddlDias = (DropDownList)content.FindControl(content.ID + "_ddlDias");
            DropDownList _ddlMeses = (DropDownList)content.FindControl(content.ID + "_ddlMeses");
            DropDownList _ddlAnios = (DropDownList)content.FindControl(content.ID + "_ddlAnios");

            try
            {
                fecha = Convert.ToDateTime(String.Format(
                    "{0}/{1}/{2}", _ddlDias.SelectedValue,
                                   _ddlMeses.SelectedValue,
                                   _ddlAnios.SelectedValue
                    ));
            }
            catch (Exception ex)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl mensajeError =
                    new System.Web.UI.HtmlControls.HtmlGenericControl("P");

                mensajeError.ID = content.ID + "_mensajeError";
                mensajeError.InnerText = "Error al procesar la fecha, por favor verifique que la fecha es correcta";
                mensajeError.Style.Add("color", "red");
                content.Controls.Add(mensajeError);

                string error = ex.Message;
            }
        }

        public static void CargarFechaPredefinida( this PlaceHolder content, DateTime fecha)
        {
            try
            {
                DropDownList _ddlDias = (DropDownList)content.FindControl(content.ID + "_ddlDias");
                DropDownList _ddlMeses = (DropDownList)content.FindControl(content.ID + "_ddlMeses");
                DropDownList _ddlAnios = (DropDownList)content.FindControl(content.ID + "_ddlAnios");

                _ddlDias.SelectedValue =
                    fecha.Day > 9 ? fecha.Day.ToString() :
                                "0" + fecha.Day.ToString();

                _ddlMeses.SelectedValue = 
                    fecha.Month > 9 ? fecha.Month.ToString() :
                                "0" + fecha.Month.ToString();

                _ddlAnios.SelectedValue = fecha.Year.ToString();
            }
            catch (Exception ex)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl mensajeError =
                    new System.Web.UI.HtmlControls.HtmlGenericControl("P");

                mensajeError.ID = content.ID + "_mensajeError";
                mensajeError.Style.Add("color", "red");
                mensajeError.InnerText = "Problema al cargar la fecha definida";
                content.Controls.Add(mensajeError);

                string error = ex.Message;

            }
        }

        public static void HabilitarCombos(this PlaceHolder content) 
        {
            DropDownList _ddlDias = (DropDownList)content.FindControl(content.ID + "_ddlDias");
            DropDownList _ddlMeses = (DropDownList)content.FindControl(content.ID + "_ddlMeses");
            DropDownList _ddlAnios = (DropDownList)content.FindControl(content.ID + "_ddlAnios");

            _ddlAnios.Attributes.Remove("disabled");
            _ddlDias.Attributes.Remove("disabled");
            _ddlMeses.Attributes.Remove("disabled");
        }
    }
}