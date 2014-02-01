<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AvisoEliminarRegistroControl.ascx.cs" Inherits="JugandoConNorthWind.UsersControls.AvisoEliminarRegistroControl" %>

<!--Modal Aviso Eliminar-->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-exclamation-sign"></span>  Mensaje de Advertencia</h4>
      </div>
      <div class="modal-body">
        <%: this.mensaje%>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
        <asp:LinkButton runat="server" ID="btnEliminar" class="btn btn-primary btn-danger" OnClick="UserControlClickEvent">Eliminar Registro</asp:LinkButton>
      </div>
    </div>
  </div>
</div>

<!--Modal No Eliminado-->
<div class="modal fade" id="modalNoEliminado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="H1"><span class="glyphicon glyphicon-exclamation-sign"></span>  Mensaje de Advertencia</h4>
      </div>
      <div class="modal-body">
        <%: this.mensajeNoEliminado %>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" data-dismiss="modal">Aceptar</button>
      </div>
    </div>
  </div>
</div>

<!--Modal Si Eliminado-->
<div class="modal fade" data-backdrop="static" id="modalEliminado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="H2"><span class="glyphicon glyphicon-exclamation-sign"></span>  Mensaje de Información</h4>
      </div>
      <div class="modal-body">
        <%: this.mesajeEliminado %>
      </div>
      <div class="modal-footer">
        <asp:LinkButton runat="server" ID="btnAceptarRedireccionar" class="btn btn-primary" OnClick="EliminadoRetornoURL_DesdeUserControl">Aceptar</asp:LinkButton>
      </div>
    </div>
  </div>
</div>




