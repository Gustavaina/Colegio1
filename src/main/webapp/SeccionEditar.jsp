<%-- 
    Document   : SeccionEditar
    Created on : 2 jul. 2023, 20:31:11
    Author     : User
--%>

<%@page import="modelo.SeccionBean"%>
<%@page import="modelo.NivelBean"%>
<%@page import="dao.NivelController"%>
<%@page import="modelo.AulaBean"%>
<%@page import="dao.AulaController"%>
<%@page import="dao.SeccionController"%>

<%@page import="java.util.ArrayList"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    SeccionController ABL = new  SeccionController();
    AulaController OAulaController = new AulaController();
    ArrayList<AulaBean> lstAula = OAulaController.SelectAll();
    NivelController ONivelController = new NivelController();
    ArrayList<NivelBean> lstNivel = ONivelController.SelectAll();
    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    SeccionBean aBE = new   SeccionBean ();   
    
    if(request.getParameter("accion") != null){        
        //ACCION -> ELIMINAR
        if("EDIT".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("id") != null ){        
         aBE = ABL.SelectByCodigo(request.getParameter("id"));            
        }
        if("CREATE".equalsIgnoreCase(request.getParameter("accion"))){
           aBE.setId_seccion("");
            aBE.setSec_descri("");
           aBE.setSec_estcod(Integer.parseInt(""));
            aBE.setId_aula("");
            aBE.setId_nivel("");
        }
        
        if("UPDATE".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("txt_id_seccion") != null ){
        
          
          aBE.setId_seccion(request.getParameter("txt_id_seccion"));
            aBE.setSec_descri(request.getParameter("txt_sec_descri"));
             aBE.setSec_estcod(Integer.parseInt(request.getParameter("cboEstado")));
             aBE.setId_aula(request.getParameter("cboAula"));
             aBE.setId_nivel(request.getParameter("cboNivel"));
            ABL.Update(aBE);
             
            response.sendRedirect("SeccionListar.jsp"); 
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
        <h1>Seccion <%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "Nuevo" :"Editar")%></h1>
                           
        <form action="SeccionEditar.jsp" method="GET">
            <input type="hidden" name="accion" 
                   value="<%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "INSERT" :"UPDATE")%>">
            Codigo:<br>
            <input class="form-control" type="text" name="txt_id_seccion" 
                   <%=("".equalsIgnoreCase((aBE.getId_seccion()))? "" :"readonly")%>
                   value="<%=aBE.getId_seccion()%>">
            Descripcion:<br>
            <input class="form-control" type="text" name="txt_sec_descri"
                 value="<%=aBE.getSec_descri() %>">
            
            <%=aBE.getId_aula()%>
 
            aula:<br>
            <select name="cboAula" class="form-control">
                <%
                    for (int i = 0; i < lstAula.size(); i++) {
                    
                        %>
                        <option <%=(aBE.getId_aula().equalsIgnoreCase(lstAula.get(i).getId_aula())? "Selected":"") %> value="<%=lstAula.get(i).getId_aula()%>"><%=lstAula.get(i).getId_aula() +" "+ lstAula.get(i).getAul_descri()%></option> 
                        <%}
                %>
            </select> 
          
            nivel:<br>
            <select name="cboNivel" class="form-control mb-4">
                <%
                    for (int i = 0; i < lstNivel.size(); i++) {
                    
                        %>
                        <option <%=(aBE.getId_nivel().equalsIgnoreCase(lstNivel.get(i).getId_nivel())? "Selected":"") %> value="<%=lstNivel.get(i).getId_nivel()%>"><%=lstNivel.get(i).getId_nivel() +" "+ lstNivel.get(i).getNiv_descri()%></option> 
                        <%}
                %>
            </select> 
            
            Estado:<br>
             <select name="cboEstado"  class="form-control mb-4" >
                 <option value="0" <%=(aBE.getSec_estcod()== 0? "Selected":"") %> >No Disponible</option>
                 <option value="1" <%=(aBE.getSec_estcod()== 1? "Selected":"") %>>Disponible</option>
            </select> 

            
            <input class="btn btn-primary" type="submit" name="accion" value="actualizar">
            <a class="btn btn-danger" href="SeccionListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
