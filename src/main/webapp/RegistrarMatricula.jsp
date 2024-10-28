<%@ page import="java.sql.Connection" %>
<%@ page import="util.MySQLConexion" %>
<%@ page import="metodos.AlumnoMetodos" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="metodos.metAPIDNI" %>
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
            <p>Ingresa tu DNI para continuar</p>
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
                String resultado = metAPIDNI.consultarDNI(dni);
                System.out.println("Resultado de la consulta: " + resultado); 
                if (resultado != null && !resultado.isEmpty()) {
                    try {
                        String nombres = "";
                        String apellidoPaterno = "";
                        String apellidoMaterno = "";

                        if (resultado.contains("nombres")) {
                            nombres = resultado.split("\"nombres\":\"")[1].split("\"")[0].trim();
                        }
                        if (resultado.contains("apellidoPaterno")) {
                            apellidoPaterno = resultado.split("\"apellidoPaterno\":\"")[1].split("\"")[0].trim();
                        }
                        if (resultado.contains("apellidoMaterno")) {
                            apellidoMaterno = resultado.split("\"apellidoMaterno\":\"")[1].split("\"")[0].trim();
                        }

                        request.setAttribute("nombre", nombres);
                        request.setAttribute("apellidos", apellidoPaterno + " " + apellidoMaterno);
                    } catch (Exception e) {
                        out.println("<script>alert('Error al procesar la respuesta de la API: " + e.getMessage() + "');</script>");
                    }
                } else {
                    out.println("<script>alert('Error al consultar DNI. Verifica que el número sea correcto.');</script>");
                }
            }
        %>

       <div class="resultado">
        <form action method="post">
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
                    <input type="tel" id="celular" name="alu_telefono" placeholder="Celular" required>
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
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            Connection con = MySQLConexion.getConexion(); 
            PreparedStatement pst = null;
            try {
                String nombre = request.getParameter("alu_nombres");
                String apellidos = request.getParameter("alu_apellidos");
                String celular = request.getParameter("alu_telefono");
                String direccion = request.getParameter("alu_direccion");
                String sexo = request.getParameter("alu_sexo");
                String numeroDocumento = request.getParameter("alu_dni");
                String grado = request.getParameter("alu_grado"); // Nuevo campo para grado
                String nivel = request.getParameter("alu_nivel"); // Nuevo campo para nivel
                
                String sql = "INSERT INTO alumno (alu_nombres, alu_apellidos, alu_telefono, alu_direccion, alu_sexo, alu_dni, alu_grado, alu_nivel) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"; // Sin correo
                pst = con.prepareStatement(sql);
                pst.setString(1, nombre);
                pst.setString(2, apellidos);
                pst.setString(3, celular);
                pst.setString(4, direccion);
                pst.setString(5, sexo);
                pst.setString(6, numeroDocumento);
                pst.setString(7, grado); // Agregar grado
                pst.setString(8, nivel);  // Agregar nivel
                
                int filasInsertadas = pst.executeUpdate();
                if (filasInsertadas > 0) {
                    out.println("<script>alert('Registro exitoso.'); window.location.href='Ingresar.jsp';</script>");
                } else {
                    out.println("<script>alert('Error al registrar.');</script>");
                }

            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<script>alert('Error al registrar: " + e.getMessage() + "');</script>");
            } finally {
                try {
                    if (pst != null) pst.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
