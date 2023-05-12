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

    <style>
        .star-ratings {
            color: #aaa9a9;
            position: relative;
            unicode-bidi: bidi-override;
            width: max-content;
            -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
            -webkit-text-stroke-width: 1.3px;
            -webkit-text-stroke-color: #2b2a29;
        }

        .star-ratings-fill {
            color: #fff58c;
            padding: 0;
            position: absolute;
            z-index: 1;
            display: flex;
            top: 0;
            left: 0;
            overflow: hidden;
            -webkit-text-fill-color: gold;
        }

        .star-ratings-base {
            z-index: 0;
            padding: 0;
        }
    </style>
</head>
<body>
<%-- header --%>
<jsp:include page="../main/header.jsp"></jsp:include>

<main id="main" class="mainContainer">
    <div class="row"><br><br><br></div>
    <section id="portfolio" class="portfolio sections-bg">
        <div class="container" data-aos="fade-up">

            <div class="section-header">
                <h2>Review List</h2>
                <p>본인이 작성한 리뷰 리스트입니다.</p>
            </div>

            <div class="portfolio-isotope" data-portfolio-filter="*" data-portfolio-layout="masonry"
                 data-portfolio-sort="original-order" data-aos="fade-up" data-aos-delay="100">

                <div>
                    <ul class="portfolio-flters">
                        <li data-filter="*" class="filter-active fw-bold text-primary">리뷰 전체보기</li>
                        <%--<li data-filter=".filter-possible" class="fw-bold text-success">작성한 리뷰보기</li>
                        <li data-filter=".filter-done" class="fw-bold text-danger">삭제한 리뷰보기</li>--%>
                    </ul><!-- End Portfolio Filters -->
                </div>

                <div class="row gy-4 portfolio-container">

                    <c:forEach var="reviewList" items="${reviewMap.reviewList}" varStatus="status">
                        <c:set var="index" value="${status.index}"></c:set>
                        <div class="col-3 portfolio-item filter-app"></div>
                        <div class="col-6 portfolio-item filter-app">
                            <div class="card">
                                <div class="card-header bg-success bg-opacity-25">
                                    <h5 class="fw-bold text-primary"><a class="text-primary"
                                                                        href="detailview.do?product_idx=${reviewList.product_idx}">${reviewMap.productList[index].product_name}</a>
                                        / 리뷰 작성일 : ${reviewList.review_regdate}</h5>
                                </div>
                                <c:if test="${reviewList.review_del_info ne -1}">
                                    <div class="card-body">
                                        <div class="card-text">
                                            <span class="fw-bold text-success">상품 별점</span>
                                            <input type="hidden" value="${reviewList.review_rating}"
                                                   id="review_rating1">
                                            <div class="star-ratings">
                                                <div class="star-ratings-fill space-x-2 text-lg"
                                                     style="width: ${reviewList.review_rating * 20}%;">
                                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                                </div>
                                                <div class="star-ratings-base space-x-2 text-lg">
                                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                                </div>
                                            </div>

                                            <hr>

                                            <p class="text-dark fw-bold">${reviewList.review_content}</p>

                                            <c:if test="${reviewList.review_filename ne 'no_file'}">
                                                <hr>
                                                <div class="d-flex justify-content-center">
                                                    <img class="image-fluid w-25"
                                                         src="${pageContext.request.contextPath}/resources/upload/${reviewList.review_filename}"/>
                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </c:if>
                                <c:if test="${reviewList.review_del_info eq -1}">
                                    <div class="card-body">
                                        <h3 class="fw-bold text-danger text-decoration-line-through">삭제된 리뷰입니다.</h3>
                                    </div>
                                </c:if>
                                <c:if test="${reviewList.review_del_info ne -1}">
                                    <div class="card-footer">
                                        <div class="text-end">
                                            <input type="button" class="btn btn-success"
                                                   onclick="location.href='review_modify_form.do?review_idx=${reviewList.review_idx}'"
                                                   value="수정">
                                                <%--onclick="location.href='review_delete.do?review_idx=${reviewList.review_idx}'"--%>
                                            <button type="button" class="btn btn-danger" data-bs-toggle="modal"
                                                   data-bs-target="#basicModal">삭제
                                            </button>
                                            <%-- modal --%>
                                            <div class="modal" id="basicModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h4 class="modal-title text-primary fw-bold">삭제 정보</h4>
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <div class="modal-body fw-bold text-start">
                                                            정말 삭제하시겠습니까?
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="location.href='review_delete.do?review_idx=${reviewList.review_idx}'">
                                                                확인
                                                            </button>
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                            </div>
                        </div>
                        <!-- End Portfolio Item -->
                        <div class="col-3 portfolio-item filter-app"></div>

                    </c:forEach>
                </div>
            </div>
        </div>
    </section>

</main>

<%-- footer--%>
<jsp:include page="../main/footer.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Vendor JS Files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/main_js/main.js"></script>
<script>
    function delete2(){

    }
</script>
</body>
</html>
