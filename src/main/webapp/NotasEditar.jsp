<%-- 
    Document   : NotasEditar
    Created on : 2 jul. 2023, 21:30:39
    Author     : User
--%>

<%@page import="modelo.NotasBean"%>
<%@page import="modelo.CursoBean2"%>
<%@page import="dao.CursoController2"%>
<%@page import="modelo.MatriculaBean"%>
<%@page import="dao.MatriculaController"%>
<%@page import="dao.NotasController"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    NotasController ABL = new  NotasController();
    MatriculaController OMatriculaController = new MatriculaController();
    ArrayList<MatriculaBean> lstMatricula = OMatriculaController.SelectAll();
    CursoController2 OCursoController2 = new CursoController2();
    ArrayList<CursoBean2> lstCurso2 = OCursoController2.SelectAll();
    
    
    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    NotasBean aBE = new   NotasBean ();    
    if(request.getParameter("accion") != null){        
        //ACCION -> ELIMINAR
        if("EDIT".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("id") != null ){        
         aBE = ABL.SelectByCodigo(request.getParameter("id"));            
        }
        
        if("UPDATE".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("txt_id_notas") != null ){
        
        
            aBE.setId_notas(request.getParameter("txt_id_notas"));
            aBE.setId_matricula(request.getParameter("txt_id_matricula"));
            aBE.setId_curso(request.getParameter("txt_id_curso"));
            aBE.setNot_observ(request.getParameter("txt_not_observ"));
            aBE.setNot_estcod(Integer.parseInt(request.getParameter("txt_not_estcod")));
            aBE.setNot_valor(Double.parseDouble(request.getParameter("txt_not_valor")));
             
            ABL.Update(aBE);
            
            response.sendRedirect("NotasListar.jsp");
            
            
             
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
        <h1>Notas <%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "Nuevo" :"Editar")%></h1>
                           
            <form action="NotasEditar.jsp" method="GET">
            <input type="hidden" name="accion" 
                   value="UPDATE">
            
            ID Notas:<br>
            <input class="form-control" type="text" name="txt_id_notas" 
                   <%=("".equalsIgnoreCase((aBE.getId_notas()))? "" :"readonly")%>
                   value="<%=aBE.getId_notas()%>">
            
            Matricula:<br>
            <select name="txt_id_matricula" class="form-control">
                <%
                    for (int i = 0; i < lstMatricula.size(); i++) {
                    String idMatricula = lstMatricula.get(i).getId_matricula();
                            String IdMatricula = lstMatricula.get(i).getId_matricula();
                            boolean isSelected = (aBE.getId_matricula() != null && aBE.getId_matricula().equalsIgnoreCase(idMatricula));
                    %>
                    <option <%= isSelected ? "selected" : ""%> value="<%= idMatricula%>"><%= idMatricula + " " + IdMatricula%></option> 
                    <% }
                %>
            </select> 
 
            Curso:<br>
           <select name="txt_id_curso" class="form-control">
                <%
                    for (int i = 0; i < lstCurso2.size(); i++) {
                            String idCurso2 = lstCurso2.get(i).getId_curso();
                            String descripcionCurso = lstCurso2.get(i).getDescripcion_curso();
                            boolean isSelected = (aBE.getId_curso() != null && aBE.getId_curso().equalsIgnoreCase(idCurso2));
                    %>
                    <option <%= isSelected ? "selected" : ""%> value="<%= idCurso2%>"><%= idCurso2 + " " + descripcionCurso%></option> 
                    <% }
                %>
            </select> 

            Descripcion:<br>
            <input class="form-control" type="text" name="txt_not_observ"
                   value="">

            Valor:<br>
            <input class="form-control" type="text" name="txt_not_valor" 
                   value="<%= aBE.getNot_valor() != null ? Double.valueOf(aBE.getNot_valor()).toString() : "" %>">
                   
            Estado:<br>
            <select name="txt_not_estcod"  class="form-control mb-4" >
                 <option value="0" <%=(aBE.getNot_estcod()== 0? "Selected":"") %> >Inactivo</option>
                 <option value="1" <%=(aBE.getNot_estcod()== 1? "Selected":"") %>>Activo</option>
            </select> 

            
            <input class="btn btn-primary" type="submit" name="accion" value="actualizar">
            <a class="btn btn-danger" href="NotasListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
       
        </div>
    </body>
</html>
