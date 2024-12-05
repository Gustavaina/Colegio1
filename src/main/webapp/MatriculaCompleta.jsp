<%@ page import="java.sql.*, util.MySQLConexion" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Datos Combinados</title>
    <%@include file="shared_styles.jsp" %> <!-- Estilos compartidos -->
    <link rel="stylesheet" href="assets/css/matriculacompleta.css"> <!-- Estilo personalizado -->
</head>
<body>

<%@include file="shared_navbar.jsp" %> <!-- Barra de navegación -->

<h2>TABLA DE MATRICULADOS</h2>

<!-- Tabla para mostrar los datos combinados -->
<div class="table-container">
    <table>
        <thead>
            <tr>
                <!-- Encabezados de las columnas que no son claves primarias ni foráneas -->
                <th>Nombres Apoderado</th>
                <th>Apellidos Apoderado</th>
                <th>Teléfono</th>
                <th>Correo Electrónico</th>
                <th>Dirección</th>
                <th>DNI Alumno</th>
                <th>Nombres Alumno</th>
                <th>Apellidos Alumno</th>
                <th>Teléfono Alumno</th>
                <th>Grado Alumno</th>
                <th>Nivel Alumno</th>
                <th>Descripción Aula</th>
                <th>Tipo Aula</th>
                <th>Sección Aula</th>
                <th>Descripción Turno</th>
                <th>Nombre Curso</th>
                <th>Nivel Curso</th>
                <th>Inicio Curso</th>
                <th>Final Curso</th>
            </tr>
        </thead>
        <tbody>
            <%
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    // Conexión a la base de datos
                    con = MySQLConexion.getConexion();

                    // Consulta SQL con INNER JOIN
                    String sql = "SELECT " +
                                 "a.nombres AS apoderado_nombres, " +
                                 "a.apellidos AS apoderado_apellidos, " +
                                 "a.telefono AS apoderado_telefono, " +
                                 "a.correo_electronico AS apoderado_email, " +
                                 "a.direccion AS apoderado_direccion, " +
                                 "al.alu_dni, " +
                                 "al.alu_nombres, " +
                                 "al.alu_apellidos, " +
                                 "al.alu_telefono, " +
                                 "al.alu_grado, " +
                                 "al.alu_nivel, " +
                                 "au.descrip AS aula_descripcion, " +
                                 "au.tipo_aula, " +
                                 "au.seccion, " +
                                 "t.descripcion AS turno_descripcion, " +
                                 "c.nombre_curso, " +
                                 "c.nivel_curso, " +
                                 "c.inicio_curso, " +
                                 "c.final_curso " +
                                 "FROM apoderados a " +
                                 "INNER JOIN alumno al ON a.id = al.id_apoderado " +
                                 "INNER JOIN aula au ON al.alu_id = au.id_alumno " +
                                 "INNER JOIN turno t ON au.id_turno = t.id_turno " +
                                 "INNER JOIN curso c ON au.cod_curso = c.cod_curso";

                    ps = con.prepareStatement(sql);
                    rs = ps.executeQuery();

                    // Imprimir las filas de datos
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("apoderado_nombres") %></td>
                <td><%= rs.getString("apoderado_apellidos") %></td>
                <td><%= rs.getString("apoderado_telefono") %></td>
                <td><%= rs.getString("apoderado_email") %></td>
                <td><%= rs.getString("apoderado_direccion") %></td>
                <td><%= rs.getString("alu_dni") %></td>
                <td><%= rs.getString("alu_nombres") %></td>
                <td><%= rs.getString("alu_apellidos") %></td>
                <td><%= rs.getString("alu_telefono") %></td>
                <td><%= rs.getString("alu_grado") %></td>
                <td><%= rs.getString("alu_nivel") %></td>
                <td><%= rs.getString("aula_descripcion") %></td>
                <td><%= rs.getString("tipo_aula") %></td>
                <td><%= rs.getString("seccion") %></td>
                <td><%= rs.getString("turno_descripcion") %></td>
                <td><%= rs.getString("nombre_curso") %></td>
                <td><%= rs.getString("nivel_curso") %></td>
                <td><%= rs.getString("inicio_curso") %></td>
                <td><%= rs.getString("final_curso") %></td>
            </tr>
            <%
                    }
                } catch (SQLException e) {
                    out.println("<p style='color: red;'>Error al cargar los datos: " + e.getMessage() + "</p>");
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>
