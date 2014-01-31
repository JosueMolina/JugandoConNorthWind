<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProveedorDetalle.aspx.cs" Inherits="JugandoConNorthWind.Proveedores.ProveedorDetalle" %>

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainPlaceHolder" runat="server">

  <div id="contenedor" runat="server" class="container">
    <div class="row">
      <div class="col-md-8">
        <div class="well">
          <form id="formulario" runat="server" class="form-horizontal">
            <fieldset>
              <legend>Detalle del Proveedor</legend>
              <div class="form-group">
                <label for="inputCompanyName" class="col-lg-4 control-label">Nombre del Proveedor : </label>
                <div class="col-lg-8">
                  <input disabled runat="server" type="text" class="form-control" id="inputCompanyName" placeholder="Nombre">
                </div>
              </div>
              <div class="form-group">
                <label for="inputContactName" class="col-lg-4 control-label">Nombre del Contacto : </label>
                <div class="col-lg-8">
                  <input disabled runat="server" type="text" class="form-control" id="inputContactName" placeholder="Contacto">
                </div>
              </div>
              <div class="form-group">
                <label for="inputContactTitle" class="col-lg-4 control-label">Cargo del Contacto : </label>
                <div class="col-lg-8">
                  <input disabled runat="server" type="text" class="form-control" id="inputContactTitle" placeholder="Cargo del Contacto">
                </div>
              </div>
              <div class="form-group">
                <label for="inputAdress" class="col-lg-4 control-label">Dirección : </label>
                <div class="col-lg-8">
                  <input disabled runat="server" type="text" class="form-control" id="inputAdress" placeholder="Dirección">
                </div>
              </div>
              <div class="form-group">
                <label for="inputCity" class="col-lg-4 control-label">Ciudad : </label>
                <div class="col-lg-8">
                  <input disabled runat="server" type="text" class="form-control" id="inputCity" placeholder="Ciudad">
                </div>
              </div>
              <div class="form-group">
                <label for="inputRegion" class="col-lg-4 control-label">Región : </label>
                <div class="col-lg-8">
                  <input disabled runat="server" type="text" class="form-control" id="inputRegion" placeholder="Region">
                </div>
              </div>
              <div class="form-group">
                <label for="inputPostalCode" class="col-lg-4 control-label">Código Postal : </label>
                <div class="col-lg-8">
                  <input disabled runat="server" type="text" class="form-control" id="inputPostalCode" placeholder="Código Postal">
                </div>
              </div>
              <div class="form-group">
                <label for="inputCountry" class="col-lg-4 control-label">País : </label>
                <div class="col-lg-8">
                  <input disabled runat="server" type="text" class="form-control" id="inputCountry" placeholder="País">
                </div>
              </div>
              <div class="form-group">
                <label for="inputPhone" class="col-lg-4 control-label">Teléfono : </label>
                <div class="col-lg-8">
                  <input disabled runat="server" type="text" class="form-control" id="inputPhone" placeholder="Teléfono">
                </div>
              </div>
              <div class="form-group">
                <label for="inputFax" class="col-lg-4 control-label">Fax : </label>
                <div class="col-lg-8">
                  <input disabled runat="server" type="text" class="form-control" id="inputFax" placeholder="Fax">
                </div>
              </div>
              <div class="form-group">
                <label for="inputHomePage" class="col-lg-4 control-label">Web Site : </label>
                <div class="col-lg-8">
                  <input disabled runat="server" type="text" class="form-control" id="inputHomePage" placeholder="Web Site">
                </div>
              </div>
              <div class="col-lg-8 col-lg-offset-4">
                <div id="Guardar-Cancelar">
                  <a href="#" class="btn btn-default btn-primary btn-info" id="A1">Guardar</a>
                  <a href="#" class="btn btn-primary" id="btnCancelar">Cancelar</a>
                </div>
                <div id="Editar-Eliminar">
                  <a href="#" class="btn btn-default btn-primary btn-info" id="btnEditar">Editar</a>
                  <a href="#" data-toggle="modal" data-target="#myModal" class="btn btn-default btn-primary btn-danger" id="btnEliminar">Eliminar</a>
                  <a href="/Proveedores/Proveedores.aspx" class="btn btn-primary">Proveedores</a>
                </div>
              </div>
            </fieldset>

            <!--Modal Aviso Eliminar-->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-exclamation-sign"></span>   Mensaje de Advertencia</h4>
                  </div>
                  <div class="modal-body">
                    Esta a punto de eliminar permanentemente un registro, todos los registros que dependan del mismo
                    serán establecidos como articulos "Sin Proveedor". 
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <asp:LinkButton runat="server" ID="btnEliminarProveedor" class="btn btn-primary btn-danger" OnClick="btnEliminarProveedor_Click">Eliminar Registro</asp:LinkButton>
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
                    <h4 class="modal-title" id="H1"><span class="glyphicon glyphicon-exclamation-sign"></span>   Mensaje de Advertencia</h4>
                  </div>
                  <div class="modal-body">
                    Ha Ocurrido un problema al intentar borrar el registro, por lo tanto no se ha terminado la Operación Excitosamente. 
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
                    <h4 class="modal-title" id="H2"><span class="glyphicon glyphicon-exclamation-sign"></span>   Mensaje de Advertencia</h4>
                  </div>
                  <div class="modal-body">
                    Registro Eliminado Exitosamente.
                  </div>
                  <div class="modal-footer">
                    <asp:LinkButton runat="server" ID="btnAceptarRedireccionar" class="btn btn-primary" OnClick="btnAceptarRedireccionar_Click">Aceptar</asp:LinkButton>
                  </div>
                </div>
              </div>
            </div>

          </form>
        </div>
      </div>
    </div>
  </div>

  <script src="../Scripts/jquery-1.8.2.min.js"></script>
  <script src="../Scripts/Bootstrap/bootstrap.min.js"></script>
  <script src="../Scripts/CustomScripts/custom.js"></script>

  <asp:Literal ID="EjecutarModel" runat="server" />
</asp:Content>
