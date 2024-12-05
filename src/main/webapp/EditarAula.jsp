<%@ page import="java.sql.*, util.MySQLConexion" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Editar Aula</title>
    <%@ include file="shared_styles.jsp" %>
    <link rel="stylesheet" href="assets/css/crud_aula.css">
</head>
<body>
    <h2>Editar Aula</h2>
    <form action="ActualizarAula.jsp" method="POST">
        <% 
            String cod_aula = request.getParameter("cod_aula");
            if (cod_aula != null) {
                try {
                    Connection conn = MySQLConexion.getConexion();
                    String query = "SELECT * FROM aula WHERE cod_aula = ?";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setString(1, cod_aula);
                    ResultSet rs = ps.executeQuery();
                    
                    if (rs.next()) {
                        String descrip = rs.getString("descrip");
                        String tipo_aula = rs.getString("tipo_aula");
                        String grado = rs.getString("grado");
                        String seccion = rs.getString("seccion");
                        String cod_curso = rs.getString("cod_curso");
                        String id_turno = rs.getString("id_turno");
                        String id_alumno = rs.getString("id_alumno");
        %>
        <label for="cod_aula">Código Aula:</label>
        <input type="text" id="cod_aula" name="cod_aula" value="<%= cod_aula %>" readonly><br>

        <label for="descrip">Descripción:</label>
        <input type="text" id="descrip" name="descrip" value="<%= descrip %>" required><br>

        <label for="tipo_aula">Tipo de Aula:</label>
        <input type="text" id="tipo_aula" name="tipo_aula" value="<%= tipo_aula %>" required><br>

        <label for="grado">Grado:</label>
        <input type="text" id="grado" name="grado" value="<%= grado %>" required><br>

        <label for="seccion">Sección:</label>
        <input type="text" id="seccion" name="seccion" value="<%= seccion %>" required><br>

        <label for="cod_curso">Código del Curso:</label>
        <input type="text" id="cod_curso" name="cod_curso" value="<%= cod_curso %>" required><br>

        <label for="id_turno">Turno:</label>
        <input type="text" id="id_turno" name="id_turno" value="<%= id_turno %>" required><br>

        <label for="id_alumno">ID Alumno:</label>
        <input type="text" id="id_alumno" name="id_alumno" value="<%= id_alumno %>" required><br>

        <input type="submit" value="Actualizar Aula">
        <% 
                    }
                    rs.close();
                    ps.close();
                    conn.close();
                } catch (SQLException e) {
                    out.println("<p>Error al cargar datos para editar: " + e.getMessage() + "</p>");
                }
            }
        %>
    </form>
</body>
</html>
