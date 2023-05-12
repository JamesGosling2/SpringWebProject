<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>회원정보 상세 입력</title>

    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>로그인</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <%--<link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
          rel="stylesheet">--%>


    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">
</head>
<body>
<main>
    <div class="container">

        <section class="section register min-vh-80 d-flex flex-column align-items-center justify-content-center py-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                        <div class="d-flex justify-content-center py-4">
                            <a href="main.do" class="logo d-flex align-items-center w-auto">
                                <img src="${pageContext.request.contextPath}/resources/upload/logo.jpg" alt="">
                                <span class="d-none d-lg-block">주당들</span>
                            </a>
                        </div><!-- End Logo -->

                        <div class="card mb-3">

                            <div class="card-body">

                                <div class="pt-4 pb-2">
                                    <h4 class="card-title text-center fw-bold pb-0 fs-3">회원 상세정보</h4>
                                    <p class="text-center small">Enter your personal details to create account</p>
                                </div>

                                <form class="row g-3 needs-validation" onsubmit="return false;" id="register_detail_form" novalidate>
                                    <div class="col-12">
                                        <label for="user1_nickname" class="form-label">닉네임</label>
                                        <input type="text" name="user1_nickname" class="form-control" id="user1_nickname"
                                               required>
                                        <div class="valid-feedback">Good!</div>
                                        <div class="invalid-feedback"></div>
                                    </div>

                                    <div class="col-12">
                                        <label for="user1_phonenumber" class="form-label">전화번호</label>
                                        <input type="text" name="user1_phonenumber" class="form-control"
                                               id="user1_phonenumber"
                                               required>
                                        <div class="valid-feedback">Good!</div>
                                        <div class="invalid-feedback">ex)010-9962-1671</div>
                                    </div>

                                    <div class="col-12">
                                        <label class="form-label">주소</label>
                                        <div>
                                            <input type="text" class="form-control" id="sample4_postcode"
                                                   placeholder="우편번호" required readonly>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback"></div>
                                        </div>
                                        <div class="col-12">
                                            <input type="button" class="form-control btn btn-success fw-bold"
                                                   onclick="sample4_execDaumPostcode();"
                                                   value="우편번호 찾기"><br>
                                        </div>
                                        <input type="text" class="form-control" id="sample4_roadAddress"
                                               placeholder="도로명주소" required readonly>
                                        <input type="text" class="form-control" id="sample4_jibunAddress"
                                               placeholder="지번주소" required readonly>
                                        <span id="guide" class="form-control" style="color:#999;display:none"></span>
                                        <input type="text" class="form-control" id="sample4_detailAddress"
                                               placeholder="상세주소" required>
                                        <input type="text" class="form-control" id="sample4_extraAddress"
                                               placeholder="참고항목" required readonly>
                                    </div>

                                    <div>
                                        <input type="hidden" name="user1_name" value="${vo.user1_name}" />
                                        <input type="hidden" name="user1_pwd" value="${vo.user1_pwd}" />
                                        <input type="hidden" name="user1_email" value="${vo.user1_email}" />
                                        <input type="hidden" name="user1_birthdate" value="${vo.user1_birthdate}" />
                                        <input type="hidden" name="user1_addr" value="">
                                    </div>

                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary w-100" id="submit"
                                                onclick='send(this.form);'>Create Account</button>
                                    </div>
                                    <div class="col-12">
                                        <p class="small mb-0">Already have an account? <a href="login.do">Log in</a></p>
                                    </div>
                                </form>

                            </div>
                        </div>

                        <div class="credits">
                            Designed by <a href="#">GoodCheese92 &amp BootstrapMade</a>
                        </div>

                    </div>
                </div>
            </div>

        </section>

    </div>
</main><!-- End #main -->

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/register/register_detail_form.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>
