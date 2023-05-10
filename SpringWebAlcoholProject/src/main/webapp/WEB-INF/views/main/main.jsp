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
    <link
            href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
            rel="stylesheet">

    <!-- Vendor CSS Files -->

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
            crossorigin="anonymous">


    <link
            href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
            rel="stylesheet">


    <!-- Template Main CSS File -->
    <link
            href="${pageContext.request.contextPath}/resources/css/main_css/main.css"
            rel="stylesheet">

</head>
<body>
<!-- Start Basic Modal-->
<c:if test="${res ne null}">
    <button type="button" id="modalBtn" class="btn btn-primary visually-hidden" data-bs-toggle="modal"
            data-bs-target="#basicModal">
    </button>
    <div class="modal" id="basicModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold text-primary">회원정보 수정</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <c:choose>
                    <c:when test="${res eq 1}">
                        <div class="modal-body fw-bold">
                            회원정보 수정에 성공했습니다.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </c:when>
                    <c:when test="${res eq 0}">
                        <div class="modal-body fw-bold">
                            회원정보 수정에 실패했습니다. 다시 진행해주세요.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary fw-bold" data-bs-dismiss="modal">Close</button>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
    <!-- End Basic Modal-->

</c:if>

<%-- header --%>
<jsp:include page="header.jsp"></jsp:include>
<c:if test="${isUser1 ne null}">
    <!-- Button trigger modal -->
    <button type="hidden" id="modalBtn" class="btn btn-primary"
            data-bs-toggle="modal" data-bs-target="#exampleModal">
        Launch demo modal
    </button>

    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1"
         aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그인 정보 확인</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">로그인 중입니다.</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                            data-bs-dismiss="modal">Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</c:if>

<main id="main" class="main">
    <div class="container">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8 d-flex justify-content-center">
                <img class="img-fluid"
                     src="${pageContext.request.contextPath}/resources/upload/main_img.jpg">
            </div>
            <div class="col-2"></div>
        </div>
    </div>

</main>
<!-- End #main -->

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<jsp:include page="footer.jsp"></jsp:include>

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>


<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/register/mainjs.js"></script>
<!-- Vendor JS Files -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/main_js/main.js"></script>

</body>
</html>
