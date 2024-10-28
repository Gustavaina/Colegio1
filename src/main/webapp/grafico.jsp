

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
        <style>
            .container {
                width: 70%;
                margin: 15px auto;
                background-color: pink;
                padding: 20px;
            }
            body {
                text-align: center;
                color: green;
            }
            h2 {
                text-align: center;
                font-family: "Verdana", sans-serif;
                font-size: 30px;
            }
        </style>
    </head>
    <body>
          
    <h2>Distribución de Alumnos por Sexo</h2>
    <div class="container">
      <h2>Grafico de Alumnos por Sexo</h2>
      <div>
        <canvas id="myChart"></canvas>
      </div>
    </div>
    </body>
    
</html>
