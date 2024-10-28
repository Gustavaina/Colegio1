<%@page import="modelo.UsuarioBean"%>
<%@page import="dao.UsuarioController"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UsuarioController UBL = new UsuarioController();
    
    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    if(request.getParameter("accion") != null){        
        //ACCION -> ELIMINAR
        if("DELETE".equalsIgnoreCase(request.getParameter("accion"))  && request.getParameter("id") != null ){            
            //TOKEN -> CODIGO USUARIO
            UBL.Delete(request.getParameter("id"));
            response.sendRedirect("UsuarioListar.jsp");
        }
       
    }
    
    ArrayList<UsuarioBean> ldata = UBL.SelectAll();
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="bootstrap4/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="bootstrap4/js/bootstrap.min.js" type="text/javascript"></script>
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css" integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    </head>
    <body>
        <header>
            <!-- Fixed navbar -->

        </header>
        <div class="container">
            <div class="row pb-3">
                <h1 >Lista de Usuarios</h1>
            </div>
           
            <div class="row pb-3">                
                <a class="btn btn-sm btn-outline-primary" href="AlumnoEditar.jsp?accion=CREATE"><i class="fa fa-plus"></i> Nuevo</a>
                <a class="btn btn-sm btn-outline-success ml-1" href="UsuarioListar.jsp"><i class="fa fa-refresh"></i> Actualizar</a>
                <a class="btn btn-sm btn-outline-secondary ml-1"><i class="fa fa-print"></i> Imprimir</a>
                <a class="btn btn-sm btn-outline-danger ml-1"><i class="fas fa-file-pdf"></i> Exportar</a>
            </div>
            <div class="row pb-3">
                <div class="table-responsive">
                    <table class="footable table table-hover table-striped table-bordered table-responsive-sm"  data-paging="true">
                        <thead>
                            <th>ID</th>
            <th>Nombre</th>  
            <th>Apellido</th>
            <th>Dni</th>
            <th>Telefono</th>
             <th>Direccion</th>
                        <th></th>
                        </thead>
                        <tbody>
                            <%
                                UsuarioBean item = null;
                                Iterator<UsuarioBean> iter = ldata.iterator();
                                while (iter.hasNext()) {
                                    item = iter.next();
                            %>

                            <tr>
                                <%=item.getId_usuario()%></td>
                                <td><%=item.getCodigo_usuario()%></td>
                                <td><%=item.getTipo_usuario()%></td>
                                <td><%=item.getEstado()%></td>
                                <td><%=item.getContrasena_usuario()%></td>
                                <td>
                                    <a class="btn btn-sm btn-warning" href="UsuarioEditar.jsp?accion=EDIT&id=<%=item.getId_usuario()%>"><i class="fas fa-pencil fa-xs"></i></a>
                                    <a class="btn btn-sm btn-danger" href="UsuarioListar.jsp?accion=DELETE&id=<%=item.getId_usuario()%>"><i class="fas fa-trash fa-xs"></i></a>
                                </td>
                            </tr>

                            <%  }%>
                        </tbody>
                    </table>
                </div>
                </main>
            </div>
        </div>

        <script>
            window.onload = function () {
                var span = document.createElement('span');

                span.className = 'fas';
                span.style.display = 'none';
                document.body.insertBefore(span, document.body.firstChild);

                //alert(window.getComputedStyle(span, null).getPropertyValue('font-family'));

                document.body.removeChild(span);
            };
        </script>
    </body>
</html>
