<%@  Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpleadoDetalle.aspx.cs" Inherits="JugandoConNorthWind.Empleados.EmpleadoDetalle" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainPlaceHolder" runat="server">
  <div id="contenedor" runat="server" class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="well">
          <form runat="server" id="formulario" class="form-horizontal  panel-warning">
            <asp:ScriptManager runat="server" ID="sm" />
            <div class="panel-heading">
              <h2 class="panel-title">Editar Empleado</h2>
            </div>
            <fieldset>
              <legend></legend>
              <div class="row panel-body">
                <div class="col-md-12">
                  <div class="row">
                  <div id="FormPrincipal">
                    <div class="col-md-6">

                      <div class="form-group">
                        <label for="inputFirstName" class="col-lg-4 control-label">Nombre : </label>
                        <div class="col-lg-7">
                          <input runat="server" type="text" class="form-control" id="inputFirstName" placeholder="Nombre" required />
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="inputLastName" class="col-lg-4 control-label">Apellido : </label>
                        <div class="col-lg-7">
                          <input runat="server" type="text" class="form-control" id="inputLastName" placeholder="Apellido" required />
                        </div>
                      </div>

                    </div>
                    <!--Fin de la Primera Columna-->

                    <div class="col-md-6">

                      <div class="form-group">
                        <label for="inputTitle" class="col-lg-4 control-label">Cargo del Empleado: </label>
                        <div class="col-lg-7">
                          <input runat="server" type="text" class="form-control" id="inputTitle" placeholder="Cargo del Empleado" />
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="inputCountry" class="col-lg-4 control-label">País : </label>
                        <div class="col-lg-7">
                          <input runat="server" type="text" class="form-control" id="inputCountry" placeholder="País" />
                        </div>
                      </div>

                    </div>
                    <!---Fin de la segunda Columna-->
                  </div>
                  <!--Fin de todo el Formulario Principal, Botones Principales-->
                  </div>
                  <!--Fin del row-->

                  <div class="row">
                  <div class="FormSecundario">
                    <div class="col-md-6">

                      <div class="form-group">
                        <label for="inputTitleOfCourtesy" class="col-lg-4 control-label">Mtrs/Dr : </label>
                        <div class="col-lg-7">
                          <input runat="server" type="text" class="form-control" id="inputTitleOfCourtesy" placeholder="Mtrs/Dr" />
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="inputHomePhone" class="col-lg-4 control-label">Teléfono de casa : </label>
                        <div class="col-lg-7">
                          <input runat="server" type="text" class="form-control" id="inputHomePhone" placeholder="Teléfono" />
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="inputAdress" class="col-lg-4 control-label">Dirección : </label>
                        <div class="col-lg-7">
                          <input runat="server" type="text" class="form-control" id="inputAdress" placeholder="Dirección" />
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="inputCity" class="col-lg-4 control-label">Ciudad: </label>
                        <div class="col-lg-7">
                          <input runat="server" type="text" class="form-control" id="inputCity" placeholder="Ciudad" />
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="inputRegion" class="col-lg-4 control-label">Región: </label>
                        <div class="col-lg-7">
                          <input runat="server" type="text" class="form-control" id="inputRegión" placeholder="Región" />
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="inputHireDate" class="col-lg-4 control-label">Fecha de Contratación : </label>
                        <div class="col-lg-7">
                          <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                              <asp:Calendar ID="CalendarioHireDate" runat="server"></asp:Calendar>
                            </ContentTemplate>
                          </asp:UpdatePanel>
                        </div>
                      </div>

                    </div>
                    <!--Fin de la Primera Columna-->

                    <div class="col-md-6">
                      
                      <div class="form-group">
                        <label for="inputPostalCode" class="col-lg-4 control-label">Codigo Postal : </label>
                        <div class="col-lg-7">
                          <input runat="server" type="text" class="form-control" id="inputPostalCode" placeholder="Codigo Postal" />
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="inputExtension" class="col-lg-4 control-label">Extensión : </label>
                        <div class="col-lg-7">
                          <input runat="server" type="text" class="form-control" id="inputExtension" placeholder="Extensión" />
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="inputPhoto" class="col-lg-4 control-label">Foto : </label>
                        <div class="col-lg-7">
                          <asp:FileUpload Width="100%" runat="server" ID="inputFileImagen" class="" /><!--<img alt="" onclick="return false;" src="" ID="Imagen" runat="server" />-->
                        </div>
                      </div>

                      <div class="form-group">
                        <label for="inputNotes" class="col-lg-4 control-label">Notas : </label>
                        <div class="col-lg-7">
                          <textarea runat="server" ID="inputNotes" style="height: 100px;" class="form-control"></textarea>
                        </div>
                      </div>

                     <%-- <div class="form-group">
                        <label for="inputPhotoPath" class="col-lg-4 control-label">Ruta de Foto : </label>
                        <div class="col-lg-7">
                          <input runat="server" type="text" class="form-control" id="inputPhotoPath" placeholder="Ruta de Foto" />
                        </div>
                      </div>--%>
                      <div class="form-group">
                        <label for="inputBirthDate" class="col-lg-4 control-label">Fecha de Nacimiento: </label>
                        <div class="col-lg-7">
                          <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                              <asp:Calendar runat="server" ID="CalendarioBirthDate"></asp:Calendar>
                            </ContentTemplate>
                          </asp:UpdatePanel>
                        </div>
                      </div>

                    </div>
                    <!--Fin de la Segunda Columna-->
                  </div>
                  <!--Fin del FormSecundario-->
                  </div>
                  <!--Fin del row-->
                </div>
                <!--Fin del col-md-12-->
                

              </div>
              <!--Fin de panel Body-->
            </fieldset>
            <!--Botones-->
            <div class="row">
              <div class="col-lg-12">
                <br />
                <div class="col-md-6 col-md-offset-6" id="Guardar-Cancelar">
                  <asp:LinkButton runat="server" class="col-md-4 col-md-offset-4 btn btn-default btn-primary btn-info" ID="btnGuardar">Guardar</asp:LinkButton>
                  <a href="" class="btn btn-primary col-md-3" id="btnCancelar">Cancelar</a>
                  <button style="display: none;" type="submit" id="btnSubmit">Submit</button>
                </div>
              </div>
            </div>
            <!--Fin de los Botones-->

            <asp:PlaceHolder runat="server" ID="phMensajeErrorEditar" />
            <!--Modal Mensajes -->
            <%@ Register Src="~/UsersControls/AvisoModalsControl.ascx" TagPrefix="control" TagName="AvisoModalsControl" %>
            <control:AvisoModalsControl runat="server" ID="AvisoModalsControl" />

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
