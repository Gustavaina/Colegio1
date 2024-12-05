<%@ page import="java.sql.*, util.MySQLConexion" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Eliminar Aula</title>
    <%@ include file="shared_styles.jsp" %>
    <link rel="stylesheet" href="assets/css/crud_aula.css">
</head>
<body>
    <h2>Eliminar Aula</h2>
    <% 
        String cod_aula = request.getParameter("cod_aula");
        if (cod_aula != null) {
            try {
                // Conectar a la base de datos
                Connection conn = MySQLConexion.getConexion();
                
                // Consulta SQL para eliminar por 'cod_aula'
                String query = "DELETE FROM aula WHERE cod_aula = ?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, cod_aula); // Establecer el valor de 'cod_aula'
                
                // Ejecutar la eliminación
                int result = ps.executeUpdate();

                if (result > 0) {
                    // Redirigir a AulaListar.jsp después de la eliminación
                    response.sendRedirect("AulaListar.jsp?message=El aula se eliminó correctamente.");
                } else {
                    out.println("<p>Error al eliminar el aula.</p>");
                }

                // Cerrar la conexión
                ps.close();
                conn.close();
            } catch (SQLException e) {
                out.println("<p>Error al eliminar: " + e.getMessage() + "</p>");
            }
        } else {
            out.println("<p>No se recibió el 'cod_aula' para eliminar.</p>");
        }
    %>
</body>
</html>
