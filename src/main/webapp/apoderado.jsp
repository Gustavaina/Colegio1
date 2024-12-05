<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="util.MySQLConexion" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="metodos.Apoderado" %>
<%@ page import="metodos.metApoderado" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrar Apoderado</title>
    <link rel="stylesheet" href="assets/css/stylesApoderado.css">
</head>
<body>
    <div class="form-container">
        <h2>Registrar Apoderado del Alumno</h2>
        <form method="post">
            <div class="form-row">
                <input type="text" name="apo_nombres" placeholder="Nombres" required>
                <input type="text" name="apo_apellidos" placeholder="Apellidos" required>
            </div>
            <div class="form-row">
                <input type="text" name="apo_telefono" maxlength="9" placeholder="Teléfono" required>
                <input type="text" name="apo_correo" placeholder="Correo Electrónico" required>
            </div>
            <div class="form-row">
                <input type="text" name="apo_direccion" placeholder="Dirección" required>
                <input type="text" name="apo_dni_menor" maxlength="8" placeholder="DNI del Menor" required>
            </div>
            <div class="form-row">
                <input type="text" name="apo_dni_apoderado" maxlength="8" placeholder="DNI del Apoderado" required>
                <select name="apo_sexo" required>
                    <option value="">Seleccione el sexo</option>
                    <option value="Masculino">Masculino</option>
                    <option value="Femenino">Femenino</option>
                </select>
            </div>
            <div class="form-row">
                <button type="submit" class="submit-btn">Registrar e ir al pago</button>
            </div>
        </form>

        <%
            // Procesar el formulario solo si el método es POST
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String nombres = request.getParameter("apo_nombres");
                String apellidos = request.getParameter("apo_apellidos");
                String telefono = request.getParameter("apo_telefono");
                String correo = request.getParameter("apo_correo");
                String direccion = request.getParameter("apo_direccion");
                String dniMenor = request.getParameter("apo_dni_menor");
                String dniApoderado = request.getParameter("apo_dni_apoderado");
                String sexo = request.getParameter("apo_sexo");

                // Verificar que los campos obligatorios no sean nulos ni vacíos
                if (nombres != null && !nombres.trim().isEmpty() && 
                    apellidos != null && !apellidos.trim().isEmpty() && 
                    telefono != null && !telefono.trim().isEmpty() && 
                    dniApoderado != null && !dniApoderado.trim().isEmpty()) {

                    metApoderado metodos = new metApoderado();
                    int apoderadoId = metodos.agregarApoderado(nombres, apellidos, telefono, correo, direccion, dniMenor, sexo, dniApoderado);

                    // Verificar si se insertó correctamente
                    if (apoderadoId > 0) {
                        // Codificar los parámetros antes de agregarlos a la URL
                        String nombreCompleto = URLEncoder.encode(nombres + " " + apellidos, "UTF-8");
                        String telefonoEncoded = URLEncoder.encode(telefono, "UTF-8");

                        // Redirigir a la página de pago con los parámetros adecuados
                        response.sendRedirect("pagos2.jsp?apoderadoId=" + apoderadoId + 
                                              "&nombreCompleto=" + nombreCompleto +
                                              "&telefono=" + telefonoEncoded);
                    } else {
                        out.println("<p>Error al registrar el apoderado.</p>");
                    }
                } else {
                    out.println("<p>Por favor, complete todos los campos obligatorios.</p>");
                }
            }
        %>

    </div>
</body>
</html>
