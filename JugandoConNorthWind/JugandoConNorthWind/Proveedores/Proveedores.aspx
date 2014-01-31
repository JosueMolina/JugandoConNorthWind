<%@ Page Title="Proveedores" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Proveedores.aspx.cs" Inherits="JugandoConNorthWind.Proveedores.Proveedores" %>

<asp:Content ID="Main" ContentPlaceHolderID="MainPlaceHolder" runat="server">
  <form id="form1" runat="server">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="well">
          <form class="bs-example form-horizontal">
            <fieldset>
              <div class="form-group">
                <div class="col-lg-12">
                  <div class="col-md-10">
                  <asp:TextBox style="vertical-align: middle" class="form-control input-lg" runat="server" ID="BuscarProveedorInput"  placeholder="Buscar Proveedor" OnTextChanged="BuscarProveedorInput_TextChanged"/>
                  </div>
                  <div class="col-md-2">
                    <button type="submit" class="btn btn-primary btn-lg" style="vertical-align: middle;">Buscar</button>
                  </div>
                </div>
              </div>
            </fieldset>
          </form>
        </div>
      <hr />
      </div>
    </div>
    <asp:ListView ID="LVProveedores" runat="server" GroupItemCount="3">
      <ItemTemplate>
        <div class="col-md-4">
          <h2><%#: Eval("CompanyName")%><small> - <%#: Eval("Country")%></small></h2>
          <h3><%#: Eval("ContactName") %></h3>
          <p><%#: Eval("ContactTitle") %></p>
          <p><a href="/Proveedores/ProveedorDetalle.aspx?id=<%#:Eval("SupplierID")%>&proveedor=<%#: Eval("CompanyName") %>" class="btn btn-default">Ver Detalle »</a></p>
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
    <%--<asp:ObjectDataSource ID="ObjListaProveedores" runat="server" SelectMethod="ListaProveedores" TypeName="JugandoConNorthWind.Proveedores.Proveedores"></asp:ObjectDataSource>--%>
  </div>  
  </form>
</asp:Content>
