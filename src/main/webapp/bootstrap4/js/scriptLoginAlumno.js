function validateDNI() {
  var dni = document.getElementById('dni').value;

  // Verificar si el DNI tiene exactamente 8 dígitos
  if (dni.length === 8 && !isNaN(dni)) {
    // Mostrar mensaje de verificación exitosa
    alert("DNI " + dni + " verificado con éxito. Serás dirigido a los cursos.");
    
    // Redirigir a cursos.jsp después de un breve retraso para que el usuario vea el mensaje
    setTimeout(function() {
      window.location.href = "Cursos.jsp";
    }, 2000); // Retraso de 2 segundos
  } else {
    // Mensaje de error si el DNI no es válido
    alert("Por favor, ingresa un DNI válido de 8 dígitos.");
  }
  
  return false; // Evita que el formulario se envíe de forma normal
}
