(function ($, Window, undefined) {
    $contenedorBotonDesFormulario = $("#btnDesplegarFormAgregarProveedor").parents(".row");
    $botonDesplegarFormulario = $("#btnDesplegarFormAgregarProveedor");
    $ContFormAgregarProveedor = $("#formularioAgregarProveedor").parents(".row");
    $btnCancelar = $("#btnCancelar");

    $("#Guardar-Cancelar").css("display", "inline-block");
    $ContFormAgregarProveedor.find("input").attr("disabled", false);

    $botonDesplegarFormulario.on("click", function (e) {
        $ContFormAgregarProveedor.slideToggle();
        var valorBoton = '<span class="glyphicon glyphicon-plus-sign pull-left"></span> Agregar Proveedor';
        var valorBoton2 = '<span class="glyphicon glyphicon-minus-sign pull-left"></span> Ocultar Formulario'
        $(this).html($(this).html() == valorBoton ? valorBoton2 : valorBoton);
    });

    $btnCancelar.on("click", function (e) { e.preventDefault(); $botonDesplegarFormulario.trigger("click"); });
    console.log("contenedor : " , $contenedorBotonDesFormulario);
    console.log("boton : " , $btnCancelar);

})(jQuery, Window, undefined);