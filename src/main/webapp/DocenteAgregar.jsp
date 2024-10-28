<%-- 
    Document   : AlumnoCrear
    Created on : 9 jun. 2023, 22:47:19
    Author     : moral
--%>

<%@page import="dao.DocenteController"%>
<%@page import="modelo.DocenteBean"%>
<%
    DocenteBean aBE = new DocenteBean ();
    DocenteController AC = new DocenteController ();
     if ("CREATE".equalsIgnoreCase(request.getParameter("accion"))
       ) {
 
             aBE.setDoc_descri(request.getParameter("txt_doc_descri"));
             aBE.setDoc_estcod(Integer.parseInt(request.getParameter("txt_doc_estcod")));
             aBE.setDoc_nombre(request.getParameter("txt_doc_nombre"));
             aBE.setDoc_apellido(request.getParameter("txt_doc_apellido"));
             aBE.setDoc_dni(Integer.parseInt(request.getParameter("txt_doc_dni")));
             aBE.setDoc_telefono(Integer.parseInt(request.getParameter("txt_doc_telefono")));
                         AC.Insert(aBE);
                         
            response.sendRedirect("DocenteListar.jsp");  
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
            <h1>Creación de Docentes  </h1> 
        <form action="DocenteAgregar.jsp" method="GET">
           
           
           
            <input class="form-control" type="hidden" name="txt_id_docente">
            
     Descripcion:<br>
            <input class="form-control mb-2" type="text" name="txt_doc_descri">
             Estado:<br>
            <select class="form-control mb-4" name="txt_doc_estcod">
                <option value="1" >Activo</option>
                <option value="0">Inactivo</option>
            </select>
            Nombre:<br>
            <input class="form-control mb-2 " type="text" name="txt_doc_nombre">
            Apellido:<br>
            <input class="form-control mb-2 " type="text" name="txt_doc_apellido">
            DNI:<br>
            <input class="form-control mb-2" type="text" name="txt_doc_dni">
            Telefono:<br>
            <input class="form-control mb-2" type="text" name="txt_doc_telefono">
       
           
            
            <input class="btn btn-primary" type="submit" name="accion" value="CREATE">
            <a class="btn btn-danger" href="DocenteListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
