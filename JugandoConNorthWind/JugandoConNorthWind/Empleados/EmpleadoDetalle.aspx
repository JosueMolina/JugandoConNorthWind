<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpleadoDetalle.aspx.cs" Inherits="JugandoConNorthWind.Empleados.EmpleadoDetalle" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainPlaceHolder" runat="server">
  <div id="contenedor" runat="server" class="container">
    <div class="row">
      <div class="col-md-8">
        <div class="well">
          <form runat="server" id="formulario" class="form-horizontal">
                        <fieldset>
              <legend>Agregar Empleado</legend>
              <div class="row">
                <div class="col-md-12">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="inputFirstName" class="col-lg-4 control-label">Nombre : </label>
                      <div class="col-lg-7">
                        <input runat="server" type="text" class="form-control" id="inputFirstName" placeholder="Nombre" required />
                      </div>
                        <span class="elemento-requerido col-lg-1">*</span>
                    </div>
                    <div class="form-group">
                      <label for="inputLastName" class="col-lg-4 control-label">Apellido : </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputLastName" placeholder="Apellido" required />
                      </div>
                      <span class="elemento-requerido col-lg-1">*</span>
                    </div>
                    <div class="form-group">
                      <label for="inputTitle" class="col-lg-4 control-label">Cargo del Empleado: </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputTitle" placeholder="Cargo del Empleado" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputTitleOfCourtesy" class="col-lg-4 control-label">Mtrs/Dr : </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputTitleOfCourtesy" placeholder="Mtrs/Dr" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputBirthDate" class="col-lg-4 control-label">Fecha de Nacimiento: </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputBirthDate" placeholder="Fecha de Nacimiento" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputHireDate" class="col-lg-4 control-label">Fecha de Contratación : </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputHireDate" placeholder="Fecha de Contratación" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputAdress" class="col-lg-4 control-label">Dirección : </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputAdress" placeholder="Dirección" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputCity" class="col-lg-4 control-label">Ciudad: </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputCity" placeholder="Ciudad" />
                      </div>
                    </div>
                  </div>

                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="inputRegion" class="col-lg-4 control-label">Región: </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputRegión" placeholder="Región" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPostalCode" class="col-lg-4 control-label">Codigo Postal : </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputPostalCode" placeholder="Codigo Postal" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputCountry" class="col-lg-4 control-label">País : </label>
                      <div class="col-lg-7">
                        <input runat="server" type="text"  class="form-control" id="inputCountry" placeholder="País" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputHomePhone" class="col-lg-4 control-label">Teléfono de casa : </label>
                      <div class="col-lg-7">
                        <input runat="server" type="text"  class="form-control" id="inputHomePhone" placeholder="Teléfono" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputExtension" class="col-lg-4 control-label">Extensión : </label>
                      <div class="col-lg-7">
                        <input runat="server" type="text"  class="form-control" id="inputExtension" placeholder="Extensión" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPhoto" class="col-lg-4 control-label">Foto : </label>
                      <div class="col-lg-7">
                         <!--<a href="" class="btn btn-default btn-primary btn-info" id="btnCargarImagen">Cargar Imagen</a>-->
                        <asp:FileUpload runat="server" ID="inputFileImagen" class="form-control" /><img alt="" onclick="return false;" src="" ID="Imagen" runat="server" />
                        <!--<input runat="server" type="text"  class="form-control" id="inputPhoto" placeholder="Foto" />-->
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputNotes" class="col-lg-4 control-label">Notas : </label>
                      <div class="col-lg-7">
                        <input runat="server" type="text"  class="form-control" id="inputNotes" placeholder="Notas" />
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPhotoPath" class="col-lg-4 control-label">Ruta de Foto : </label>
                      <div class="col-lg-7">
                        <input runat="server" type="text"  class="form-control" id="inputPhotoPath" placeholder="Ruta de Foto" />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12">
                  <div id="Guardar-Cancelar" class="pull-right" style="padding-right: 4em;">
                    <asp:LinkButton runat="server" class="btn btn-default btn-primary btn-info" ID="btnGuardar" >Guardar</asp:LinkButton>
                    <a href="" style="margin-left: 0.5em;" class="btn btn-primary" id="btnCancelar">Cancelar</a>
                    <button style="display: none;" type="submit" id="btnSubmit">Submit</button>
                  </div>
                </div>
              </div>
            </fieldset>
            <asp:PlaceHolder runat="server" ID="phMensajeErrorEditar" />
            <!--Modal Aviso Eliminar-->
            <%@ Register Src="~/UsersControls/AvisoModalsControl.ascx" TagPrefix="control" TagName="AvisoModalsControl" %>
            <control:AvisoModalsControl runat="server" id="AvisoModalsControl" />
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
