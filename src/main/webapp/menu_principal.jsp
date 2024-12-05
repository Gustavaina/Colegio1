<%@page import="modelo.AlumnoBean"%>
<%@page import="modelo.CursoBean2"%>
<%@page import="dao.AlumnoController"%>
<%@page import="dao.CursoController2"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>

<!doctype html>
<html lang="en">



    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <!-- Styles -->
        <link rel="stylesheet" href="assets/css/stylee.css">

        <!-- Google fonts -->
        <link href="https://fonts.googleapis.com/css?family=Muli:300,700&display=swap" rel="stylesheet">

        <!-- Ionic icons -->
        <link href="https://unpkg.com/ionicons@4.5.10-0/dist/css/ionicons.min.css" rel="stylesheet">

        <title>Dashboard - Templune</title>
    </head>
    <%
        String parametro = request.getParameter("filtro");
        CursoController2 UBL = new CursoController2();
        AlumnoController AC = new AlumnoController();
        //EVALUACION DE EXISTEN INICIAL DE PARAMETROS
        if (request.getParameter("accion") != null) {
            //ACCION -> ELIMINAR
            if ("DELETE".equalsIgnoreCase(request.getParameter("accion")) && request.getParameter("id") != null) {
                //TOKEN -> CODIGO USUARIO
                UBL.Delete(request.getParameter("id"));
                response.sendRedirect("CursoListar2.jsp");
            }

        }

        ArrayList<CursoBean2> ldata = UBL.SelectAll();
        List<AlumnoBean> ldata2 = AC.SelectAll();

        int count = ldata.size();
        int count2 = ldata.size();

    %>
    <%if (session.getAttribute("codigo_usuario") != null) {

    %>

    <body>
        <div class="d-flex" id="content-wrapper">

            <!-- Sidebar -->
            <div id="sidebar-container" class="bg-primary">
                <div class="logo">
                    <h4 class="text-light font-weight-bold mb-0">Colegio</h4>
                </div>
                <div class="menu">
                    <a href="#" class="d-block text-light p-3 border-0"><i class="icon ion-md-arrow-dropup-circle lead mr-2"></i>
                        Tablero</a>

                    <div class="container mt-3">
                        <div class="dropdown">
                            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="icon ion-md-apps lead mr-2"></i>
                                Tablas
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="RegistroApoderados.jsp"><i class="icon ion-md-person lead mr-2"></i> Apoderados </a>
                                <a class="dropdown-item" href="AlumnoListar.jsp"><i class="icon ion-md-people lead mr-2"></i> Alumnos </a>
                                <a href="AulaListar.jsp" class="dropdown-item"><i class="icon ion-md-person lead mr-2"></i> Aulas </a>
                                <a class="dropdown-item" href="TurnoListar.jsp"><i class="icon ion-md-apps lead mr-2"></i> Turnos </a>
                                <a class="dropdown-item" href="CursoListar.jsp"><i class="icon ion-md-apps lead mr-2"></i> Cursos </a>
                                <a class="dropdown-item" href="MatriculaCompleta.jsp"><i class="icon ion-md-apps lead mr-2"></i> Matricula </a>
                                <!--<a href="PensionListar.jsp" class="dropdown-item"><i class="icon ion-md-person lead mr-2"></i>Metodo de pago</a>

                                <!--<a class="dropdown-item" href="SeccionListar.jsp"><i class="icon ion-md-person lead mr-2"></i>Secciones</a>
                                <a class="dropdown-item" href="MatriculaListar.jsp"><i class="icon ion-md-person lead mr-2"></i>Matriculas</a>
                                <a class="dropdown-item" href="NotasListar.jsp"><i class="icon ion-md-person lead mr-2"></i>Notas</a>
                                <a href="AulaListar.jsp" class="dropdown-item"><i class="icon ion-md-person lead mr-2"></i>Aulas </a>

                                <a href="DocenteListar.jsp" class="dropdown-item"><i class="icon ion-md-person lead mr-2"></i>
                                    Docentes</a>

                                <a href="PensionListar.jsp" class="dropdown-item"><i class="icon ion-md-person lead mr-2"></i>
                                    Pensiones</a>

                                <a href="CursoHasSeccionListar.jsp" class="dropdown-item"><i class="icon ion-md-person lead mr-2"></i>
                                    Cursos por seccion</a> -->
                                
                            </div>
                        </div>
                    </div>

                    <!--<div class="container mt-3">
                        <div class="dropdown">
                            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="icon ion-md-search lead mr-2"></i>
                                Consultas
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                 <a class="dropdown-item" href="JsfConsulta.xhtml"><i class="icon ion-md-people lead mr-2"></i>Consulta de matriculas</a>
                                  <a class="dropdown-item" href="JsfConsulta2.xhtml"><i class="icon ion-md-people lead mr-2"></i>Consulta de cursos</a>

                            </div>
                        </div>
                    </div>-->

                    <!--<div class="container mt-3">
                        <div class="dropdown">
                            <button class="btn btn-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="icon ion-md-stats lead mr-2"></i>
                                Graficos
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <a class="dropdown-item" href="Graficos.jsp"><i class="icon ion-md-people lead mr-2"></i>Graficos Matricula</a>

                            </div>
                        </div>
                    </div>-->


                </div>
            </div>
            <!-- Fin sidebar -->

            <div class="w-100">

                <!-- Navbar -->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container">

                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <form class="form-inline position-relative d-inline-block my-2">
                                <input class="form-control" type="search" placeholder="Buscar" aria-label="Buscar">
                                <button class="btn position-absolute btn-search" type="submit"><i class="icon ion-md-search"></i></button>
                            </form>
                            <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
                                <li class="nav-item dropdown">
                                    <a class="nav-link text-dark dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <img src="assets/img/user-1.png" class="img-fluid rounded-circle avatar mr-2"
                                             alt="https://generated.photos/" />
                                        ${codigo_usuario}


                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#">Mi perfil</a>
                                        <a class="dropdown-item" href="#">Suscripciones</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="index.jsp">Cerrar sesión</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Fin Navbar -->

                <!-- Page Content -->
                <div id="content" class="bg-grey w-100">

                    <section class="bg-light py-3">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-9 col-md-8">
                                    <h1 class="font-weight-bold mb-0">${codigo_usuario}</h1>
                                    <p class="lead text-muted">Información</p>
                                </div>
                                <!--<div class="col-lg-3 col-md-4 d-flex">
                                    <button class="btn btn-primary w-100 align-self-center">Exportar Cursos</button>
                                </div>-->
                            </div>
                        </div>
                    </section>

                    <section class="bg-mix py-3">
                        <div class="container">
                            <div class="card rounded-0">
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-6 d-flex stat my-3">
                                            <div class="mx-auto">
                                                <h6 class="text-muted">Cantidad De cursos </h6>
                                                <h3 class="font-weight-bold"><%=count%></h3>
                                                <h6 class="text-success"><i class="icon ion-md-arrow-dropup-circle"></i> </h6>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 d-flex stat my-3">
                                            <div class="mx-auto">
                                                <h6 class="text-muted">Cantidad de Alumnos</h6>
                                                <h3 class="font-weight-bold"><%=count2%></h3>
                                                <h6 class="text-success"><i class="icon ion-md-arrow-dropup-circle"></i> </h6>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 d-flex stat my-3">
                                            <div class="mx-auto">
                                                <h6 class="text-muted">Estado de Usuario</h6>
                                                <h3 class="font-weight-bold">Activo</h3>
                                                <h6 class="text-success"><i class="icon ion-md-arrow-dropup-circle"></i> </h6>
                                            </div>
                                        </div>
                                        <div class="col-lg-3 col-md-6 d-flex my-3">
                                            <div class="mx-auto">
                                                <h6 class="text-muted">Usuarios nuevos</h6>
                                                <h3 class="font-weight-bold">0</h3>
                                                <h6 class="text-success"><i class="icon ion-md-arrow-dropup-circle"></i> </h6>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>

                    <section>

                        <div class="container">
                            <div class="row">
                                <div class="col-lg-8 my-3">
                                    <div class="card rounded-0">
                                        <div class="card-header bg-light">
                                            <h6 class="font-weight-bold mb-0">Cursos Disponibles </h6>


                                        </div>

                                    </div>



                                </div>
                            </div>
                            <div class="container mt-3" >
                                <div class="row">
                                    <%

                                        CursoBean2 item = null;
                                        Iterator<CursoBean2> iter = ldata.iterator();
                                        while (iter.hasNext()) {
                                            item = iter.next();


                                    %> 

                                    <div class="col-lg-4 col-md-6 col-sm-12">
                                        <div class="card">
                                            <img src="pagin/logo-curso.png" class="card-img-top" alt="...">
                                            <div class="card-body">
                                                <h5 class="card-title"><%=item.getNombre_curso()%></h5>
                                                <p class="card-text">
                                                    <%=item.getDescripcion_curso()%>

                                                </p>




                                                <%   String estado = "";
                                                    if (item.getEstado_curso() == 1) {
                                                        estado = "Activo";
                                                    } else {
                                                        estado = "Inactivo";
                                                    }


                                                %>
                                                <a href="#" class="btn btn-primary"><%=estado%></a>

                                            </div>
                                        </div>
                                    </div>

                                    <%}   %>

                                </div>
                            </div>  
                        </div>
                </div>
                </section>

            </div>

        </div>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3/dist/Chart.min.js" integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>
    <script>
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Feb 2020', 'Mar 2020', 'Abr 2020', 'May 2020'],
                datasets: [{
                        label: 'Nuevos usuarios',
                        data: [50, 100, 150, 200],
                        backgroundColor: [
                            '#12C9E5',
                            '#12C9E5',
                            '#12C9E5',
                            '#111B54'
                        ],
                        maxBarThickness: 30,
                        maxBarLength: 2
                    }]
            },
            options: {
                scales: {
                    yAxes: [{
                            ticks: {
                                beginAtZero: true
                            }
                        }]
                }
            }
        });
    </script>
</body>

</html>


<%
    } else {

        response.sendRedirect("index.jsp");
    }
%>