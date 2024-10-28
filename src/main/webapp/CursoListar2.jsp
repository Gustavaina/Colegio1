<%@ page import="java.sql.*, java.util.*, metodos.CursoPrimariaMetodos, util.MySQLConexion" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Cursos Primaria</title>
    
    <%@include file="shared_styles.jsp" %> <!-- Estilos compartidos -->
    <script>
        function llenarFormulario(aula_id, curso_id, curso_matematica, curso_comunicacion, curso_ingles, cursos_ciencias, curso_arte, curso_edu_fisica, curso_historia) {
            document.getElementById("aula_id").value = aula_id;
            document.getElementById("curso_id").value = curso_id;
            document.getElementById("curso_matematica").value = curso_matematica;
            document.getElementById("curso_comunicacion").value = curso_comunicacion;
            document.getElementById("curso_ingles").value = curso_ingles;
            document.getElementById("cursos_ciencias").value = cursos_ciencias;
            document.getElementById("curso_arte").value = curso_arte;
            document.getElementById("curso_edu_fisica").value = curso_edu_fisica;
            document.getElementById("curso_historia").value = curso_historia;
            
            document.getElementById("accion").value = "editar";
            document.getElementById("botonAgregar").style.display = "none"; // Oculta el botón de agregar
            document.getElementById("botonGuardarCambios").style.display = "inline-block"; // Muestra el botón de guardar cambios
        }
    </script>
    
    <link rel="stylesheet" href="assets/css/crud_primaria.css">
    
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
</head>
<body>

<%@include file="shared_navbar.jsp" %> <!-- Barra de navegación compartida -->

<h2>Lista de Cursos de Primaria</h2>

<a href="AulaListar.jsp" class="button" style="margin-bottom: 20px;">Ir a Registro de Aulas</a>

<%
    CursoPrimariaMetodos metodos = new CursoPrimariaMetodos();
    String accion = request.getParameter("accion");

    if ("insertar".equals(accion)) {
        int aula_id = Integer.parseInt(request.getParameter("aula_id"));
        String curso_matematica = request.getParameter("curso_matematica");
        String curso_comunicacion = request.getParameter("curso_comunicacion");
        String curso_ingles = request.getParameter("curso_ingles");
        String cursos_ciencias = request.getParameter("cursos_ciencias");
        String curso_arte = request.getParameter("curso_arte");
        String curso_edu_fisica = request.getParameter("curso_edu_fisica");
        String curso_historia = request.getParameter("curso_historia");
        
        boolean resultado = metodos.insertarCursoPri(aula_id, curso_matematica, curso_comunicacion, curso_ingles, cursos_ciencias, curso_arte, curso_edu_fisica, curso_historia);
        out.println(resultado ? "Curso agregado correctamente." : "Error al agregar curso.");
        
    } else if ("eliminar".equals(accion)) {
        int cursoId = Integer.parseInt(request.getParameter("curso_id"));
        boolean resultado = metodos.eliminarCursoPri_por_idcurso(cursoId);
        out.println(resultado ? "Curso eliminado correctamente." : "Error al eliminar curso.");
        
    } else if ("editar".equals(accion)) {
        int aula_id = Integer.parseInt(request.getParameter("aula_id"));
        String curso_matematica = request.getParameter("curso_matematica");
        String curso_comunicacion = request.getParameter("curso_comunicacion");
        String curso_ingles = request.getParameter("curso_ingles");
        String cursos_ciencias = request.getParameter("cursos_ciencias");
        String curso_arte = request.getParameter("curso_arte");
        String curso_edu_fisica = request.getParameter("curso_edu_fisica");
        String curso_historia = request.getParameter("curso_historia");
        int curso_id = Integer.parseInt(request.getParameter("curso_id"));
        
        boolean resultado = metodos.actualizarCursoPri(aula_id, curso_matematica, curso_comunicacion, curso_ingles, cursos_ciencias, curso_arte, curso_edu_fisica, curso_historia, curso_id);
        out.println(resultado ? "Curso actualizado correctamente." : "Error al actualizar curso.");
    }
%>

<!-- Formulario para agregar/editar curso -->
<form method="post" action="CursoListar2.jsp" id="formCurso">
    <h3>Agregar Curso</h3>
    <input type="hidden" name="accion" id="accion" value="insertar">
    <input type="hidden" name="curso_id" id="curso_id">
    
    Aula ID: <input type="text" name="aula_id" id="aula_id" required><br>

    <!-- Formulario de Selección de Cursos -->
    Matemática:
    <select name="curso_matematica" id="curso_matematica" required>
        <option value="">Selecciona tu nivel</option>
        <option value="MatematicaBasica">Matematica Basica</option>
        <option value="Matematica 1">Matematica 1</option>
        <option value="Matematica 2">Matematica 2</option>
        <option value="Matematica 3">Matematica 3</option>
        <option value="Aritmetica 1">Aritmetica 1</option>
        <option value="Aritmetica 2">Aritmetica 2</option>
    </select>
    
    Comunicación: 
    <select name="curso_comunicacion" id="curso_comunicacion" required>
        <option value="">Selecciona tu Curso</option>
        <option value="Comunicacion">Comunicacion</option>
        <option value="Comunicacion para 2do">Comunicacion para 2do</option>
        <option value="Razonamiento Verbal 1">Razonamiento Verbal 1</option>
        <option value="Razonamiento Verbal 2">Razonamiento Verbal 2</option>
        <option value="Comunicacion para 5to">Comunicacion para 5to</option>
        <option value="Introducción a Redaccion">Introducción a Redaccion</option>
    </select>
    
    Inglés: 
    <select name="curso_ingles" id="curso_ingles" required>
        <option value="">Selecciona tu Curso</option>
        <option value="Introduccion Ingles 1">Introduccion Ingles 1</option>
        <option value="Introduccion Ingles 2">Introduccion Ingles 2</option>
        <option value="Ingles 1">Ingles 1</option>
        <option value="Ingles 2">Ingles 2</option>
        <option value="Ingles 3">Ingles 3</option>
        <option value="Ingles 4">Ingles 4</option>
    </select>
    
    Ciencias: 
    <select name="cursos_ciencias" id="cursos_ciencias" required>
        <option value="">Selecciona tu Curso</option>
        <option value="Introduccion a las Ciencias">Introduccion a las Ciencias</option>
        <option value="Ciencias 1">Ciencias 1</option>
        <option value="Ciencias 2">Ciencias 2</option>
        <option value="Ciencias 3">Ciencias 3</option>
        <option value="Ciencias 4">Ciencias 4</option>
        <option value="Ciencias 5">Ciencias 5</option>
    </select>
    
    Arte: 
    <select name="curso_arte" id="curso_arte" required>
        <option value="">Selecciona tu Curso</option>
        <option value="Introduccion al Arte">Introduccion al Arte</option>
        <option value="Artes basicas">Artes basicas</option>
        <option value="Arte de pinturas 1">Arte de pinturas 1</option>
        <option value="Arte de pinturas 2">Arte de pinturas 2</option>
        <option value="Arte 1">Arte 1</option>
        <option value="Arte 2">Arte 2</option>
    </select>
    
    Educación Física: 
    <select name="curso_edu_fisica" id="curso_edu_fisica" required>
        <option value="">Selecciona tu Curso</option>
        <option value="Educacion fisica 1">Educacion fisica 1</option>
        <option value="Educacion fisica 2">Educacion fisica 2</option>
        <option value="Educacion fisica 3">Educacion fisica 3</option>
        <option value="Educacion fisica 4">Educacion fisica 4</option>
        <option value="Educacion fisica 5">Educacion fisica 5</option>
        <option value="Educacion fisica 6">Educacion fisica 6</option>
    </select>
    
    Historia: 
    <select name="curso_historia" id="curso_historia" required>
        <option value="">Selecciona tu Curso</option>
        <option value="Introduccion a la historia del peru">Introduccion a la historia del peru</option>
        <option value="Historia del peru 1">Historia del peru 1</option>
        <option value="Historia del peru 2">Historia del peru 2</option>
        <option value="Historia del peru 3">Historia del peru 3</option>
        <option value="Historia de Latinoamerica 1">Historia de Latinoamerica 1</option>
        <option value="Historia de Latinoamerica 2">Historia de Latinoamerica 2</option>
    </select>

    <button type="submit" id="botonAgregar" class="button">Agregar Cursos</button>
    <button type="submit" id="botonGuardarCambios" class="button" style="display:none;">Guardar cambio de cursos</button>
</form>

<hr>

<!-- Tabla para mostrar los cursos -->
<table>
    <tr>
        <th>ID Curso</th>
        <th>Aula ID</th>
        <th>Matemática</th>
        <th>Comunicación</th>
        <th>Inglés</th>
        <th>Ciencias</th>
        <th>Arte</th>
        <th>Educación Física</th>
        <th>Historia</th>
        <th>Acciones</th>
    </tr>

    <%
        Connection con = MySQLConexion.getConexion();
        String sql = "SELECT * FROM cursosprimaria";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int curso_id = rs.getInt("curso_id");
                int aula_id = rs.getInt("aula_id");
                String curso_matematica = rs.getString("curso_matematica");
                String curso_comunicacion = rs.getString("curso_comunicacion");
                String curso_ingles = rs.getString("curso_ingles");
                String cursos_ciencias = rs.getString("cursos_ciencias");
                String curso_arte = rs.getString("curso_arte");
                String curso_edu_fisica = rs.getString("curso_edu_fisica");
                String curso_historia = rs.getString("curso_historia");
    %>
                <tr>
                    <td><%= curso_id %></td>
                    <td><%= aula_id %></td>
                    <td><%= curso_matematica %></td>
                    <td><%= curso_comunicacion %></td>
                    <td><%= curso_ingles %></td>
                    <td><%= cursos_ciencias %></td>
                    <td><%= curso_arte %></td>
                    <td><%= curso_edu_fisica %></td>
                    <td><%= curso_historia %></td>
                    <td>
                        <div class="button-group">
                            <button class="button editar-button" onclick="llenarFormulario('<%= aula_id %>', '<%= curso_id %>', '<%= curso_matematica %>', '<%= curso_comunicacion %>', '<%= curso_ingles %>', '<%= cursos_ciencias %>', '<%= curso_arte %>', '<%= curso_edu_fisica %>', '<%= curso_historia %>');">Editar</button>
                            
                            <form action="CursoListar2.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="accion" value="eliminar">
                                <input type="hidden" name="curso_id" value="<%= curso_id %>">
                                <button class="button eliminar-button" onclick="return confirm('¿Estás seguro de eliminar este curso?');">Eliminar</button>
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
