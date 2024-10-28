<%@ page import="java.sql.*, java.util.*, metodos.CursoSecundariaMetodos, util.MySQLConexion" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Cursos Secundaria</title>
    
    <%@include file="shared_styles.jsp" %> <!-- Estilos compartidos -->
    <script>
        function llenarFormulario(aula_id, cursosec_id, curso_matematica, curso_fisica, curso_redaccion, curso_historia, curso_tutoria, curso_ciencias, curso_ingles, curso_edu_fisica) {
            document.getElementById("aula_id").value = aula_id;
            document.getElementById("cursosec_id").value = cursosec_id;
            document.getElementById("curso_matematica").value = curso_matematica;
            document.getElementById("curso_fisica").value = curso_fisica;
            document.getElementById("curso_redaccion").value = curso_redaccion;
            document.getElementById("curso_historia").value = curso_historia;
            document.getElementById("curso_tutoria").value = curso_tutoria;
            document.getElementById("curso_ciencias").value = curso_ciencias;
            document.getElementById("curso_ingles").value = curso_ingles;
            document.getElementById("curso_edu_fisica").value = curso_edu_fisica;
            
            document.getElementById("accion").value = "editar";
            document.getElementById("botonAgregar").style.display = "none"; // Oculta el botón de agregar
            document.getElementById("botonGuardarCambios").style.display = "inline-block"; // Muestra el botón de guardar cambios
        }
    </script>
    
    <link rel="stylesheet" href="assets/css/crud_alumn.css">
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

<h2>Lista de Cursos de Secundaria</h2>

<a href="AulaListar.jsp" class="button" style="margin-bottom: 20px;">Ir a Registro de Aulas</a>

<%
    CursoSecundariaMetodos metodos = new CursoSecundariaMetodos();
    String accion = request.getParameter("accion");

    if ("insertar".equals(accion)) {
        int aula_id = Integer.parseInt(request.getParameter("aula_id"));
        String curso_matematica = request.getParameter("curso_matematica");
        String curso_fisica = request.getParameter("curso_fisica");
        String curso_redaccion = request.getParameter("curso_redaccion");
        String curso_historia = request.getParameter("curso_historia");
        String curso_tutoria = request.getParameter("curso_tutoria");
        String curso_ciencias = request.getParameter("curso_ciencias");
        String curso_ingles = request.getParameter("curso_ingles");
        String curso_edu_fisica = request.getParameter("curso_edu_fisica");
        
        boolean resultado = metodos.insertaCursoSec(aula_id, curso_matematica, curso_fisica, curso_redaccion, curso_historia, curso_tutoria, curso_ciencias, curso_ingles, curso_edu_fisica);
        out.println(resultado ? "Curso agregado correctamente." : "Error al agregar curso.");
        
    } else if ("eliminar".equals(accion)) {
        int cursosec_id = Integer.parseInt(request.getParameter("cursosec_id"));
        boolean resultado = metodos.eliminarCursoporcursoid(cursosec_id);
        out.println(resultado ? "Curso eliminado correctamente." : "Error al eliminar curso.");
        
    } else if ("editar".equals(accion)) {
        int aula_id = Integer.parseInt(request.getParameter("aula_id"));
        String curso_matematica = request.getParameter("curso_matematica");
        String curso_fisica = request.getParameter("curso_fisica");
        String curso_redaccion = request.getParameter("curso_redaccion");
        String curso_historia = request.getParameter("curso_historia");
        String curso_tutoria = request.getParameter("curso_tutoria");
        String curso_ciencias = request.getParameter("curso_ciencias");
        String curso_ingles = request.getParameter("curso_ingles");
        String curso_edu_fisica = request.getParameter("curso_edu_fisica");
        int cursosec_id = Integer.parseInt(request.getParameter("cursosec_id"));
        
        boolean resultado = metodos.actualizarCursoSec(aula_id, curso_matematica, curso_fisica, curso_redaccion, curso_historia, curso_tutoria, curso_ciencias, curso_ingles, curso_edu_fisica, cursosec_id);
        out.println(resultado ? "Curso actualizado correctamente." : "Error al actualizar curso.");
    }
%>
    
    
<!-- Formulario para agregar/editar curso -->
<form method="post" action="CursoListar.jsp" id="formCurso">
    <h3>Agregar Curso</h3>
    <input type="hidden" name="accion" id="accion" value="insertar">
    <input type="hidden" name="curso_id" id="curso_id">
    
    Aula ID: <input type="text" name="aula_id" id="aula_id" required><br>
    
    <!-- Formulario de Selección de Cursos -->
    Matemática:
    <select name="curso_matematica" id="curso_matematica" required>
        <option value="">Selecciona tu nivel</option>
        <option value="Introduccion Matematica">Introduccion Matematica</option>
        <option value="Matematica 1">Matematica 1</option>
        <option value="Algebra">Matematica 2</option>
        <option value="Matematica 2">Matematica 2</option>
        <option value="Calculo 1">Calculo 1</option>
        <option value="Calculo 2">Calculo 2</option>
    </select>
    <!-- 'Introduccion Matematica','Matematica 1','Algebra','Matematica 2','Calculo 1','Calculo 2' -->
    Física: 
    <select name="curso_fisica" id="curso_fisica" required>
        <option value="">Selecciona tu Curso</option>
        <option value="Introduccion a la Fisica">Introduccion a la Fisica</option>
        <option value="Fisica basica">Fisica basica</option>
        <option value="Fisica ">Fisica 1</option>
        <option value="Fisica 2">Fisica 2</option>
        <option value="Fisica 3">Fisica 3</option>
        <option value="Fisica Avazanda">Fisica Avazanda</option>
    </select>
    <!-- 'Introduccion a la Fisica','Fisica basica','Fisica 1','Fisica 2','Fisica 3','Fisica Avazanda' -->
    Redacción: 
    <select name="curso_redaccion" id="curso_redaccion" required>
        <option value="">Selecciona tu Curso</option>
        <option value="Comunicacion">Comunicacion</option>
        <option value="Comprension y texto 1">Comprension y texto 1</option>
        <option value="Comprension y textos 2">Comprension y textos 2</option>
        <option value="Compresion y etica 1">Compresion y etica 1</option>
        <option value="Compresion y Etica 2">Compresion y Etica 2</option>
        <option value="Etica Avanzada">Etica Avanzada</option>
    </select>
    <!-- Comunicacion','Comprension y texto 1','Comprension y textos 2','Compresion y etica 1','Compresion y Etica 2','Etica Avanzada' -->
    Historia: 
    <select name="curso_historia" id="curso_historia" required>
        <option value="">Selecciona tu Curso</option>
        <option value="Historia de america">Historia de america</option>
        <option value="Historia de Europa 1">Historia de Europa 1</option>
        <option value="Historia de Europa 2">Historia de Europa 2</option>
        <option value="Historia de africa">Historia de africa</option>
        <option value="Historia de asia 1">Historia de asia 1</option>
        <option value="Historia de asia 2">Historia de asia 2</option>
    </select>
    <!-- 'Historia de america','Historia de Europa 1','Historia de Europa 2','Historia de africa','Historia de asia 1','Historia de asia 2' -->
    Tutoria: 
    <select name="curso_tutoria" id="curso_tutoria" required>
        <option value="">Selecciona tu Curso</option>
        <option value="Educacion Personal">Educacion Personal</option>
        <option value="Tutoria 1">Tutoria 1</option>
        <option value="Tutoria 2">Tutoria 2</option>
        <option value="Tutoria 3">Tutoria 3</option>
        <option value="Psicologia 1">Psicologia 1</option>
        <option value="Psicologia 2">Psicologia 2</option>
    </select>
    <!-- 'Educacion Personal','Educacion Personal','Tutoria 2','Tutoria 3','Psicologia 1','Psicologia 2' -->
    Ciencias:
    <select name="curso_ciencias" id="curso_ciencias" required>
        <option value="">Selecciona tu Curso</option>
        <option value="Ciencias y Tecnologia 1">Ciencias y Tecnologia 1</option>
        <option value="Ciencias y Tecnologia 2">Ciencias y Tecnologia 2</option>
        <option value="Ciencias y Tecnologia 3">Ciencias y Tecnologia 3</option>
        <option value="Ciencias y Tecnologia 4">Ciencias y Tecnologia 4</option>
        <option value="Ciencias y tecnologia Avanzada 1">Ciencias y tecnologia Avanzada 1</option>
        <option value="Ciencias y tecnologia Avanzada 2">Ciencias y tecnologia Avanzada 2</option>
    </select>
    <!-- 'Ciencias y Tecnologia 1','Ciencias y tecnologia 2','Ciencias y tecnologia 3','Ciencias y tecnologia 4','Ciencias y tecnologia Avanzada 1','Ciencas y Tecnologia Avanzada 2' -->
    Inglés: 
    <select name="curso_ingles" id="curso_ingles" required>
        <option value="">Selecciona tu Curso</option>
        <option value="Ingles 1">Ingles 1</option>
        <option value="Ingles 2">Ingles 2</option>
        <option value="Ingles 3">Ingles 3</option>
        <option value="Ingles avanzada 1">Ingles avanzada 1</option>
        <option value="Ingles avanzada 2">Ingles avanzada 2</option>
        <option value="Business ingles">Business ingles</option>
    </select>
    <!-- 'Ingles 1','Ingles 2','Ingles 3','Ingles avanzada 1','Ingles avanzada 2','Business ingles' -->
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
    <!-- 'Educacion fisica 1','Educacion fisica 2','Educacion fisica 3','Educacion fisica 4','Educacion fisica 5','Educacion fisica 6' -->
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
        <th>Fisica</th>
        <th>Redacción</th>
        <th>Historia</th>
        <th>Tutoria</th>
        <th>Ciencias</th>
        <th>Inglés</th>
        <th>Educación Física</th>
        <th>Acciones</th>
    </tr>
     <%
        Connection con = MySQLConexion.getConexion();
        String sql = "SELECT * FROM cursossecundaria";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int cursosec_id = rs.getInt("cursosec_id");
                int aula_id = rs.getInt("aula_id");
                String curso_matematica = rs.getString("curso_matematica");
                String curso_fisica = rs.getString("curso_fisica");
                String curso_redaccion = rs.getString("curso_redaccion");
                String curso_historia = rs.getString("curso_historia");
                String curso_tutoria = rs.getString("curso_tutoria");
                String curso_ciencias = rs.getString("curso_ciencias");
                String curso_ingles = rs.getString("curso_ingles");
                String curso_edu_fisica = rs.getString("curso_edu_fisica");
    %>
    <tr>
                    <td><%= cursosec_id %></td>
                    <td><%= aula_id %></td>
                    <td><%= curso_matematica %></td>
                    <td><%= curso_fisica %></td>
                    <td><%= curso_redaccion %></td>
                    <td><%= curso_historia %></td>
                    <td><%= curso_tutoria %></td>
                    <td><%= curso_ciencias %></td>
                    <td><%= curso_ingles %></td>
                    <td><%= curso_edu_fisica %></td>
                    <td>
                        <div class="button-group">
                            <button class="button editar-button" onclick="llenarFormulario('<%= aula_id %>', '<%= curso_matematica %>', '<%= curso_fisica %>', '<%= curso_redaccion %>', '<%= curso_historia %>', '<%= curso_tutoria %>', '<%= curso_ciencias %>', '<%= curso_ingles %>', '<%= curso_edu_fisica %>');">Editar</button>
                            
                            <form action="CursoListar.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="accion" value="eliminar">
                                <input type="hidden" name="curso_id" value="<%= cursosec_id %>">
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