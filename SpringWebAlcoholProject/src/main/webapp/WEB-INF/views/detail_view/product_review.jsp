<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>리뷰보기</title>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Montserrat:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Raleway:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

    <%-- DetailView CSS Files--%>
    <link href="${pageContext.request.contextPath}/resources/css/detailview_css/main.css" rel="stylesheet">
</head>
<body>
<%--<jsp:include page="product_review.jsp"></jsp:include>--%>

<c:forEach var="review_list" items="${review_map.reviewList}" varStatus="status">
    <c:set var="index" value="${status.index}"></c:set>
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div>
                        <span class="text-start">${review_map.userList[index].user1_nickname}</span>
                        <span class="text-end">${review_list.review_rating}</span>
                        <span class="text-end">${review_list.review_regdate}</span>
                    </div>
                </div>
                <div class="card-body">
                    <p>${review_list.review_content}, ${review_list.review_filename}</p>
                    <img class="img-fluid rounded float-start w-25 h-auto"
                         src="${pageContext.request.contextPath}/resources/alcohol_image/${review_list.review_filename}"/>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- Vendor JS Files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/resources/js/detailview_js/main.js"></script>
</body>
</html>
