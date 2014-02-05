using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace JugandoConNorthWind.UsersControls
{
    public partial class AvisoEliminarRegistroControl : System.Web.UI.UserControl
    {
        public event EventHandler UserControlButtonClicked;
        public event EventHandler RetornoURLEvent;

        public string mensajeAviso { get; set; }
        public string mensajeNoExitoso { get; set; }
        public string mensajeExitoso { get; set; }
        public string mensajeExitosoAlternativo { get; set; }

        //Borrar y ejecutar Modal evento User Control
        protected void UserControlClickEvent(object sender, EventArgs e)
        {
            OnClickEvent();
        }

        //Eliminado RetornoUrl Evento User Control
        protected void RetornoURL_DesdeUserControl(object sender, EventArgs e)
        {
            RetornoURL();
        }

        private void RetornoURL()
        {
            if (RetornoURLEvent != null)
                RetornoURLEvent(this, EventArgs.Empty);
        }

        private void OnClickEvent()
        {
            if (UserControlButtonClicked != null)
                UserControlButtonClicked(this, EventArgs.Empty);
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

    }
}