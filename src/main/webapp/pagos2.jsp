<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="util.MySQLConexion" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.SQLException" %>

<%
    String fullName = request.getParameter("full-name"); // Nombre completo
    String phone = request.getParameter("phone"); // Teléfono
    String cardNumber = request.getParameter("pago_numerodetarjeta"); // Número de tarjeta
    String expiryDate = request.getParameter("pago_fechavencimiento"); // MM/AA
    if (expiryDate != null && !expiryDate.isEmpty()) {
        // Convertir la fecha a formato YYYY-MM-DD
        String[] parts = expiryDate.split("/");
        if (parts.length == 2) {
            String month = parts[0];
            String year = parts[1];
            
            // Ajustar el año a un formato completo (por ejemplo, 42 se convierte en 2042)
            int yearInt = Integer.parseInt(year);
            String fullYear = "20" + yearInt; // Asumimos que es en el siglo 21

            // Crear la fecha en formato YYYY-MM-DD
            expiryDate = fullYear + "-" + month + "-01"; // Usamos el primer día del mes
        }
    }

    String cvv = request.getParameter("pago_cvv"); // CVV
    double amountPaid = 50.00; // Monto fijo de pago, ajustalo si es necesario

    // Obtener el ID del apoderado por el nombre completo
    String idApoderado = null;
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        // Conexión a la base de datos
        conn = MySQLConexion.getConexion();
        
        // Consulta para obtener el ID del apoderado basado en el nombre completo
        String query = "SELECT id FROM apoderados WHERE CONCAT(nombres, ' ', apellidos) = ?";
        ps = conn.prepareStatement(query);
        ps.setString(1, fullName);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            idApoderado = rs.getString("id");
        }

        // Si se encontró el apoderado, insertar el pago
        if (idApoderado != null) {
            String insertQuery = "INSERT INTO metododepago (pago_numerodetarjeta, pago_fechavecimiento, pago_cvv, montopagado, id_apoderados) "
                                 + "VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(insertQuery);
            ps.setString(1, cardNumber);
            ps.setString(2, expiryDate);
            ps.setString(3, cvv);
            ps.setDouble(4, amountPaid);
            ps.setString(5, idApoderado);
            int rowsAffected = ps.executeUpdate();
            
            if (rowsAffected > 0) {
                // Redirigir a la página de pago exitoso
                response.sendRedirect("pago_exitoso.jsp");
            } else {
                out.println("<p>Hubo un error al procesar el pago. Intenta nuevamente.</p>");
            }
        
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<p>Error en la base de datos: " + e.getMessage() + "</p>");
    } finally {
        // Cerrar conexiones
        if (rs != null) {
            try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        if (ps != null) {
            try { ps.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
        if (conn != null) {
            try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Pasarela de Pago</title>
    <link rel="stylesheet" type="text/css" href="assets/css/csspagos.css">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const cardNumberInput = document.getElementById('card-number');
            const expiryDateInput = document.getElementById('expiry-date');
            const cvvInput = document.getElementById('cvv');
            const visaIcon = document.querySelector('img[alt="Visa"]');
            const mastercardIcon = document.querySelector('img[alt="Mastercard"]');
            const acceptTermsCheckbox = document.getElementById('accept-terms');
            const confirmPaymentButton = document.getElementById('confirm-payment');

            let cardType = null;

            // Validar fecha de vencimiento
            function validarFechaVencimiento(fecha) {
                const [mes, anio] = fecha.split('/');
                const mesNum = parseInt(mes, 10);
                const anioNum = parseInt(anio, 10) + 2000;
                const fechaActual = new Date();
                const mesActual = fechaActual.getMonth() + 1;
                const anioActual = fechaActual.getFullYear();

                if (mesNum < 1 || mesNum > 12) {
                    alert("El mes debe estar entre 01 y 12.");
                    return false;
                }

                if (anioNum < anioActual || (anioNum === anioActual && mesNum < mesActual)) {
                    alert("La fecha de vencimiento no puede estar en el pasado.");
                    return false;
                }

                return true;
            }

            // Detección de tipo de tarjeta (Visa o Mastercard)
            cardNumberInput.addEventListener('input', function () {
                let cardNumber = cardNumberInput.value.replace(/\s/g, '');
                if (cardNumber.startsWith('4') && cardNumber.length <= 16) {
                    cardType = 'Visa';
                    cvvInput.maxLength = 3;
                    showOnlyIcon(visaIcon);
                } else if (cardNumber.startsWith('5') && cardNumber.length <= 16) {
                    cardType = 'Mastercard';
                    cvvInput.maxLength = 4;
                    showOnlyIcon(mastercardIcon);
                } else {
                    cardType = null;
                    showAllIcons();
                }

                // Formatear el número de tarjeta en bloques de 4
                cardNumber = cardNumber.replace(/(\d{4})(?=\d)/g, '$1 ').trim();
                cardNumberInput.value = cardNumber;
            });

            // Formateo de la fecha de vencimiento en formato MM/AA
            expiryDateInput.addEventListener('input', function () {
                let expiryDate = expiryDateInput.value.replace(/\D/g, '');
                if (expiryDate.length > 2) {
                    expiryDate = expiryDate.slice(0, 2) + '/' + expiryDate.slice(2, 4);
                }
                expiryDateInput.value = expiryDate;
            });

            // Habilitar el botón de pago solo si el usuario acepta los términos
            acceptTermsCheckbox.addEventListener('change', function () {
                confirmPaymentButton.disabled = !acceptTermsCheckbox.checked;
            });

            function showOnlyIcon(icon) {
                visaIcon.style.display = 'none';
                mastercardIcon.style.display = 'none';
                icon.style.display = 'block';
            }

            function showAllIcons() {
                visaIcon.style.display = 'block';
                mastercardIcon.style.display = 'block';
            }
        });
    </script>
</head>
<body>
    <div class="main-content-pago">
        <h2>Pasarela de Pago</h2>
        <div class="payment-header">
            <div class="payment-icons">
                <img src="assets/img/visa1.png" alt="Visa">
                <img src="assets/img/mastercard2.png" alt="Mastercard">
            </div>
        </div>
        
        <!-- Formulario de pago con tarjeta -->
        <form id="card-payment-form" action="" method="post">
            <input type="hidden" name="id_apoderados">
            <!-- Mostrar Nombre Completo y Teléfono desde los parámetros -->
            <div class="form-group">
                <label for="full-name">Nombre Completo:</label>
                <input type="text" id="full-name" name="full-name" value="<%= request.getParameter("nombreCompleto") %>" readonly>
            </div>
            <div class="form-group">
                <label for="phone">Teléfono:</label>
                <input type="text" id="phone" name="phone" value="<%= request.getParameter("telefono") %>" readonly>
            </div>

            <!-- Campos de pago -->
            <div class="form-group">
                <label for="card-number">Número de Tarjeta:</label>
                <input type="text" id="card-number" name="pago_numerodetarjeta" placeholder="XXXX XXXX XXXX XXXX" maxlength="19" required>
            </div>
            <div class="form-group">
                <label for="expiry-date">Fecha de Vencimiento (MM/AA):</label>
                <input type="text" id="expiry-date" name="pago_fechavencimiento" placeholder="MM/AA" required>
            </div>
            <div class="form-group">
                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="pago_cvv" placeholder="CVV" maxlength="4" required>
            </div>

            <!-- Aceptación de términos -->
            <div class="form-group">
                <input type="checkbox" id="accept-terms"> Acepto los términos y condiciones
            </div>

            <!-- Botón de confirmación -->
            <button type="submit" id="confirm-payment" disabled>Confirmar Pago</button>
        </form>
    </div>
</body>
</html>