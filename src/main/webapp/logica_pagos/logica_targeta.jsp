<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String fullName = request.getParameter("full-name");
    String cardNumber = request.getParameter("card-number").replace(" ", ""); 
    String expiryDate = request.getParameter("expiry-date");
    String cvv = request.getParameter("cvv");

    boolean paymentSuccessful = false;

    
    if (fullName != null && !fullName.trim().isEmpty() &&
        cardNumber != null && cardNumber.length() == 16 && 
        (cardNumber.startsWith("4") || cardNumber.startsWith("5")) && 
        expiryDate != null && expiryDate.matches("\\d{2}/\\d{2}") && 
        cvv != null && cvv.length() == 3) {
        
      
        paymentSuccessful = true; 
    }

    
    if (paymentSuccessful) {
        out.println("Pago exitoso. Redirigiendo a la página de éxito...");
        response.sendRedirect("../pago_exitoso.jsp");
    } else {
        out.println("Pago fallido. Redirigiendo a la página de fallo...");
       response.sendRedirect("../pago_fallido.jsp");
    }
%>

