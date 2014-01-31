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
        public event EventHandler EliminadoRetornoURLEvent;

        public string mensaje { get; set; }
        public string mensajeNoEliminado { get; set; }
        public string mesajeEliminado { get; set; }

        //Borrar y ejecutar Modal evento User Control
        protected void UserControlClickEvent(object sender, EventArgs e)
        {
            OnClickEvent();
        }

        //Eliminado RetornoUrl Evento User Control
        protected void EliminadoRetornoURL_DesdeUserControl(object sender, EventArgs e)
        {
            EliminadoRetornoURL();
        }

        private void EliminadoRetornoURL()
        {
            if (EliminadoRetornoURLEvent != null)
                EliminadoRetornoURLEvent(this, EventArgs.Empty);
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