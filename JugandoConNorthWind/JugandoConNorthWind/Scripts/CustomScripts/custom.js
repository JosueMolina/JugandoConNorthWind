(function ($, Window, undefined) {

    var $botonEditar = $("#MainPlaceHolder_btnEditar"),
        $botonEliminar = $("#MainPlaceHolder_btnEliminar"),
        $botonGuardar = $("#MainPlaceHolder_btnGuardar"),
        $botonCancelar = $("#MainPlaceHolder_btnCancelar"),
        $botonesEditando = $("#Guardar-Cancelar").css("display", "none"),
        $botonesOpciones = $("#Editar-Eliminar");

    $botonEditar.on("click", function (e) {
        e.preventDefault();
        $("input").attr("disabled", false);
        $botonesOpciones.fadeOut(200, function () {
            $botonesEditando.fadeIn(200);
        });
    });

    $botonGuardar.on("click", function (e) {
        $("#btnSubmit").trigger("click");
        var form = $("#formulario");
        form.validate();
        console.log(form.valid());
        if (!form.valid())
        {
            e.preventDefault();
        }
        
    });

    $botonCancelar.on("click", function (e) {
        e.preventDefault();

        $("input").attr("disabled", true);
        $botonesEditando.fadeOut(200, function () {
            $botonesOpciones.fadeIn(200);
        });
    });
})(jQuery, Window, undefined);