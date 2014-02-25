(function ($, Window, undefined) {
    $contenedorBotonDesFormulario = $("#btnDesplegarFormAgregarProveedor").parents(".row");
    $botonDesplegarFormulario = $("#btnDesplegarFormAgregarProveedor");
    $ContFormAgregarProveedor = $("#formularioAgregarProveedor").parents(".row");
    $btnGuardar = $("#MainPlaceHolder_btnGuardar");
    $btnCancelar = $("#btnCancelar");

    $("#Guardar-Cancelar").css("display", "inline-block");

    $botonDesplegarFormulario.on("click", function (e) {
        $ContFormAgregarProveedor.slideToggle();
        var valorBoton = '<span class="glyphicon glyphicon-plus-sign pull-left"></span> Agregar Proveedor';
        var valorBoton2 = '<span class="glyphicon glyphicon-minus-sign pull-left"></span> Ocultar Formulario';
        $(this).html($(this).html() == valorBoton ? valorBoton2 : valorBoton);
    });

    $btnCancelar.on("click", function (e) { e.preventDefault(); $botonDesplegarFormulario.trigger("click"); });

    $btnGuardar.on("click", function (e) {
        $("#btnSubmit").trigger("click");
        var form = $("#formPrincipal");
        form.validate();
        console.log(form.valid());
        if (!form.valid()) {
            e.preventDefault();
        }
    });

})(jQuery, Window, undefined);