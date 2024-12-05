<%@ page import="java.sql.*, util.MySQLConexion" %>

<%
    String id = request.getParameter("id");
    Connection con = null;
    PreparedStatement ps = null;

    try {
        con = MySQLConexion.getConexion();
        ps = con.prepareStatement("DELETE FROM alumno WHERE alu_id = ?");
        ps.setInt(1, Integer.parseInt(id));
        ps.executeUpdate();
        response.sendRedirect("AlumnoListar.jsp"); // Redirigir después de la eliminación
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<p style='color: red;'>Error al eliminar el alumno: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
