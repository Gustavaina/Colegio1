<%@ page import="java.sql.*, metodos.TurnoMetodos, util.MySQLConexion" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Turnos</title>
    
    <%@include file="shared_styles.jsp" %> <!-- Coloca aquí los estilos compartidos -->
    <script>
        function llenarFormulario(idTurno, descripcion) {
            document.getElementById("id_turno").value = idTurno;
            document.getElementById("descripcion").value = descripcion;

            document.getElementById("accion").value = "editar";
            document.getElementById("botonAgregar").style.display = "none";
            document.getElementById("botonGuardarCambios").style.display = "inline-block";
        }
    </script>
    
    <link rel="stylesheet" href="assets/css/crud_primaria.css">
    <style>
        /* Estilos para los botones de editar y eliminar */
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

<h2>Lista de Turnos</h2>

<%
    // Lógica para insertar, actualizar o eliminar según el formulario enviado
    TurnoMetodos metodos = new TurnoMetodos();
    String accion = request.getParameter("accion");

    if ("insertar".equals(accion)) {
        String descripcion = request.getParameter("descripcion");
        
        boolean resultado = metodos.insertarTurno(descripcion);
        out.println(resultado ? "Turno agregado correctamente." : "Error al agregar turno.");
    } else if ("eliminar".equals(accion)) {
        int idTurno = Integer.parseInt(request.getParameter("id_turno"));
        boolean resultado = metodos.eliminarTurno(idTurno);
        out.println(resultado ? "Turno eliminado correctamente." : "Error al eliminar turno.");
    } else if ("editar".equals(accion)) {
        int idTurno = Integer.parseInt(request.getParameter("id_turno"));
        String descripcion = request.getParameter("descripcion");
        
        boolean resultado = metodos.actualizarTurno(idTurno, descripcion);
        out.println(resultado ? "Turno actualizado correctamente." : "Error al actualizar turno.");
    }
%>

<!-- Formulario para agregar/editar turno -->
<form method="post" action="TurnoListar.jsp" id="formTurno">
    <h3>Agregar Turno</h3>
    <input type="hidden" name="accion" id="accion" value="insertar">
    <input type="hidden" name="id_turno" id="id_turno">

    Descripción: <input type="text" name="descripcion" id="descripcion" required><br>

    <button type="submit" id="botonAgregar" class="button">Agregar Turno</button>
    <button type="submit" id="botonGuardarCambios" class="button" style="display:none;">Guardar Cambios</button>
</form>

<hr>

<!-- Tabla para mostrar los turnos -->
<table>
    <tr>
        <th>ID Turno</th>
        <th>Descripción</th>
        <th>Acciones</th>
    </tr>

    <%
        Connection con = MySQLConexion.getConexion();
        String sql = "SELECT * FROM turno";
        try (PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                int idTurno = rs.getInt("id_turno");
                String descripcion = rs.getString("descripcion");
    %>
                <tr>
                    <td><%= idTurno %></td>
                    <td><%= descripcion %></td>
                    <td>
                        <div class="button-group">
                            <!-- Botón para eliminar turno -->
                            <form action="TurnoListar.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="accion" value="eliminar">
                                <input type="hidden" name="id_turno" value="<%= idTurno %>">
                                <button type="submit" class="button eliminar-button" onclick="return confirm('¿Estás seguro de eliminar este turno?');">Eliminar</button>
                            </form>
                            <!-- Botón para editar turno -->
                            <button class="button editar-button" onclick="llenarFormulario('<%= idTurno %>', '<%= descripcion %>');">Editar</button>
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
