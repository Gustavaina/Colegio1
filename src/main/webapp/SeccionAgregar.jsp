<%-- 
    Document   : SeccionAgregar
    Created on : 2 jul. 2023, 20:31:47
    Author     : User
--%>

<%@page import="dao.SeccionController"%>
<%@page import="modelo.NivelBean"%>
<%@page import="dao.NivelController"%>
<%@page import="modelo.AulaBean"%>
<%@page import="dao.AulaController"%>
<%@page import="modelo.SeccionBean"%>
<%@page import="java.util.ArrayList"%>

<%
    SeccionBean aBE = new SeccionBean ();
    AulaController oAulaController = new AulaController();
    ArrayList<AulaBean> lstAula = oAulaController.SelectAll();
    NivelController oNivelController = new NivelController();
    ArrayList<NivelBean> lstNivel = oNivelController.SelectAll();
    
    SeccionController AC = new SeccionController ();
     if ("CREATE".equalsIgnoreCase(request.getParameter("accion"))
     ) {
                  
             
            
            aBE.setSec_descri(request.getParameter("txt_sec_descri"));
             aBE.setSec_estcod(Integer.parseInt(request.getParameter("cboEstado")));
             aBE.setId_aula(request.getParameter("cboAula"));
             aBE.setId_nivel(request.getParameter("cboNivel"));
             
                         AC.Insert(aBE);
response.sendRedirect("SeccionListar.jsp");  
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
            <h1>Creación de Seccion  </h1> 
        <form action="SeccionAgregar.jsp" method="GET">
           
          
           <br>
            <input class="form-control" type="hidden" name="txt_id_seccion">
            
            DESCRIPCION:<br>
            <input class="form-control" type="text" name="txt_sec_descri"
                   >
            AULA:<br>
            <select name="cboAula" class="form-control mb-2">
                <%
                    for (int i = 0; i < lstAula.size(); i++) {
                    
                        %>
                        <option value="<%=lstAula.get(i).getId_aula()%>"><%=lstAula.get(i).getId_aula() +" "+ lstAula.get(i).getAul_descri()%></option> 
                        <%}
                %>
            </select> 
            
            NIVEL:<br>
            <select name="cboNivel" class="form-control mb-2">
                <%
                    for (int i = 0; i < lstNivel.size(); i++) {
                    
                        %>
                        <option value="<%=lstNivel.get(i).getId_nivel()%>"><%=lstNivel.get(i).getId_nivel() +" "+ lstNivel.get(i).getNiv_descri()%></option> 
                        <%}
                %>
            </select> 
            
             ESTADO:<br>
                       <select class="form-control mb-4" name="cboEstado">
                <option value="1" >Disponible</option>
                <option value="0">No disponible</option>
            
                
                

            
            
            <input class="btn btn-primary" type="submit" name="accion" value="CREATE">
            <a class="btn btn-danger" href="SeccionListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
