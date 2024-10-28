<%@ page import="java.sql.*, java.util.*, util.MySQLConexion" %>
<%@ page import="metodos.metApoderado" %>


<!DOCTYPE html>
<html lang="es">
    <link rel="stylesheet" href="assets/css/stylescrudApoderado.css">
<head>
    <meta charset="UTF-8">
    <title>Lista de Apoderados</title>
    
    <%@include file="shared_styles.jsp" %>
    <script>
        function llenarFormulario(nombre, apellidos, telefono, correo, direccion, dniMenor, sexo, dniApoderado) {
            document.getElementById("nombre").value = nombre;
            document.getElementById("apellidos").value = apellidos;
            document.getElementById("telefono").value = telefono;
            document.getElementById("correo").value = correo;
            document.getElementById("direccion").value = direccion;
            document.getElementById("dniMenor").value = dniMenor;
            document.getElementById("sexo").value = sexo;
            document.getElementById("dniApoderado").value = dniApoderado;

            document.getElementById("accion").value = "editar";
            document.getElementById("botonAgregar").style.display = "none";
            document.getElementById("botonGuardarCambios").style.display = "inline-block";
        }
    </script>
    <link rel="stylesheet" href="assets/css/crud_apoderados.css">
    <style>
        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        .button-group button {
            margin: 0;
        }
    </style>
</head>
<body>

<%@include file="shared_navbar.jsp" %>

<h2>Lista de Apoderados</h2>

<a href="AlumnoListar.jsp" class="button" style="margin-bottom: 20px;">Ir a Registro de los Alumnos Matriculados</a>

<%
    String accion = request.getParameter("accion");
    metApoderado apoderadoManager = new metApoderado();
    
    if (accion != null) {
        try {
            if (accion.equals("insertar")) {
                // Agregar un nuevo apoderado
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");
                String telefono = request.getParameter("telefono");
                String correo = request.getParameter("correo");
                String direccion = request.getParameter("direccion");
                String dniMenor = request.getParameter("dniMenor");
                String sexo = request.getParameter("sexo");
                String dniApoderado = request.getParameter("dniApoderado");
                apoderadoManager.agregarApoderado(nombre, apellidos, telefono, correo, direccion, dniMenor, sexo, dniApoderado);
            } else if (accion.equals("editar")) {
                // Editar un apoderado
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");
                String telefono = request.getParameter("telefono");
                String correo = request.getParameter("correo");
                String direccion = request.getParameter("direccion");
                String dniMenor = request.getParameter("dniMenor");
                String sexo = request.getParameter("sexo");
                String dniApoderado = request.getParameter("dniApoderado");
                apoderadoManager.editarApoderado(nombre, apellidos, telefono, correo, direccion, dniMenor, sexo, dniApoderado);
            } else if (accion.equals("eliminar")) {
                // Eliminar un apoderado
                String dniApoderado = request.getParameter("dniApoderado");
                apoderadoManager.eliminarApoderado(dniApoderado);
            }
        } catch (SQLException e) {
            out.println("Error al realizar la acción: " + e.getMessage());
        }
    }
%>

<!-- Formulario para agregar o editar apoderados -->
<form method="post" action="RegistroApoderados.jsp" id="formApoderado">
    <h3>Agregar Apoderado</h3>
    <input type="hidden" name="accion" id="accion" value="insertar">
    Nombre: <input type="text" name="nombre" id="nombre" required><br>
    Apellidos: <input type="text" name="apellidos" id="apellidos" required><br>
    Teléfono: <input type="text" name="telefono" id="telefono" required><br>
    Correo Electrónico: <input type="email" name="correo" id="correo" required><br>
    Dirección: <input type="text" name="direccion" id="direccion" required><br>
    DNI del Menor: <input type="text" name="dniMenor" id="dniMenor" required><br>
    Sexo: <input type="text" name="sexo" id="sexo" required><br>
    DNI del Apoderado: <input type="text" name="dniApoderado" id="dniApoderado" required><br>
    
    <div class="button-group">
        <button type="submit" id="botonAgregar" class="button">Agregar Apoderado</button>
        <button type="submit" id="botonGuardarCambios" class="button" style="display:none;">Guardar Cambios</button>
    </div>
</form>

<hr>

<!-- Tabla para mostrar los apoderados -->
<table>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Apellidos</th>
        <th>Teléfono</th>
        <th>Correo Electrónico</th>
        <th>Dirección</th>
        <th>DNI del Menor</th>
        <th>Sexo</th>
        <th>DNI del Apoderado</th>
        <th>Acciones</th>
    </tr>

    <%
        // Mostrar la lista de apoderados desde la base de datos
        Connection con = MySQLConexion.getConexion();
        String sql = "SELECT * FROM apoderados"; // Cambia a tu tabla correcta
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id"); // Asegúrate de que la columna ID esté bien nombrada en tu base de datos
                String nombre = rs.getString("nombres");
                String apellidos = rs.getString("apellidos");
                String telefono = rs.getString("telefono");
                String correo = rs.getString("correo_electronico");
                String direccion = rs.getString("direccion");
                String dniMenor = rs.getString("dni_menor");
                String sexo = rs.getString("sexo");
                String dniApoderado = rs.getString("dni_apoderado");
    %>
                <tr>
                    <td><%= id %></td>
                    <td><%= nombre %></td>
                    <td><%= apellidos %></td>
                    <td><%= telefono %></td>
                    <td><%= correo %></td>
                    <td><%= direccion %></td>
                    <td><%= dniMenor %></td>
                    <td><%= sexo %></td>
                    <td><%= dniApoderado %></td>
                    <td>
                        <div class="button-group">
                            <button type="button" class="button editar-button" onclick="llenarFormulario('<%= nombre %>', '<%= apellidos %>', '<%= telefono %>', '<%= correo %>', '<%= direccion %>', '<%= dniMenor %>', '<%= sexo %>', '<%= dniApoderado %>');">Editar</button>
                            <form action="RegistroApoderados.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="accion" value="eliminar">
                                <input type="hidden" name="dniApoderado" value="<%= dniApoderado %>">
                                <button type="submit" class="button eliminar-button" onclick="return confirm('¿Estás seguro de eliminar a este apoderado?');">Borrar</button>
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
