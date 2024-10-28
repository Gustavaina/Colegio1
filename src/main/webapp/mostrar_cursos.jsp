<%@page import="modelo.CursoBean2"%>
<%@page import="dao.CursoController2"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<%
    String parametro=request.getParameter("filtro");
    CursoController2 UBL = new CursoController2();
    
    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    if(request.getParameter("accion") != null){        
        //ACCION -> ELIMINAR
        if("DELETE".equalsIgnoreCase(request.getParameter("accion"))  && request.getParameter("id") != null ){            
            //TOKEN -> CODIGO USUARIO
            UBL.Delete(request.getParameter("id"));
            response.sendRedirect("CursoListar2.jsp");
        }
       
    }
    
    ArrayList<CursoBean2> ldata = UBL.SelectAll();
%>
<%
if (session.getAttribute("codigo_usuario") !=null) {

%>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
         <link href="bootstrap4/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>         
        <script src="bootstrap4/js/bootstrap.min.js" type="text/javascript"></script>
        <link href="footable/css/footable.core.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/navbar-top.css" rel="stylesheet" type="text/css"/>       
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>JSP Page</title>
    </head>
     <body>
        
      <div class="container mt-3" >
        <div class="row">
            <%
              
            
            CursoBean2 item = null;
                               Iterator<CursoBean2> iter = ldata.iterator();
                                while (iter.hasNext()) {
                                    item = iter.next();
               
                   
            %> 
                    
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                  <div class="card">
                                  <img src="pagin/logo-curso.png" class="card-img-top" alt="...">
                                                      <div class="card-body">
                            <h5 class="card-title"><%=item.getNombre_curso()%></h5>
                            <p class="card-text">
                            <%=item.getDescripcion_curso()%>

                            </p>

            
            
                
                    <%   String estado="";
                     if (item.getEstado_curso()==1 ) {
                             estado="Activo";
                         }else {
                        estado="Inactivo";
                        }
                    
                    
                    %>
                                             <a href="#" class="btn btn-primary"><%=estado%></a>

                                    </div>
                    </div>
                </div>

         <%}   %>
                    
             </div>
    </div>  
     

    </body>
</html>


<%
    }else  {

response.sendRedirect("index.jsp");
}
%>