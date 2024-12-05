<%@ page import="java.sql.*, util.MySQLConexion" %>
<link rel="stylesheet" href="assets/css/crud_alumnoscrud.css">

<%
    String alu_id = request.getParameter("alu_id");
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

    try {
        con = MySQLConexion.getConexion();

        // Obtener el DNI del apoderado asociado al alumno
        ps = con.prepareStatement("SELECT id_apoderado FROM alumno WHERE alu_id = ?");
        ps.setString(1, alu_id);
        ResultSet rs = ps.executeQuery();

        int id_apoderado_actual = 0;
        if (rs.next()) {
            id_apoderado_actual = rs.getInt("id_apoderado");
        } else {
            out.println("<p style='color: red;'>No se encontró el alumno.</p>");
            return;
        }

        // Verificar si el DNI del apoderado ingresado corresponde al apoderado actual
        ps = con.prepareStatement("SELECT id FROM apoderados WHERE dni_apoderado = ?");
        ps.setString(1, dni_apoderado);
        rs = ps.executeQuery();

        int id_apoderado_nuevo = 0;
        if (rs.next()) {
            id_apoderado_nuevo = rs.getInt("id");
        } else {
            out.println("<p style='color: red;'>El DNI del apoderado no existe.</p>");
            return;
        }

        // Si el DNI del apoderado ingresado no es el mismo que el asociado al alumno, mostrar error
        if (id_apoderado_actual != id_apoderado_nuevo) {
            out.println("<p style='color: red;'>El DNI del apoderado no corresponde al apoderado asociado con el alumno.</p>");
            return;
        }

        // Actualizar los datos del alumno
        ps = con.prepareStatement("UPDATE alumno SET alu_nombres = ?, alu_apellidos = ?, alu_dni = ?, alu_telefono = ?, alu_sexo = ?, alu_direccion = ?, alu_grado = ?, alu_nivel = ?, id_apoderado = ? WHERE alu_id = ?");
        ps.setString(1, alu_nombres);
        ps.setString(2, alu_apellidos);
        ps.setString(3, alu_dni);
        ps.setString(4, alu_telefono);
        ps.setString(5, alu_sexo);
        ps.setString(6, alu_direccion);
        ps.setString(7, alu_grado);
        ps.setString(8, alu_nivel);
        ps.setInt(9, id_apoderado_nuevo);
        ps.setInt(10, Integer.parseInt(alu_id));

        int result = ps.executeUpdate();

        if (result > 0) {
            // Redirigir al usuario a la página de listado de alumnos
            response.sendRedirect("AlumnoListar.jsp");
        } else {
            out.println("<p style='color: red;'>Error al actualizar los datos del alumno.</p>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<p style='color: red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
