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
<script>
window.onload = function(){
	const cards = document.querySelectorAll('.card');
	fixProducerName();
	calCardTotal();
	cards.forEach((cards) => {
		const product = cards.querySelectorAll('.product');
		
		product.forEach((product)=>{
			const amountVal = product.querySelector('.amount');
			const price = product.querySelector('.price');
			const checkbox = product.querySelector('.buy');
			const removeEle = product.querySelector('.removeEle');
			const idx = product.querySelector('.idx');
			let amount = parseInt(amountVal.innerHTML);
			const priceOne = parseInt(price.innerHTML)/amount;
			


			removeEle.addEventListener('click',()=>{
				var idx = product.querySelector('.idx').value;
				removeElem(idx);
				product.remove();
				calCardTotal();
			});
		});				
	});
}
function fixAmount(amount,idx){
	var url="fixAmount.do";
	var param="idx="+idx+"&amount="+amount;
	sendRequest(url,param,(response)=>{},"GET");
}

function calCardTotal(){
	const cards = document.querySelectorAll('.card');
	cards.forEach((cards) => {
		const product = cards.querySelectorAll('.product');
		const totPrice = cards.querySelector('.totPrice');
		const deliveryFee = cards.querySelector('.deliveryFee');
		const totCost = cards.querySelector('.totCost');
		let totprice=0;
		product.forEach((product)=>{
			const checkbox = product.querySelector('.buy');
			const price = product.querySelector('.price');
			if(checkbox.checked)
				totprice+=parseInt(price.innerHTML);
		});
		totPrice.innerHTML=totprice;
		if(totprice==0){
			deliveryFee.innerHTML=0;
			totCost.innerHTML=0;
		}else{
			deliveryFee.innerHTML=3000;
			totCost.innerHTML=totprice+3000;
		}
	});
	calTotal();
}

function calTotal(){
	const totPrice = document.querySelectorAll('.totPrice');
	const deliveryFee = document.querySelectorAll('.deliveryFee');
	const totCost = document.querySelectorAll('.totCost');
	var price=0;
	var fee=0;
	var cost=0;
	
	totPrice.forEach((tot)=>{
		price+=parseInt(tot.innerHTML);	
	});
	deliveryFee.forEach((tot)=>{
		fee+=parseInt(tot.innerHTML);	
	});
	cost=price+fee;
	document.getElementById("totPrice").innerHTML=price;
	document.getElementById("totDeliv").innerHTML=fee;
	document.getElementById("totCost").innerHTML=cost;
	document.ff.cost.value=cost;
}

function removeElem(idx){
	var url="remove_cart_in.do";
	var param="idx="+idx;
	sendRequest(url,param,(response)=>{},"GET");
}

function fixProducerName(){
    const producerNames = document.querySelectorAll('.producer_name');
    var idxs=[];
    const url = "findProdcerName.do";
    var names;
    producerNames.forEach((producerName) => {
        idxs.push(parseInt(producerName.innerHTML));
    });
    let data= { idxs: idxs };
    const xhr = new XMLHttpRequest();
    xhr.open("POST", url);
    xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
    xhr.onreadystatechange = function() {
      if (xhr.readyState === 4 && xhr.status === 200) {
        const names = JSON.parse(xhr.responseText);
        producerNames.forEach((producerName, idx) => {
            producerName.innerHTML = names[idx];
        });
      }
    };
    xhr.send(JSON.stringify(data));
}
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
	<c:set var="producer" value="999999" />
	<main id="main" class="main">
		<section id="blog" class="blog">

			<c:forEach var="carts" items="${cart}">
				<c:if test="${producer ne carts.producer_idx}">
					<c:set var="producer" value="${carts.producer_idx}" />
					<div class="card">
						<div class="card-body producer_name">${producer}</div>
						<hr>
						<c:forEach var="cart" items="${cart_in}">
							
											<img style="width: 53px; height: 68px;"
												src="${pageContext.request.contextPath}/resources/alcohol_image/${cart.cart.product_thumbnail_filename}">
		
						</c:forEach>
					</div>
				</c:if>
			</c:forEach>
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