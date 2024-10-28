function ingresar() {
    document.getElementById("modal").style.display = "block";
}

function mostrarMensaje() {
    const mensaje = "Se le va a enviar un link para que pueda ingresar al portafolio virtual del colegio Daniel Alomia Robles mediante su correo electrónico.";
    alert(mensaje);
    // Redirige a index.html
    window.location.href = "Inicio.jsp";
}

function continuar() {
    alert("Usted será dirigido al portafolio virtual del colegio Daniel Alomia Robles.");
    window.location.href = "Ingresar.jsp";
}

function cerrarModal() {
    document.getElementById("modal").style.display = "none";
}

document.getElementById('volver').addEventListener('click', function() {
    window.location.href = 'Inicio.jsp'; // Redirige a index.html
});
