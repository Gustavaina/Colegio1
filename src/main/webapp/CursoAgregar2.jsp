<%-- 
    Document   : AlumnoCrear
    Created on : 9 jun. 2023, 22:47:19
    Author     : moral
--%>

<%@page import="dao.CursoController2"%>
<%@page import="modelo.CursoBean2"%>

<%
    CursoBean2 cBE = new  CursoBean2 ();
    CursoController2 CC = new  CursoController2 ();
     if ("CREATE".equalsIgnoreCase(request.getParameter("accion"))
      && request.getParameter("txt_id") !=null  ) {
             if (true) {
                     
                 }
            cBE.setNombre_curso(request.getParameter("txt_nombre_curso"));
            cBE.setDescripcion_curso(request.getParameter("txt_descripcion_curso"));
            cBE.setEstado_curso(Integer.parseInt(request.getParameter("txt_estado_curso")));
          
           
                         CC.Insert(cBE);
response.sendRedirect("CursoListar2.jsp");  
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
        <form action="CursoAgregar2.jsp" method="GET">
           

         
            <input class="form-control" type="hidden" name="txt_id"   >
            Nombre del Curso:<br>
            <input class="form-control" type="text" name="txt_nombre_curso" value="">
           Descripcion del Curso:<br>
           <input class="form-control" type="text" name="txt_descripcion_curso" value="">
                    Estado:<br>
            
            <select class="form-control mb-4" name="txt_estado_curso">
                <option value="1" >Disponible</option>
                <option value="0">No disponible</option>
                
                
            </select>
            
            
            <input class="btn btn-primary" type="submit" name="accion" value="CREATE">
            <a class="btn btn-danger" href="AlumnoListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
