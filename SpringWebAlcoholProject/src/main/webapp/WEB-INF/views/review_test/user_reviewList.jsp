<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Main</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">


    <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
          rel="stylesheet">


    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/resources/css/main_css/main.css" rel="stylesheet">
</head>
<body>
<%-- header --%>
<jsp:include page="../main/header.jsp"></jsp:include>

<main id="main" class="mainContainer">
    <div class="row"><br><br><br></div>
    <section id="portfolio" class="portfolio sections-bg">
        <div class="container border border-primary" data-aos="fade-up">

            <div class="section-header">
                <h2>Review List</h2>
                <p>본인이 작성한 리뷰 리스트입니다.</p>
            </div>

            <div class="portfolio-isotope" data-portfolio-filter="*" data-portfolio-layout="masonry"
                 data-portfolio-sort="original-order" data-aos="fade-up" data-aos-delay="100">

                <div>
                    <ul class="portfolio-flters">
                        <li data-filter="*" class="filter-active">리뷰 전체보기</li>
                        <li data-filter=".filter-app">작성가능한 리뷰보기</li>
                        <li data-filter=".filter-product">작성한 리뷰보기</li>
                        <%--<li data-filter=".filter-branding">Branding</li>
                        <li data-filter=".filter-books">Books</li>--%>
                    </ul><!-- End Portfolio Filters -->
                </div>

                <div class="row gy-4 portfolio-container">
                    <c:forEach var="reviewList" items="${reviewMap.reviewList}" varStatus="status">
                        <c:set var="index" value="${status.index}"></c:set>
                        <div class="col-3"></div>
                        <div class="col-6">
                            <div class="card">
                                <div class="card-header">
                                    <h5 class="fw-bold text-primary"><a class="text-primary" href="detailview.do?product_idx=${reviewList.product_idx}">${reviewMap.productList[index].product_name}</a> / 리뷰 작성일 : ${reviewList.review_regdate}</h5>
                                </div>
                                <div class="card-body">
                                    <div class="card-text">
                                        <p>${reviewList.review_content}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Portfolio Item -->
                        <div class="col-3"></div>
                    </c:forEach>
                </div>
            </div>
        </div>

    </section>

</main>

<%-- footer--%>
<jsp:include page="../main/footer.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/register/mainjs.js"></script>
<!-- Vendor JS Files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/main_js/main.js"></script>

</body>
</html>
