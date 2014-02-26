<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CombosFechaControl.ascx.cs" Inherits="JugandoConNorthWind.UsersControls.CombosFechaControl" %>
<asp:UpdatePanel ID="upFechaContratacion" runat="server">
<ContentTemplate>
<div class="col-lg-3">
  <asp:DropDownList runat="server" ID="selectDias" disabled class="form-control">
  </asp:DropDownList>
</div>
<div class="col-lg-3">
  <asp:DropDownList ID="selectMeses" runat="server" disabled class="form-control">
  </asp:DropDownList>
</div>
<div class="col-lg-4">
  <asp:DropDownList runat="server" ID="selectAnios" disabled class="form-control">
  </asp:DropDownList>
</div>
 </ContentTemplate>
  </asp:UpdatePanel>
