<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Pasarela de Pago</title>
    <link rel="stylesheet" type="text/css" href="assets/css/csspagos.css">
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            const cardNumberInput = document.getElementById('card-number');
            const expiryDateInput = document.getElementById('expiry-date');
            const cvvInput = document.getElementById('cvv');
            const fullNameInput = document.getElementById('full-name');
            const cellPhoneInput = document.getElementById('cell-phone'); 
            const visaIcon = document.querySelector('img[alt="Visa"]');
            const mastercardIcon = document.querySelector('img[alt="Mastercard"]');
            const yapeButton = document.getElementById('yape-button');
            const yapeForm = document.getElementById('yape-form');
            const cardPaymentForm = document.getElementById('card-payment-form');
            const paymentIcons = document.querySelector('.payment-icons');
            const paymentHeader = document.querySelector('.payment-header');
            
            cardPaymentForm.addEventListener('submit', function(event) {
                
                if (fullNameInput.value.trim() === '') {
                    alert('Por favor, introduzca su nombre completo.');
                    event.preventDefault();  
                    return;
                }

                
                let cardNumber = cardNumberInput.value.replace(/\s/g, '');
                if (cardNumber.length !== 16 || (!cardNumber.startsWith('4') && !cardNumber.startsWith('5'))) {
                    alert('Por favor, introduzca un número de tarjeta válido.');
                    event.preventDefault(); 
                    return;
                }

                
                let expiryDate = expiryDateInput.value;
                if (!/^\d{2}\/\d{2}$/.test(expiryDate)) {
                    alert('Por favor, introduzca una fecha de vencimiento válida en el formato MM/AA.');
                    event.preventDefault();  
                    return;
                }

                
                let cvv = cvvInput.value.replace(/\D/g, '');
                if (cvv.length !== 3) {
                    alert('Por favor, introduzca un CVV válido (3 dígitos).');
                    event.preventDefault();  
                    return;
                }
            });

           
            yapeButton.addEventListener('click', function() {
                cardPaymentForm.style.display = 'none';
                yapeForm.style.display = 'block';
                paymentIcons.style.display = 'none'; 
                yapeButton.style.display = 'none'; 
                document.getElementById('card-button').style.display = 'block';
                paymentHeader.style.display = 'none'; 
            });

            
            document.getElementById('card-button').addEventListener('click', function() {
                cardPaymentForm.style.display = 'block';
                yapeForm.style.display = 'none';
                paymentIcons.style.display = 'block'; 
                yapeButton.style.display = 'block'; 
                this.style.display = 'none'; 
                paymentHeader.style.display = 'block'; 
            });

           
            cardNumberInput.addEventListener('input', function (e) {
                let cardNumber = cardNumberInput.value.replace(/\s/g, '');
                
                if (cardNumber.length > 16) {
                    cardNumber = cardNumber.slice(0, 16);
                }
                
                cardNumber = cardNumber.replace(/(\d{4})(?=\d)/g, '$1 ').trim();
                cardNumberInput.value = cardNumber;

               
                if (cardNumber.startsWith('4') && cardNumber.length === 19) {
                  
                    showOnlyIcon(visaIcon);
                } else if (cardNumber.startsWith('5') && cardNumber.length === 19) {
                    
                    showOnlyIcon(mastercardIcon);
                } else {
                    showAllIcons();
                }
            });

            // AQUI SE FORMATEA LAS TR
            expiryDateInput.addEventListener('input', function () {
                let expiryDate = expiryDateInput.value.replace(/\D/g, '');

                
                if (expiryDate.length > 4) {
                    expiryDate = expiryDate.slice(0, 4);
                }

             
                if (expiryDate.length > 2) {
                    expiryDate = expiryDate.slice(0, 2) + '/' + expiryDate.slice(2);
                }

              
                let month = expiryDate.slice(0, 2);
                if (month.length === 2 && (parseInt(month) < 1 || parseInt(month) > 12)) {
                    expiryDate = '';
                }

                expiryDateInput.value = expiryDate;
            });

           
            cvvInput.addEventListener('input', function () {
                let cvv = cvvInput.value.replace(/\D/g, '');
                if (cvv.length > 3) {
                    cvv = cvv.slice(0, 3);
                }
                cvvInput.value = cvv;
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
        
       
        <form id="card-payment-form" action="logica_pagos/logica_targeta.jsp" method="post">
    <div class="form-group">
        <label for="full-name">Nombre Completo:</label>
        <input type="text" id="full-name" name="full-name" placeholder="Ingrese su nombre completo" required>
    </div>
    <div class="form-group">
        <label for="card-number">Número de Tarjeta:</label>
        <input type="text" id="card-number" name="card-number" placeholder="XXXX XXXX XXXX XXXX" required>
    </div>
    <div class="form-group">
        <label for="expiry-date">Fecha de Vencimiento (MM/AA):</label>
        <input type="text" id="expiry-date" name="expiry-date" placeholder="MM/AA" required>
    </div>
    <div class="form-group">
        <label for="cvv">CVV:</label>
        <input type="text" id="cvv" name="cvv" placeholder="CVV" required>
    </div>
    <button type="submit" class="btn-pagar-targeta">Pagar con Tarjeta</button>
    <button type="button" id="yape-button">Pagar con Yape</button>
</form>


       
<form id="yape-form" style="display: none;" action="logica_pagos/logica_yape.jsp" method="post">
    <div class="form-group">
        <label for="yape-name">Nombre Completo:</label>
        <input type="text" id="yape-name" name="yape-name" placeholder="Ingrese su nombre completo" required>
    </div>
    <div class="form-group">
        <label for="cell-phone">Número de Celular:</label>
        <input type="text" id="cell-phone" name="cell-phone" placeholder="Ingrese su número de celular" required>
    </div>
    <img class="qr-code" src="assets/img/yape.jpg" alt="Código QR Yape">
    <button type="submit" class="btn-yape">Confirmar pago con Yape</button>
    <button type="button" id="card-button" style="display: none;">Volver al Pago con Tarjeta</button>
</form>


        <div class="terms-total-container">
            <p class="terms-and-conditions"><input type="checkbox" required> He leído y acepto los <a href="#">términos y condiciones</a>.</p>
            <div class="total-container">
                <p>Total: <span id="total-amount">S/. 50.00</span></p>
            </div>
        </div>
    </div>
    
</body>
</html>

