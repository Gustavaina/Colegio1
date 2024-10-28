<%@page import="modelo.CursoBean2"%>
<%@page import="dao.CursoController2"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   CursoController2 CBL = new  CursoController2();
    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    CursoBean2 cBE = new   CursoBean2 ();    
    if(request.getParameter("accion") != null){        
        //ACCION -> ELIMINAR
        if("EDIT".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("id") != null ){        
        cBE = CBL.SelectByCodigo(request.getParameter("id"));            
        }
        if("CREATE".equalsIgnoreCase(request.getParameter("accion"))){
           cBE.setId_curso("");
           cBE.setNombre_curso("");
           cBE.setDescripcion_curso("");
           cBE.setEstado_curso(Integer.parseInt(""));
           
        }
        
        if("UPDATE".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("txt_id_curso") != null ){
     
        response.sendRedirect("CursoListar2.jsp");  
         
             cBE.setId_curso(request.getParameter("txt_id_curso"));
             cBE.setNombre_curso(request.getParameter("txt_nombre_curso"));
           cBE.setDescripcion_curso(request.getParameter("txt_curso_descripcion"));
           
           cBE.setEstado_curso(Integer.parseInt((request.getParameter("txt_cur_estcod"))));
          
            CBL.Update(cBE);
                
             
        }
        
     
    } 
%>
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
            
            <!-- -->
          <h1>Curso <%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "Nuevo" :request.getParameter("id"))%></h1> 
        <form action="CursoEditar2.jsp" method="GET">
            <input type="hidden" name="accion" 
                   value="<%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "INSERT" :"UPDATE")%>">
            Codigo:<br>
            <input class="form-control mb-2" type="text" name="txt_id_curso" 
                   <%=("".equalsIgnoreCase(cBE.getId_curso())? "" :"readonly")%>
                   value="<%=cBE.getId_curso()%>">
            
            Nombre : <br>
               <input class="form-control mb-2" type="text" name="txt_nombre_curso" value="<%=cBE.getNombre_curso()%>">
           
               Descripcion:<br> 
           <input class="form-control mb-2" type="text" name="txt_curso_descripcion" value="<%=cBE.getDescripcion_curso()%>">

             Estado:<br>
             
            <select name="txt_cur_estcod"  class="form-control mb-4" >
                 <option value="0" <%=(cBE.getEstado_curso()== 0? "Selected":"") %> >Inactivo</option>
                 <option value="1" <%=(cBE.getEstado_curso()== 1? "Selected":"") %>>Activo</option>
            </select>

            <input class="btn btn-primary" type="submit" name="accion" value="actualizar">
            <a class="btn btn-danger" href="CursoListar2.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
