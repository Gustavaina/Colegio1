<%@page import="modelo.Curso_Seccion_Aula_Bean"%>
<%@page import="dao.Curso_Seccion_Aula_Controller"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<%
    Curso_Seccion_Aula_Controller CSC = new Curso_Seccion_Aula_Controller();

    //Curso_Seccion_Aula_Bean CSBE = new Curso_Seccion_Aula_Bean ();
    if (request.getParameter("accion") != null) {
        //ACCION -> ELIMINAR
        if ("DELETE".equalsIgnoreCase(request.getParameter("accion")) && request.getParameter("id") != null) {
            //TOKEN -> CODIGO USUARIO
            CSC.Delete(request.getParameter("id"));
            response.sendRedirect("CursoHasSeccionListar.jsp");
        }

    }

    List<Curso_Seccion_Aula_Bean> ldata = CSC.SelectAllAll();

    //PAGINACIÓN
    int start = 0; //Índice de inicio de la página
    int length = 10; //Cantidad de registros por página
    int totalRecords = ldata.size();
    int totalPages = (int) Math.ceil((double) totalRecords / length);

    //Verificar si hay parámetros para la paginación
    if (request.getParameter("start") != null && request.getParameter("length") != null) {
        start = Integer.parseInt(request.getParameter("start"));
        length = Integer.parseInt(request.getParameter("length"));
    }

    //Obtener la sublista correspondiente a la página actual
    int end = Math.min(start + length, totalRecords);
    List<Curso_Seccion_Aula_Bean> currentPageData = ldata.subList(start, end);

%>

<%
    if (session.getAttribute("codigo_usuario") != null) {
%>


<html>
    <head>
        <title>include</title>
        <%@include file="shared_styles.jsp" %>
    </head>
    <body>
        <%@include file="shared_navbar.jsp" %>
        <div class="container">
            <div class="row pb-3">
                <h1 >Cursos por Seccion</h1>
            </div>

            <div class="row pb-3">
                <div class="col-lg-8 col-md-9 col-sm-9 col-xs-12 mb-2">                
                    <a class="btn btn-sm btn-outline-primary" href="CursoHasSeccionAgregar.jsp" ><i class="fa fa-plus"></i> Agregar Cursos a Profesores</a>
                    <a class="btn btn-sm btn-outline-success ml-1" href="CursoHasSeccionListar.jsp"><i class="fa fa-refresh"></i> Actualizar</a>
                    <a class="btn btn-sm btn-outline-secondary ml-1"><i class="fa fa-print"></i> Imprimir</a>
                    <a class="btn btn-sm btn-outline-danger ml-1"><i class="fas fa-file-pdf"></i> Exportar</a>
                </div>

                <div class="input-group-prepend col-lg-4 col-md-3 col-sm-3 col-xs-12 mb-2">
                    <span class="input-group-append">
                        <button class="btn btn-outline-secondary" type="button">
                            <i class="fa fa-filter"></i>
                        </button>
                    </span>
                    <input class="form-control py-2" type="text" placeholder="filtrar" id="filter">


                </div>
            </div>

            <div class="row pb-3">
                <div class="table-responsive">
                    <table class="footable table table-hover table-striped table-bordered table-responsive-sm toggle-arrow-tiny" data-page-size="1" data-filter=#filter>            <thead>
                        <thead>
                            <tr>
                                <th data-toggle="true" class="footable-first-column">Curso</th>
                                <th> Seccion</th> 
                                <th>Aula</th>
                                <th>Docente </th>
                                <th>ID Nivel</th>

                                <th>Estado  </th>
                                <th class="footable-last-column"></th>
                            </tr>
                        </thead>
                        <%                 Curso_Seccion_Aula_Bean item = null;
                            Iterator<Curso_Seccion_Aula_Bean> iter = ldata.iterator();
                            while (iter.hasNext()) {
                                item = iter.next();


                        %>
                        <tbody>
                            <tr>

                                <td><%=item.getNombre_curso()%></td>
                                <td><%=item.getSec_descri()%></td>
                                <td><%=item.getAul_descri()%></td> 
                                <td><%=item.getDoc_nombre()%></td>        

                                <td><%=item.getId_nivel()%></td> 


                                <td><%=(item.getEstado() == 1 ? "Activo" : "Inactivo")%></td>


                                <td>      
                                    <a class="btn btn-sm btn-warning" href="CursoHasSeccionEditar.jsp?accion=EDIT&id=<%=item.getCur_codigo()%>"><i class="fas fa-pencil fa-xs"> </i></a>

                                    <a class="btn btn-sm btn-danger" href="CursoHasSeccionListar.jsp?accion=DELETE&id=<%=item.getCur_codigo()%>"><i class="fas fa-trash fa-xs"> </i></a>  

                                </td>  
                            </tr>
                            <%   }%>
                        </tbody>
                        <tfoot class="hide-if-no-paging">
                            <tr>
                                <td colspan="7" class="text-center">
                                    <ul class="pagination"></ul>
                                </td>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
            <a href="menu_principal.jsp"><button type="button" class="btn btn-primary btn-lg btn-block">Menu Principal</button></a>
            <%@include file="shared_script.jsp" %>
            <script>
                window.onload = function () {
                    var span = document.createElement('span');

                    span.className = 'fas';
                    span.style.display = 'none';
                    document.body.insertBefore(span, document.body.firstChild);

                    //alert(window.getComputedStyle(span, null).getPropertyValue('font-family'));

                    document.body.removeChild(span);
                };

                jQuery(function ($) {
                    $('.footable').footable();
                });
            </script>
        </div>
    </body>
</html>

<%
    } else {
        response.sendRedirect("index.jsp");
    }
%>