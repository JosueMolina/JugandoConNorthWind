(function ($, Window, undefined) {

    var $botonEditar = $("#btnEditar"),
        $botonEliminar = $("#btnEliminar"),
        $botonGuardar = $("#btnGuardar"),
        $botonCancelar = $("#btnCancelar"),
        $botonesEditando = $("#Guardar-Cancelar").css("display", "none"),
        $botonesOpciones = $("#Editar-Eliminar");

    $botonEditar.on("click", function (e) {
        e.preventDefault();
        $("input").attr("disabled", false);
        $botonesOpciones.fadeOut(200, function () {
            $botonesEditando.fadeIn(200);
        });
    });

    $botonCancelar.on("click", function (e) {
        e.preventDefault();
        $("input").attr("disabled", true);
        $botonesEditando.fadeOut(200, function () {
            $botonesOpciones.fadeIn(200);
        });
    });

    $("#btnEliminarProveedor").on("click", function (e) {
        console.log("Hola Mundo");
        e.preventDefault();
    });


})(jQuery, Window, undefined);