<%-- 
    Document   : NotasAgregar
    Created on : 2 jul. 2023, 21:30:19
    Author     : User
--%>

<%@page import="dao.NotasController"%>
<%@page import="modelo.CursoBean2"%>
<%@page import="dao.CursoController2"%>
<%@page import="modelo.MatriculaBean"%>
<%@page import="dao.MatriculaController"%>
<%@page import="modelo.NotasBean"%>
<%@page import="java.util.ArrayList"%>
<%
    NotasBean aBE = new NotasBean ();
    MatriculaController OMatriculaController = new MatriculaController();
    ArrayList<MatriculaBean> lstMatricula = OMatriculaController.SelectAll();
    CursoController2 OCursoController2 = new CursoController2();
    ArrayList<CursoBean2> lstCurso2 = OCursoController2.SelectAll();
    
    
    NotasController AC = new NotasController ();
     if ("CREATE".equalsIgnoreCase(request.getParameter("accion"))
      ) {
                  
             
            //aBE.setId_notas(request.getParameter("txt_id_notas"));
            
            aBE.setId_matricula(request.getParameter("txt_id_matricula"));            
            aBE.setId_curso(request.getParameter("txt_id_curso"));
            aBE.setNot_observ(request.getParameter("txt_not_observ"));
            aBE.setNot_estcod(Integer.parseInt(request.getParameter("txt_not_estcod")));
            aBE.setNot_valor(Double.parseDouble(request.getParameter("txt_not_valor")));
            
                         AC.Insert(aBE);
response.sendRedirect("NotasListar.jsp");  
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
            <h1>Creación de Notas  </h1> 
        <form action="NotasAgregar.jsp" method="GET">
           
          
           <br>
            <input class="form-control" type="hidden" name="txt_id_notas">
            
            Matricula:<br>
            <select name="txt_id_matricula" class="form-control mb-2">
                <%
                    for (int i = 0; i < lstMatricula.size(); i++) {
                    
                        %>
                        <option value="<%=lstMatricula.get(i).getId_matricula()%>"><%=lstMatricula.get(i).getId_matricula() +" "+ lstMatricula.get(i).getId_matricula()%></option> 
                        <%}
                %>
            </select> 
            
            Curso:<br>
            <select name="txt_id_curso" class="form-control mb-2">
                <%
                    for (int i = 0; i < lstCurso2.size(); i++) {
                    
                        %>
                        <option value="<%=lstCurso2.get(i).getId_curso()%>"><%=lstCurso2.get(i).getId_curso() +" "+ lstCurso2.get(i).getDescripcion_curso()%></option> 
                        <%}
                %>
            </select>
            
            Descripcion:<br>
            <input class="form-control" type="text" name="txt_not_observ"
                   >
            
            Valor:<br>
            <input class="form-control" type="text" name="txt_not_valor" 
                   value="<%= aBE.getNot_valor() != null ? Double.valueOf(aBE.getNot_valor()).toString() : "" %>">
                
            ESTADO:<br>
                       <select class="form-control mb-4" name="txt_not_estcod">
                <option value="1" >Disponible</option>
                <option value="0">No disponible</option>
            
            <input class="btn btn-primary" type="submit" name="accion" value="CREATE">
            <a class="btn btn-danger" href="NotasListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
