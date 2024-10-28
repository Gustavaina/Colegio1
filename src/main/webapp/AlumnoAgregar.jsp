<%-- 
    Document   : AlumnoCrear
    Created on : 9 jun. 2023, 22:47:19
    Author     : moral
--%>

<%@page import="dao.AlumnoController"%>
<%@page import="modelo.AlumnoBean"%>
<%
    AlumnoBean aBE = new AlumnoBean ();
    AlumnoController AC = new AlumnoController ();
     if ("CREATE".equalsIgnoreCase(request.getParameter("accion"))
      && request.getParameter("txt_id") !=null  ) {
                  
            aBE.setAlu_nombres(request.getParameter("txt_nombres"));
             aBE.setAlu_apellidos(request.getParameter("txt_apellidos"));
             aBE.setAlu_dni(request.getParameter("txt_dni"));
             aBE.setAlu_telefono(request.getParameter("txt_telefono"));
             aBE.setAlu_sexo(request.getParameter("txt_sexo"));
             aBE.setAlu_direccion(request.getParameter("txt_direccion"));
                         AC.Insert(aBE);
response.sendRedirect("AlumnoListar.jsp");  
         }


%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link href="bootstrap4/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <div class="container">
            <h1>Creación de Alumnos  </h1> 
        <form action="AlumnoAgregar.jsp" method="GET">
           
           <!  Codigo: !>
           <br>
            <input class="form-control" type="hidden" name="txt_id"   >
            Nombre:<br>
            <input class="form-control" type="text" name="txt_nombres"
                   value="">
             Apellido:<br>
            <input class="form-control" type="text" name="txt_apellidos"
                   value="">
            Dni:<br>
            <input class="form-control" type="text" name="txt_dni"
                   value="">
            Direccion:<br>
            <input class="form-control" type="text" name="txt_direccion" 
                   value="" >
            Sexo:<br>
            <input class="form-control" type="text" name="txt_sexo" 
                   value="" >
            Telefono:<br>
            <input class="form-control" type="text" name="txt_telefono" 
                   value="" >
            
            
            <input class="btn btn-primary" type="submit" name="accion" value="CREATE">
            <a class="btn btn-danger" href="AlumnoListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
