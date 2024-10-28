<%-- 
    Document   : PensionEditar
    Created on : 06/07/2023, 04:45:26 AM
    Author     : win10
--%>

<%@page import="modelo.PensionBean"%>
<%@page import="modelo.AlumnoBean"%>
<%@page import="dao.AlumnoController"%>
<%@page import="modelo.MatriculaBean"%>
<%@page import="dao.MatriculaController"%>
<%@page import="dao.PensionController"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    PensionController ABL = new PensionController();
    MatriculaController OMatriculaController = new MatriculaController();
    ArrayList<MatriculaBean> lstMatricula = OMatriculaController.SelectAll();
    AlumnoController OAlumnoController = new AlumnoController();
    ArrayList<AlumnoBean> lstAlumno = OAlumnoController.SelectAll();

    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    PensionBean aBE = new PensionBean();
    if (request.getParameter("accion") != null) {
        //ACCION -> ELIMINAR
        if ("EDIT".equalsIgnoreCase(request.getParameter("accion"))
                && request.getParameter("id") != null) {
            aBE = ABL.SelectByCodigo(request.getParameter("id"));
        }

        if ("UPDATE".equalsIgnoreCase(request.getParameter("accion"))
                && request.getParameter("txt_id_pension") != null) {

            aBE.setId_pension(request.getParameter("txt_id_pension"));
            aBE.setId_matricula(request.getParameter("txt_id_matricula"));
            aBE.setId_alumno(request.getParameter("txt_id_alumno"));
            aBE.setPension_mes(request.getParameter("txt_pension_mes"));
            aBE.setPension_monto(Double.parseDouble(request.getParameter("txt_pension_monto")));
            aBE.setPension_descuento(Double.parseDouble(request.getParameter("txt_pension_descuento")));
            aBE.setPension_mora(Double.parseDouble(request.getParameter("txt_pension_mora")));
            aBE.setPension_fecha_registro(request.getParameter("txt_pension_fecha_registro"));
            aBE.setPension_fecha_vencimiento(request.getParameter("txt_pension_fecha_vencimiento"));
            aBE.setPension_estado(Integer.parseInt(request.getParameter("txt_estado")));

            ABL.Update(aBE);

            response.sendRedirect("PensionListar.jsp");

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
        <h1>Pension <%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "Nuevo" :"Editar")%></h1>
                           
            <form action="PensionEditar.jsp" method="GET">
            <input type="hidden" name="accion" 
                   value="UPDATE">
            
            ID pension:<br>
            <input class="form-control" type="text" name="txt_id_pension" 
                   <%=("".equalsIgnoreCase((aBE.getId_pension()))? "" :"readonly")%>
                   value="<%=aBE.getId_pension() %>">
            
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
 
            Alumno:<br>
           <select name="txt_id_alumno" class="form-control mb-2">
                    <%
                        for (int i = 0; i < lstAlumno.size(); i++) {
                            String idAlumno = lstAlumno.get(i).getAlu_id();
                            String nombresAlumno = lstAlumno.get(i).getAlu_nombres();
                            boolean isSelected = (aBE.getId_alumno() != null && aBE.getId_alumno().equalsIgnoreCase(idAlumno));
                    %>
                    <option <%= isSelected ? "selected" : ""%> value="<%= idAlumno%>"><%= idAlumno + " " + nombresAlumno%></option> 
                    <% }
                    %>
                </select>

            Mes:<br>
            <input class="form-control" type="text" name="txt_pension_mes"value="">

            Monto:<br>
            <input class="form-control" type="text" name="txt_pension_monto" 
                   value="<%= aBE.getPension_monto() != null ? Double.valueOf(aBE.getPension_monto()).toString() : "" %>">
            
            Descuento:<br>
            <input class="form-control" type="text" name="txt_pension_descuento" 
                   value="<%= aBE.getPension_descuento() != null ? Double.valueOf(aBE.getPension_descuento()).toString() : "" %>">
            
            Mora:<br>
            <input class="form-control" type="text" name="txt_pension_mora" 
                   value="<%= aBE.getPension_mora() != null ? Double.valueOf(aBE.getPension_mora()).toString() : "" %>">
            
            Registro:<br>
            <input class="form-control" type="text" name="txt_pension_fecha_registro"
                   value="">
            
            Vencimiento<br>
            <input class="form-control" type="text" name="txt_pension_fecha_vencimiento"
                   value="">
                   
            Estado:<br>
            <select name="txt_estado"  class="form-control mb-4" >
                 <option value="0" <%=(aBE.getPension_estado() == 0? "Selected":"") %> >Inactivo</option>
                 <option value="1" <%=(aBE.getPension_estado() == 1? "Selected":"") %>>Activo</option>
            </select> 

            
            <input class="btn btn-primary" type="submit" name="accion" value="actualizar">
            <a class="btn btn-danger" href="PensionListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
       
        </div>
    </body>
</html>
