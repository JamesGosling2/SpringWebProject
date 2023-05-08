<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cart_in</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="#" rel="icon">
<link href="#" rel="apple-touch-icon">

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
.rights{
	text-align: right;
}
.lefts{
	text-align: left;
}
</style>
<script
	src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
window.onload = function(){
	const cards = document.querySelectorAll('.card');
	cards.forEach((cards) => {
		const product = cards.querySelectorAll('.product');
		fixProducerName();
		calCardTotal();
		
		product.forEach((product)=>{
			const minusBtn = product.querySelector('.minus');
			const plusBtn = product.querySelector('.plus');
			const amountVal = product.querySelector('.amount');
			const price = product.querySelector('.price');
			const checkbox = product.querySelector('.buy');
			const removeEle = product.querySelector('.removeEle');
			product.querySelector('.idx')
			let amount = parseInt(amountVal.innerHTML);
			const priceOne = parseInt(price.innerHTML)/amount;
			
			minusBtn.addEventListener('click', () => {
			    if (amount > 1) {
			    	amount--;
			    	amountVal.innerHTML=amount;
			    	price.innerHTML=priceOne*amount;
			    	calCardTotal();
			    }
			});
			plusBtn.addEventListener('click', () => {
			    if (amount < 100) {
					amount++;
			    	amountVal.innerHTML=amount;
			    	price.innerHTML=priceOne*amount;
			    	calCardTotal();
			    }
			});
			checkbox.addEventListener('change',() => {
				calCardTotal();
			})
			removeEle.addEventListener('click',()=>{
				var idx = product.querySelector('.idx').value;
				removeElem(idx);
				product.remove();
				calCardTotal();
			});
		});				
	});
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
}
function removeElem(idx){
	var url="remove_cart_in.do";
	var param="idx="+idx;
	sendRequest(url,param,resFn,"GET");
}
function resFn() {
	if (xhr.readyState == 4 && xhr.status == 200) {
	}
}
function fixProducerName(){
    const producerNames = document.querySelectorAll('.producer_name');
    producerNames.forEach((producerName) => {
        const idx = producerName.innerHTML;
        const url = "findProdcerName.do";
        const param = "idx=" + idx;
        sendRequest(url, param, (response) => {
            if (xhr.readyState == 4 && xhr.status == 200) {
                producerName.innerHTML = xhr.responseText;
            }
        }, "GET");
    });
}
</script>

</head>
<body>
	<c:set var="producer" value="999999" />
	<form id="cart">
		<c:forEach var="carts" items="${cart_in}">
			<c:if test="${producer ne carts.producer_idx}">
				<c:set var="producer" value="${carts.producer_idx}" />
				<div class="card" style="width: 425px;">
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
										<td rowspan="2"><img style="width: 53px; height: 68px;"
											src="${pageContext.request.contextPath}/resources/alcohol_image/${cart.product_thumbnail_filename}">
										</td>
										<td>${cart.product_name}</td>
										<td style="text-align: right;"><input type="button"
											value="X" class="removeEle"></td>
									</tr>
									<tr>
										<td>
											<div class="btn-group">
												<button type="button" class="btn btn-outline-primary minus">-</button>
												<button type="button" class="btn btn-outline-primary amount"
													disabled>1</button>
												<button type="button" class="btn btn-outline-primary plus">+</button>
											</div>
										</td>
										<td class="price rights">${cart.product_price}</td>
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
				</div>
			</c:if>
		</c:forEach>
	</form>
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