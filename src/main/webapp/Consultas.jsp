

<%@page import="modelo.NotasModel"%>
<%@page import="modelo.NotasBean"%>
<%@page import="dao.NotasController"%>
<%@page import="modelo.CursoBean2"%>
<%@page import="dao.CursoController2"%>
<%@page import="modelo.MatriculaBean"%>
<%@page import="dao.MatriculaController"%>
<%@page import="modelo.SeccionBean"%>
<%@page import="dao.SeccionController"%>
<%@page import="dao.AlumnoController"%>
<%@page import="modelo.AlumnoBean"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consulta en cascada</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    </head>
    <body>
         <%@include file="shared_navbar.jsp" %>

    <%
        AlumnoController oAlumnoController = new AlumnoController();
        ArrayList<AlumnoBean> listAlumno = oAlumnoController.SelectAll();

        CursoController2 oCursoController2 = new CursoController2();
        ArrayList<CursoBean2> listCurso = oCursoController2.SelectAll();

        MatriculaController oMatriculaController = new MatriculaController();
        ArrayList<MatriculaBean> listMatricula = oMatriculaController.SelectAll();

        String id_matricula = "", id_curso = "";

        NotasController oNotasController = new NotasController();

        if (request.getParameter("mat") != null) {
            id_matricula = request.getParameter("mat");
        }
        if (request.getParameter("cur") != null) {
            id_curso = request.getParameter("cur");
        }

        // Aquí obtenemos los cursos asociados a la matrícula seleccionada
        ArrayList<CursoBean2> cursosPorMatricula = new CursoController2().getCursosPorMatricula(id_matricula);
        ArrayList<NotasBean> notasPorMatricula = oNotasController.SelectByMatricula(id_matricula);
    %>    
    <div class="container">
        <h1>Consulta en cascada</h1>
        <form>
            <div class="form-group">
                <label>Seleccione Matricula</label>
                <select name="mat" class="form-control" onchange="this.form.submit()">
                    <option value="">--elegir--</option>
                    <% for (int i = 0; i < listMatricula.size(); i++) {
                            String selected = "";
                            if (listMatricula.get(i).getId_matricula().equals(id_matricula)) {
                                selected = "selected";
                            }
                    %>
                    <option value="<%= listMatricula.get(i).getId_matricula()%>" <%= selected%>>
                        <%= listMatricula.get(i).getId_matricula() + " - " + listAlumno.get(i).getAlu_nombres()%>
                    </option>
                    <% } %>
                </select>
            </div>
               <!-- 
            <div class="form-group">
                <label>Seleccione Curso</label>
                <select name="cur" class="form-control" onchange="this.form.submit()">
                    <option value="">--elegir--</option>
                    <% for (CursoBean2 curso : cursosPorMatricula) {
                            String selected = "";
                            if (curso.getId_curso().equals(id_curso)) {
                                selected = "selected";
                            }
                    %>
                    <option value="<%= curso.getId_curso()%>" <%= selected%>>
                        <%= curso.getNombre_curso()%>
                    </option>
                    <% } %>
                </select>
            </div>
               -->
        </form>
        <table class="table table-bordered">
            <tr>
                <th>Curso</th>
                <th>Nota</th>
                <th>Observacion</th>
            </tr>
            <% for (NotasBean x : notasPorMatricula) {%>
            <tr>
                <td><%= x.getId_curso()%></td>
                <td><%= x.getNot_valor()%> </td>
                <td><%= x.getNot_observ()%></td>
            </tr>
            <% }%>
        </table> 
    </div>
    <div class="container">
        <a href="menu_principal.jsp"><button type="button" class="btn btn-primary btn-lg btn-block">Menu Principal</button></a>
    </div>        
</body>
</html>
