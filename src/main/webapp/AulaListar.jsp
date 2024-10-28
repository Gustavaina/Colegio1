<%@ page import="java.sql.*, java.util.*, metodos.AulaMetodos, util.MySQLConexion" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Aulas</title>
    
    <%@include file="shared_styles.jsp" %> <!-- Estilos compartidos -->
    <script>
        function llenarFormulario(alum_id, aula_id, aula_seccion, aula_grado, aula_nivel) {
            
            document.getElementById("alum_id").value = alum_id;
            document.getElementById("aula_id").value = aula_id; // ID para actualizar o eliminar 
            document.getElementById("aula_seccion").value = aula_seccion;
            document.getElementById("aula_grado").value = aula_grado;
            document.getElementById("aula_nivel").value = aula_nivel;
            
            document.getElementById("accion").value = "editar";
            document.getElementById("botonAgregar").style.display = "none";
            document.getElementById("botonGuardarCambios").style.display = "inline-block";
        }
    </script>
        <style>
        /* Estilos para los botones de editar y eliminar */
        .button-group {
            display: flex; /* Utiliza flexbox para alinear los botones */
            justify-content: center; /* Centra el grupo de botones */
            gap: 10px; /* Espacio entre los botones */
        }
        .button-group button {
            margin: 0; /* Asegura que no haya margen alrededor de los botones */
        }
    </style>
    <link rel="stylesheet" href="assets/css/crud_secundaria.css">
</head>
<body>

<%@include file="shared_navbar.jsp" %> <!-- Barra de navegación compartida -->

<h2>Lista de Aulas</h2>

<a href="AlumnoListar.jsp" class="button" style="margin-bottom: 20px;">Ir a Registro de los Alumnos Matriculados</a>
<a href="CursoListar2.jsp" class="button" style="margin-bottom: 20px;">Ir a Registro de Cursos de Nivel Primaria</a>
<a href="CursoListar.jsp" class="button" style="margin-bottom: 20px;">Ir a Registro de Cursos de Nivel Secundaria</a>

<%
    AulaMetodos metodos = new AulaMetodos();
    String accion = request.getParameter("accion");

    if ("insertar".equals(accion)) {
        String aula_seccion = request.getParameter("aula_seccion");
        int alum_id = Integer.parseInt(request.getParameter("alum_id"));
        String aula_grado = request.getParameter("aula_grado");
        String aula_nivel = request.getParameter("aula_nivel");
        boolean resultado = metodos.insertarAula(aula_seccion, alum_id, aula_grado, aula_nivel);
        out.println(resultado ? "Aula agregada correctamente." : "Error al agregar aula.");
        
    } else if ("eliminar".equals(accion)) {
        int aula_id = Integer.parseInt(request.getParameter("aula_id"));
        boolean resultado = metodos.eliminarAulaporaula_id(aula_id);
        out.println(resultado ? "Aula eliminada correctamente." : "Error al eliminar aula.");
        
    } else if ("editar".equals(accion)) {
        String aula_seccion = request.getParameter("aula_seccion");
        int alum_id = Integer.parseInt(request.getParameter("alum_id"));
        int aula_id = Integer.parseInt(request.getParameter("aula_id"));
        String aula_grado = request.getParameter("aula_grado");
        String aula_nivel = request.getParameter("aula_nivel");
        boolean resultado = metodos.actualizarAula(alum_id, aula_seccion, aula_grado, aula_nivel, aula_id);
        out.println(resultado ? "Aula actualizada correctamente." : "Error al actualizar aula.");
    }
%>

<!-- Formulario para agregar/editar aula -->
<form method="post" action="AulaListar.jsp" id="formAula">
    <h3>Agregar Aula</h3>
    <input type="hidden" name="accion" id="accion" value="insertar">
    <input type="hidden" name="aula_id" id="aula_id"> <!-- ID para actualizar o eliminar -->
    
    Alumno ID: <input type="text" name="alum_id" id="alum_id" required><br>
    
    Sección: 
    <select name="aula_seccion" id="aula_seccion" required>
        <option value="A">A</option>
        <option value="B">B</option>
    </select>
    
    Aulagrado:
    <select name="aula_grado" id="aula_grado" required>
        <option value="Primer grado">Primer grado</option>
        <option value="Segundo grado">Segundo grado</option>
        <option value="Tercer grado">Tercer grado</option>
        <option value="Cuarto grado">Cuarto grado</option>
        <option value="Quinto grado">Quinto grado</option>
        <option value="Sexto grado">Sexto grado</option>
    </select>
    
    Nivel:
    <select id="aula_nivel" name="aula_nivel" required>
        <option value="">Selecciona tu nivel</option>
        <option value="Primaria">Primaria</option>
        <option value="Secundaria">Secundaria</option>
    </select>
    
    <button type="submit" id="botonAgregar" class="button">Agregar Aula</button>
    <button type="submit" id="botonGuardarCambios" class="button" style="display:none;">Guardar Cambios</button>
</form>

<hr>

<!-- Tabla para mostrar las aulas -->
<table>
    <tr>
        <th>ID Aula</th>
        <th>Alumno ID</th>
        <th>Sección</th>
        <th>Grado</th>
        <th>Nivel</th>
        <th>Acciones</th>
    </tr>

    <%
        Connection con = MySQLConexion.getConexion();
        String sql = "SELECT * FROM aula";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                String aula_seccion = rs.getString("aula_seccion");
                int alum_id = rs.getInt("alum_id");
                String aula_grado= rs.getString("aula_grado");
                String aula_nivel=rs.getString("aula_nivel");
                int aula_id = rs.getInt("aula_id");
    %>
                <tr>
                    <td><%= aula_id %></td>
                    <td><%= alum_id %></td>
                    <td><%= aula_seccion %></td>
                    <td><%= aula_grado %></td>
                    <td><%= aula_nivel %></td>
                    <td>
                        <div class="button-group">
                            <!-- Botón para editar aula -->
                            <button class="button editar-button" onclick="llenarFormulario('<%= alum_id %>', '<%= aula_seccion %>','<%= aula_grado %>', '<%= aula_nivel %>');">Editar</button>
                            
                            <!-- Botón para eliminar aula -->
                            <form action="AulaListar.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="accion" value="eliminar">
                                <input type="hidden" name="aula_id" value="<%= aula_id %>">
                                <button class="button eliminar-button" onclick="return confirm('¿Estás seguro de eliminar este aula?');">Eliminar</button>
                            </form>
                        </div>
                    </td>
                </tr>
    <%
            }
            rs.close();
            ps.close();
        } catch (SQLException e) {
            out.println("Error al cargar los datos: " + e.getMessage());
        } finally {
            try { if (con != null) con.close(); } catch (SQLException ex) {}
        }
    %>
</table>

</body>
</html>
