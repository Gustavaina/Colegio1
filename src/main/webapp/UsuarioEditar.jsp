<%@page import="modelo.UsuarioBean"%>
<%@page import="dao.UsuarioController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    UsuarioController UBL = new UsuarioController();
    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    UsuarioBean uBE = new UsuarioBean();    
    if(request.getParameter("accion") != null){        
        //ACCION -> ELIMINAR
        if("EDIT".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("id") != null ){        
         uBE = UBL.SelectByCodigo(request.getParameter("id"));            
        }
        if("CREATE".equalsIgnoreCase(request.getParameter("accion"))){
            uBE.setId_usuario("");
            uBE.setCodigo_usuario("");
            uBE.setTipo_usuario("");
            uBE.setEstado(Integer.parseInt(""));
            uBE.setContrasena_usuario("");
        }
        
        if("UPDATE".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("id") != null ){
            uBE.setId_usuario(request.getParameter("id_usuario"));
            uBE.setCodigo_usuario(request.getParameter("txt_codigo_usuario"));
            uBE.setTipo_usuario(request.getParameter("txt_tipo_usuario"));
            uBE.setEstado(Integer.parseInt(request.getParameter("txt_estado")));
            uBE.setContrasena_usuario(request.getParameter("txt_contrasena_usuario"));
            UBL.Update(uBE);
            response.sendRedirect("UsuarioListar.jsp");    
        }
        
        if("INSERT".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("id") != null ){
            uBE.setId_usuario(request.getParameter("id_usuario"));
            uBE.setCodigo_usuario(request.getParameter("txt_codigo_usuario"));
            uBE.setTipo_usuario(request.getParameter("txt_tipo_usuario"));
            uBE.setEstado(Integer.parseInt(request.getParameter("txt_estado")));
            uBE.setContrasena_usuario(request.getParameter("txt_contrasena_usuario"));
            UBL.Insert(uBE);
            response.sendRedirect("UsuarioListar.jsp");    
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
        <h1>Usuario <%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "Nuevo" :"Editar")%></h1>
        <form action="UsuarioEditar.jsp" method="POST">
            <input type="hidden" name="accion" 
                   value="<%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "INSERT" :"UPDATE")%>">
            Codigo:<br>
            <input class="form-control" type="text" name="id_usuario" 
                   <%=("".equalsIgnoreCase(uBE.getId_usuario())? "" :"readonly")%>
                   value="<%=uBE.getId_usuario()  %>">
            Nombre:<br>
            <input class="form-control" type="text" name="txt_codigo_usuario"
                   value="<%=uBE.getCodigo_usuario() %>">
            Password:<br>
            <input class="form-control" type="password" name="txt_tipo_usuario"
                   value="<%=uBE.getTipo_usuario() %>">
            Descripción:<br>
            <input class="form-control" type="text" name="txt_estado" 
                   value="<%=uBE.getEstado() %>" >
            Email:<br>
            <input class="form-control" type="text" name="txt_contrasena_usuario" 
                   value="<%=uBE.getContrasena_usuario() %>" >
            Estado:<br>
            <select class="form-control ">
                <option value="0">Inactivo</option>
                <option value="1">Activo</option>
            </select>
            <input class="btn btn-primary" type="submit" name="accion" value="actualizar">
            
            <a class="btn btn-danger" href="UsuarioListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
