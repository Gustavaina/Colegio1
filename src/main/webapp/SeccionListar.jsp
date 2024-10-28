   

<%@page import="modelo.SeccionBean"%>
<%@page import="dao.SeccionController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>   
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    
    SeccionController UBL = new SeccionController();

    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    if (request.getParameter("accion") != null) {
        //ACCION -> ELIMINAR
        if ("DELETE".equalsIgnoreCase(request.getParameter("accion")) && request.getParameter("id") != null) {
            //TOKEN -> CODIGO USUARIO
            UBL.Delete(request.getParameter("id"));
            response.sendRedirect("SeccionListar.jsp");
        }

    }

    List<SeccionBean> ldata = UBL.SelectAll();

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
    List<SeccionBean> currentPageData = ldata.subList(start, end);

%>
<%    if (session.getAttribute("codigo_usuario") != null) {

%>

<!DOCTYPE html>
<html>
    <head>
        <title>include</title>
        <%@include file="shared_styles.jsp" %>
    </head>
    <body>
        <%@include file="shared_navbar.jsp" %>
        <div class="container">
            <div class="row pb-3">
                <h1 >Lista de Secciones </h1>
            </div>

            <div class="row pb-3">
                <div class="col-lg-8 col-md-9 col-sm-9 col-xs-12 mb-2">                
                    <a class="btn btn-sm btn-outline-primary" href="SeccionAgregar.jsp"><i class="fa fa-plus"></i> Nuevo</a>
                    <a class="btn btn-sm btn-outline-success ml-1" href="SeccionListar.jsp"><i class="fa fa-refresh"></i> Actualizar</a>
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
                    <table class="footable table table-hover table-striped table-bordered table-responsive-sm toggle-arrow-tiny" data-page-size="3" data-filter=#filter>            
                        <thead>
                            <tr>
                                <th data-toggle="true" class="footable-first-column">
                                    ID Seccion
                                </th>
                                <th>
                                    Descripcion
                                </th>  
                                <th>
                                    Aula
                                </th>
                                <th>
                                    Nivel
                                </th>
                                <th>
                                    Estado
                                </th>
                                <th class="footable-last-column"></th>
                            </tr>
                        </thead>   
                        <%                SeccionBean item = null;
                            Iterator<SeccionBean> iter = ldata.iterator();
                            while (iter.hasNext()) {
                                item = iter.next();


                        %>
                        <tbody>
                            <tr>
                                <td><%=item.getId_seccion()%></td>
                                <td><%=item.getSec_descri()%></td>           
                                <td><%=item.getDescri_aula()%></td>
                                <td><%=item.getDescri_nivel()%></td>
                                <td><%=(item.getSec_estcod() == 1 ? "Disponible" : "No disponible")%></td>

                                <td>      
                                    <a class="btn btn-sm btn-warning" href="SeccionEditar.jsp?accion=EDIT&id=<%=item.getId_seccion()%>"><i class="fas fa-pencil fa-xs"> </i></a>

                                    <a class="btn btn-sm btn-danger" href="SeccionListar.jsp?accion=DELETE&id=<%=item.getId_seccion()%>"><i class="fas fa-trash fa-xs"> </i></a>  
                                    <a class="btn btn-sm btn-success" href="SeccionCursoListar.jsp?id=<%=item.getId_seccion()%>"><i class="fas fa-book fa-xs"> </i></a>
                                </td>  
                            </tr>
                            <%   }  %>
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