<%@ Page  MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProveedorDetalle.aspx.cs" Inherits="JugandoConNorthWind.Proveedores.ProveedorDetalle" %>


<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainPlaceHolder" runat="server">

  <div id="contenedor" runat="server" class="container">
    <div class="row">
      <div class="col-md-8">
        <div class="well">
          <form runat="server" id="formulario" class="form-horizontal">
            <fieldset>
              <legend>Detalle del Proveedor</legend>
              <div class="form-group">
                <label for="inputCompanyName" class="col-lg-4 control-label">Nombre del Proveedor : </label>
                <div class="col-lg-8">
                  <input disabled runat="server" type="text" class="form-control" id="inputCompanyName" placeholder="Nombre" required />
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
                  <input disabled runat="server" type="text" title="Proporciona una URL" pattern="(http|https)//:.+" class="form-control" id="inputHomePage" placeholder="Web Site">
                </div>
              </div>
              <div class="col-lg-8 col-lg-offset-4">
                <div id="Guardar-Cancelar">
                  <asp:LinkButton runat="server" class="btn btn-default btn-primary btn-info" id="btnGuardar" OnClick="btnGuardar_Click">Guardar</asp:LinkButton>
                  <a href="#" class="btn btn-primary" runat="server" id="btnCancelar">Cancelar</a>
                  <button type="submit" id="btnSubmit">Submit</button>
                </div>
                <div id="Editar-Eliminar">
                  <a class="btn btn-default btn-primary btn-info" runat="server" id="btnEditar">Editar</a>
                  <a data-toggle="modal" data-target="#myModal" class="btn btn-default btn-primary btn-danger" runat="server" id="btnEliminar">Eliminar</a>
                  <a href=" /Proveedores/Proveedores.aspx" class="btn btn-primary" runat="server" id="btnProveedores">Proveedores</a>
                </div>
              </div>
            </fieldset>
            <asp:PlaceHolder runat="server" ID="phMensajeErrorEditar" /> 
            <!--Modal Aviso Eliminar-->
            <%@ Register Src="~/UsersControls/AvisoEliminarRegistroControl.ascx" TagPrefix="Control" TagName="AvisoEliminarRegistroControl" %>
            <Control:AvisoEliminarRegistroControl runat="server" id="AvisoEliminarRegistroControl" />

          </form>
        </div>
      </div>
    </div>
  </div>

  <script src="../Scripts/jquery-1.8.2.min.js"></script>
  <script src="../Scripts/Bootstrap/bootstrap.min.js"></script>
  <script src="../Scripts/Plugins/jquery.validate.js"></script>
  <script src="../Scripts/Plugins/additional-methods.js"></script>
  <script src="../Scripts/CustomScripts/custom.js"></script>

  <asp:Literal ID="EjecutarModel" runat="server" />
</asp:Content>
