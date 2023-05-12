<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Review Write</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="#" rel="icon">
    <link href="#" rel="apple-touch-icon">

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

    <%-- TextEditor Summernote CSS file --%>
    <link href="${pageContext.request.contextPath}/resources/summernoteEditor/summernote-lite.css" rel="stylesheet">

    <style>
         fieldset{
            display: inline-block;
            direction: rtl;
            border:0;
        }
         fieldset legend{
            text-align: right;
        }
        input[type=radio]{
            display: none;
        }
         label{
            font-size: 3em;
            color: transparent;
            text-shadow: 0 0 0 #f0f0f0;
        }
         label:hover{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
         label:hover ~ label{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
         input[type=radio]:checked ~ label{
            text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
        }
    </style>

</head>
<body>
<%-- header --%>
<header>
    <jsp:include page="../main/header.jsp"></jsp:include>
</header>

<main id="main" class="main">
    <div class="row"><br><br><br></div>
    <div class="container">
        <div class="row">
            <div class="col-2"></div>
            <div class="col-8 portfolio-item filter-product">
                <div class="portfolio-wrap text-center">
                    <a href="#" data-gallery="portfolio-gallery-app" class="glightbox"><img
                            src="${pageContext.request.contextPath}/resources/alcohol_image/${product_vo.product_thumbnail_filename}"
                            class="img-fluid" alt=""></a>
                    <div class="portfolio-info">
                        <h4><a href="#" title="More Details">${product_vo.product_name}</a></h4>
                        <p>${product_vo.product_simple_content}</p>
                    </div>
                </div>
            </div><!-- End Portfolio Item -->
            <div class="col-2"></div>
        </div>
        <form onsubmit="return false;" method="post" enctype="multipart/form-data">
            <div class="row">
                <div class="col-1"></div>
                <div class="col-10">
                    <form id="reviewForm">
                        <div class="card">
                            <div class="card-header">
                                <span class="fs-2 fw-bold text-success bg-white">리뷰쓰기</span>
                            </div>
                            <div class="card-body">
                                <div class="card-title"></div>
                                <textarea id="summernote" class="summernote" name="review_content">

                            </textarea><!-- End Summernote Editor -->
                                <span class="fw-bold text-success fs-4">상품 별점</span>
                                <fieldset>
                                    <input type="radio" name="review_rating" value="5" id="rate1"><label
                                        for="rate1">★</label>
                                    <input type="radio" name="review_rating" value="4" id="rate2"><label
                                        for="rate2">★</label>
                                    <input type="radio" name="review_rating" value="3" id="rate3"><label
                                        for="rate3">★</label>
                                    <input type="radio" name="review_rating" value="2" id="rate4"><label
                                        for="rate4">★</label>
                                    <input type="radio" name="review_rating" value="1" id="rate5"><label
                                        for="rate5">★</label>
                                </fieldset>
                                <br>
                                <input type="file" name="review_photo" id="review_photo">
                            </div>
                            <div class="card-footer text-end">
                                <button class="btn btn-primary" onclick="send(this.form);">등록하기</button>
                                <button class="btn btn-secondary" onclick="location.href='main.do'">취소</button>
                            </div>
                        </div>
                        <input type="hidden" name="product_idx" value="${product_vo.product_idx}">
                        <input type="hidden" name="user1_idx" value="${user1.user1_idx}">
                    </form>
                </div>
                <div class="col-1"></div>
            </div>
        </form>
    </div>

</main><!-- End #main -->

<%-- footer --%>
<jsp:include page="../main/footer.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Vendor JS Files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/review_js/impactReview.js"></script>
<%-- Summernote Editor JS file --%>
<script src="${pageContext.request.contextPath}/resources/summernoteEditor/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/summernoteEditor/summernote-ko-KR.js"></script>

<script>
    $(document).ready(function () {
        $('#summernote').summernote({
            height: 300,                 // 에디터 높이
            minHeight: null,             // 최소 높이
            maxHeight: null,             // 최대 높이
            focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
            lang: "ko-KR",					// 한글 설정
            placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
        });

    });

    $('.summernote').summernote({

        toolbar: [
            // [groupName, [list of button]]
            ['fontname', ['fontname']],
            ['fontsize', ['fontsize']],
            ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            ['color', ['forecolor', 'color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['height', ['height']],
        ],
        height: 300,                 // 에디터 높이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
    });

    function send(f){
        let review_content = f.review_content.value;
        let review_rating = f.review_rating.value;
        let review_photo = f.review_photo.value;

        if(review_content.trim() == ''){
            alert("리뷰 내용을 작성해주세요.");
            return;
        }

        alert(review_rating);
        /*if(review_rating >= 1 && review_rating <= 5){
            alert("별점을 눌러주세요.");
            return;
        }*/

        /*if(review_filename == ''){
            alert("file을 올려주세요.");
            return;
        }*/

        f.method = "post";
        f.action = "review_insert.do";
        f.submit();
    } // end of send()


</script>
</body>
</html>
