<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="util.MySQLConexion" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="metodos.Apoderado" %>
<%@ page import="metodos.metApoderado" %>                                           

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registrar Apoderado</title>
    <link rel="stylesheet" href="assets/css/stylesApoderado.css">
    <script>
        function redirectToPayment() {
            // Redirigir después de 2 segundos
            setTimeout(function() {
                window.location.href = "pagos.jsp"; // Cambia esto a la ruta correcta de pagos.jsp
            }, 2000); // Esperar 2 segundos
        }
    </script>
</head>
<body>
    <div class="form-container">
        <h2>Registrar Apoderado del Alumno</h2>
        <form method="post">
            <div class="form-row">
                <div class="form-group">
                    <input type="text" id="nombres" name="apo_nombres" placeholder="Nombres" required>
                </div>
                <div class="form-group">
                    <input type="text" id="apellidos" name="apo_apellidos" placeholder="Apellidos" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <input type="tel" id="telefono" name="apo_telefono" placeholder="Teléfono" required>
                </div>
                <div class="form-group">
                    <input type="email" id="correo" name="apo_correo" placeholder="Correo Electrónico" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <input type="text" id="direccion" name="apo_direccion" placeholder="Dirección" required>
                </div>
                <div class="form-group">
                    <input type="text" id="dni_menor" name="apo_dni_menor" placeholder="DNI del Menor" required>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group">
                    <input type="text" id="dni_apoderado" name="apo_dni_apoderado" placeholder="DNI del Apoderado" required>
                </div>
                <div class="form-group">
                    <select id="sexo" name="apo_sexo" required>
                        <option value="" disabled selected>Seleccione el sexo</option>
                        <option value="masculino">Masculino</option>
                        <option value="femenino">Femenino</option>
                        <option value="otro">Otro</option>
                    </select>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group" style="flex: 1;">
                    <button type="submit" class="submit-btn">Registrar e ir al pago</button>
                </div>
            </div>
        </form>

        <%
            // Obtener los parámetros del formulario
            String nombres = request.getParameter("apo_nombres");
            String apellidos = request.getParameter("apo_apellidos");
            String telefono = request.getParameter("apo_telefono");
            String correo = request.getParameter("apo_correo");
            String direccion = request.getParameter("apo_direccion");
            String dniMenor = request.getParameter("apo_dni_menor");
            String dniApoderado = request.getParameter("apo_dni_apoderado");
            String sexo = request.getParameter("apo_sexo");

            // Comprobar si los parámetros no son nulos antes de crear el objeto
            if (nombres != null && apellidos != null && telefono != null && correo != null && 
                direccion != null && dniMenor != null && dniApoderado != null && sexo != null) {
                // Crear un objeto Apoderado
                Apoderado apoderado = new Apoderado();
                apoderado.setNombres(nombres);
                apoderado.setApellidos(apellidos);
                apoderado.setTelefono(telefono);
                apoderado.setCorreoElectronico(correo);
                apoderado.setDireccion(direccion);
                apoderado.setDniMenor(dniMenor);
                apoderado.setSexo(sexo);
                apoderado.setDniApoderado(dniApoderado);

                // Llamar al método para registrar el apoderado
                metApoderado metodos = new metApoderado();
                try {
                    metodos.agregarApoderado(nombres, apellidos, telefono, correo, direccion, dniMenor, sexo, dniApoderado); // Registro en la base de datos
                    out.println("<p>Apoderado registrado exitosamente.</p>");
                    out.println("<script>redirectToPayment();</script>"); // Llamar a la función de redirección
                } catch (SQLException e) {
                    e.printStackTrace();
                    out.println("<p>Error al registrar el apoderado. Intente de nuevo.</p>");
                }
            }
        %>
    </div>
</body>
</html>
