<%@ page import="java.sql.*, metodos.AulaMetodos, util.MySQLConexion" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <%@include file="shared_styles.jsp" %> <!-- Estilos compartidos -->
    <%@include file="shared_navbar.jsp" %> <!-- Barra de navegación compartida -->
    <title>Lista de Aulas</title>

    <%@ include file="shared_styles.jsp" %> <!-- Estilos compartidos -->
    <link rel="stylesheet" href="assets/css/crud_aula.css"> <!-- Hoja de estilos específica -->
</head>
<body>
    
    <h2>Agregar Aula</h2>

    <form action="AulaListar.jsp" method="POST">
    <input type="hidden" id="cod_aula" name="cod_aula" value="<%= request.getParameter("cod_aula") != null ? request.getParameter("cod_aula") : "" %>"><br>

    <label for="id_aula">ID del Aula:</label>
    <input type="text" id="id_aula" name="id_aula" required><br>

    <label for="descrip">Descripción:</label>
    <input type="text" id="descrip" name="descrip" required><br>

    <label for="tipo_aula">Tipo de Aula:</label>
    <input type="text" id="tipo_aula" name="tipo_aula" required><br>

    <label for="grado">Grado:</label>
    <input type="text" id="grado" name="grado" required><br>

    <label for="seccion">Sección:</label>
    <input type="text" id="seccion" name="seccion" required><br>

    <label for="cod_curso">Código del Curso:</label>
    <input type="text" id="cod_curso" name="cod_curso" required><br>

    <label for="id_turno">Turno:</label>
    <input type="text" id="id_turno" name="id_turno" required><br>

    <label for="id_alumno">ID del Alumno:</label>
    <input type="text" id="id_alumno" name="id_alumno" required><br>

    <input type="submit" value="Insertar Aula">
</form>

<h2>Lista de Aulas</h2>

<table border="1">
    <thead>
        <tr>
            <th>Código Aula</th>
            <th>ID del Aula</th>
            <th>Descripción</th>
            <th>Tipo de Aula</th>
            <th>Grado</th>
            <th>Sección</th>
            <th>Código del Curso</th>
            <th>Turno</th>
            <th>ID Alumno</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <% 
            // Conectar a la base de datos y obtener los registros
            try {
                Connection conn = MySQLConexion.getConexion();
                String query = "SELECT * FROM aula"; // Consulta para obtener todas las aulas
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query);

                // Mostrar los resultados en la tabla
                while (rs.next()) {
                    String cod_aula = rs.getString("cod_aula");  
                    String id_aula = rs.getString("id_aula");  
                    String descrip = rs.getString("descrip");
                    String tipo_aula = rs.getString("tipo_aula");
                    String grado = rs.getString("grado");
                    String seccion = rs.getString("seccion");
                    String cod_curso = rs.getString("cod_curso");
                    String id_turno = rs.getString("id_turno");
                    String id_alumno = rs.getString("id_alumno");
        %>
        <tr>
            <td><%= cod_aula %></td>
            <td><%= id_aula %></td> 
            <td><%= descrip %></td>
            <td><%= tipo_aula %></td>
            <td><%= grado %></td>
            <td><%= seccion %></td>
            <td><%= cod_curso %></td>
            <td><%= id_turno %></td>
            <td><%= id_alumno %></td>
            <td>
                <a href="EditarAula.jsp?cod_aula=<%= cod_aula %>">Editar</a> | 
                <a href="EliminarAula.jsp?cod_aula=<%= cod_aula %>">Borrar</a>
            </td>
        </tr>
        <% 
                }
                rs.close();
                stmt.close();
                conn.close();
            } catch (SQLException e) {
                out.println("<p>Error en la base de datos: " + e.getMessage() + "</p>");
            }
        %>
    </tbody>
</table>

<%
    // Captura de datos del formulario
    String cod_aula = request.getParameter("cod_aula");
    String id_aula = request.getParameter("id_aula");
    String descrip = request.getParameter("descrip");
    String tipo_aula = request.getParameter("tipo_aula");
    String grado = request.getParameter("grado");
    String seccion = request.getParameter("seccion");
    String cod_curso = request.getParameter("cod_curso");
    String id_turno = request.getParameter("id_turno");
    String id_alumno = request.getParameter("id_alumno");

    // Verificación si se enviaron los datos
    if (cod_aula != null && descrip != null && tipo_aula != null &&
        grado != null && seccion != null && cod_curso != null && id_turno != null && id_alumno != null) {

        try {
            // Crear una conexión a la base de datos
            Connection conn = MySQLConexion.getConexion();

            // Consulta de inserción sin cod_aula, ya que es auto-incremental
            String query = "INSERT INTO aula (id_aula, descrip, tipo_aula, grado, seccion, cod_curso, id_turno, id_alumno) "
             + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, id_aula);  
                ps.setString(2, descrip);
                ps.setString(3, tipo_aula);
                ps.setString(4, grado);
                ps.setString(5, seccion);
                ps.setString(6, cod_curso);
                ps.setString(7, id_turno);
                ps.setString(8, id_alumno);

            int result = ps.executeUpdate();  // Ejecutar la inserción

            // Si la inserción es exitosa, redirigir a la misma página
            if (result > 0) {
                response.sendRedirect("AulaListar.jsp?message=El aula se insertó correctamente.");
            } else {
                out.println("<p>Error al insertar el aula.</p>");
            }

            // Cerrar la conexión
            ps.close();
            conn.close();

        } catch (SQLException e) {
            out.println("<p>Error en la base de datos: " + e.getMessage() + "</p>");
        }
    }
%>

</body>
</html>
