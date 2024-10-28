<%@page import="dao.MatriculaController"%>
<%@page import="modelo.SeccionBean"%>
<%@page import="dao.SeccionController"%>
<%@page import="modelo.AlumnoBean"%>
<%@page import="dao.AlumnoController"%>
<%@page import="modelo.MatriculaBean"%>
<%@page import="java.util.ArrayList"%>
<%
    MatriculaBean aBE = new MatriculaBean();

    AlumnoController oAlumnoController = new AlumnoController();
    ArrayList<AlumnoBean> lstAlumno = oAlumnoController.SelectAll(); // acà 
    
    
    SeccionController oSeccionController = new SeccionController();
    ArrayList<SeccionBean> lstSeccion = oSeccionController.SelectAll();

    MatriculaController AC = new MatriculaController();
    if ("CREATE".equalsIgnoreCase(request.getParameter("accion"))) {

        aBE.setId_alumno(request.getParameter("txt_id_alumno"));
        aBE.setId_seccion(request.getParameter("txt_id_seccion"));
        aBE.setMatricula_fecha_ingreso(request.getParameter("txt_matricula_fecha_ingreso"));
        aBE.setMatricula_estado(Integer.parseInt(request.getParameter("txt_estado")));

        AC.Insert(aBE);
        response.sendRedirect("MatriculaListar.jsp");
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
            <h1>Creación de matricula  </h1> 
            <form action="MatriculaAgregar.jsp" method="GET">


                <br>
                <input class="form-control" type="hidden" name="txt_id_matricula">


                ALUMNO:<br>
                <select name="txt_id_alumno" class="form-control mb-2">
                    <%                    for (int i = 0; i < lstAlumno.size(); i++) {

                    %>
                    <option value="<%=lstAlumno.get(i).getAlu_id()%>"> <%=lstAlumno.get(i).getAlu_id()%><%=" "%><%=lstAlumno.get(i).getAlu_nombres()%></option> 
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

                Fecha Ingreso:<br>
                <input class="form-control" type="text" name="txt_matricula_fecha_ingreso"
                      value="2018-09-08"  >

                ESTADO:<br>
                <select class="form-control mb-4" name="txt_estado">
                    <option value="1" >Disponible</option>
                    <option value="0">No disponible</option>


                    <input class="btn btn-primary" type="submit" name="accion" value="CREATE">
                    <a class="btn btn-danger" href="MatriculaListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
            </form>
        </div>
    </body>
</html>