$(function() {

    // Initialize form validation on the registration form.
  
    // It has the name attribute "registration"
  
    $("form[name='registro']").validate({
  
      // Specify validation rules
  
      rules: {
  
        // The key name on the left side is the name attribute
  
        // of an input field. Validation rules are defined
  
        // on the right side
  
        id_prod: "required",
        nom_prod: "required",
  
        id_prod: {
  
          required: true,
  
          // Specify that email should be validated
  
          // by the built-in "email" rule
  
          maxlength: 10
  
        },
  
        precio: {
  
          required: true,

          maxlength: 8
        },

        categoria_id_cate: "required",
        tipo_producto_id_tipo: "required",
  
      },
  
      // Specify validation error messages
  
      messages: {
  
        id_prod: {
  
          required: "Por favor introduzca el código del producto",
  
          minlength: "El código debe tener menos de 10 caracteres."
  
        },

        nom_prod: "Por favor, introduzca el nombre del producto",

        precio: {
  
            required: "Por favor introduzca el precio del producto",
    
            minlength: "El precio debe tener menos de 8 caracteres."
    
        },

        categoria_id_cate: "Por favor, introduzca la categoria",
  
        tipo_producto_id_tipo: "Por favor, introduce un tipo de producto",
  
      },
  
      submitHandler: function(form) {
  
        form.submit();
  
      }
  
    });
  
  });