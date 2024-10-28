<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="metodos.AlumnoMetodos" %>
<%@ page import="util.MySQLConexion" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/css/stylescursos.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous" />
    <title>Ingreso DNI</title>
</head>
<body>
    <section>
        <div class="container mt-5 pt-5">
            <div class="row">
                <div class="col-12 col-sm-7 col-md-6 m-auto">
                    <div class="card border-0 shadow">
                        <div class="card-body">
                            <p align="center"><strong>Bienvenidos al Colegio</strong></p>
                            <svg class="mx-auto my-3" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                            </svg>

                            <%
                    AlumnoMetodos alumnoMetodos = new AlumnoMetodos();
                    boolean dniValido = false;
                    String mensaje = "";

                    if (request.getMethod().equalsIgnoreCase("POST")) {
                        String dni = request.getParameter("dni").trim();

                        if (dni.length() != 8 || !dni.matches("\\d{8}")) {
                            mensaje = "Por favor, ingresa un DNI válido de 8 dígitos.";
                        } else if (alumnoMetodos.verificarDni(dni)) {
                            dniValido = true;
                            out.println("<script>alert('DNI válido.'); window.location.href='Cursos.jsp';</script>");
                        } else {
                            mensaje = "DNI no encontrado. Por favor, verifica e intenta de nuevo.";
                        }
                    }
                %>

                            <form id="loginForm" method="post">
                                <input type="text" name="dni" id="dni" class="form-control my-4 py-2" placeholder="Ingrese su DNI (8 dígitos)" required />
                                
                                <% if (!mensaje.isEmpty()) { %>
                                    <div class="alert alert-danger" role="alert">
                                        <%= mensaje %>
                                    </div>
                                <% } %>
                                
                                <div class="text-center mt-3">
                                    <input type="submit" class="btn btn-primary" value="Verificar DNI" />
                                    <a href="#" class="nav-link">No recuerdas tu contraseña?</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <a href="Ingresar.jsp" class="export-button">Volver a elegir Login</a>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384" crossorigin="anonymous"></script>
</body>
</html>
