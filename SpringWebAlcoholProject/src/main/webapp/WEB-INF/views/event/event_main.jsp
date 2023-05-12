<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link href="${pageContext.request.contextPath}/resources/css/event_css/event.css"
	rel="stylesheet">
	<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
		<link
				href="${pageContext.request.contextPath}/resources/css/main_css/main.css"
				rel="stylesheet">
	</head>
	
	<body>
		<jsp:include page="../main/header.jsp"></jsp:include>
		<div class="row"><br><br><br><br></div>

		<div class="head_title d-flex justify-content-center align-items-center">

			<img class="downdown"  src="${pageContext.request.contextPath}/resources/event_image/막걸리_2.png">
			<%-- 안되면 밑에 경오로 수정 --%>
			<%--<img class="downdown"  src="/alcohol/resources/event_image/막걸리_2.png">--%>
			<span class="namename">특별한 날, 주당들과 함께해요</span>
			<img class="downdown" src="${pageContext.request.contextPath}/resources/event_image/전통주.png">

		</div>
		
		<c:forEach var="list" items="${ event_list }" varStatus="status">
			<div >
				<a href="event_detail.do?event_idx=${ list.event_idx }">
					<img class="imgimg" alt="${ list.event_thumbnail }" src="${pageContext.request.contextPath}/resources/event_image/${ list.event_thumbnail }">
				</a>
			</div>
		
		</c:forEach>
		<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/register/mainjs.js"></script>
		<!-- Vendor JS Files -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
				crossorigin="anonymous"></script>
		<script src="${pageContext.request.contextPath}/resources/js/main_js/main.js"></script>

	</body>
</html>