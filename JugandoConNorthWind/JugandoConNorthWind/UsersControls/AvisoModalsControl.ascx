<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AvisoModalsControl.ascx.cs" Inherits="JugandoConNorthWind.UsersControls.AvisoEliminarRegistroControl" %>

<!--Modal Aviso-->
<div class="modal fade" id="modalAviso" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-exclamation-sign"></span>  Mensaje de Advertencia</h4>
      </div>
      <div class="modal-body">
        <%: this.mensajeAviso%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <asp:LinkButton runat="server" ID="btnEliminar" class="btn btn-primary btn-danger" OnClick="UserControlClickEvent">Eliminar Registro</asp:LinkButton>
      </div>
    </div>
  </div>
</div>

<!--Modal No Exitoso-->
<div class="modal fade" id="modalNoExitoso" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="H1"><span class="glyphicon glyphicon-exclamation-sign"></span>  Mensaje de Advertencia</h4>
      </div>
      <div class="modal-body">
        <%: this.mensajeNoExitoso %>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>

<!--Modal Exitoso-->
<div class="modal fade" data-backdrop="static" id="modalExitoso" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="H2"><span class="glyphicon glyphicon-exclamation-sign"></span>  Mensaje de Información</h4>
      </div>
      <div class="modal-body">
        <%: this.mensajeExitoso %>
      </div>
      <div class="modal-footer">
        <asp:LinkButton runat="server" ID="btnAceptarRedireccionar" class="btn btn-primary" OnClick="RetornoURL_DesdeUserControl">Aceptar</asp:LinkButton>
      </div>
    </div>
  </div>
</div>

<!--Modal Exitoso Alternativo-->
<div class="modal fade" data-backdrop="static" id="modalExitosoAlternativo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="H3"><span class="glyphicon glyphicon-exclamation-sign"></span>  Mensaje de Información</h4>
      </div>
      <div class="modal-body">
        <%: this.mensajeExitosoAlternativo %>
      </div>
      <div class="modal-footer">
        <asp:LinkButton runat="server" ID="LinkButton1" class="btn btn-primary" OnClick="RetornoURL_DesdeUserControl">Aceptar</asp:LinkButton>
      </div>
    </div>
  </div>
</div>




