<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="modelo.AlumnoBean"%>
<%@page import="java.util.List"%>
<%@page import="dao.Negocio"%>
<%@page import="dao.SeccionController"%>
<%@page import="modelo.SeccionBean"%>
<%@page import="java.util.ArrayList"%>
<html>
<head>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.2/Chart.min.js"></script>
    <style>
        .container {
            width: 70%;
            margin: 15px auto;
            background-color: #71dd8a;
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
        <h2>Gráfico de Alumnos por Sexo</h2>
        <div>
            <form id="filterForm" method="get" action="GraficoServlet">
                <select name="selectedSex" id="selectedSex" onchange="updateChart()">
                    <option value="">Todos</option>
                    <option value="M">Masculino</option>
                    <option value="F">Femenino</option>
                </select>
            </form>
            <canvas id="myChart"></canvas>
        </div>
    </div>

    <script>
        function updateChart() {
            var selectedSex = document.getElementById('selectedSex').value;
            var url = 'GraficoServlet?selectedSex=' + selectedSex;

            fetch(url)
                .then(response => response.json())
                .then(data => {
                    var labels = data.map(item => item.alu_sexo);
                    var counts = data.map(item => item.count);

                    var ctx = document.getElementById("myChart").getContext("2d");
                    var myChart = new Chart(ctx, {
                        type: "bar",
                        data: {
                            labels: labels,
                            datasets: [{
                                label: "Número de Alumnos",
                                data: counts,
                                backgroundColor: ["rgba(75, 192, 192, 0.6)", "rgba(153, 255, 102, 0.6)"]
                            }]
                        }
                    });
                });
        }

        // Load initial chart
        window.onload = updateChart;
    </script>
</body>
</html>
