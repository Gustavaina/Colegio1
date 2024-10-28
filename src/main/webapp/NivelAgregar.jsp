<%-- 
    Document   : NivelAgregar
    Created on : 2 jul. 2023, 16:02:16
    Author     : User
--%>

<%@page import="dao.NivelController"%>
<%@page import="modelo.NivelBean"%>


<%
    NivelBean cBE = new NivelBean();
    NivelController CC = new NivelController();
    if ("CREATE".equalsIgnoreCase(request.getParameter("accion"))
     ) {

        //cBE.setNombre_curso(request.getParameter("txt_nombre_curso"));
        cBE.setNiv_descri(request.getParameter("txt_niv_descri"));
        cBE.setNiv_estcod(Integer.parseInt(request.getParameter("txt_niv_estcod")));

        CC.Insert(cBE);
        response.sendRedirect("NivelListar.jsp");
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
            <h1>Creación de Nivel </h1> 
            <form action="NivelAgregar.jsp" method="GET">



                <input class="form-control" type="hidden" name="txt_id_nivel"   >

                Descripcion:<br>
                <input class="form-control" type="text" name="txt_niv_descri" value="">

                Estado:<br>            
                <select name="txt_niv_estcod" class="form-control" >
                    <option value="1" >Disponible</option>
                    <option value="0" >No disponible</option>   
                </select>


                <input class="btn btn-primary" type="submit" name="accion" value="CREATE">
                <a class="btn btn-danger" href="NivelListar.jsp"><i class="fas fa-cancel fa-xs"></i> Cancelar</a>
            </form>
        </div>
    </body>
</html>
