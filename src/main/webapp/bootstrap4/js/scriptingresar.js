document.getElementById('ingresar').addEventListener('click', function() {
    const alumnoOption = document.getElementById('alumno');
    const profesorOption = document.getElementById('profesor');

    if (alumnoOption.classList.contains('selected')) {
        window.location.href = 'LoginAlumno.jsp'; // Reemplaza con la URL de la página de alumnos
    } else if (profesorOption.classList.contains('selected')) {
        window.location.href = 'index.jsp'; // Reemplaza con la URL de la página de profesores
    } else {
        alert('Por favor selecciona una opción antes de ingresar.');
    }
});

// Agrega o quita la clase 'selected' al hacer clic en las opciones
document.querySelectorAll('.option').forEach(option => {
    option.addEventListener('click', function() {
        document.querySelectorAll('.option').forEach(opt => opt.classList.remove('selected'));
        this.classList.add('selected');
    });
});
