<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Main</title>
<meta content="" name="description">
<meta content="" name="keywords">

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
	
<style>
/* Base setup */
@import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

.article-card {
  margin-top : 80px;
  margin-left : 25%;
  width: 50%;
  border-radius: 12px;
  overflow: hidden;
  position: relative;
  font-family: Arial, Helvetica, sans-serif;
  box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
  transition: all 300ms;
}

.article-card:hover {
  transform: translateY(-2px);
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
}

.article-card img {
  width: 100%;
  object-fit: fill;
}

.article-card .content {
  box-sizing: border-box;
  width: 100%;
  position: absolute;
  padding: 30px 20px 20px 20px;
  height: auto;
  bottom: 0;
  background: linear-gradient(transparent, rgba(0, 0, 0, 0.6));
}

.article-card .date,
.article-card .title {
  margin: 0;
}


.article-card .title {
  font-size: 40px;
  font-weight : bold;
  text-shadow : 5px 5px 10px gray;
  color: #fff;
}

.rate{
	margin-top: 30px;
	margin-left: 33%;
}


h1 h3{
 	 margin-top: 80px;
 	 text-align: center;
}

.ques{
	 margin-top: 180px;
	font-size: 50px;
	text-align: center;
	font-weight: bold;
	color : #00665b;
	text-shadow : 5px 5px 10px gray;
}

/* Ratings widget */
.rate {
    display: inline-block;
    border: 0;
}
/* Hide radio */
.rate > input {
    display: none;
}
/* Order correctly by floating highest to the right */
.rate > label {
    float: right;
}
/* The star of the show */
.rate > label:before {
    display: inline-block;
    font-size: 130px;
    padding: .3rem .2rem;
    margin: 0;
    cursor: pointer;
    font-family: FontAwesome;
    content: "\f005 "; /* full star */
}

/* Half star trick */
.rate .half:before {
    content: "\f089 "; /* half star no outline */
    position: absolute;
    padding-right: 0;
}
/* Click + hover color */
input:checked ~ label, /* color current and previous stars on checked */
label:hover, label:hover ~ label { color: orange;  } /* color previous stars on hover */

/* Hover highlights */
input:checked + label:hover, input:checked ~ label:hover, /* highlight current and previous stars */
input:checked ~ label:hover ~ label, /* highlight previous selected stars for new rating */
label:hover ~ input:checked ~ label /* highlight previous selected stars */ { color: #00665b;  } 



.search_button {
	background-color:orange;
	color:white;
	width : 20%;
	height: 70px;
	padding-top: 4px;
	font-size: 40px;
	font-weight:bold;
	border-radius: 3px;
	border: 1px solid rgba(0, 0, 0, 0.1);
	margin-bottom: 70px;
	margin-left: 40%;
	margin-top: 50px;
	text-shadow : 5px 5px 10px gray;
}

.search_button:hover {
	background-color:#00665b;
	 transform: translateY(-2px);
  box-shadow: 0 14px 28px rgba(0, 0, 0, 0.25), 0 10px 10px rgba(0, 0, 0, 0.22);
}

</style>


</head>
<body>
	<!-- Start Basic Modal-->
	<c:if test="${res ne null}">
		<button type="button" id="modalBtn"
			class="btn btn-primary visually-hidden" data-bs-toggle="modal"
			data-bs-target="#basicModal"></button>
		<div class="modal" id="basicModal" data-bs-backdrop="static"
			data-bs-keyboard="false" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title fw-bold text-primary">회원정보 수정</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<c:choose>
						<c:when test="${res eq 1}">
							<div class="modal-body fw-bold">회원정보 수정에 성공했습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
							</div>
						</c:when>
						<c:when test="${res eq 0}">
							<div class="modal-body fw-bold">회원정보 수정에 실패했습니다. 다시 진행해주세요.
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary fw-bold"
									data-bs-dismiss="modal">Close</button>
							</div>
						</c:when>
					</c:choose>
				</div>
			</div>
		</div>
		<!-- End Basic Modal-->

	</c:if>

	<%-- header --%>
	<jsp:include page="header.jsp"></jsp:include>
	<c:if test="${isUser1 ne null}">
		<!-- Button trigger modal -->
		<button type="hidden" id="modalBtn" class="btn btn-primary"
			data-bs-toggle="modal" data-bs-target="#exampleModal">
			Launch demo modal</button>

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

	<main id="main" class="main">
	<div class="center">
	  <div class="article-card">
	    <div class="content">
	      <p class="title">AI소믈리에가 <br> 당신에게 꼭 맞는 <br> 술을 찾아드려요</p>
	    </div>
	    <img src="/alcohol/resources/startbootstrap-agency-gh-pages/assets/img/alcohol_2.jpg" />
	  </div>
	</div>
	<form>
	<h3 class="ques">달콤한 술을 좋아하시나요?</h3>
	<fieldset class="rate">
	    <input type="radio" id="rating10" name="product_sweet_rating" value="10" /><label for="rating10" title="5 stars"></label>
	    <input type="radio" id="rating9" name="product_sweet_rating" value="9" /><label class="half" for="rating9" title="4 1/2 stars"></label>
	    <input type="radio" id="rating8" name="product_sweet_rating" value="8" /><label for="rating8" title="4 stars"></label>
	    <input type="radio" id="rating7" name="product_sweet_rating" value="7" /><label class="half" for="rating7" title="3 1/2 stars"></label>
	    <input type="radio" id="rating6" name="product_sweet_rating" value="6" /><label for="rating6" title="3 stars"></label>
	    <input type="radio" id="rating5" name="product_sweet_rating" value="5" /><label class="half" for="rating5" title="2 1/2 stars"></label>
	    <input type="radio" id="rating4" name="product_sweet_rating" value="4" /><label for="rating4" title="2 stars"></label>
	    <input type="radio" id="rating3" name="product_sweet_rating" value="3" /><label class="half" for="rating3" title="1 1/2 stars"></label>
	    <input type="radio" id="rating2" name="product_sweet_rating" value="2" /><label for="rating2" title="1 star"></label>
	    <input type="radio" id="rating1" name="product_sweet_rating" value="1" /><label class="half" for="rating1" title="1/2 star"></label>
	
	</fieldset>
	<h3 class="ques">새콤한 술을 좋아하시나요?</h3>
	<fieldset class="rate">
	    <input type="radio" id="sour10" name="product_sourish_rating" value="10" /><label for="sour10" title="5 stars"></label>
	    <input type="radio" id="sour9" name="product_sourish_rating" value="9" /><label class="half" for="sour9" title="4 1/2 stars"></label>
	    <input type="radio" id="sour8" name="product_sourish_rating" value="8" /><label for="sour8" title="4 stars"></label>
	    <input type="radio" id="sour7" name="product_sourish_rating" value="7" /><label class="half" for="sour7" title="3 1/2 stars"></label>
	    <input type="radio" id="sour6" name="product_sourish_rating" value="6" /><label for="sour6" title="3 stars"></label>
	    <input type="radio" id="sour5" name="product_sourish_rating" value="5" /><label class="half" for="sour5" title="2 1/2 stars"></label>
	    <input type="radio" id="sour4" name="product_sourish_rating" value="4" /><label for="sour4" title="2 stars"></label>
	    <input type="radio" id="sour3" name="product_sourish_rating" value="3" /><label class="half" for="sour3" title="1 1/2 stars"></label>
	    <input type="radio" id="sour2" name="product_sourish_rating" value="2" /><label for="sour2" title="1 star"></label>
	    <input type="radio" id="sour1" name="product_sourish_rating" value="1" /><label class="half" for="sour1" title="1/2 star"></label>
	
	</fieldset>
	<h3 class="ques">바디감 있는 술을 좋아하시나요?</h3>
	<fieldset class="rate">
	    <input type="radio" id="body10" name="product_bodytaste_rating" value="10" /><label for="body10" title="5 stars"></label>
	    <input type="radio" id="body9" name="product_bodytaste_rating" value="9" /><label class="half" for="body9" title="4 1/2 stars"></label>
	    <input type="radio" id="body8" name="product_bodytaste_rating" value="8" /><label for="body8" title="4 stars"></label>
	    <input type="radio" id="body7" name="product_bodytaste_rating" value="7" /><label class="half" for="body7" title="3 1/2 stars"></label>
	    <input type="radio" id="body6" name="product_bodytaste_rating" value="6" /><label for="body6" title="3 stars"></label>
	    <input type="radio" id="body5" name="product_bodytaste_rating" value="5" /><label class="half" for="body5" title="2 1/2 stars"></label>
	    <input type="radio" id="body4" name="product_bodytaste_rating" value="4" /><label for="body4" title="2 stars"></label>
	    <input type="radio" id="body3" name="product_bodytaste_rating" value="3" /><label class="half" for="body3" title="1 1/2 stars"></label>
	    <input type="radio" id="body2" name="product_bodytaste_rating" value="2" /><label for="body2" title="1 star"></label>
	    <input type="radio" id="body1" name="product_bodytaste_rating" value="1" /><label class="half" for="body1" title="1/2 star"></label>
	
	</fieldset>
	
	<div>
        <input class="search_button" type="button" value="전통주 추천받기" onclick="recommend(this.form);">
    </div>
	
	</form>
	</main>
	<!-- End #main -->


	<!-- ======= Footer ======= -->
	<jsp:include page="footer.jsp"></jsp:include>

	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>


	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/register/mainjs.js"></script>
	<!-- Vendor JS Files -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/main_js/main.js"></script>
		
	<script>
		function recommend(f) {
			f.action = "recommend.do";
			f.submit();
		}
	</script>

</body>
</html>
