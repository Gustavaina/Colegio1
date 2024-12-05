<%@page import="java.sql.ResultSet"%>
<%@page import="metodos.metAPIDNI"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="util.MySQLConexion" %>
<%@ page import="metodos.AlumnoMetodos" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Matrícula</title>
    <link rel="stylesheet" href="assets/css/stylesmatriculaa.css">
    <script>
        function validarDNI() {
            const dniInput = document.getElementById("numero_documento").value;
            if (dniInput.length !== 8) {
                alert("El DNI debe tener 8 dígitos.");
                return false;
            }
            return true;
        }

        function continuar() {
            if (validarDNI()) {
                document.getElementById("dniForm").submit();
            }
        }
    </script>
</head>
<body>
    <div class="form-container">
        <h2>MATRICULATE A NOSOTROS</h2>
        <p>Ingresa el DNI del menor</p>
        <form id="dniForm" method="post">
            <div class="form-row">
                <div class="form-group" style="flex: 1;">
                    <input type="text" id="numero_documento" name="numero_documento" placeholder="N° de Documento" required onblur="validarDNI()">
                </div>
                <div class="form-group" style="flex-basis: auto; margin-left: 10px;">
                    <button type="button" class="submit-btn" onclick="continuar()">Continuar</button>
                </div>
            </div>
        </form>

        <%
            String dni = request.getParameter("numero_documento");
            if (dni != null && !dni.isEmpty()) {
                // Llama al método de la API para obtener los datos del menor
                String resultado = metAPIDNI.consultarDNI(dni);
                String nombres = "";
                String apellidoPaterno = "";
                String apellidoMaterno = "";
                String dniApoderado = "";

                try {
                    if (resultado != null && !resultado.isEmpty()) {
                        if (resultado.contains("nombres")) {
                            nombres = resultado.split("\"nombres\":\"")[1].split("\"")[0].trim();
                        }
                        if (resultado.contains("apellidoPaterno")) {
                            apellidoPaterno = resultado.split("\"apellidoPaterno\":\"")[1].split("\"")[0].trim();
                        }
                        if (resultado.contains("apellidoMaterno")) {
                            apellidoMaterno = resultado.split("\"apellidoMaterno\":\"")[1].split("\"")[0].trim();
                        }
                    } else {
                        out.println("<script>alert('Error al consultar DNI. Verifica que el número sea correcto.');</script>");
                    }

                    // Llama al método para obtener el DNI del apoderado
                    dniApoderado = AlumnoMetodos.obtenerDniApoderadoPorDniMenor(dni);

                } catch (Exception e) {
                    out.println("<script>alert('Error al procesar la respuesta: " + e.getMessage() + "');</script>");
                }

                // Establece los datos en los atributos para mostrarlos
                request.setAttribute("nombre", nombres);
                request.setAttribute("apellidos", apellidoPaterno + " " + apellidoMaterno);
                request.setAttribute("dniApoderado", dniApoderado);
            }
        %>

        <div class="resultado">
            <form action="RegistrarMatricula.jsp" method="post">
                <div class="form-row">
                    <div class="form-group">
                        <p>DNI DEL APODERADO:</p>
                        <input type="text" id="dniapoderado" name="dni_apoderado" placeholder="DNI Apoderado" required 
                               value="<%= request.getAttribute("dniApoderado") != null ? request.getAttribute("dniApoderado") : "" %>" readonly>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <input type="text" id="nombre" name="alu_nombres" placeholder="Nombre" required value="<%= request.getAttribute("nombre") != null ? request.getAttribute("nombre") : "" %>" readonly>
                    </div>
                    <div class="form-group">
                        <input type="text" id="apellidos" name="alu_apellidos" placeholder="Apellidos" required value="<%= request.getAttribute("apellidos") != null ? request.getAttribute("apellidos") : "" %>" readonly>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <input type="tel" id="celular" name="alu_telefono" maxlength="9" placeholder="Celular" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <input type="text" id="direccion" name="alu_direccion" placeholder="Dirección" required>
                    </div>
                    <div class="form-group">
                        <select id="sexo" name="alu_sexo" required>
                            <option value="">Selecciona tu sexo</option>
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                            <option value="Otro">Otro</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group">
                        <input type="text" id="numero_documento" name="alu_dni" placeholder="N° de Documento" required value="<%= request.getParameter("numero_documento") != null ? request.getParameter("numero_documento") : "" %>" readonly>
                    </div>
                    <div class="form-group">
                        <select id="grado" name="alu_grado" required>
                            <option value="">Selecciona tu grado</option>
                            <option value="Primer grado">Primer grado</option>
                            <option value="Segundo grado">Segundo grado</option>
                            <option value="Tercer grado">Tercer grado</option>
                            <option value="Cuarto grado">Cuarto grado</option>
                            <option value="Quinto grado">Quinto grado</option>
                            <option value="Sexto grado">Sexto grado</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <select id="nivel" name="alu_nivel" required>
                            <option value="">Selecciona tu nivel</option>
                            <option value="Primaria">Primaria</option>
                            <option value="Secundaria">Secundaria</option>
                        </select>
                    </div>
                </div>

                <div class="form-row">
                    <div class="form-group" style="flex: 1;">
                        <button type="button" class="submit-btn" onclick="window.location.href='Inicio.jsp'">Regresar a Inicio</button>
                    </div>
                    <div class="form-group" style="flex: 1;">
                        <button type="button" class="submit-btn" onclick="window.location.href='Ingresar.jsp'">Ir a Elegir Rol</button>
                    </div>
                    <div class="form-group" style="flex: 1;">
                        <button type="submit" class="submit-btn">Unirme</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

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

                    // Redirigir a Ingresar.jsp
                    response.sendRedirect("Ingresar.jsp");
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


</body>
</html>
