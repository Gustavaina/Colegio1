<%@ page import="java.sql.*, java.util.*, metodos.AlumnoMetodos, util.MySQLConexion" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registrar Alumno</title>
    <%@include file="shared_styles.jsp" %> <!-- Estilos compartidos -->
    <%@include file="shared_navbar.jsp" %> <!-- Barra de navegación compartida -->
    <link rel="stylesheet" href="assets/css/crud_alumnoscrud.css">
    

    <script type="text/javascript">
        // Función para validar el DNI (8 dígitos)
        function validarDNI() {
            var dni = document.getElementById("alu_dni").value;
            if (dni.length != 8 || isNaN(dni)) {
                alert("El DNI debe ser exactamente 8 dígitos numéricos.");
                return false;
            }
            return true;
        }

        // Función para validar el Teléfono (Debe comenzar con 9 y tener 9 dígitos)
        function validarTelefono() {
            var telefono = document.getElementById("alu_telefono").value;
            if (telefono.length != 9 || telefono[0] != '9' || isNaN(telefono)) {
                alert("El teléfono debe comenzar con 9 y tener 9 dígitos.");
                return false;
            }
            return true;
        }

        // Función para validar antes de enviar el formulario
        function validarFormulario() {
            if (!validarDNI()) {
                return false;
            }
            if (!validarTelefono()) {
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <h2>Registrar Alumno</h2>
    <form action="AlumnoListar.jsp" method="post" onsubmit="return validarFormulario()">
        <label for="alu_nombres">Nombres:</label>
        <input type="text" id="alu_nombres" name="alu_nombres" required><br><br>

        <label for="alu_apellidos">Apellidos:</label>
        <input type="text" id="alu_apellidos" name="alu_apellidos" required><br><br>

        <label for="alu_dni">DNI:</label>
        <input type="text" id="alu_dni" name="alu_dni" maxlength="8" required><br><br>

        <label for="alu_telefono">Teléfono:</label>
        <input type="text" id="alu_telefono" name="alu_telefono" maxlength="9" required><br><br>

        <label for="alu_sexo">Sexo:</label>
        <select id="alu_sexo" name="alu_sexo" required>
            <option value="Masculino">Masculino</option>
            <option value="Femenino">Femenino</option>
        </select><br><br>

        <label for="alu_direccion">Dirección:</label>
        <input type="text" id="alu_direccion" name="alu_direccion" required><br><br>

        <label for="alu_grado">Grado:</label>
        <select id="alu_grado" name="alu_grado" required>
            <option value="1">Primer Grado</option>
            <option value="2">Segundo Grado</option>
            <option value="3">Tercer Grado</option>
            <option value="4">Cuarto Grado</option>
            <option value="5">Quinto Grado</option>
        </select><br><br>

        <label for="alu_nivel">Nivel:</label>
        <select id="alu_nivel" name="alu_nivel" required>
            <option value="Primaria">Primaria</option>
            <option value="Secundaria">Secundaria</option>
        </select><br><br>

        <label for="dni_apoderado">DNI del Apoderado:</label>
        <input type="text" id="dni_apoderado" name="dni_apoderado" maxlength="8" required><br><br>

        <input type="submit" value="Registrar Alumno">
    </form>

    <%
        if (request.getMethod().equalsIgnoreCase("POST")) {
            // Obtener los datos del formulario
            String alu_nombres = request.getParameter("alu_nombres");
            String alu_apellidos = request.getParameter("alu_apellidos");
            String alu_dni = request.getParameter("alu_dni");
            String alu_telefono = request.getParameter("alu_telefono");
            String alu_sexo = request.getParameter("alu_sexo");
            String alu_direccion = request.getParameter("alu_direccion");
            String alu_grado = request.getParameter("alu_grado");
            String alu_nivel = request.getParameter("alu_nivel");
            String dni_apoderado = request.getParameter("dni_apoderado");

            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            int idApoderado = -1;

            try {
                // Obtener conexión a la base de datos
                con = MySQLConexion.getConexion();

                // Consulta para obtener el ID del apoderado basado en el DNI del apoderado
                ps = con.prepareStatement("SELECT id FROM apoderados WHERE dni_apoderado = ?");
                ps.setString(1, dni_apoderado);
                rs = ps.executeQuery();

                // Verificar si se encontró el apoderado
                if (rs.next()) {
                    idApoderado = rs.getInt("id");
                }

                // Si no se encuentra un apoderado con ese DNI, mostrar mensaje de error
                if (idApoderado == -1) {
                    out.println("<p style='color: red;'>No se encontró un apoderado con el DNI: " + dni_apoderado + "</p>");
                } else {
                    // Verificar si el DNI del alumno está asociado con el dni_menor del apoderado
                    ps = con.prepareStatement("SELECT * FROM apoderados WHERE dni_menor = ? AND dni_apoderado = ?");
                    ps.setString(1, alu_dni);
                    ps.setString(2, dni_apoderado);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        // Insertar el nuevo alumno en la tabla
                        ps = con.prepareStatement("INSERT INTO alumno (alu_nombres, alu_apellidos, alu_dni, alu_telefono, alu_sexo, alu_direccion, alu_grado, alu_nivel, id_apoderado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
                        ps.setString(1, alu_nombres);
                        ps.setString(2, alu_apellidos);
                        ps.setString(3, alu_dni);
                        ps.setString(4, alu_telefono);
                        ps.setString(5, alu_sexo);
                        ps.setString(6, alu_direccion);
                        ps.setString(7, alu_grado);
                        ps.setString(8, alu_nivel);
                        ps.setInt(9, idApoderado); // ID del apoderado

                        // Ejecutar la inserción
                        ps.executeUpdate();
                        out.println("<p>Alumno registrado correctamente.</p>");
                    } else {
                        out.println("<p style='color: red;'>El DNI del alumno no está asociado con el DNI del apoderado.</p>");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p style='color: red;'>Error al registrar el alumno: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
    
     <h2>Lista de Alumnos Registrados</h2>

<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>Nombres</th>
            <th>Apellidos</th>
            <th>DNI</th>
            <th>Teléfono</th>
            <th>Sexo</th>
            <th>Dirección</th>
            <th>Grado</th>
            <th>Nivel</th>
            <th>ID Apoderado</th>
            <th>Acciones</th> <!-- Nueva columna para las acciones -->
        </tr>
    </thead>
    <tbody>
        <%
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                // Obtener conexión a la base de datos
                con = MySQLConexion.getConexion();

                // Consulta para obtener los alumnos registrados
                ps = con.prepareStatement("SELECT alu_id, alu_nombres, alu_apellidos, alu_dni, alu_telefono, alu_sexo, alu_direccion, alu_grado, alu_nivel, id_apoderado FROM alumno");
                rs = ps.executeQuery();

                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getInt("alu_id") %></td>
                        <td><%= rs.getString("alu_nombres") %></td>
                        <td><%= rs.getString("alu_apellidos") %></td>
                        <td><%= rs.getString("alu_dni") %></td>
                        <td><%= rs.getString("alu_telefono") %></td>
                        <td><%= rs.getString("alu_sexo") %></td>
                        <td><%= rs.getString("alu_direccion") %></td>
                        <td><%= rs.getString("alu_grado") %></td>
                        <td><%= rs.getString("alu_nivel") %></td>
                        <td><%= rs.getInt("id_apoderado") %></td>
                        <td>
                            <!-- Enlace para editar -->
                            <a href="editarAlumno.jsp?id=<%= rs.getInt("alu_id") %>">Editar</a> |
                            <!-- Formulario para eliminar -->
                            <form action="eliminarAlumno.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="id" value="<%= rs.getInt("alu_id") %>">
                                <input type="submit" value="Eliminar" onclick="return confirm('¿Estás seguro de eliminar este alumno?')">
                            </form>
                        </td>
                    </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<p style='color: red;'>Error al cargar los datos: " + e.getMessage() + "</p>");
            } finally {
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </tbody>
</table>
</body>
</html>
