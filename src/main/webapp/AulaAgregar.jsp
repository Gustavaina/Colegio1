<%-- 
    Document   : AulaAgregar
    Created on : 2 jul. 2023, 14:09:33
    Author     : User
--%>
<%@page import="dao.AulaController"%>
<%@page import="modelo.AulaBean"%>



<%
    AulaBean cBE = new AulaBean();
    AulaController CC = new AulaController();
    if ("CREATE".equalsIgnoreCase(request.getParameter("accion"))) {
        //cBE.setNombre_curso(request.getParameter("txt_nombre_curso"));
        cBE.setAul_descri(request.getParameter("txt_aul_descri"));
        cBE.setAul_estcod(Integer.parseInt(request.getParameter("txt_aul_estcod")));

        CC.Insert(cBE);
        response.sendRedirect("AulaListar.jsp");
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
            <h1>Creación de Aula  </h1> 
            <form action="AulaAgregar.jsp" method="GET">



                <input class="form-control" type="hidden" name="txt_id_aula" >

                Descripcion:<br>
                <input class="form-control" type="text" name="txt_aul_descri" 
                       >
                Estado:<br>                     
                <select class="form-control" name="txt_aul_estcod">
                    <option value="1">Activo</option>
                    <option value="0">Inactivo</option>

                <input class="btn btn-primary" type="submit" name="accion" value="CREATE">
                <a class="btn btn-danger" href="AulaListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
            </form>
        </div>
    </body>
</html>

