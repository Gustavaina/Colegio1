<%@ page import="java.sql.*, java.util.*, metodos.AlumnoMetodos, util.MySQLConexion" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Alumnos</title>
    
    <%@include file="shared_styles.jsp" %> <!-- Coloca aquí los estilos compartidos -->
    <script>
        function llenarFormulario(nombre, apellidos, dni, telefono, sexo, direccion, grado, nivel) {
    document.getElementById("nombre").value = nombre;
    document.getElementById("apellidos").value = apellidos;
    document.getElementById("dni").value = dni; // El DNI debe permanecer igual
    document.getElementById("telefono").value = telefono;
    document.getElementById("sexo").value = sexo;
    document.getElementById("direccion").value = direccion;
    document.getElementById("grado").value = grado;
    document.getElementById("nivel").value = nivel;

    // Cambiar la acción del formulario a "editar"
    document.getElementById("accion").value = "editar";
    document.getElementById("botonAgregar").style.display = "none"; // Oculta el botón de agregar
    document.getElementById("botonGuardarCambios").style.display = "inline-block"; // Muestra el botón de guardar cambios
}

    </script>
    <link rel="stylesheet" href="assets/css/crud_alumnoscrud.css">
    <style>
        /* Estilos para los botones de editar y eliminar */
        .button-group {
            display: flex; /* Utiliza flexbox para alinear los botones */
            justify-content: center; /* Centra el grupo de botones */
            gap: 10px; /* Espacio entre los botones */
        }
        .button-group button {
            margin: 0; /* Asegura que no haya margen alrededor de los botones */
        }
    </style>
</head>
<body>

<%@include file="shared_navbar.jsp" %> <!-- Coloca aquí la barra de navegación compartida -->

<h2>Lista de Alumnos</h2>

<a href="RegistroApoderados.jsp" class="button" style="margin-bottom: 20px;">Ir a Registro de Apoderados</a>
<a href="AulaListar.jsp" class="button" style="margin-bottom: 20px;">Ir a Registrar Aula</a>

<%
    // Lógica para insertar, actualizar o eliminar según el formulario enviado
    AlumnoMetodos metodos = new AlumnoMetodos();
    String accion = request.getParameter("accion");

    if ("insertar".equals(accion)) {
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String dni = request.getParameter("dni");
        String telefono = request.getParameter("telefono");
        String sexo = request.getParameter("sexo");
        String direccion = request.getParameter("direccion");
        String grado = request.getParameter("grado");
        String nivel = request.getParameter("nivel");
        
        boolean resultado = metodos.insertarAlumno(nombre, apellidos, dni, telefono, sexo, direccion, grado, nivel);
        out.println(resultado ? "Alumno agregado correctamente." : "Error al agregar alumno.");
    } else if ("eliminar".equals(accion)) {
        String dni = request.getParameter("dni");
        boolean resultado = metodos.eliminarAlumnoPorDni(dni);
        out.println(resultado ? "Alumno eliminado correctamente." : "Error al eliminar alumno.");
    } else if ("editar".equals(accion)) {
        String nombre = request.getParameter("nombre");
        String apellidos = request.getParameter("apellidos");
        String dni = request.getParameter("dni");
        String telefono = request.getParameter("telefono");
        String sexo = request.getParameter("sexo");
        String direccion = request.getParameter("direccion");
        String grado = request.getParameter("grado");
        String nivel = request.getParameter("nivel");
        
        boolean resultado = metodos.actualizarAlumno(nombre, apellidos, dni, telefono, sexo, direccion, grado, nivel);
        out.println(resultado ? "Alumno actualizado correctamente." : "Error al actualizar alumno.");
    }
%>

<!-- Botón para agregar nuevo alumno -->
<form method="post" action="AlumnoListar.jsp" id="formAlumno">
    <h3>Agregar Alumno</h3>
    <input type="hidden" name="accion" id="accion" value="insertar">
    Nombre: <input type="text" name="nombre" id="nombre" required><br>
    Apellidos: <input type="text" name="apellidos" id="apellidos" required><br>
    DNI: <input type="text" name="dni" id="dni" required><br>
    Teléfono: <input type="text" name="telefono" id="telefono" required><br>
    Sexo: <input type="text" name="sexo" id="sexo" required><br>
    Dirección: <input type="text" name="direccion" id="direccion" required><br>
    Grado: 
    <select name="grado" id="grado" required>
        <option value="Primer grado">Primer grado</option>
        <option value="Segundo grado">Segundo grado</option>
        <option value="Tercer grado">Tercer grado</option>
        <option value="Cuarto grado">Cuarto grado</option>
        <option value="Quinto grado">Quinto grado</option>
        <option value="Sexto grado">Sexto grado</option>
    </select><br>
    Nivel: 
    <select name="nivel" id="nivel" required>
        <option value="Primaria">Primaria</option>
        <option value="Secundaria">Secundaria</option>
    </select><br>
    <button type="submit" id="botonAgregar" class="button">Agregar Alumno</button>
    <button type="submit" id="botonGuardarCambios" class="button" style="display:none;">Guardar Cambios</button> <!-- Botón para guardar cambios -->
</form>


<hr>

<!-- Tabla para mostrar los alumnos -->
<table>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Apellidos</th>
        <th>DNI</th>
        <th>Teléfono</th>
        <th>Sexo</th>
        <th>Dirección</th>
        <th>Grado</th>
        <th>Nivel</th>
        <th>Acciones</th>
    </tr>

    <%
        // Mostrar la lista de alumnos desde la base de datos
        Connection con = MySQLConexion.getConexion();
        String sql = "SELECT * FROM alumno";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("alu_id");
                String nombre = rs.getString("alu_nombres");
                String apellidos = rs.getString("alu_apellidos");
                String dni = rs.getString("alu_dni");
                String telefono = rs.getString("alu_telefono");
                String sexo = rs.getString("alu_sexo");
                String direccion = rs.getString("alu_direccion");
                String grado = rs.getString("alu_grado");
                String nivel = rs.getString("alu_nivel");
    %>
                <tr>
                    <td><%= id %></td>
                    <td><%= nombre %></td>
                    <td><%= apellidos %></td>
                    <td><%= dni %></td>
                    <td><%= telefono %></td>
                    <td><%= sexo %></td>
                    <td><%= direccion %></td>
                    <td><%= grado %></td>
                    <td><%= nivel %></td>
                    <td>
    <div class="button-group">
        <!-- Botón para editar alumno -->
        <button class="button editar-button" onclick="llenarFormulario('<%= nombre %>', '<%= apellidos %>', '<%= dni %>', '<%= telefono %>', '<%= sexo %>', '<%= direccion %>', '<%= grado %>', '<%= nivel %>');">Editar</button>
        
        <!-- Botón para eliminar alumno -->
        <form action="AlumnoListar.jsp" method="post" style="display:inline;">
            <input type="hidden" name="accion" value="eliminar">
            <input type="hidden" name="dni" value="<%= dni %>">
            <button class="button eliminar-button" onclick="return confirm('¿Estás seguro de eliminar a este alumno?');">Eliminar</button>
        </form>
    </div>
</td>

                </tr>
    <%
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            out.println("Error al cargar los datos: " + e.getMessage());
        } finally {
            try { if (con != null) con.close(); } catch (SQLException ex) {}
        }
    %>
</table>

</body>
</html>
