<%-- 
    Document   : MatriculaEditar
    Created on : 29 jun. 2023, 12:32:08
    Author     : U-07
--%>

<%@page import="modelo.MatriculaBean"%>
<%@page import="modelo.AulaBean"%>
<%@page import="dao.AulaController"%>
<%@page import="modelo.SeccionBean"%>
<%@page import="dao.SeccionController"%>
<%@page import="modelo.AlumnoBean"%>
<%@page import="dao.AlumnoController"%>
<%@page import="dao.MatriculaController"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    MatriculaController ABL = new MatriculaController();
    AlumnoController OAlumnoController = new AlumnoController();
    ArrayList<AlumnoBean> lstAlumno = OAlumnoController.SelectAll();
    SeccionController OSeccionController = new SeccionController();
    ArrayList<SeccionBean> lstSeccion = OSeccionController.SelectAll();
    AulaController OAulaController = new AulaController();
    ArrayList<AulaBean> lstAula = OAulaController.SelectAll();

    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    MatriculaBean aBE = new MatriculaBean();
    if (request.getParameter("accion") != null) {
        //ACCION -> ELIMINAR
        if ("EDIT".equalsIgnoreCase(request.getParameter("accion"))
                && request.getParameter("id") != null) {
            aBE = ABL.SelectByCodigo(request.getParameter("id"));
        }
       

        if ("UPDATE".equalsIgnoreCase(request.getParameter("accion"))
                && request.getParameter("txt_id_matricula") != null) {
            aBE.setId_matricula(request.getParameter("txt_id_matricula"));
            aBE.setId_alumno(request.getParameter("cboAlumno"));
            aBE.setId_seccion(request.getParameter("cboSeccion"));
            
            aBE.setMatricula_fecha_ingreso(request.getParameter("txt_matricula_fecha_ingreso"));
            aBE.setMatricula_estado(Integer.parseInt(request.getParameter("cboEstado")));
            ABL.Update(aBE);
            
            response.sendRedirect("MatriculaListar.jsp");

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
                <h1>Matricula <%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                        ? "Nuevo" : "Editar")%></h1>

            <form action="MatriculaEditar.jsp" method="GET">
                <input type="hidden" name="accion"  value="UPDATE">
                Codigo:<br>
                <input class="form-control" type="text" name="txt_id_matricula" 
                       <%=("".equalsIgnoreCase((aBE.getId_matricula())) ? "" : "readonly")%>
                       value="<%=aBE.getId_matricula()%>">



                alumno:<br>
                <select name="cboAlumno" class="form-control mb-2">
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



                seccion:<br>
                <select name="cboSeccion" class="form-control mb-2">
                    <%
                        for (int i = 0; i < lstSeccion.size(); i++) {
                            String idSeccion = lstSeccion.get(i).getId_seccion();
                            String descripcionSeccion = lstSeccion.get(i).getSec_descri();
                            boolean isSelected = (aBE.getId_seccion() != null && aBE.getId_seccion().equalsIgnoreCase(idSeccion));
                    %>
                    <option <%= isSelected ? "selected" : ""%> value="<%= idSeccion%>"><%= idSeccion + " " + descripcionSeccion%></option> 
                    <% }
                    %>
                </select>




                Fecha Ingreso:<br>
                <input class="form-control" type="text" name="txt_matricula_fecha_ingreso"
                       value="<%=aBE.getMatricula_fecha_ingreso()%>">

                Estado:<br>
                <select name="cboEstado"  class="form-control mb-4" >
                    <option value="0" <%=(aBE.getMatricula_estado() == 0 ? "Selected" : "")%> >Inactivo</option>
                    <option value="1" <%=(aBE.getMatricula_estado() == 1 ? "Selected" : "")%>>Activo</option>
                </select> 


                <input class="btn btn-primary" type="submit">
                <a class="btn btn-danger" href="MatriculaListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
            </form>
        </div>
    </body>
</html>
