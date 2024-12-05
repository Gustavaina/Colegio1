<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="metodos.metApoderado"%>
<%@page import="util.MySQLConexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
        <%@include file="shared_styles.jsp" %> <!-- Estilos compartidos -->
    <%@include file="shared_navbar.jsp" %> <!-- Barra de navegación compartida -->
    <title>Lista de Apoderados</title>
    <link rel="stylesheet" href="assets/css/crud_apoderados.css">
    <script>
        // Función para llenar el formulario con los datos del apoderado a editar
        function llenarFormulario(fila) {
            var celdas = fila.getElementsByTagName("td");
            document.getElementById("id").value = celdas[0].innerText; // Suponiendo que el ID está en la primera columna

            document.getElementById("nombre").value = celdas[1].innerText;
            document.getElementById("apellidos").value = celdas[2].innerText;
            document.getElementById("telefono").value = celdas[3].innerText;
            document.getElementById("correo").value = celdas[4].innerText;
            document.getElementById("direccion").value = celdas[5].innerText;
            document.getElementById("dniMenor").value = celdas[6].innerText;
            document.getElementById("sexo").value = celdas[7].innerText;
            document.getElementById("dniApoderado").value = celdas[8].innerText;

            document.getElementById("accion").value = "editar";
            document.getElementById("botonAgregar").style.display = "none";
            document.getElementById("botonGuardarCambios").style.display = "inline-block";
        }

        // Función para validar el teléfono (debe comenzar con 9 y tener 9 dígitos)
        // Función para validar el teléfono (debe ser exactamente 9 dígitos numéricos)
            function validarFormulario() {
                var telefono = document.getElementById("telefono").value;

                // Validación: debe ser un número de 9 dígitos
                if (!/^\d{9}$/.test(telefono)) {
                    alert("El número de teléfono debe tener exactamente 9 dígitos.");
                    return false;
                }
                return true;
            }

    </script>
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

<h2>Lista de Apoderados</h2>

<a href="AlumnoListar.jsp" class="button" style="margin-bottom: 20px;">Ir a Registro de los Alumnos Matriculados</a>

<% 
    String accion = request.getParameter("accion");
    metApoderado apoderadoManager = new metApoderado();
    
    if (accion != null) {
        try {
            if (accion.equals("insertar")) {
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");
                String telefono = request.getParameter("telefono");
                String correo = request.getParameter("correo");
                String direccion = request.getParameter("direccion");
                String dniMenor = request.getParameter("dniMenor");
                String sexo = request.getParameter("sexo");
                String dniApoderado = request.getParameter("dniApoderado");
                apoderadoManager.agregarApoderado(nombre, apellidos, telefono, correo, direccion, dniMenor, sexo, dniApoderado);
            } 
            else if (accion.equals("editar")) {
                String nombre = request.getParameter("nombre");
                String apellidos = request.getParameter("apellidos");
                String telefono = request.getParameter("telefono");
                String correo = request.getParameter("correo");
                String direccion = request.getParameter("direccion");
                String dniMenor = request.getParameter("dniMenor");
                String sexo = request.getParameter("sexo");
                String dniApoderado = request.getParameter("dniApoderado");
                int id = Integer.parseInt(request.getParameter("id"));  // Convertimos el id a entero

                apoderadoManager.editarApoderado(nombre, apellidos, telefono, correo, direccion, dniMenor, sexo, dniApoderado, id); // Pasar el id
            }
            else if (accion.equals("eliminar")) {
                String dniApoderado = request.getParameter("dniApoderado");
                apoderadoManager.eliminarApoderado(dniApoderado);
            }
        } catch (SQLException e) {
            out.println("Error al realizar la acción: " + e.getMessage());
        } catch (NumberFormatException e) {
            out.println("Error: el ID proporcionado no es válido.");
        }
    }
%>

<form method="post" action="RegistroApoderados.jsp" id="formApoderado" onsubmit="return validarFormulario();">
    <h3>Agregar Apoderado</h3>
    <input type="hidden" name="accion" id="accion" value="insertar">
    <input type="hidden" name="id" id="id"> <!-- Campo oculto para el ID -->
    Nombre: <input type="text" name="nombre" id="nombre" required><br>
    Apellidos: <input type="text" name="apellidos" id="apellidos" required><br>
    Teléfono: <input type="text" name="telefono" id="telefono" maxlength="9" pattern="[0-9]{9}" required oninput="validarTelefono()" title="El número de teléfono debe ser solo 9 dígitos numéricos."><br>

    <label for="correo">Correo Electrónico:</label>
<input type="email" name="correo" id="correo" required>

    
    <br>
    
    Dirección: <input type="text" name="direccion" id="direccion" required><br>
    DNI del Menor: <input type="text" name="dniMenor" id="dniMenor" maxlength="8" pattern="[0-9]{8}" required oninput="validarDNI('dniMenor')"><br>


    Sexo: 
    <select name="sexo" id="sexo" required>
        <option value="Masculino">Masculino</option>
        <option value="Femenino">Femenino</option>
        <option value="Otro">Otro</option>
    </select><br>
    DNI del Apoderado: <input type="text" name="dniApoderado" id="dniApoderado" maxlength="8" pattern="[0-9]{8}" required oninput="validarDNI('dniApoderado')"><br>
    
    <div class="button-group">
        <button type="submit" id="botonAgregar" class="button">Agregar Apoderado</button>
        <button type="submit" id="botonGuardarCambios" class="button" style="display:none;">Guardar Cambios</button>
    </div>
</form>

<hr>

<table>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Apellidos</th>
        <th>Teléfono</th>
        <th>Correo Electrónico</th>
        <th>Dirección</th>
        <th>DNI del Menor</th>
        <th>Sexo</th>
        <th>DNI del Apoderado</th>
        <th>Acciones</th>
    </tr>

<% 
    Connection con = MySQLConexion.getConexion();
    String sql = "SELECT * FROM apoderados"; // Cambia a tu tabla correcta
    try {
        PreparedStatement ps = con.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            int id = rs.getInt("id");
            String nombre = rs.getString("nombres");
            String apellidos = rs.getString("apellidos");
            String telefono = rs.getString("telefono");
            String correo = rs.getString("correo_electronico");
            String direccion = rs.getString("direccion");
            String dniMenor = rs.getString("dni_menor");
            String sexo = rs.getString("sexo");
            String dniApoderado = rs.getString("dni_apoderado");
%>
            <tr onclick="llenarFormulario(this)">
                <td><%= id %></td>
                <td><%= nombre %></td>
                <td><%= apellidos %></td>
                <td><%= telefono %></td>
                <td><%= correo %></td>
                <td><%= direccion %></td>
                <td><%= dniMenor %></td>
                <td><%= sexo %></td>
                <td><%= dniApoderado %></td>
                <td>
                    <form action="RegistroApoderados.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="accion" value="eliminar">
                        <input type="hidden" name="dniApoderado" value="<%= dniApoderado %>">
                        <button type="submit" class="button eliminar-button" onclick="return confirm('¿Estás seguro de eliminar este apoderado?')">Eliminar</button>
                    </form>
                </td>
            </tr>
<% 
        }
    } catch (SQLException e) {
        out.println("Error en la consulta: " + e.getMessage());
    }
%>
</table>

</body>
</html>
