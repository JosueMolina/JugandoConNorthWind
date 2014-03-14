<%@ Page MaintainScrollPositionOnPostback="true" Title="Empleados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="JugandoConNorthWind.Empleados.Empleados" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="MainPlaceHolder" ContentPlaceHolderID="MainPlaceHolder" runat="server">
  <form runat="server" id="formulario">
    <asp:ScriptManager runat="server" ID="sm" />
    <div class="container">

      <!--Agregar Nuevo Empleado-->
      <div class="row">
        <div class="col-md-12">
          <div class="well">
            <form class="form-horizontal">
              <fieldset>
                <div class="form-group">
                  <div class="col-md-12">
                    <a id="btnDesplegarFormAgregarEmpleado" class="col-md-12 btn btn-primary btn-info btn-lg"><span class="glyphicon glyphicon-plus-sign pull-left"></span>Agregar Empleado</a>
                  </div>
                </div>
              </fieldset>
            </form>
          </div>
          <hr />
        </div>
      </div>

      <div class="row" style="display: none;">
        <div id="formularioAgregarEmpleado" class="form-horizontal">
          <div class="well">
            <div class="row">
            <div class="col-md-12">
              <!--Enabezado y Botones-->

                <div class="col-lg-6">
                  <h1 style="display: inline;">Nuevo Empleado</h1>
                </div>

                <div class="col-lg-6">
                  <div class="col-md-6 pull-right" id="Guardar-Cancelar" style="display: none;">
                    <asp:LinkButton runat="server" class="col-md-5 btn btn-default btn-primary btn-info" ID="btnGuardar" OnClick="btnGuardar_Click">Guardar</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="btnCancelar" class="btn btn-primary col-md-5 col-md-offset-1">Cancelar</asp:LinkButton>
                    <button style="display: none;" type="submit" id="btnSubmit">Submit</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
            <!--Fin de Encabezado y Botones-->

          <fieldset>
            <legend></legend>
            <div class="row panel-body">
              <div class="col-md-12">
                <div class="row">
                  <div id="col-md-12">

                    <div class="col-md-6">

                      <div class="form-group">
                        <div class="col-lg-11">
                          <div class="input-group">
                            <span class="input-group-addon">Nombre : </span>
                            <input runat="server" type="text" class="form-control" id="inputFirstName" placeholder="Escriba su Nombre" required />
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                          <div class="input-group">
                            <span class="input-group-addon">Apellido : </span>
                            <input runat="server" type="text" class="form-control" id="inputLastName" placeholder="Apellido" required />
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
                            <input runat="server" type="text" class="form-control" id="inputTitle" placeholder="Cargo del Empleado" />
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                          <div class="input-group">
                            <span class="input-group-addon">País : </span>
                            <input runat="server" type="text" class="form-control" id="inputCountry" placeholder="País" />
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
                            <input runat="server" type="text" class="form-control" id="inputTitleOfCourtesy" placeholder="Mtrs/Dr" />
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                          <div class="input-group">
                            <span class="input-group-addon">Tel. Casa : </span>
                            <input runat="server" type="text" class="form-control" id="inputHomePhone" placeholder="Teléfono" />
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                          <div class="input-group">
                            <span class="input-group-addon">Dirección : </span>
                            <input runat="server" type="text" class="form-control" id="inputAdress" placeholder="Dirección" />
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                          <div class="input-group">
                            <span class="input-group-addon">Ciudad : </span>
                            <input runat="server" type="text" class="form-control" id="inputCity" placeholder="Ciudad" />
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                          <div class="input-group">
                            <span class="input-group-addon">Región : </span>
                            <input runat="server" type="text" class="form-control" id="inputRegión" placeholder="Región" />
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
                                    <asp:DropDownList runat="server" AutoPostBack="true" ID="selectDias" class="form-control" OnSelectedIndexChanged="combos_SelectedIndexChanged">
                                    </asp:DropDownList>
                                  </div>
                                  <div class="col-lg-3">
                                    <asp:DropDownList ID="selectMeses" AutoPostBack="true" runat="server" class="form-control" OnSelectedIndexChanged="combos_SelectedIndexChanged">
                                    </asp:DropDownList>
                                  </div>
                                  <div class="col-lg-4">
                                    <asp:DropDownList runat="server" AutoPostBack="true" ID="selectAnios" class="form-control" OnSelectedIndexChanged="combos_SelectedIndexChanged">
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
                            <input runat="server" type="text" class="form-control" id="inputPostalCode" placeholder="Codigo Postal" />
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                          <div class="input-group">
                            <span class="input-group-addon">Extensión : </span>
                            <input runat="server" type="text" class="form-control" id="inputExtension" placeholder="Extensión" />
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                          <div class="input-group foto">
                            <span class="input-group-addon" style="width: 37%;">Foto : </span>
                            <asp:FileUpload Width="97%" runat="server" class="form-control" ID="inputFileImagen" /><img alt="" src="" id="Imagen" runat="server" style="display: none;" />
                          </div>
                        </div>
                      </div>

                      <div class="form-group">
                        <div class="col-lg-11">
                          <div class="input-group">
                            <span class="input-group-addon">Notas : </span>
                            <textarea runat="server" id="inputNotes" style="height: 100px;" class="form-control"></textarea>
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
                                    <asp:DropDownList runat="server" AutoPostBack="true" ID="selectDias2" class="form-control" OnSelectedIndexChanged="combos_SelectedIndexChanged">
                                    </asp:DropDownList>
                                  </div>
                                  <div class="col-lg-3">
                                    <asp:DropDownList ID="selectMeses2" AutoPostBack="true" runat="server" class="form-control" OnSelectedIndexChanged="combos_SelectedIndexChanged">
                                    </asp:DropDownList>
                                  </div>
                                  <div class="col-lg-4">
                                    <asp:DropDownList runat="server" AutoPostBack="true" ID="selectAnios2" class="form-control" OnSelectedIndexChanged="combos_SelectedIndexChanged">
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

        </div>
      </div>

    <!--Buscar Empleado-->
    <div class="row">
      <div class="col-md-12 pull-right">
        <div class="formBuscarEmpleado">
          <div class="bs-example form-horizontal">
            <fieldset>
              <div class="form-group">
                <div class="col-lg-12">
                  <div class="col-lg-3">
                    <asp:LinkButton runat="server" ID="btnListarTodos" CssClass="btn btnListarTodos" Width="100%" OnClick="btnListarTodos_Click"><span class="glyphicon glyphicon-list pull-left"></span> Listar Todos</asp:LinkButton>
                  </div>
                  <div class="col-md-1 pull-right">
                    <a id="A1" href="" onserverclick="BuscarEmpleadoInput_TextChanged" runat="server" class="btn btn-info" style="vertical-align: middle; border: none;"><span class="glyphicon glyphicon-search"></span></a>
                  </div>
                  <div class="col-md-3 pull-right">
                    <asp:TextBox Style="vertical-align: middle" class="form-control customInput" runat="server" ID="BuscarEmpleadoInput" placeholder="Buscar Empleado" OnTextChanged="BuscarEmpleadoInput_TextChanged" />
                  </div>
                </div>
              </div>
            </fieldset>
          </div>
        </div>
      </div>
    </div>

    <%@ Register Src="~/UsersControls/AvisoModalsControl.ascx" TagPrefix="control" TagName="AvisoModalsControl" %>
    <control:AvisoModalsControl runat="server" ID="AvisoModalsControl" />

      <!--Lista Empleados-->

          <asp:GridView ID="GridListaEmpleados" runat="server"
            DataKeyNames="EmployeeID"
            AlternatingRowStyle-BackColor="#25292d"
            AutoGenerateColumns="false"
            CssClass="col-sm-12 gridListaEmpleados"
            HeaderStyle-BackColor="#27c2ef"
            HeaderStyle-ForeColor="#ffffff"
            HeaderStyle-Height="4em"
            HeaderStyle-CssClass="headerGridStyle"
            AllowPaging="true"
            PagerStyle-HorizontalAlign="Center" PagerStyle-CssClass="paginator"
            OnPageIndexChanging="GridListaEmpleados_PageIndexChanging"
            OnSelectedIndexChanged="GridListaEmpleados_SelectedIndexChanged"
            OnRowCommand="GridListaEmpleados_RowCommand">
            <Columns>
              <asp:TemplateField HeaderStyle-CssClass="paddingLeft1em" ItemStyle-CssClass="paddingLeft1em" ItemStyle-BorderWidth="0px"
                HeaderStyle-BorderWidth="0px" HeaderText="ID">
                <ItemTemplate>
                  <asp:LinkButton ID="LinkButton1" OnCommand="cellClick" CommandArgument='<%# Eval("EmployeeID").ToString() %>' runat="server"> <%# Eval("EmployeeID") %> </asp:LinkButton>
                </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderStyle-CssClass="paddingLeft1em" ItemStyle-CssClass="paddingLeft1em" ItemStyle-BorderWidth="0px"
                HeaderStyle-BorderWidth="0px" HeaderText="First Name" ItemStyle-Height="3em">
                <ItemTemplate>
                  <asp:LinkButton ID="LinkButton2" OnCommand="cellClick" CommandArgument='<%# Eval("EmployeeID").ToString() %>' runat="server"> <%# Eval("FirstName") %></asp:LinkButton>
                </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderStyle-CssClass="paddingLeft1em" ItemStyle-CssClass="paddingLeft1em" ItemStyle-BorderWidth="0px"
                HeaderStyle-BorderWidth="0px" HeaderText="Last Name">
                <ItemTemplate>
                  <asp:LinkButton ID="LinkButton3" OnCommand="cellClick" CommandArgument='<%# Eval("EmployeeID").ToString() %>' runat="server"> <%# Eval("LastName") %></asp:LinkButton>
                </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderStyle-CssClass="paddingLeft1em" ItemStyle-CssClass="paddingLeft1em" ItemStyle-BorderWidth="0px"
                HeaderStyle-BorderWidth="0px" HeaderText="Country">
                <ItemTemplate>
                  <asp:LinkButton ID="LinkButton4" OnCommand="cellClick" CommandArgument='<%# Eval("EmployeeID").ToString() %>' runat="server"> <%# Eval("Country") %></asp:LinkButton>
                </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderStyle-CssClass="paddingLeft1em" ItemStyle-CssClass="paddingLeft1em" ItemStyle-BorderWidth="0px"
                HeaderStyle-BorderWidth="0px" HeaderText="City">
                <ItemTemplate>
                  <asp:LinkButton ID="LinkButton5" OnCommand="cellClick" CommandArgument='<%# Eval("EmployeeID").ToString() %>' runat="server"> <%# Eval("City") %></asp:LinkButton>
                </ItemTemplate>
              </asp:TemplateField>
              <asp:TemplateField HeaderStyle-CssClass="paddingLeft1em" ItemStyle-CssClass="paddingLeft1em" ItemStyle-BorderWidth="0px"
                HeaderStyle-BorderWidth="0px">
                <ItemTemplate>
                  <asp:LinkButton ID="BotonEditar" runat="server" CommandName="EditandoEmpleado" CommandArgument='
                 <%# Eval("employeeID").ToString() + ";" + Eval("FirstName").ToString() + 
                ";" + Eval("LastName").ToString() %>'
                    class="glyphicon glyphicon-pencil pull-left">
                  </asp:LinkButton>
                </ItemTemplate>
              </asp:TemplateField>

              <asp:TemplateField HeaderStyle-CssClass="paddingLeft1em" ItemStyle-CssClass="paddingLeft1em" ItemStyle-BorderWidth="0px"
                HeaderStyle-BorderWidth="0px">
                <ItemTemplate>
                  <asp:LinkButton ID="BotonEliminar" runat="server" CommandName="EliminandoEmpleado" CommandArgument='
                <%# Eval("employeeID").ToString()%>'
                    class="glyphicon glyphicon-remove pull-left"></asp:LinkButton>
                </ItemTemplate>
              </asp:TemplateField>

            </Columns>
          </asp:GridView>

          <%-- Datos del Usuario--%>
          <!--Modal Aviso-->
          <div class="modal fade  bs-example-modal-lg" id="modalDetalleEmpleado" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
              <div class="modal-content">
                <div class="modal-header">
                  <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                  <h4 class="modal-title" id="myModalLabel"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;&nbsp;Detalle de Empleado</h4>
                </div>
                <div class="modal-body">
                  <!--Contenido del Modal-->
                  <div class="container perfilUsuario">
                    <div class="row">
                      <div class="col-sm-9">
                        <div id="ImagenEmpleado" class="col-sm-2" style="margin-right: 0; background: #2e3338; text-align: center;">
                          <img style="vertical-align: middle;" src="http://lorempixel.com/300/300" alt="Imagen Muestra" class="img-rounded">
                        </div>
                        <div id="InfoEmpleado" class="col-sm-10">
                          <div id="NombreEmpleado" class="col-sm-12">
                            <div id="Nombres">
                              <h1 style="line-height: 0.5em;"><%= empleado.FirstName %>  <%=empleado.LastName %></h1>
                              <h3 style="line-height: 0.5em;"><i><%= empleado.Title %></i></h3>
                            </div>
                            <div class="DatosEmpleado" id="telefonos">
                              Teléfono : <i><%= empleado.HomePhone %>  &nbsp;&nbsp;</i>
                              Extensión : <i><%= empleado.Extension %> &nbsp;&nbsp;</i>
                              Código Postal : <i><%= empleado.PostalCode %></i><br />
                              Pais : <i><%= empleado.Country %></i>
                              Region : <i><%= empleado.Region %></i>
                              Ciudad : <i><%= empleado.City %></i><br />
                              Dirección : <i><%= empleado.Address %></i>
                              Contratación : <i><%= Convert.ToDateTime(empleado.HireDate).ToShortDateString()%></i>
                              Nacimiento : <i><%= Convert.ToDateTime(empleado.BirthDate).ToShortDateString() %></i>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-sm-9">
                        <div id="Notas">
                          <h2>Notas</h2>
                          <p>
                            <%= empleado.Notes%>
                          </p>
                        </div>
                      </div>

                    </div>
                  </div>

                </div>
                <div class="modal-footer">
                  <asp:LinkButton ID="LinkButton6" runat="server" CssClass="btn btn-info"> <span class="glyphicon glyphicon-shopping-cart "></span> Ver Ventas</asp:LinkButton>
                  <a href="#"></a>
                </div>
              </div>
            </div>
          </div>
          <!--Fin del Modal-->
          <%--Fin de los Datos del Usuario--%>


      <br />

    <%--<asp:ListView ID="LVEmpleados" runat="server" GroupItemCount="3">
      <ItemTemplate>
        <div class="col-md-4">
          <h2 style="margin-right: 1em;"><span class="glyphicon glyphicon-user pull-left" style="margin-right: .5em;"></span> <%#: Eval("FirstName")%><small> - <%#: Eval("City")%></small></h2>
          <h3><%#: Eval("LastName") %></h3>
          <p><%#: Eval("Title") %></p>
          <p><a href="/Empleados/EmpleadoDetalle.aspx?id=<%#:Eval("EmployeeID")%>&Empleado=<%#: Eval("FirstName") +  " " +Eval("LastName").ToString() %>" class="btn btn-default">Ver Detalle »</a></p>
        </div>
       </ItemTemplate>
      <GroupTemplate>
        <div class="row">
          <div id="ItemPlaceHolder" runat="server">
          </div>
          </div>
        <hr />
      </GroupTemplate>
    </asp:ListView>--%>
          </div>

    <%--<asp:ObjectDataSource ID="ObjListaEmpleados" runat="server" SelectMethod="ListaEmpleados" TypeName="JugandoConNorthWind.Empleados.Empleados"></asp:ObjectDataSource>--%>
  </div>
    <%---Fin del Container--%>
    <br />



    <script src="../Scripts/jquery-2.1.0.min.js"></script>
    <script src="../Scripts/Bootstrap/bootstrap.min.js"></script>
    <script src="../Scripts/Plugins/jquery.validate.js"></script>
    <script src="../Scripts/Plugins/additional-methods.js"></script>
    <script src="../Scripts/Plugins/toastr.js"></script>
    <script src="../Scripts/CustomScripts/custom.js"></script>
    <script src="../Scripts/CustomScripts/Empleados.js"></script>
    <%--Uso de Toastr--%>
    <asp:Literal runat="server" ID="ToastrLiteral"></asp:Literal>
    <asp:Literal ID="EjecutarModel" runat="server" />
    <asp:Literal ID="EjecutarModelDetalle" runat="server" />
  </form>
</asp:Content>
