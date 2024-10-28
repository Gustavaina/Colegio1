<%-- 
    Document   : NivelEditar
    Created on : 2 jul. 2023, 15:58:08
    Author     : User
--%>

<%@page import="modelo.NivelBean"%>
<%@page import="dao.NivelController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    NivelController CBL = new  NivelController();
    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    NivelBean cBE = new   NivelBean ();    
    if(request.getParameter("accion") != null){        
        //ACCION -> ELIMINAR
        if("EDIT".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("id") != null ){        
         cBE = CBL.SelectByCodigo(request.getParameter("id"));            
        }
        if("CREATE".equalsIgnoreCase(request.getParameter("accion"))){
            cBE.setId_nivel((""));
            cBE.setNiv_descri("");
            cBE.setNiv_estcod(Integer.parseInt(""));
        }
        
        if("UPDATE".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("txt_id_nivel") != null ){
        
                 
          cBE.setId_nivel(request.getParameter("txt_id_nivel"));
            cBE.setNiv_descri(request.getParameter("txt_niv_descri"));
             cBE.setNiv_estcod(Integer.parseInt((request.getParameter("txt_niv_estcod"))));
            CBL.Update(cBE);
            
            response.sendRedirect("NivelListar.jsp");
             
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
        <h1>Nivel <%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "Nuevo" :"Editar")%></h1>
                           
        <form action="NivelEditar.jsp" method="GET">
            <input type="hidden" name="accion" 
                   value="<%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "INSERT" :"UPDATE")%>">
            Codigo:<br>
            <input class="form-control" type="text" name="txt_id_nivel" 
                   <%=("".equalsIgnoreCase(cBE.getId_nivel())? "" :"readonly")%>
                   value="<%=cBE.getId_nivel()%>">
            
            Descripcion:<br>
            <input class="form-control" type="text" name="txt_niv_descri"
                   value="<%=cBE.getNiv_descri() %>">
            
             Estado Codigo:<br>
                         <select name="txt_niv_estcod"  class="form-control mb-4" >
                 <option value="0" <%=(cBE.getNiv_estcod()== 0? "Selected":"") %> >Inactivo</option>
                 <option value="1" <%=(cBE.getNiv_estcod()== 1? "Selected":"") %>>Activo</option>
            </select>
              

            <input class="btn btn-primary" type="submit" name="accion" value="actualizar">
            <a class="btn btn-danger" href="NivelListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
