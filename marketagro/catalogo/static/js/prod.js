function validarFormProducto() {
    id_prod = $('#id_prod').val()
    nom_prod =  $('#nom_prod').val()
    precio =  $('#precio').val()
    categoria =  $('#categoria_id_cate').val()
    tipo =  $('#tipo_producto_id_producto').val()
    proveedor =  $('#proveedor_rut').val()
    imagen =  $('#imagen').val()
  
  if (id_prod == "")
  {
    $('#id_prod').focus()
    toastr.error("Debe ingresar el código del producto","ERROR",{
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-bottom-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    });
    return false;
  }
  
  if (nom_prod == "")
  {
    $('#nom_prod').focus()
    toastr.error("Debe ingresar el nombre del producto","ERROR",{
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-bottom-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    });
    return false;
  } 
  
  if (precio == "")
  {
    $('#precio').focus()
    toastr.error("Debe ingresar el precio del producto","ERROR",{
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-bottom-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    });
    return false;
  } 
  
  if (categoria == "")
  {
    $('#categoria_id_cate').focus()
    toastr.error("Debe ingresar la categoria del producto","ERROR",{
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-bottom-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    });
    return false;
  } 
  
  if (tipo == "")
  {
    $('#tipo_producto_id_producto').focus()
    toastr.error("Debe ingresar el tipo de producto","ERROR",{
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-bottom-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    });
    return false;
  } 
  
  if (proveedor == "")
  {
    $('#proveedor_rut').focus()
    toastr.error("Debe ingresar el proveedor del producto","ERROR",{
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-bottom-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    });
    return false;
  } 
  
  if (imagen == "")
  {
    $('#imagen').focus()
    toastr.error("Debe adjuntar la imagen del producto","ERROR",{
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": true,
        "positionClass": "toast-bottom-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    });
    return false;
  } 
  
  }