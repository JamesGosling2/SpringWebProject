<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->


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
<style type="text/css">
.rights {
	text-align: right;
}

.lefts {
	text-align: left;
}

.card {
	margin-bottom: 10px;
}
</style>
<script
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	
</script>

</head>
<body>

	<c:if test="${isUser1 ne null}">
		<!-- Button trigger modal -->
		<button type="hidden" id="modalBtn" class="btn btn-primary"
			data-bs-toggle="modal" data-bs-target="#exampleModal">Launch
			demo modal</button>
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
							data-bs-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- ======= Header ======= -->
	<jsp:include page="../main/header.jsp"></jsp:include>

	<!-- ======= main ======= -->

	<main id="main" class="main">
		<section id="blog" class="blog" style="text-align:center;">
			<!-- CartVO carts
	String name, id;
	private int cost;
	boolean isPaid;
	List<OrderListVO> cart; -->
			<c:forEach var="cart" items="${carts}">
				<c:set var="producer" value="99999999" />
				<form class="card" style="width: 720px;">
					<input type="hidden">
					<div class="card-body">
						<p>${cart.name}</p>
						<p>총 가격 ${cart.cost}원 입니다.</p>
					</div>
					<c:if test="${!cart.isPaid}">
						<button class="btn btn-primary"
							onclick="cancelCart('${cart.cart.get(0).orderlist_date}');">구매 취소</button>
					</c:if>
					<hr>
					<c:forEach var="cart_in" items="${cart.cart}">
						<c:if
							test="${producer ne products[cart_in.product_idx].producer_idx}">
							<c:set var="producer"
								value="${products[cart_in.product_idx].producer_idx}" />
							<div class="card-body">
								<div>${producers[producer].producer_name}</div>
							</div>
							<div class="card-body row row-col-3">
								<c:forEach var="item" items="${cart.cart}">
									<c:set var="item_idx" value="${item.product_idx}" />
									<c:if test="${producer eq products[item_idx].producer_idx}">
										<div class="col">
											<p>${products[item_idx].product_name}</p>
											<img style="height: 200px;"
												src="${pageContext.request.contextPath}/resources/alcohol_image/${products[item_idx].product_thumbnail_filename}">

										</div>
									</c:if>
								</c:forEach>
							</div>
						</c:if>
					</c:forEach>
				</form>
			</c:forEach>
		</section>
	</main>
	<!-- ======= Footer ======= -->
	<jsp:include page="../main/footer.jsp"></jsp:include>
	<script
		src="${pageContext.request.contextPath}/resources/js/buy/buy_response.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/register/mainjs.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/detailview_js/main.js"></script>
	<!-- Vendor JS Files -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/main_js/main.js"></script>
</body>
</html>