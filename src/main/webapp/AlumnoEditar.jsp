<%@page import="modelo.AlumnoBean"%>
<%@page import="dao.AlumnoController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    AlumnoController ABL = new  AlumnoController();
    //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
    AlumnoBean aBE = new   AlumnoBean ();    
    if(request.getParameter("accion") != null){        
        //ACCION -> ELIMINAR
        if("EDIT".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("id") != null ){        
         aBE = ABL.SelectByCodigo(request.getParameter("id"));            
        }
        if("CREATE".equalsIgnoreCase(request.getParameter("accion"))){
           aBE.setAlu_id("");
            aBE.setAlu_nombres("");
           aBE.setAlu_apellidos("");
            aBE.setAlu_dni("");
            aBE.setAlu_telefono("");
            aBE.setAlu_sexo("");
            aBE.setAlu_direccion("");
        }
        
        if("UPDATE".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("txt_id") != null ){
        response.sendRedirect("AlumnoListar.jsp");   
          aBE.setAlu_id(request.getParameter("txt_id"));
            aBE.setAlu_nombres(request.getParameter("txt_nombres"));
             aBE.setAlu_apellidos(request.getParameter("txt_apellidos"));
             aBE.setAlu_dni(request.getParameter("txt_dni"));
             aBE.setAlu_telefono(request.getParameter("txt_telefono"));
              aBE.setAlu_sexo(request.getParameter("txt_sexo"));
             aBE.setAlu_direccion(request.getParameter("txt_direccion"));
            ABL.Update(aBE);
             
        }
        
        if("INSERT".equalsIgnoreCase(request.getParameter("accion")) 
        && request.getParameter("id") != null ){
          aBE.setAlu_id(request.getParameter("txt_id"));
            aBE.setAlu_nombres(request.getParameter("txt_nombres"));
             aBE.setAlu_apellidos(request.getParameter("txt_apellidos"));
             aBE.setAlu_dni(request.getParameter("txt_dni"));
             aBE.setAlu_telefono(request.getParameter("txt_telefono"));
             aBE.setAlu_sexo(request.getParameter("txt_sexo"));
             aBE.setAlu_direccion(request.getParameter("txt_direccion"));
            ABL.Insert(aBE);
            response.sendRedirect("AlumnoListar.jsp");    
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
        <h1>Alumno <%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "Nuevo" :"Editar")%></h1>
        <form action="AlumnoEditar.jsp" method="GET">
            <input type="hidden" name="accion" 
                   value="<%=("CREATE".equalsIgnoreCase(request.getParameter("accion"))
                           ? "INSERT" :"UPDATE")%>">
            Codigo:<br>
            <input class="form-control" type="text" name="txt_id" 
                   <%=("".equalsIgnoreCase(aBE.getAlu_id())? "" :"readonly")%>
                   value="<%=aBE.getAlu_id()%>">
            Nombre:<br>
            <input class="form-control" type="text" name="txt_nombres"
                   value="<%=aBE.getAlu_nombres() %>">
             Apellido:<br>
            <input class="form-control" type="text" name="txt_apellidos"
                   value="<%=aBE.getAlu_apellidos() %>">
            Dni:<br>
            <input class="form-control" type="text" name="txt_dni"
                   value="<%=aBE.getAlu_dni() %>">
            Direccion:<br>
            <input class="form-control" type="text" name="txt_direccion" 
                   value="<%=aBE.getAlu_direccion() %>" >
             Sexo:<br>
            <input class="form-control" type="text" name="txt_sexo" 
                   value="<%=aBE.getAlu_sexo() %>" >
            Telefono:<br>
            <input class="form-control" type="text" name="txt_telefono" 
                   value="<%=aBE.getAlu_telefono() %>" >
            
            
            <input class="btn btn-primary" type="submit" name="accion" value="actualizar">
            <a class="btn btn-danger" href="AlumnoListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
        </form>
        </div>
    </body>
</html>
