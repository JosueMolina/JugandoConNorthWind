using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JugandoConNorthWind.UsersControls
{
    public partial class CombosFechaControl : System.Web.UI.UserControl
    {
        List<object[]> Meses = new List<object[]>();

        protected void Page_Load(object sender, EventArgs e)
        {
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

            if (!IsPostBack)
            {
                cargarCombosFecha();
            }

        }

        protected void selectMeses_SelectedIndexChanged(object sender, EventArgs e)
        {
            int diaSeleccionado = Convert.ToInt16(selectDias.SelectedValue);
            int diasDelMesSeleccionado = Convert.ToInt16(Meses[selectMeses.SelectedIndex][1]);

            if (diaSeleccionado > diasDelMesSeleccionado)
            {
                selectDias.SelectedIndex = diasDelMesSeleccionado - 1;
            }

            string script = "$('#" + selectDias.ClientID +"').attr('disabled', false);"
                          + "$('#" + selectMeses.ClientID +"').attr('disabled', false);"
                          + "$('#" + selectAnios.ClientID +"').attr('disabled', false);";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scripHablitarDias", script, true);
        }

        protected void selectDias_SelectedIndexChanged(object sender, EventArgs e)
        {
            int diaSeleccionado = Convert.ToInt16(selectDias.SelectedValue);
            int diasDelMesSeleccionado = Convert.ToInt16(Meses[selectMeses.SelectedIndex][1]);

            if (diaSeleccionado > diasDelMesSeleccionado)
            {
                selectDias.SelectedIndex = diasDelMesSeleccionado - 1;
            }

            string script = "$('#" + selectDias.ClientID +"').attr('disabled', false);"
                          + "$('#" + selectMeses.ClientID +"').attr('disabled', false);"
                          + "$('#" + selectAnios.ClientID +"').attr('disabled', false);";
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "scriptHablitarDias", script, true);
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


            for (int i = 1; i <= 31; i++)
            {
                string dia = i.ToString().Length < 2 ? "0" + i.ToString() : i.ToString();
                selectDias.Items.Add(new ListItem(dia, dia));
            }


            for (int i = 1950; i < DateTime.Now.Year; i++)
            {
                selectAnios.Items.Add(new ListItem(i.ToString(), i.ToString()));
            }
        }

    }
}