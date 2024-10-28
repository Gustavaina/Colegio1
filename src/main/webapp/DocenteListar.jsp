<%-- 
    Document   : DocenteListar
    Created on : 10/06/2023, 08:07:50 PM
    Author     : win10
--%>
<%@page import="modelo.DocenteBean"%>
<%@page import="dao.DocenteController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    DocenteController UBL = new DocenteController();

    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    if (request.getParameter("accion") != null) {
        //ACCION -> ELIMINAR
        if ("DELETE".equalsIgnoreCase(request.getParameter("accion")) && request.getParameter("id") != null) {
            //TOKEN -> CODIGO USUARIO
            UBL.Delete(request.getParameter("id"));
            response.sendRedirect("DocenteListar.jsp");
        }

    }

    List<DocenteBean> ldata = UBL.SelectAll();

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
    List<DocenteBean> currentPageData = ldata.subList(start, end);

%>
<%    if (session.getAttribute("codigo_usuario") != null) {

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
                <h1 >Lista de Docentes </h1>
            </div>

            <div class="row pb-3">
                <div class="col-lg-8 col-md-9 col-sm-9 col-xs-12 mb-2">                
                    <a class="btn btn-sm btn-outline-primary" href="DocenteAgregar.jsp"><i class="fa fa-plus"></i> Nuevo</a>
                    <a class="btn btn-sm btn-outline-success ml-1" href="DocenteListar.jsp"><i class="fa fa-refresh"></i> Actualizar</a>
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
                                <th data-toggle="true" class="footable-first-column">
                                    ID docente
                                </th>
                                <th>
                                    Nombre
                                </th>
                                <th>
                                    Apellido
                                </th>
                                <th>
                                    Dni
                                </th>
                                <th>
                                    Telefono
                                </th>
                                <th>
                                    Descripcion
                                </th>  
                                <th>
                                    Estado
                                </th>
                                <th class="footable-last-column"></th>

                            </tr>
                        </thead>   
                        <%                DocenteBean item = null;
                            Iterator<DocenteBean> iter = ldata.iterator();
                            while (iter.hasNext()) {
                                item = iter.next();
                        %>
                        <tbody>
                            <tr>
                                <td><%=item.getId_docente()%></td>                         
                                <td><%=item.getDoc_nombre()%></td>
                                <td><%=item.getDoc_apellido()%></td>
                                <td><%=item.getDoc_dni()%></td>
                                <td><%=item.getDoc_telefono()%></td>
                                <td><%=item.getDoc_descri()%></td>
                                <td><%= item.getDoc_estcod() == 1 ? "Activo" : "Inactivo"%></td>

                                <td>      
                                    <a class="btn btn-sm btn-warning" href="DocenteEditar.jsp?accion=EDIT&id=<%=item.getId_docente()%>"><i class="fas fa-pencil fa-xs"> </i></a>
                                    <a class="btn btn-sm btn-danger" href="DocenteListar.jsp?accion=DELETE&id=<%=item.getId_docente()%>"><i class="fas fa-trash fa-xs"> </i></a>      
                                </td>  
                            </tr>
                            <%   }  %>
                        </tbody>
                        <tfoot class="hide-if-no-paging">
                            <tr>
                                <td colspan="10" class="text-center">
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