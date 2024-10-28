<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String yapeName = request.getParameter("yape-name");
    String cellPhone = request.getParameter("cell-phone");
    
    boolean paymentSuccessful = false;

    if (yapeName != null && !yapeName.trim().isEmpty() && 
        cellPhone != null && cellPhone.matches("\\d{9}")) {
        paymentSuccessful = true;
    }

    if (paymentSuccessful) {
        response.sendRedirect("../pago_exitoso.jsp");
    } else {
        response.sendRedirect("../pago_fallido.jsp");
    }
%>
