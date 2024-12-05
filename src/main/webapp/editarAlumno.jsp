<%@ page import="java.sql.*, util.MySQLConexion" %>

<%
    String id = request.getParameter("id");

    String alu_nombres = "", alu_apellidos = "", alu_dni = "", alu_telefono = "", alu_sexo = "", alu_direccion = "", alu_grado = "", alu_nivel = "", dni_apoderado = "";
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        // Conexión a la base de datos
        con = MySQLConexion.getConexion();

        // Obtener los datos del alumno por ID
        ps = con.prepareStatement("SELECT * FROM alumno WHERE alu_id = ?");
        ps.setInt(1, Integer.parseInt(id));
        rs = ps.executeQuery();

        if (rs.next()) {
            alu_nombres = rs.getString("alu_nombres");
            alu_apellidos = rs.getString("alu_apellidos");
            alu_dni = rs.getString("alu_dni");
            alu_telefono = rs.getString("alu_telefono");
            alu_sexo = rs.getString("alu_sexo");
            alu_direccion = rs.getString("alu_direccion");
            alu_grado = rs.getString("alu_grado");
            alu_nivel = rs.getString("alu_nivel");
            int idApoderado = rs.getInt("id_apoderado");

            // Buscar el DNI del apoderado usando el id_apoderado
            ps = con.prepareStatement("SELECT dni_apoderado FROM apoderados WHERE id = ?");
            ps.setInt(1, idApoderado);
            ResultSet rsApoderado = ps.executeQuery();

            if (rsApoderado.next()) {
                dni_apoderado = rsApoderado.getString("dni_apoderado");
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<p style='color: red;'>Error al obtener los datos: " + e.getMessage() + "</p>");
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

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Alumno</title>
    <%@ include file="shared_styles.jsp" %> <!-- Estilos compartidos -->
    <%@ include file="shared_navbar.jsp" %> <!-- Barra de navegación compartida -->
    <link rel="stylesheet" href="assets/css/crud_alumnoscrud.css">
</head>
<body>
    <h2>Editar Alumno</h2>
    <form action="ActualizarAlumno.jsp" method="post">
        <input type="hidden" name="alu_id" value="<%= id %>">
        <label for="alu_nombres">Nombres:</label>
        <input type="text" id="alu_nombres" name="alu_nombres" value="<%= alu_nombres %>" required><br><br>

        <label for="alu_apellidos">Apellidos:</label>
        <input type="text" id="alu_apellidos" name="alu_apellidos" value="<%= alu_apellidos %>" required><br><br>

        <label for="alu_dni">DNI:</label>
        <input type="text" id="alu_dni" name="alu_dni" value="<%= alu_dni %>" maxlength="8" required><br><br>

        <label for="alu_telefono">Teléfono:</label>
        <input type="text" id="alu_telefono" name="alu_telefono" value="<%= alu_telefono %>" maxlength="9" required><br><br>

        <label for="alu_sexo">Sexo:</label>
        <select id="alu_sexo" name="alu_sexo" required>
            <option value="Masculino" <%= alu_sexo.equals("Masculino") ? "selected" : "" %>>Masculino</option>
            <option value="Femenino" <%= alu_sexo.equals("Femenino") ? "selected" : "" %>>Femenino</option>
        </select><br><br>

        <label for="alu_direccion">Dirección:</label>
        <input type="text" id="alu_direccion" name="alu_direccion" value="<%= alu_direccion %>" required><br><br>

        <label for="alu_grado">Grado:</label>
        <select id="alu_grado" name="alu_grado" required>
            <option value="1" <%= alu_grado.equals("1") ? "selected" : "" %>>Primer Grado</option>
            <option value="2" <%= alu_grado.equals("2") ? "selected" : "" %>>Segundo Grado</option>
            <option value="3" <%= alu_grado.equals("3") ? "selected" : "" %>>Tercer Grado</option>
            <option value="4" <%= alu_grado.equals("4") ? "selected" : "" %>>Cuarto Grado</option>
            <option value="5" <%= alu_grado.equals("5") ? "selected" : "" %>>Quinto Grado</option>
        </select><br><br>

        <label for="alu_nivel">Nivel:</label>
        <select id="alu_nivel" name="alu_nivel" required>
            <option value="Primaria" <%= alu_nivel.equals("Primaria") ? "selected" : "" %>>Primaria</option>
            <option value="Secundaria" <%= alu_nivel.equals("Secundaria") ? "selected" : "" %>>Secundaria</option>
        </select><br><br>

        <!-- Mostrar el DNI del apoderado correspondiente -->
        <label for="dni_apoderado">DNI del Apoderado:</label>
        <input type="text" id="dni_apoderado" name="dni_apoderado" value="<%= dni_apoderado %>" maxlength="8" required><br><br>

        <input type="submit" value="Actualizar Alumno">
    </form>
</body>
</html>
