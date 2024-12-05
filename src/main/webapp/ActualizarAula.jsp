<%@ page import="java.sql.*, util.MySQLConexion" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Actualizar Aula</title>
    <%@ include file="shared_styles.jsp" %>
    <link rel="stylesheet" href="assets/css/crud_aula.css">
</head>
<body>
    <h2>Actualizar Aula</h2>
    <% 
        // Obtener los valores del formulario
        String cod_aula = request.getParameter("cod_aula");
        String descrip = request.getParameter("descrip");
        String tipo_aula = request.getParameter("tipo_aula");
        String grado = request.getParameter("grado");
        String seccion = request.getParameter("seccion");
        String cod_curso = request.getParameter("cod_curso");
        String id_turno = request.getParameter("id_turno");
        String id_alumno = request.getParameter("id_alumno");

        // Verificar que los datos se hayan recibido correctamente
        if (cod_aula == null || cod_aula.trim().isEmpty() || descrip == null || descrip.trim().isEmpty() ||
            tipo_aula == null || tipo_aula.trim().isEmpty() || grado == null || grado.trim().isEmpty() ||
            seccion == null || seccion.trim().isEmpty() || cod_curso == null || cod_curso.trim().isEmpty() ||
            id_turno == null || id_turno.trim().isEmpty() || id_alumno == null || id_alumno.trim().isEmpty()) {

            out.println("<p>Faltan datos. Asegúrese de completar todos los campos.</p>");
        } else {
            // Si los campos están completos, realizar la actualización
            Connection conn = null;
            PreparedStatement ps = null;
            
            try {
                // Establecer la conexión con la base de datos
                conn = MySQLConexion.getConexion();
                
                // Preparar la consulta de actualización
                String query = "UPDATE aula SET descrip = ?, tipo_aula = ?, grado = ?, seccion = ?, cod_curso = ?, id_turno = ?, id_alumno = ? WHERE cod_aula = ?";
                ps = conn.prepareStatement(query);
                
                // Establecer los parámetros en la consulta
                ps.setString(1, descrip);
                ps.setString(2, tipo_aula);
                ps.setString(3, grado);
                ps.setString(4, seccion);
                ps.setString(5, cod_curso);
                ps.setString(6, id_turno);
                ps.setString(7, id_alumno);
                ps.setString(8, cod_aula);
                
                // Ejecutar la actualización
                int result = ps.executeUpdate();
                
                if (result > 0) {
                    out.println("<p>Aula actualizada correctamente.</p>");
                    // Redirigir a la lista de aulas
                    response.sendRedirect("AulaListar.jsp");
                } else {
                    out.println("<p>Error al actualizar el aula. Verifique los datos e intente nuevamente.</p>");
                }
                
            } catch (SQLException e) {
                out.println("<p>Error al actualizar el aula: " + e.getMessage() + "</p>");
            } finally {
                // Cerrar conexiones
                try {
                    if (ps != null) ps.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    out.println("<p>Error al cerrar la conexión: " + e.getMessage() + "</p>");
                }
            }
        }
    %>
</body>
</html>
