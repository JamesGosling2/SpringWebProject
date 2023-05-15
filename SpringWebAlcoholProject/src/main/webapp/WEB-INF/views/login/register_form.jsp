<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>회원가입</title>

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

    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/resources/css/login_css/niceAdmin.css" rel="stylesheet">
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
                                    <h4 class="card-title text-center fw-bold pb-0 fs-3">회원가입</h4>
                                    <p class="text-center small">Enter your personal essential to create account</p>
                                </div>

                                <form class="row g-3 needs-validation" id="register_form" onsubmit="return false;" novalidate>
                                    <div class="col-12">
                                        <label for="user1_email" class="form-label">ID(e-mail)</label>
                                        <div class="input-group has-validation">
                                            <span class="input-group-text" id="inputGroupPrepend">@</span>
                                            <c:choose>
                                                <c:when test="${email ne null}">
                                                    <input type="text" name="user1_email" class="form-control" id="user1_email"
                                                           value="${email}" readonly required>
                                                </c:when>
                                                <c:when test="${userInfo ne null and userInfo.has_email eq true}">
                                                    <input type="text" name="user1_email" class="form-control" id="user1_email"
                                                           value="${userInfo.email}" readonly required>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" name="user1_email" class="form-control" id="user1_email"
                                                           onchange="idChange();" required>
                                                </c:otherwise>
                                            </c:choose>
                                            <input type="button" class="input-group-text btn btn-success" id="inputGroupPrepend" value="check"
                                                   data-bs-toggle="modal" data-bs-target="#idCheckModal" onclick="idRepetitionCheck();"/>
                                            <div>
                                                <div class="modal fade" id="idCheckModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                                    <div class="modal-dialog">
                                                        <div class="modal-content">
                                                            <div class="modal-header">
                                                                <h1 class="modal-title fs-5 text-primary fw-bold" id="exampleModalLabel">아이디 중복 검사</h1>
                                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                            </div>
                                                            <div class="modal-body fw-bold">
                                                                <span id="idCheckSpan"></span>
                                                            </div>
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="valid-feedback">Good!</div>
                                            <div class="invalid-feedback"></div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="user1_pwd" class="form-label">비밀번호</label>
                                        <input type="password" name="user1_pwd" class="form-control" id="user1_pwd"
                                               required>
                                        <div class="valid-feedback">Good!</div>
                                        <div class="invalid-feedback">6 ~ 16자리의 영문, 숫자, 특문 조합</div>
                                    </div>

                                    <div class="col-12">
                                        <label for="user_pwd_check" class="form-label">비밀번호 확인</label>
                                        <input type="password" class="form-control" id="user_pwd_check" required>
                                        <div class="valid-feedback">Good!</div>
                                        <div class="invalid-feedback"></div>
                                    </div>

                                    <div class="col-12">
                                        <label for="user1_name" class="form-label">이름</label>
                                        <c:choose>
                                            <c:when test="${name ne null}">
                                                <input type="text" name="user1_name" class="form-control" id="user1_name"
                                                       value="${name}" readonly required>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" name="user1_name" class="form-control" id="user1_name"
                                                       required>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="valid-feedback">Good!</div>
                                        <div class="invalid-feedback"></div>
                                    </div>

                                    <div class="col-12">
                                        <label for="user1_birthdate" class="form-label">생년월일</label>
                                        <c:choose>
                                            <c:when test="${birthdate ne null}">
                                                <input type="text" name="user1_birthdate" class="form-control"
                                                       value="${birthdate}" id="user1_birthdate" readonly required>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" name="user1_birthdate" class="form-control"
                                                       id="user1_birthdate" required>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="valid-feedback">Good!</div>
                                        <div class="invalid-feedback">8자리(ex. 19920324)</div>
                                    </div>


                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value=""
                                                   id="acceptTerms" required>
                                            <label class="form-check-label" for="acceptTerms">I agree and accept the <a
                                                    href="#">terms and conditions</a></label>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback">You must agree before submitting.</div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary w-100" id="submit"
                                        onclick="send1(this.form);">Create Account</button>
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

<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/register/register_form.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>
