<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProveedorDetalle.aspx.cs" Inherits="JugandoConNorthWind.Proveedores.ProveedorDetalle" %>

<asp:Content ID="Head" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Main" ContentPlaceHolderID="MainPlaceHolder" runat="server">
  <div class="container">
    <div class="row">
      <h2 runat="server" id="NombreProveedor"></h2>
    </div>
    <div class="row">
      <div class="col-md-8">
        <div class="well">
          <form class="form-horizontal">
            <fieldset>
              <legend>Detalle del Proveedor</legend>
              <div class="form-group">
                <label for="inputCompanyName" class="col-lg-4 control-label">Nombre del Proveedor : </label>
                <div class="col-lg-8">
                  <input disabled runat="server" type="text" class="form-control" id="inputCompanyName" placeholder="Nombre">
                </div>
              </div>
              <div class="form-group">
                <label for="inputContactName" class="col-lg-4 control-label">Nombre del Contacto: </label>
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
            </fieldset>
          </form>
        </div>
      </div>
    </div>
  </div>
</asp:Content>
