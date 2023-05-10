<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Board List</title>

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
<header>
    <jsp:include page="../main/header.jsp"></jsp:include>
</header>

<div class="row"><br><br><br><br></div>
<main id="main" class="main">
    <div class="row"></div>
    <div class="container">
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <table class="table table-bordered border-success caption-top">
                    <caption class="fs-2 fw-bold text-success">List of board</caption>
                    <thead class="table-primary border border-success bg-success">
                    <tr class="text-center">
                        <th style="width:10%;">No</th>
                        <th style="width:45%;">제목</th>
                        <th style="width:15%;">작성자</th>
                        <th style="width:20%;">작성일</th>
                        <th style="width:10%;">조회</th>
                    </tr>
                    </thead>
                    <tbody class="text-center">
                    <c:forEach var="board_list" items="${board_map.board_list}" varStatus="status">
                        <c:set var="index" value="${status.index}"></c:set>
                        <tr>
                            <td>${board_list.board1_idx}</td>
                            <td><a href="board_detail_view.do?board1_idx=${board_list.board1_idx}&user1_idx=${board_map.user_list[index].user1_idx}">${board_list.board1_subject}</a></td>
                            <td>${board_map.user_list[index].user1_nickname}</td>
                            <td>${board_list.board1_regdate}</td>
                            <td>${board_list.board1_readhit}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="5" class="text-center">${pageMenu}</td>
                    </tr>
                    </tbody>
                    <c:if test="${user1 ne null}">
                        <tfoot>
                        <tr>
                            <td colspan="5" class="text-end">
                                <input type="button" class="btn btn-primary fw-bold" value="글쓰기"
                                       onclick="location.href='board_write.do'"/>
                            </td>
                        </tr>
                        </tfoot>
                    </c:if>
                </table>
            </div>
            <div class="col-1"></div>
        </div>
    </div>
</main>


<%-- footer --%>
<jsp:include page="../main/footer.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Vendor JS Files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/review_js/impactReview.js"></script>

</body>
</html>
