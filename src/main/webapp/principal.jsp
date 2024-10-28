<%
    if (session.getAttribute("codigo_usuario") == null) { response.sendRedirect("index.jsp");}
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>documento</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </head>
    <body>
        <%@include file="shared_navbar.jsp" %>
              
        <div class="container mt-4">

            <h1>Bievenido al sistema ${codigo_usuario}  </<strong>Usuario Logueado</strong></h1>
            <div>
                <h1 align="center">Menú Principal </h1>
                <a href="AlumnoListar.jsp">
                    <button type="button" class="btn btn-primary btn-lg btn-block">Mostrar Alumnos</button>


                </a>
                <a href="CursoListar2.jsp">
                    <button type="button" class="btn btn-secondary btn-lg btn-block">Mostrar Cursos </button> 
                </a>
                <a href="NivelListar.jsp">
                    <button type="button" class="btn btn-secondary btn-lg btn-block">Mostrar Niveles </button> 
                </a>
                <a href="DocenteListar.jsp">
                    <button type="button" class="btn btn-secondary btn-lg btn-block">Mostrar  Docente</button> 
                </a>
                <a href="SeccionListar.jsp">
                    <button type="button" class="btn btn-secondary btn-lg btn-block">Mostrar Secciones </button> 
                </a>
                <a href="MatriculaListar.jsp">
                    <button type="button" class="btn btn-secondary btn-lg btn-block">Mostrar Matriculas </button> 
                </a>
                <a href="NotasListar.jsp">
                    <button type="button" class="btn btn-secondary btn-lg btn-block">Mostrar Notas </button> 
                </a>
                 
                        </div>
        </div>
    </body>
</html>
