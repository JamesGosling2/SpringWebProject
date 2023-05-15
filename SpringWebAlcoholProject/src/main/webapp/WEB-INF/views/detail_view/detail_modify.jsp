<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Vendor CSS Files -->
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/quill/quill.snow.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/quill/quill.bubble.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/assets/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- MainCSS -->
<link
	href="${pageContext.request.contextPath}/resources/assets/css/style.css"
	rel="stylesheet">
	

</head>

<body>
	<jsp:include page="../main/header.jsp"></jsp:include>
		<div class="row"><br><br><br><br></div>
	
	<main class = "insertmain">

		<div class="pagetitle ">
			<h1>상품 수정하기</h1>
		</div>
		<!-- End Page Title -->


		<div class="col-lg-6 centercenter">

			<div class="card border bg-white" style="border:none;">
				<div class="card-body">

					<!-- General Form Elements -->
					<form method="post" enctype="multipart/form-data">
						<input type="hidden" value="${ vo1.product_idx }" name="product_idx">
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">상품명</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_name" value="${ vo1.product_name }">
							</div>
						</div>
						<fieldset class="row mb-3">
							<legend class="col-form-label col-sm-2 pt-0">주종</legend>
							<c:if test=""></c:if>
							<div class="col-sm-10">
								<div class="form-check">
									<input class="form-check-input" type="radio" name="product_type"
										id="gridRadios1" value="탁주" checked> <label
										class="form-check-label" for="gridRadios1"> 
										탁주
										</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="product_type"
										id="gridRadios2" value="약주청주"> <label
										class="form-check-label" for="gridRadios2"> 
										약주,청주
										 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="product_type"
										id="gridRadios3" value="과실주"> <label
										class="form-check-label" for="gridRadios3"> 
										과실주
										 </label>
								</div>
								<div class="form-check">
									<input class="form-check-input" type="radio" name="product_type"
										id="gridRadios4" value="증류주"> <label
										class="form-check-label" for="gridRadios4"> 
										증류주

									 </label>
								</div>
								
							</div>
						</fieldset>
						<div class="row mb-3">
							<label for="inputNumber" class="col-sm-2 col-form-label">도수</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" name="product_alcohol_degree" value="${ vo1.product_alcohol_degree }">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">유통기한</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_expiration_date" value="${ vo1.product_expiration_date}">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputNumber" class="col-sm-2 col-form-label">가격</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" name="product_price" value="${ vo1.product_price}">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">용량</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_capacity" value="${ vo1.product_capacity}">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">상품한줄소개</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_simple_content" value="${ vo1.product_simple_content}">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputNumber" class="col-sm-2 col-form-label">
								썸네일
							</label>
							<div class="col-sm-10">
								<img src="${pageContext.request.contextPath}/resources/alcohol_image/${ vo1.product_thumbnail_filename }" width="200px">
								${ vo1.product_thumbnail_filename }
								<input class="form-control" type="file" id="thumbnail" name="thumbnail" >
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputNumber" class="col-sm-2 col-form-label">
								상세사진1
							</label>
							<div class="col-sm-10">
								<img src="${pageContext.request.contextPath}/resources/alcohol_image/${ vo1.product_filename1 }" width="200px">
								${ vo1.product_filename1 }
								<input class="form-control" type="file" id="filename1" name="filename1">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputNumber" class="col-sm-2 col-form-label">
								상세사진2
							</label>
							<div class="col-sm-10">
								<img src="${pageContext.request.contextPath}/resources/alcohol_image/${ vo1.product_filename2 }" width="200px">
								${ vo1.product_filename2 }
								<input class="form-control" type="file" id="filename2" name="filename2">
							</div>
						</div>
						
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">상품 상세설명1</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="product_detail_content1" style="height: 200px; resize: none;">${ vo1.product_detail_content1 }</textarea>
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">상품 상세설명2</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="product_detail_content2" style="height: 200px; resize: none;">${ vo1.product_detail_content2 }</textarea>
							</div>
						</div>
						
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">상세재료</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_ingredients" value="${ vo1.product_ingredients }">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">추천안주</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_point_snack" value="${ vo1.product_point_snack }">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">양조장</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="producer_name" value="${ vo1.producer_name }">
							</div>
						</div>
						
						
						
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label">단맛</label>
							<div class="col-sm-10">
								<select class="form-select" aria-label="Default select example" name="product_sweet_rating">
									<option value="0" <c:if test="${ vo1.product_sweet_rating eq '0'}">selected</c:if>>0</option>
									<option value="1" <c:if test="${ vo1.product_sweet_rating eq '1'}">selected</c:if>>1</option>
									<option value="2" <c:if test="${ vo1.product_sweet_rating eq '2'}">selected</c:if>>2</option>
									<option value="3" <c:if test="${ vo1.product_sweet_rating eq '3'}">selected</c:if>>3</option>
									<option value="4" <c:if test="${ vo1.product_sweet_rating eq '4'}">selected</c:if>>4</option>
									<option value="5" <c:if test="${ vo1.product_sweet_rating eq '5'}">selected</c:if>>5</option>
									<option value="6" <c:if test="${ vo1.product_sweet_rating eq '6'}">selected</c:if>>6</option>
									<option value="7" <c:if test="${ vo1.product_sweet_rating eq '7'}">selected</c:if>>7</option>
									<option value="8" <c:if test="${ vo1.product_sweet_rating eq '8'}">selected</c:if>>8</option>
									<option value="9" <c:if test="${ vo1.product_sweet_rating eq '9'}">selected</c:if>>9</option>
									<option value="10" <c:if test="${ vo1.product_sweet_rating eq '10'}">selected</c:if>>10</option>
								</select>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label">신맛</label>
							<div class="col-sm-10">
								<select class="form-select" aria-label="Default select example" name="product_sourish_rating">
									<option value="0" <c:if test="${ vo1.product_sourish_rating eq '0'}">selected</c:if>>0</option>
									<option value="1" <c:if test="${ vo1.product_sourish_rating eq '1'}">selected</c:if>>1</option>
									<option value="2" <c:if test="${ vo1.product_sourish_rating eq '2'}">selected</c:if>>2</option>
									<option value="3" <c:if test="${ vo1.product_sourish_rating eq '3'}">selected</c:if>>3</option>
									<option value="4" <c:if test="${ vo1.product_sourish_rating eq '4'}">selected</c:if>>4</option>
									<option value="5" <c:if test="${ vo1.product_sourish_rating eq '5'}">selected</c:if>>5</option>
									<option value="6" <c:if test="${ vo1.product_sourish_rating eq '6'}">selected</c:if>>6</option>
									<option value="7" <c:if test="${ vo1.product_sourish_rating eq '7'}">selected</c:if>>7</option>
									<option value="8" <c:if test="${ vo1.product_sourish_rating eq '8'}">selected</c:if>>8</option>
									<option value="9" <c:if test="${ vo1.product_sourish_rating eq '9'}">selected</c:if>>9</option>
									<option value="10" <c:if test="${ vo1.product_sourish_rating eq '10'}">selected</c:if>>10</option>
								</select>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label">깔끔함</label>
							<div class="col-sm-10">
								<select class="form-select" aria-label="Default select example" name="product_cleantaste_rating">
									<option value="0" <c:if test="${ vo1.product_cleantaste_rating eq '0'}">selected</c:if>>0</option>
									<option value="1" <c:if test="${ vo1.product_cleantaste_rating eq '1'}">selected</c:if>>1</option>
									<option value="2" <c:if test="${ vo1.product_cleantaste_rating eq '2'}">selected</c:if>>2</option>
									<option value="3" <c:if test="${ vo1.product_cleantaste_rating eq '3'}">selected</c:if>>3</option>
									<option value="4" <c:if test="${ vo1.product_cleantaste_rating eq '4'}">selected</c:if>>4</option>
									<option value="5" <c:if test="${ vo1.product_cleantaste_rating eq '5'}">selected</c:if>>5</option>
									<option value="6" <c:if test="${ vo1.product_cleantaste_rating eq '6'}">selected</c:if>>6</option>
									<option value="7" <c:if test="${ vo1.product_cleantaste_rating eq '7'}">selected</c:if>>7</option>
									<option value="8" <c:if test="${ vo1.product_cleantaste_rating eq '8'}">selected</c:if>>8</option>
									<option value="9" <c:if test="${ vo1.product_cleantaste_rating eq '9'}">selected</c:if>>9</option>
									<option value="10" <c:if test="${ vo1.product_cleantaste_rating eq '10'}">selected</c:if>>10</option>
								</select>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label">바디감</label>
							<div class="col-sm-10">
								<select class="form-select" aria-label="Default select example" name="product_bodytaste_rating">
									<option value="0" <c:if test="${ vo1.product_bodytaste_rating eq '0'}">selected</c:if>>0</option>
									<option value="1" <c:if test="${ vo1.product_bodytaste_rating eq '1'}">selected</c:if>>1</option>
									<option value="2" <c:if test="${ vo1.product_bodytaste_rating eq '2'}">selected</c:if>>2</option>
									<option value="3" <c:if test="${ vo1.product_bodytaste_rating eq '3'}">selected</c:if>>3</option>
									<option value="4" <c:if test="${ vo1.product_bodytaste_rating eq '4'}">selected</c:if>>4</option>
									<option value="5" <c:if test="${ vo1.product_bodytaste_rating eq '5'}">selected</c:if>>5</option>
									<option value="6" <c:if test="${ vo1.product_bodytaste_rating eq '6'}">selected</c:if>>6</option>
									<option value="7" <c:if test="${ vo1.product_bodytaste_rating eq '7'}">selected</c:if>>7</option>
									<option value="8" <c:if test="${ vo1.product_bodytaste_rating eq '8'}">selected</c:if>>8</option>
									<option value="9" <c:if test="${ vo1.product_bodytaste_rating eq '9'}">selected</c:if>>9</option>
									<option value="10" <c:if test="${ vo1.product_bodytaste_rating eq '10'}">selected</c:if>>10</option>
								</select>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label">탄산</label>
							<div class="col-sm-10">
								<select class="form-select" aria-label="Default select example" name="product_sparkling_rating">
									<option value="0" <c:if test="${ vo1.product_sparkling_rating eq '0'}">selected</c:if>>0</option>
									<option value="1" <c:if test="${ vo1.product_sparkling_rating eq '1'}">selected</c:if>>1</option>
								</select>
							</div>
						</div>
						
						<div class="row mb-3">
							<div class="col-sm-10">
								<button type="button" class="btn btn-primary submitbtn" onclick="modify(this.form)">
									등록하기
								</button>
							</div>
						</div>
						

					</form>
					<!-- End General Form Elements -->

				</div>
			</div>

		</div>
	</main>
	

	
	<script>
		
		window.onload = function(){
			var type = '${vo1.product_type}';
			if(type == document.getElementById("gridRadios1").value){
				document.getElementById("gridRadios1").checked = true;
			}else if(type == document.getElementById("gridRadios2").value){
				document.getElementById("gridRadios2").checked = true;
			}else if(type == document.getElementById("gridRadios3").value){
				document.getElementById("gridRadios3").checked = true;
			}else if(type == document.getElementById("gridRadios4").value){
				document.getElementById("gridRadios4").checked = true;
			}
			
			
			
		}
		function modify(f) {
			var fileCheck = document.getElementById("thumbnail").value;
			var fileCheck1 = document.getElementById("filename1").value;
			var fileCheck2 = document.getElementById("filename2").value;
			
			if(f.product_name.value == null || f.product_name.value.trim() == ""){
				alert("상품명을 기입해주세요");
				return false;
			}else if(f.product_alcohol_degree.value == null || f.product_alcohol_degree.value.trim() == ""){
				alert("주류의 도수를 기입해주세요");
				return false;
			}else if(f.product_expiration_date.value == null || f.product_expiration_date.value.trim() == ""){
				alert("상품의 유통기한을 기입해주세요");
				return false;
			}else if(f.product_price.value == null || f.product_price.value.trim() == ""){
				alert("상품의 가격을 기입해주세요");
				return false;
			}else if(f.product_capacity.value == null || f.product_capacity.value.trim() == ""){
				alert("상품의 용량을 기입해주세요");
				return false;
			}else if(f.product_simple_content.value == null || f.product_simple_content.value.trim() == ""){
				alert("상품의 한줄소개글을 기입해주세요");
				return false;
			}else if(f.product_sweet_rating.value == "::단맛 정도를 선택하세요::"){
				alert("상품의 단맛 정도를 선택해주세요");
				return false;
			}else if(f.product_sourish_rating.value == "::신맛 정도를 선택하세요::"){
				alert("상품의 신맛 정도를 선택해주세요");
				return false;
			}else if(f.product_cleantaste_rating.value == "::깔끔함 정도를 선택하세요::"){
				alert("상품의 깔끔함 정도를 선택해주세요");
				return false;
			}else if(f.product_bodytaste_rating.value == "::바디감 정도를 선택하세요::"){
				alert("상품의 바디감 정도를 선택해주세요");
				return false;
			}else if(f.product_sparkling_rating.value == "::탄산 유무를 선택하세요::"){
				alert("상품의 탄산 유무를 선택해주세요");
				return false;
			}else if(!fileCheck){
				alert("상품의 썸네일을 등록해주세요");
				return false;
			}else if(!fileCheck1){
				alert("상품의 상세사진1을 등록해주세요");
				return false;
			}else if(!fileCheck2){
				alert("상품의 상세사진2를 등록해주세요");
				return false;
			}
			
			f.action = "product_modify.do";
			//f.method = "post";
			f.submit();
		}
	</script>

	
</body>
</html>