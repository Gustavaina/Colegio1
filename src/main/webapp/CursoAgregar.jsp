<%-- 
    Document   : AlumnoCrear
    Created on : 9 jun. 2023, 22:47:19
    Author     : moral
--%>

<%@page import="dao.CursoController"%>
<%@page import="modelo.CursoBean"%>
<%
    CursoBean cBE = new  CursoBean ();
    CursoController CC = new  CursoController ();
     if ("CREATE".equalsIgnoreCase(request.getParameter("accion"))
      && request.getParameter("txt_id") !=null  ) {
             if (true) {
                     
                 }
     
            cBE.setCur_descri(request.getParameter("txt_cur_descri"));
            cBE.setCur_estcod(Integer.parseInt(request.getParameter("txt_cur_estcod")));
           
                         CC.Insert(cBE);
response.sendRedirect("CursoListar.jsp");  
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
            <h1>Creación de Curso  </h1> 
        <form action="CursoAgregar.jsp" method="GET">
           
             Codigo: 
             <br>
           <br>
            <input class="form-control" type="hidden" name="txt_id"   >
            Descripcion:<br>
            <input class="form-control" type="text" name="txt_cur_descri"
                   value="">
           Estado:<br>
            
            <select class="form-control" name="txt_cur_estcod">
                <option value="1" >Disponible</option>
                <option value="0">No disponible</option>
            </select>
            
            
            <input class="btn btn-primary" type="submit" name="accion" value="CREATE">
            <a class="btn btn-danger" href="AlumnoListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
