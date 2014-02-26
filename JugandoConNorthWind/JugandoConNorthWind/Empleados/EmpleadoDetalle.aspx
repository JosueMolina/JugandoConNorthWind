<%@  Page MaintainScrollPositionOnPostback="true" Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmpleadoDetalle.aspx.cs" Inherits="JugandoConNorthWind.Empleados.EmpleadoDetalle" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="MainContent" ContentPlaceHolderID="MainPlaceHolder" runat="server">
  <div id="contenedor" runat="server" class="container">
    <div class="row">
      <div class="col-md-12">
          <form runat="server" id="formulario" class="form-horizontal">
            <asp:ScriptManager runat="server" ID="sm" />
        <div class="well">
          <!--Enabezado y Botones-->
          <div class="row">
            <div class="col-lg-12">

              <div class="col-lg-6">
                <h1 style="display: inline;">Editar Empleado</h1>
              </div>

              <div class="col-lg-6">
                <div class="col-md-6  pull-right" id="Editar-Eliminar">
                  <asp:LinkButton runat="server" class="col-md-5 btn btn-default btn-primary btn-info" ID="btnEditar">Editar</asp:LinkButton>
                  <a data-target="#modalAviso" data-toggle="modal" class="btn btn-primary col-md-5 col-md-offset-1 btn-danger" id="btnEliminar">Eliminar</a>
                </div>
                <div class="col-md-6 pull-right" id="Guardar-Cancelar" style="display: none;">
                  <asp:LinkButton runat="server" class="col-md-5 btn btn-default btn-primary btn-info" ID="btnGuardar" OnClick="btnGuardar_Click">Guardar</asp:LinkButton>
                  <asp:LinkButton runat="server" ID="btnCancelar" class="btn btn-primary col-md-5 col-md-offset-1" OnClick="CargarValores">Cancelar</asp:LinkButton>
                  <%--<a runat="server" onserverclick="CargarValores" class="btn btn-primary col-md-5 col-md-offset-1" id="btnCancelar">Cancelar</a>--%>
                  <button style="display: none;" type="submit" id="btnSubmit">Submit</button>
                </div>
              </div>

            </div>
          </div>
          <!--Fin de Encabezado y Botones-->
        </div>

            <fieldset>
              <legend></legend>
              <div class="row panel-body">
                <div class="col-md-12">
                  <div class="row">
                  <div id="FormPrincipal">

                    <div class="col-md-6">

                      <div class="form-group">
                        <div class="col-lg-11">
                          <div class="input-group">
                            <span class="input-group-addon">Nombre : </span>
                            <input disabled runat="server" type="text" class="form-control" id="inputFirstName" placeholder="Escriba su Nombre" required />
                          </div>
                          </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                        <div class="input-group">
                          <span class="input-group-addon">Apellido : </span>
                          <input disabled runat="server" type="text" class="form-control" id="inputLastName" placeholder="Apellido" required />
                        </div>
                        </div>
                      </div>

                    </div>
                    <!--Fin de la Primera Columna-->

                    <div class="col-md-6">

                      <div class="form-group">
                        <div class="col-lg-11">
                          <div class="input-group">
                            <span class="input-group-addon">Cargo E. : </span>
                            <input disabled runat="server" type="text" class="form-control" id="inputTitle" placeholder="Cargo del Empleado" />
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                          <div class="input-group">
                            <span class="input-group-addon">País : </span>
                            <input disabled runat="server" type="text" class="form-control" id="inputCountry" placeholder="País" />
                          </div>
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
                        <div class="col-lg-11">
                          <div class="input-group">
                            <span class="input-group-addon">Mtrs/Dr : </span>
                            <input disabled runat="server" type="text" class="form-control" id="inputTitleOfCourtesy" placeholder="Mtrs/Dr" />
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                        <div class="input-group">
                           <span class="input-group-addon">Tel. Casa : </span>
                          <input disabled runat="server" type="text" class="form-control" id="inputHomePhone" placeholder="Teléfono" />
                        </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                        <div class="input-group">
                           <span class="input-group-addon">Dirección : </span>
                          <input disabled runat="server" type="text" class="form-control" id="inputAdress" placeholder="Dirección" />
                        </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                        <div class="input-group">
                          <span class="input-group-addon">Ciudad : </span>
                          <input disabled runat="server" type="text" class="form-control" id="inputCity" placeholder="Ciudad" />
                        </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                        <div class="input-group">
                          <span class="input-group-addon">Región : </span>
                          <input disabled runat="server" type="text" class="form-control" id="inputRegión" placeholder="Región" />
                        </div>
                        </div>
                      </div>

                      <asp:UpdatePanel ID="UPFechaContratacion" runat="server">
                        <ContentTemplate>

                          <div class="form-group">
                            <div class="col-lg-11">

                              <div class="input-group">
                                <span class="input-group-addon excepto">Fecha Contratación :</span>
                                <div class="row">
                                  <div class="col-lg-3">
                                    <asp:DropDownList runat="server" AutoPostBack="true" ID="selectDias" disabled class="form-control" OnSelectedIndexChanged="combos_SelectedIndexChanged">
                                    </asp:DropDownList>
                                  </div>
                                  <div class="col-lg-3">
                                    <asp:DropDownList ID="selectMeses" AutoPostBack="true" runat="server" disabled class="form-control" OnSelectedIndexChanged="combos_SelectedIndexChanged">
                                    </asp:DropDownList>
                                  </div>
                                  <div class="col-lg-4">
                                    <asp:DropDownList runat="server" AutoPostBack="true" ID="selectAnios" disabled class="form-control" OnSelectedIndexChanged="combos_SelectedIndexChanged">
                                    </asp:DropDownList>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>

                        </ContentTemplate>
                      </asp:UpdatePanel>

                    </div>
                    <!--Fin de la Primera Columna-->

                    <div class="col-md-6">
                      
                      <div class="form-group">
                        <div class="col-lg-11">
                        <div class="input-group">
                        <span class="input-group-addon">C. Postal : </span>
                        <input disabled runat="server" type="text" class="form-control" id="inputPostalCode" placeholder="Codigo Postal" />
                        </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                        <div class="input-group">
                        <span class="input-group-addon">Extensión : </span>
                          <input disabled runat="server" type="text" class="form-control" id="inputExtension" placeholder="Extensión" />
                        </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                        <div class="input-group foto">
                          <span class="input-group-addon" style="width: 37%;">Foto : </span>
                          <asp:FileUpload Width="97%" disabled runat="server" class="form-control" ID="inputFileImagen" /><img alt="" src="" ID="Imagen" runat="server" style="display: none;" />
                        </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                        <div class="input-group">
                          <span class="input-group-addon">Notas : </span>
                          <textarea disabled runat="server" ID="inputNotes" style="height: 100px;" class="form-control"></textarea>
                        </div>
                        </div>
                      </div>
                      
                      <asp:UpdatePanel runat="server" ID="UPFechaNacimiento">
                        <ContentTemplate>

                          <div class="form-group">
                            <div class="col-lg-11">

                              <div class="input-group">
                                <span class="input-group-addon excepto">Fecha de Nacimento :</span>
                                <div class="row">
                                  <div class="col-lg-3">
                                    <asp:DropDownList runat="server" AutoPostBack="true" ID="selectDias2" disabled class="form-control" OnSelectedIndexChanged="combos_SelectedIndexChanged">
                                    </asp:DropDownList>
                                  </div>
                                  <div class="col-lg-3">
                                    <asp:DropDownList ID="selectMeses2" AutoPostBack="true" runat="server" disabled class="form-control" OnSelectedIndexChanged="combos_SelectedIndexChanged">
                                    </asp:DropDownList>
                                  </div>
                                  <div class="col-lg-4">
                                    <asp:DropDownList runat="server" AutoPostBack="true" ID="selectAnios2" disabled class="form-control" OnSelectedIndexChanged="combos_SelectedIndexChanged">
                                    </asp:DropDownList>
                                  </div>
                                </div>
                              </div>

                            </div>
                          </div>

                        </ContentTemplate> 
                      </asp:UpdatePanel>

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

            <asp:PlaceHolder runat="server" ID="phMensajeErrorEditar" />
            <!--Modal Mensajes -->
            <%@ Register Src="~/UsersControls/AvisoModalsControl.ascx" TagPrefix="control" TagName="AvisoModalsControl" %>
            <control:AvisoModalsControl runat="server" ID="AvisoModalsControl" />

          </form>
      </div>
    </div>
  </div>

  <script src="../Scripts/jquery-2.1.0.min.js"></script>
  <script src="../Scripts/Bootstrap/bootstrap.min.js"></script>
  <script src="../Scripts/Plugins/jquery.validate.js"></script>
  <script src="../Scripts/Plugins/toastr.js"></script>
  <script src="../Scripts/Plugins/additional-methods.js"></script>
  <script src="../Scripts/CustomScripts/custom.js"></script>

  <asp:Literal ID="EjecutarModel" runat="server" />
  <asp:Literal ID="toastrLiteral" runat="server" />
</asp:Content>
