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
</style>
<script
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script src="${pageContext.request.contextPath}/resources/js/cart_in.js"></script>
<link href="/alcohol/resources/css/main_css/main.css" rel="stylesheet">

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
	<c:set var="producer" value="999999" />
	<main id="main" class="main">
		<section id="blog" class="blog">

			<form name="ff" id="cart" action="pay_readys.do" method="post"
				class="row g-5">
				<input type="hidden" name="cost">
				<div class="col-8">
					<c:forEach var="carts" items="${cart_in}">
						<c:if test="${producer ne carts.producer_idx}">
							<c:set var="producer" value="${carts.producer_idx}" />
							<div class="card">
								<article class="blog-details">
									<div class="card-body producer_name">${producer}</div>
									<hr>
									<c:forEach var="cart" items="${cart_in}">
										<c:if test="${producer eq cart.producer_idx}">
											<div class="card-body product">
												<input type="hidden" class="idx" value="${cart.product_idx}">
												<table style="width: 100%;">
													<tr>
														<td rowspan="3"><input class="form-check-input buy"
															type="checkbox" checked></td>
														<td rowspan="2"><img
															style="width: 53px; height: 68px;"
															src="${pageContext.request.contextPath}/resources/alcohol_image/${cart.product_thumbnail_filename}">
														</td>
														<td class="lefts">${cart.product_name}</td>
														<td class="rights"><input type="button" value="X"
															class="removeEle"></td>
													</tr>
													<tr>
														<td class="lefts">
															<div class="btn-group">
																<button type="button"
																	class="btn btn-outline-primary minus">-</button>
																<button type="button"
																	class="btn btn-outline-primary amount" disabled>${cart.product_amount}</button>
																<button type="button"
																	class="btn btn-outline-primary plus">+</button>
															</div>
														</td>
														<td class="price rights">${cart.product_price*cart.product_amount}</td>
													</tr>
													<tr>
														<td colspan="4"><hr></td>
													</tr>
												</table>
											</div>
										</c:if>
									</c:forEach>
									<div class="card-body">
										<table style="width: 100%;">
											<tr>
												<td>상품금액</td>
												<td class="totPrice rights"></td>
											</tr>
											<tr>
												<td>배송비</td>
												<td class="deliveryFee rights"></td>
											</tr>
											<tr>
												<td>총 금액</td>
												<td class="totCost rights"></td>
											</tr>
										</table>
									</div>
								</article>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="col-lg-4">
					<div class="sidebar border border-primary rr_box" style="position: fixed;">
						<table style="width: 100%;">
							<tr>
								<td>총 상품금액</td>
								<td id="totPrice" class="rights">0</td>
							</tr>
							<tr>
								<td>총 배송비</td>
								<td id="totDeliv" class="rights">0</td>
							</tr>
							<tr>
								<td>총 금액</td>
								<td id="totCost" class="rights">0</td>
							</tr>
						</table>
						<div class="shopping">
							<button type="button" class="btn btn-primary number buy"
								onclick="this.form.submit();">
								<i class='bx bx-gift'>구매하기</i>
							</button>
						</div>
					</div>
				</div>
			</form>
			</div>
		</section>
	</main>
	<!-- ======= Footer ======= -->
	<jsp:include page="../main/footer.jsp"></jsp:include>
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