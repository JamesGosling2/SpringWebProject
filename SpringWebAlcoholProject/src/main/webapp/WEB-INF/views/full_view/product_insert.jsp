<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<h1>상품 등록하기</h1>
		</div>
		<!-- End Page Title -->


		<div class="col-lg-6 centercenter">

			<div class="card">
				<div class="card-insert">

					<!-- General Form Elements -->
					<form method="post" enctype="multipart/form-data">
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">상품명</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_name">
							</div>
						</div>
						<fieldset class="row mb-3">
							<legend class="col-form-label col-sm-2 pt-0">주종</legend>
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
								<input type="number" class="form-control" name="product_alcohol_degree">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">유통기한</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_expiration_date">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputNumber" class="col-sm-2 col-form-label">가격</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" name="product_price">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">용량</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_capacity">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">상품한줄소개</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_simple_content">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputNumber" class="col-sm-2 col-form-label">
								썸네일
							</label>
							<div class="col-sm-10">
								<input class="form-control" type="file" id="thumbnail" name="thumbnail">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputNumber" class="col-sm-2 col-form-label">
								상세사진1
							</label>
							<div class="col-sm-10">
								<input class="form-control" type="file" id="filename1" name="filename1">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputNumber" class="col-sm-2 col-form-label">
								상세사진2
							</label>
							<div class="col-sm-10">
								<input class="form-control" type="file" id="filename2" name="filename2">
							</div>
						</div>
						
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">상품 상세설명1</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="product_detail_content1" style="height: 100px; resize: none;"></textarea>
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">상품 상세설명2</label>
							<div class="col-sm-10">
								<textarea class="form-control" name="product_detail_content2" style="height: 100px; resize: none;"></textarea>
							</div>
						</div>
						
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">상세재료</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_ingredients">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">추천안주</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="product_point_snack">
							</div>
						</div>
						<div class="row mb-3">
							<label for="inputText" class="col-sm-2 col-form-label">양조장</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="producer_name">
							</div>
						</div>
						
						
						
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label">단맛</label>
							<div class="col-sm-10">
								<select class="form-select" aria-label="Default select example" name="product_sweet_rating">
									<option selected>::단맛 정도를 선택하세요::</option>
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label">신맛</label>
							<div class="col-sm-10">
								<select class="form-select" aria-label="Default select example" name="product_sourish_rating">
									<option selected>::신맛 정도를 선택하세요::</option>
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label">깔끔함</label>
							<div class="col-sm-10">
								<select class="form-select" aria-label="Default select example" name="product_cleantaste_rating">
									<option selected>::깔끔함 정도를 선택하세요::</option>
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label">바디감</label>
							<div class="col-sm-10">
								<select class="form-select" aria-label="Default select example" name="product_bodytaste_rating">
									<option selected>::바디감 정도를 선택하세요::</option>
									<option value="0">0</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
								</select>
							</div>
						</div>
						<div class="row mb-3">
							<label class="col-sm-2 col-form-label">탄산</label>
							<div class="col-sm-10">
								<select class="form-select" aria-label="Default select example" name="product_sparkling_rating">
									<option selected>::탄산 유무를 선택하세요::</option>
									<option value="1">있음</option>
									<option value="0">없음</option>
									
								</select>
							</div>
						</div>


						<div class="row mb-3">
							<div class="col-sm-10">
								<button type="button" class="btn btn-primary submitbtn" onclick="insert(this.form)">
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
		function insert(f) {
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
			}
			
			f.action = "insert.do";
			f.method = "post";
			f.submit();
		}
	</script>
	
</body>
</html>