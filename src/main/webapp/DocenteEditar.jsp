<%@page import="dao.DocenteController"%>
<%@page import="modelo.DocenteBean"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DocenteController ABL = new  DocenteController();
    
    DocenteBean aBE = new   DocenteBean ();    
    if(request.getParameter("accion") != null){ 
    
        if("EDIT".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("id") != null ){        
         aBE = ABL.SelectByCodigo(request.getParameter("id"));            
        }
        if("CREATE".equalsIgnoreCase(request.getParameter("accion"))){
            aBE.setId_docente("");
            aBE.setDoc_descri("");
            aBE.setDoc_estcod(Integer.parseInt(""));
            aBE.setDoc_nombre("");
            aBE.setDoc_apellido("");
            aBE.setDoc_dni(Integer.parseInt(""));
            aBE.setDoc_telefono(Integer.parseInt(""));
            
        }
        
        if("UPDATE".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("txt_id_docente") != null ){
        
          
          aBE.setId_docente(request.getParameter("txt_id_docente"));
            aBE.setDoc_descri(request.getParameter("txt_doc_descri"));
             aBE.setDoc_estcod(Integer.parseInt(request.getParameter("txt_doc_estcod")));
             aBE.setDoc_nombre(request.getParameter("txt_doc_nombre"));
             aBE.setDoc_apellido(request.getParameter("txt_doc_apellido"));
             aBE.setDoc_dni(Integer.parseInt(request.getParameter("txt_doc_dni")));
             aBE.setDoc_telefono(Integer.parseInt(request.getParameter("txt_doc_telefono")));
            ABL.Update(aBE);
            
            response.sendRedirect("DocenteListar.jsp");
             
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
        <h1>Docente <%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "Nuevo" :"Editar")%></h1>
                           
        <form action="DocenteEditar.jsp" method="GET">
            <input type="hidden" name="accion" 
                   value="<%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "INSERT" :"UPDATE")%>">
            CODIGO:<br>
            <input class="form-control mb-2" type="text" name="txt_id_docente" 
                   <%=("".equalsIgnoreCase(aBE.getId_docente())? "" :"readonly")%>
                   value="<%=aBE.getId_docente()%>">
            DESCRIPCION:<br>
            <input class="form-control mb-2" type="text" name="txt_doc_descri"
                   value="<%=aBE.getDoc_descri() %>">

            NOMBRE:<br>
            <input class="form-control mb-2" type="text" name="txt_doc_nombre"
                   value="<%=aBE.getDoc_nombre() %>">
            APELLIDO:<br>
            <input class="form-control mb-2" type="text" name="txt_doc_apellido" 
                   value="<%=aBE.getDoc_apellido() %>" >
            DNI:<br>
            <input class="form-control mb-2" type="text" name="txt_doc_dni" 
                   value="<%=aBE.getDoc_dni() %>" >
            TELEFONO:<br>
            <input class="form-control mb-2" type="text" name="txt_doc_telefono" 
                   value="<%=aBE.getDoc_telefono() %>" >
             ESTADO:<br>
             <select name="txt_doc_estcod"  class="form-control mb-4" >
                 <option value="0" <%=(aBE.getDoc_estcod()== 0? "Selected":"") %> >Inactivo</option>
                 <option value="1" <%=(aBE.getDoc_estcod()== 1? "Selected":"") %>>Activo</option>
            </select>
            
            <input class="btn btn-primary" type="submit" name="accion" value="actualizar">
            <a class="btn btn-danger" href="DocenteListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
