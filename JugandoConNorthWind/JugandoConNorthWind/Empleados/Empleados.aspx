<%@ Page Title="Empleados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Empleados.aspx.cs" Inherits="JugandoConNorthWind.Empleados.Empleados" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="MainPlaceHolder" ContentPlaceHolderID="MainPlaceHolder" runat="server">
  <form  runat="server" id="formPrincipal">
  <div class="container">
    <!--Buscar Empleado-->
    <div class="row">
      <div class="col-md-12">
        <div class="well">
          <div class="bs-example form-horizontal">
            <fieldset>
              <div class="form-group">
                <div class="col-lg-12">
                  <div class="col-md-10">
                  <asp:TextBox style="vertical-align: middle" class="form-control input-lg" runat="server" ID="BuscarEmpleadoInput"  placeholder="Buscar Empleado"/>
                  </div>
                  <div class="col-md-2">
                    <a id="A1" href="" runat="server" class="btn btn-primary btn-lg" style="vertical-align: middle;">Buscar</a>
                  </div>
                </div>
              </div>
            </fieldset>
          </div>
        </div>
      <hr />
      </div>
    </div>
    <!--Agregar Nuevo Empleado-->
    <div class="row">
      <div class="col-md-12">
        <div class="well">
          <form class="bs-example form-horizontal">
            <fieldset>
              <div class="form-group">
                <div class="col-md-12">
                  <a id="btnDesplegarFormAgregarEmpleado" class="col-md-12 btn btn-primary btn-info btn-lg"><span class="glyphicon glyphicon-plus-sign pull-left"></span> Agregar Empleado</a>
                </div>
              </div>
            </fieldset>
          </form>
        </div>
        <hr />
      </div>
    </div>

    <div class="row" style="display: none;">
      <div class="col-md-12">
        <div class="well">
          <div id="formularioAgregarEmpleado" class="form-horizontal">
            <fieldset>
              <legend>Agregar Empleado</legend>
              <div class="row">
                <div class="col-md-12">
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="inputCompanyName" class="col-lg-4 control-label">Nombre del Empleado : </label>
                      <div class="col-lg-7">
                        <input runat="server" type="text" class="form-control" id="inputCompanyName" placeholder="Nombre" required />
                      </div>
                        <span class="elemento-requerido col-lg-1">*</span>
                    </div>
                    <div class="form-group">
                      <label for="inputContactName" class="col-lg-4 control-label">Nombre del Contacto : </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputContactName" placeholder="Contacto">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputContactTitle" class="col-lg-4 control-label">Cargo del Contacto: </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputContactTitle" placeholder="Cargo del Contacto">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputAdress" class="col-lg-4 control-label">Dirección : </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputAdress" placeholder="Dirección">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputCity" class="col-lg-4 control-label">Ciudad : </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputCity" placeholder="Ciudad">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputRegion" class="col-lg-4 control-label">Región : </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputRegion" placeholder="Region">
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6">
                    <div class="form-group">
                      <label for="inputPostalCode" class="col-lg-4 control-label">Código Postal : </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputPostalCode" placeholder="Código Postal">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputCountry" class="col-lg-4 control-label">País : </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputCountry" placeholder="País">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputPhone" class="col-lg-4 control-label">Teléfono : </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputPhone" placeholder="Teléfono">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputFax" class="col-lg-4 control-label">Fax : </label>
                      <div class="col-lg-7">
                        <input  runat="server" type="text" class="form-control" id="inputFax" placeholder="Fax">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputHomePage" class="col-lg-4 control-label">Web Site : </label>
                      <div class="col-lg-7">
                        <input enableviewstate="true" runat="server" type="text" title="Proporciona una URL" pattern="(http|https)//:.+" class="form-control" id="inputHomePage" placeholder="Web Site">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12">
                  <div id="Guardar-Cancelar" class="pull-right" style="padding-right: 4em;">
                    <asp:LinkButton runat="server" class="btn btn-default btn-primary btn-info" ID="btnGuardar">Guardar</asp:LinkButton>
                    <a href="" style="margin-left: 0.5em;" class="btn btn-primary" id="btnCancelar">Cancelar</a>
                    <button style="display: none;" type="submit" id="btnSubmit">Submit</button>
                  </div>
                </div>
              </div>
            </fieldset>
            <asp:PlaceHolder runat="server" ID="phMensajeErrorEditar" /> 
            <!--Modal Aviso Eliminar-->
           <%-- <%@ Register Src="~/UsersControls/AvisoEliminarRegistroControl.ascx" TagPrefix="Control" TagName="AvisoEliminarRegistroControl" %>
            <Control:AvisoEliminarRegistroControl runat="server" id="AvisoEliminarRegistroControl" />--%>

          </div>
        </div>
      </div>
    </div>

    <!--Lista Empleados-->
    <asp:ListView ID="LVEmpleados" runat="server" GroupItemCount="3">
      <ItemTemplate>
        <div class="col-md-4">
          <h2 style="margin-right: 1em;"><span class="glyphicon glyphicon-user pull-left" style="margin-right: .5em;"></span> <%#: Eval("FirstName")%><small> - <%#: Eval("City")%></small></h2>
          <h3><%#: Eval("LastName") %></h3>
          <p><%#: Eval("Title") %></p>
          <%-- %><p><a href="/Empleados/EmpleadoDetalle.aspx?id=<%#:Eval("SupplierID")%>&Empleado=<%#: Eval("CompanyName") %>" class="btn btn-default">Ver Detalle »</a></p>--%>
        </div>
       </ItemTemplate>
      <GroupTemplate>
        <div class="row">
          <div id="ItemPlaceHolder" runat="server">
          </div>
          </div>
        <hr />
      </GroupTemplate>
    </asp:ListView>
    <%--<asp:ObjectDataSource ID="ObjListaEmpleados" runat="server" SelectMethod="ListaEmpleados" TypeName="JugandoConNorthWind.Empleados.Empleados"></asp:ObjectDataSource>--%>
  </div>
    
    <%--Uso de Toastr--%>

    <script src="../Scripts/jquery-1.8.2.min.js"></script>
    <script src="../Scripts/Bootstrap/bootstrap.min.js"></script>
    <script src="../Scripts/Plugins/jquery.validate.js"></script>
    <script src="../Scripts/Plugins/additional-methods.js"></script>
    <script src="../Scripts/Plugins/toastr.js"></script>
    <script src="../Scripts/CustomScripts/Empleados.js"></script>
    <asp:Literal runat="server" ID="ToastrLiteral"></asp:Literal>
    </form>
</asp:Content>
