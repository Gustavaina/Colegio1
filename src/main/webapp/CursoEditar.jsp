<%@page import="modelo.CursoBean"%>
<%@page import="dao.CursoController"%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
   CursoController CBL = new  CursoController();
    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    CursoBean cBE = new   CursoBean ();    
    if(request.getParameter("accion") != null){        
        //ACCION -> ELIMINAR
        if("EDIT".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("id") != null ){        
        cBE = CBL.SelectByCodigo(request.getParameter("id"));            
        }
        if("CREATE".equalsIgnoreCase(request.getParameter("accion"))){
           cBE.setId_cur(Integer.parseInt(""));
           cBE.setCur_descri("");
           cBE.setCur_estcod(Integer.parseInt(""));
           
        }
        
        if("UPDATE".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("txt_id") != null ){
        response.sendRedirect("CursoListar2.jsp");   
        
         
             cBE.setId_cur(Integer.parseInt((request.getParameter("txt_id"))));
           cBE.setCur_descri(request.getParameter("txt_cur_descri"));
           cBE.setCur_estcod(Integer.parseInt((request.getParameter("txt_cur_estcod"))));
          
            CBL.Update(cBE);
             
        }
        
        if("INSERT".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("id") != null ){
            cBE.setId_cur(Integer.parseInt((request.getParameter("txt_id"))));
           cBE.setCur_descri(request.getParameter("txt_cur_descri"));
           cBE.setCur_estcod(Integer.parseInt((request.getParameter("txt_cur_estcod"))));
            CBL.Insert(cBE);
            response.sendRedirect("CursoListar.jsp");    
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
        <h1>Usuario <%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "Nuevo" :"Editar")%></h1>
        <form action="CursoEditar.jsp" method="GET">
            <input type="text" name="accion" 
                   value="<%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "INSERT" :"UPDATE")%>">
            <br>
            Codigo Curso:<br>
            <input class="form-control" type="text" name="txt_id" 
                   <%=("".equalsIgnoreCase(Integer.toString(cBE.getId_cur()))? "" :"readonly")%>
                   value="<%=cBE.getId_cur()%>">
            Descripcion:<br>
            <input class="form-control" type="text" name="txt_cur_descri" value="<%=cBE.getCur_descri()%>">
             Estado:<br>
             
            <input class="form-control" type="text" name="txt_cur_estcod"
                   value="<%=cBE.getCur_estcod() %>">

            <input class="btn btn-primary" type="submit" name="accion" value="actualizar">
            <a class="btn btn-danger" href="CursoListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
