<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>taste rating</title>

    <%-- boot strap --%>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
          rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/detailview_css/taste_rating.css">
</head>
<body>
<%--<jsp:include page="taste_rating.jsp?PRODUCT_SWEET_RATING=#&
                        PRODUCT_SOURISH_RATING=#&
                        PRODUCT_CLEANTASTE_RATING=#&
                        PRODUCT_BODYTASTE_RATING=#&
                        PRODUCT_SPARKLING_RATING=#"></jsp:include>--%>
<h2 class="fw-bold text-primary">맛의 정도</h2>
<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-chart-bar me-1"></i>
        <span class="fw-bold text-black card-title">향미 그래프</span>
    </div>
    <div class="card-body">
        <canvas id="myBarChart" width="100%" height="50"></canvas>
    </div>
</div>
<div>
<c:if test="${param.product_sparkling_rating eq 1}">
    <c:set var="isSparking" value="0"></c:set>
    <h2 class="fw-bold">탄산 : 있음</h2>
</c:if>
<c:if test="${param.product_sparkling_rating eq 0}">
    <c:set var="isSparking" value="1"></c:set>
    <h2 class="fw-bold">탄산 : 없음</h2>
</c:if>
</div>
<%--<div class="card mb-4">
    <div class="card-header">
        <i class="fas fa-chart-bar me-1"></i>
        <span class="fw-bold text-black card-title">탄산 유무, ${param.product_sparkling_rating}</span>
    </div>
    <div class="card-body">
        <canvas id="myPieChart" width="100%" height="50"></canvas>
    </div>
</div>--%>

<%-- bootStrap --%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.bundle.min.js"></script>

<script>
    // Bar Chart Example
    var ctx = document.getElementById("myBarChart");
    var myLineChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ["단맛", "신맛", "담백", "바디감"],
            datasets: [{
                label: "점수",
                backgroundColor: ["rgba(47, 157, 39, 1)", "rgba(250, 237, 125, 1)", "rgba(181, 178, 255,1)", "rgba(2,117,216,1)"],
                borderColor: "rgba(2,117,216,1)",
                data: [${param.product_sweet_rating}, ${param.product_sourish_rating}, ${param.product_cleantaste_rating}, ${param.product_bodytaste_rating}]
            }],
        },
        options: {
            scales: {
                xAxes: [{
                    time: {
                        unit: 'month'
                    },
                    gridLines: {
                        display: false
                    },
                    ticks: {
                        maxTicksLimit: 6
                    }
                }],
                yAxes: [{
                    ticks: {
                        min: 0,
                        max: 10,
                        maxTicksLimit: 5
                    },
                    gridLines: {
                        display: true
                    }
                }],
            },
            legend: {
                display: false
            }

        }
    });

    // Pie Chart Example
    var ctx1 = document.getElementById("myPieChart");
    var myPieChart1 = new Chart(ctx1, {
        type: 'pie',
        data: {
            datasets: [{
                backgroundColor: ["rgba(255, 255, 255, 1)", "rgba(47, 157, 39, 1)"],
                data: [${isSparking}, ${param.product_sparkling_rating}]
            }],
        },
    });

</script>

</body>
</html>
