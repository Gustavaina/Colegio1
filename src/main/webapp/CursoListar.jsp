<%@ page import="java.sql.*, metodos.CursoMetodos, util.MySQLConexion" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Cursos</title>
    
    <%@include file="shared_styles.jsp" %> <!-- Coloca aquí los estilos compartidos -->
    
    <script>
        function llenarFormulario(codCurso, idCurso, nombreCurso, nivelCurso, inicioCurso, finalCurso) {
            document.getElementById("cod_curso").value = codCurso;
            document.getElementById("id_curso").value = idCurso;
            document.getElementById("nombre_curso").value = nombreCurso;
            document.getElementById("nivel_curso").value = nivelCurso;
            document.getElementById("inicio_curso").value = inicioCurso;
            document.getElementById("final_curso").value = finalCurso;
            
            document.getElementById("accion").value = "editar";
            document.getElementById("botonAgregar").style.display = "none";
            document.getElementById("botonGuardarCambios").style.display = "inline-block";
        }
    </script>
    
    <script>
        function validarFormulario() {
            // Valida el formato de los campos datetime
            var inicioCurso = document.getElementById("inicio_curso").value;
            var finalCurso = document.getElementById("final_curso").value;
            
            var regex = /^\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}$/; // Formato YYYY-MM-DD HH:MM:SS
            
            if (!regex.test(inicioCurso) || !regex.test(finalCurso)) {
                alert("Por favor, ingrese las fechas en el formato correcto: YYYY-MM-DD HH:MM:SS");
                return false; // Impide el envío del formulario
            }
            return true; // Permite enviar el formulario
        }
    </script>
    
    <link rel="stylesheet" href="assets/css/crud_secundaria.css">
    <style>
        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        .button-group button {
            margin: 0;
        }
    </style>
</head>
<body>

<%@include file="shared_navbar.jsp" %> <!-- Barra de navegación compartida -->

<h2>Lista de Cursos</h2>

<a href="AulaListar.jsp" class="button" style="margin-bottom: 20px;">Ir a Registro de Aulas</a>

<%
    // Lógica para insertar, actualizar o eliminar según el formulario enviado
    CursoMetodos metodos = new CursoMetodos();
    String accion = request.getParameter("accion");

    if ("insertar".equals(accion)) {
        String idCurso = request.getParameter("id_curso");
                String nombreCurso = request.getParameter("nombre_curso");
                String nivelCurso = request.getParameter("nivel_curso");
                String inicioCurso = request.getParameter("inicio_curso");
                String finalCurso = request.getParameter("final_curso");

                

        boolean resultado = metodos.insertarCurso(idCurso, nombreCurso, nivelCurso, inicioCurso, finalCurso);
        out.println(resultado ? "Curso agregado correctamente." : "Error al agregar curso.");
    } else if ("eliminar".equals(accion)) {
        int codCurso = Integer.parseInt(request.getParameter("cod_curso"));
        boolean resultado = metodos.eliminarCurso(codCurso);
        out.println(resultado ? "Curso eliminado correctamente." : "Error al eliminar curso.");
    } else if ("editar".equals(accion)) {
        int codCurso = Integer.parseInt(request.getParameter("cod_curso"));
        String idCurso = request.getParameter("id_curso");
        String nombreCurso = request.getParameter("nombre_curso");
        String nivelCurso = request.getParameter("nivel_curso");
        String inicioCurso = request.getParameter("inicio_curso");
        String finalCurso = request.getParameter("final_curso");
        
        boolean resultado = metodos.actualizarCurso(codCurso, idCurso, nombreCurso, nivelCurso, inicioCurso, finalCurso);
        out.println(resultado ? "Curso actualizado correctamente." : "Error al actualizar curso.");
    }
%>

<!-- Formulario para agregar/editar curso -->
 <form method="post" action="CursoListar.jsp" id="formCurso" onsubmit="return validarFormulario();">
    <h3>Agregar Curso</h3>
    <input type="hidden" name="accion" id="accion" value="insertar">
    <input type="hidden" name="cod_curso" id="cod_curso">
    
    ID Curso: <input type="text" name="id_curso" id="id_curso" required><br>
    Nombre Curso: <input type="text" name="nombre_curso" id="nombre_curso" required><br>
    Nivel Curso: <input type="text" name="nivel_curso" id="nivel_curso" required><br>
    Inicio Curso (AÑO-MES-DIA HORAS:MIN:SEG): <input type="text" name="inicio_curso" id="inicio_curso" required><br>
    Final Curso (AÑO-MES-DIA HORAS:MIN:SE): <input type="text" name="final_curso" id="final_curso" required><br>

    <button type="submit" id="botonAgregar" class="button">Agregar Curso</button>
    <button type="submit" id="botonGuardarCambios" class="button" style="display:none;">Guardar Cambios</button>
</form>

<hr>

<!-- Tabla para mostrar los cursos -->
<table>
    <tr>
        <th>Código</th>
        <th>ID Curso</th>
        <th>Nombre Curso</th>
        <th>Nivel Curso</th>
        <th>Inicio Curso</th>
        <th>Final Curso</th>
        <th>Acciones</th>
    </tr>

    <%
        Connection con = MySQLConexion.getConexion();
        String sql = "SELECT * FROM curso";
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int codCurso = rs.getInt("cod_curso");
                String idCurso = rs.getString("id_curso");
                String nombreCurso = rs.getString("nombre_curso");
                String nivelCurso = rs.getString("nivel_curso");
                String inicioCurso = rs.getString("inicio_curso");
                String finalCurso = rs.getString("final_curso");
    %>
                <tr>
                    <td><%= codCurso %></td>
                    <td><%= idCurso %></td>
                    <td><%= nombreCurso %></td>
                    <td><%= nivelCurso %></td>
                    <td><%= inicioCurso %></td>
                    <td><%= finalCurso %></td>
                    <td>
                        <div class="button-group">
                            <!-- Botón para eliminar curso -->
                            <form action="CursoListar.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="accion" value="eliminar">
                                <input type="hidden" name="cod_curso" value="<%= codCurso %>">
                                <button type="submit" class="button eliminar-button" onclick="return confirm('¿Estás seguro de eliminar este curso?');">Eliminar</button>
                            </form>
                            <!-- Botón para editar curso -->
                            <button class="button editar-button" onclick="llenarFormulario('<%= codCurso %>', '<%= idCurso %>', '<%= nombreCurso %>', '<%= nivelCurso %>', '<%= inicioCurso %>', '<%= finalCurso %>');">Editar</button>
                        </div>
                    </td>
                </tr>
    <%
            }
        } catch (SQLException e) {
            out.println("Error al cargar los datos: " + e.getMessage());
        } finally {
            if (con != null) con.close();
        }
    %>
</table>

</body>
</html>
