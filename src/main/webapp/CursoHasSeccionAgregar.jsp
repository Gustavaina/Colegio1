


<%@page import="dao.Curso_Seccion_Aula_Controller"%>
<%@page import="modelo.AulaBean"%>
<%@page import="dao.AulaController"%>
<%@page import="modelo.DocenteBean"%>
<%@page import="dao.DocenteController"%>
<%@page import="modelo.CursoBean2"%>
<%@page import="dao.CursoController2"%>
<%@page import="modelo.SeccionBean"%>
<%@page import="dao.SeccionController"%>
<%@page import="modelo.AlumnoBean"%>
<%@page import="dao.AlumnoController"%>
<%@page import="modelo.Curso_Seccion_Aula_Bean"%>
<%@page import="java.util.ArrayList"%>
<%
  Curso_Seccion_Aula_Bean CSBE = new Curso_Seccion_Aula_Bean();

    AlumnoController oAlumnoController = new AlumnoController();
    ArrayList<AlumnoBean> lstAlumno = oAlumnoController.SelectAll(); // acà 
    
    
    SeccionController oSeccionController = new SeccionController();
    ArrayList<SeccionBean> lstSeccion = oSeccionController.SelectAll();
    
    CursoController2 OCursoController2 = new CursoController2();
    ArrayList<CursoBean2> lstCurso2 = OCursoController2.SelectAll();
// invocación del docente
    DocenteController oDocenteController = new DocenteController();
    ArrayList<DocenteBean> lstDocente = oDocenteController.SelectAll();
    // invocación del aula
    
    AulaController oAulaController = new AulaController();
    ArrayList<AulaBean> lstAula = oAulaController.SelectAll();
    
    Curso_Seccion_Aula_Controller  controlador_has = new Curso_Seccion_Aula_Controller();
    

    if ("CREATE".equalsIgnoreCase(request.getParameter("accion"))) {
    CSBE.setCur_codigo(request.getParameter("cur_codigo"));
    CSBE.setId_seccion(request.getParameter("txt_id_seccion"));
    CSBE.setId_aula(request.getParameter("txt_id_aula"));
    CSBE.setId_docente(request.getParameter("txt_docente"));
    CSBE.setEstado(Integer.parseInt(request.getParameter("txt_estado")));
    
       

         controlador_has.Insert(CSBE);
        response.sendRedirect("CursoHasSeccionListar.jsp");
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
            <h1>Asignación de Cursos a Profesores </h1> 
            <form action="CursoHasSeccionAgregar.jsp" method="GET">


                <br>
                <input class="form-control" type="hidden" name="txt_id_matricula">

           Curso:<br>
            <select name="cur_codigo" class="form-control mb-2">
                <%
                    for (int i = 0; i < lstCurso2.size(); i++) {
                    
                        %>
                        <option value="<%=lstCurso2.get(i).getId_curso()%>"><%=lstCurso2.get(i).getId_curso() +" "+ lstCurso2.get(i).getNombre_curso()%></option> 
                        <%}
                %>
            </select>

                SECCION:<br>
                <select name="txt_id_seccion" class="form-control mb-2">
                    <%
                        for (int i = 0; i < lstSeccion.size(); i++) {

                    %>
                    <option value="<%=lstSeccion.get(i).getId_seccion()%>"> <%=" "%> <%=lstSeccion.get(i).getId_seccion() + " " + lstSeccion.get(i).getSec_descri()%></option> 
                    <%}
                    %>
                </select> 

                Aula:<br>
            <select name="txt_id_aula" class="form-control mb-2">
                <%
                    for (int i = 0; i < lstAula.size(); i++) {
                    
                        %>
                        <option value="<%=lstAula.get(i).getId_aula()%>"><%=lstAula.get(i).getId_aula() +" "+ lstAula.get(i).getAul_descri()%></option> 
                        <%}
                %>
            </select> 
               Docente:<br>
            <select name="txt_docente" class="form-control mb-2">
                <%
                    for (int i = 0; i < lstDocente.size(); i++) {
                    
                        %>
                        <option value="<%=lstDocente.get(i).getId_docente()%>"><%=lstDocente.get(i).getDoc_nombre() +" "+lstDocente.get(i).getDoc_apellido()  %>
                        </option> <%}
                %>
            </select> 

                ESTADO:<br>
                <select class="form-control mb-4" name="txt_estado">
                    <option value="1" >En curso</option>
                    <option value="0">Culminado</option>


                    <input class="btn btn-primary" type="submit" name="accion" value="CREATE">
                    <a class="btn btn-danger" href="MatriculaListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
            </form>
        </div>
    </body>
</html>