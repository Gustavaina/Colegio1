<%@page import="modelo.AulaBean"%>
<%@page import="dao.AulaController"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AulaController CBL = new  AulaController();
    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    AulaBean cBE = new   AulaBean ();    
    if(request.getParameter("accion") != null){        
        //ACCION -> ELIMINAR
        if("EDIT".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("id") != null ){        
         cBE = CBL.SelectByCodigo(request.getParameter("id"));            
        }
        if("CREATE".equalsIgnoreCase(request.getParameter("accion"))){
            cBE.setId_aula((""));
            cBE.setAul_descri("");
            cBE.setAul_estcod(Integer.parseInt(""));
        }
        
        if("UPDATE".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("txt_id_aula") != null ){
        
          cBE.setId_aula(request.getParameter("txt_id_aula"));
            cBE.setAul_descri(request.getParameter("txt_aul_descri"));
             cBE.setAul_estcod(Integer.parseInt((request.getParameter("txt_aul_estcod"))));
            CBL.Update(cBE);
            
            response.sendRedirect("AulaListar.jsp");
             
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
        <h1>Aula <%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "Nuevo" :"Editar")%></h1>
                           
        <form action="AulaEditar.jsp" method="GET">
            <input type="hidden" name="accion" 
                   value="<%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "INSERT" :"UPDATE")%>">
            Codigo:<br>
            <input class="form-control mb-2" type="text" name="txt_id_aula" 
                   <%=("".equalsIgnoreCase(cBE.getId_aula())? "" :"readonly")%>
                   value="<%=cBE.getId_aula()%>">
            
            Descripcion:<br>
            <input class="form-control mb-2" type="text" name="txt_aul_descri"
                   value="<%=cBE.getAul_descri() %>">
            
             Estado :<br>
            <select name="txt_aul_estcod"  class="form-control mb-4" >
                 <option value="0" <%=(cBE.getAul_estcod()== 0? "Selected":"") %>>Inactivo</option>
                 <option value="1" <%=(cBE.getAul_estcod()== 1? "Selected":"") %>>Activo</option>
            </select>
              

            <input class="btn btn-primary" type="submit" name="accion" value="actualizar">
            <a class="btn btn-danger" href="AulaListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
