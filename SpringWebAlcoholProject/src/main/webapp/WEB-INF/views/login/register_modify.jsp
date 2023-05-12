<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
    <title>회원정보 수정</title>

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
    <link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <main>
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
                                    <h4 class="card-title text-center fw-bold pb-0 fs-3">회원정보 수정</h4>
                                    <p class="text-center small">Enter your personal details to modify account</p>
                                </div>

                                <form class="row g-3 needs-validation" id="register_modify_form" onsubmit="return false;" novalidate>
                                    <div class="col-12">
                                        <label for="user1_email" class="form-label">Email</label>
                                        <input type="text" name="user1_email" class="form-control"
                                               id="user1_email" value="${user1.user1_email}"
                                               readonly required>
                                        <div class="valid-feedback">Good!</div>
                                        <div class="invalid-feedback"></div>
                                    </div>

                                    <div class="col-12">
                                        <label for="user1_name" class="form-label">Name</label>
                                        <input type="text" name="user1_name" class="form-control"
                                               id="user1_name" value="${user1.user1_name}"
                                               readonly required>
                                        <div class="valid-feedback">Good!</div>
                                        <div class="invalid-feedback"></div>
                                    </div>

                                    <div class="col-12">
                                        <label for="user1_pwd" class="form-label">Password</label>
                                        <input type="password" name="user1_pwd" class="form-control" id="user1_pwd"
                                               value="${user1.user1_pwd}" required>
                                        <div class="valid-feedback">Good!</div>
                                        <div class="invalid-feedback">6 ~ 16자리의 영문, 숫자, 특문 조합</div>
                                    </div>

                                    <div class="col-12">
                                        <label for="user_pwd_check" class="form-label">Password Check</label>
                                        <input type="password" class="form-control" id="user_pwd_check"
                                               value="${user1.user1_pwd}" required>
                                        <div class="valid-feedback">Good!</div>
                                        <div class="invalid-feedback"></div>
                                    </div>

                                    <div class="col-12">
                                        <label for="user1_nickname" class="form-label">NickName</label>
                                        <input type="text" name="user1_nickname" class="form-control"
                                               id="user1_nickname" value="${user1.user1_nickname}"
                                               required>
                                        <div class="valid-feedback">Good!</div>
                                        <div class="invalid-feedback"></div>
                                    </div>

                                    <div class="col-12">
                                        <label for="user1_phonenumber" class="form-label">PhoneNumber</label>
                                        <input type="text" name="user1_phonenumber" class="form-control"
                                               id="user1_phonenumber" value="${user1.user1_phonenumber}"
                                               required>
                                        <div class="valid-feedback">Good!</div>
                                        <div class="invalid-feedback">ex)010-9962-1671</div>
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
                                                       id="user1_birthdate"
                                                       value="${user1.user1_birthdate}"
                                                       readonly required>
                                            </c:otherwise>
                                        </c:choose>
                                        <div class="valid-feedback">Good!</div>
                                        <div class="invalid-feedback">8자리(ex. 19920324)</div>
                                    </div>

                                    <div class="col-12">
                                        <label class="form-label">주소</label>
                                        <c:set var="addr" value="${user1.user1_addr}" />
                                        <c:set var="start" value="${fn:indexOf(addr, '(')}" />
                                        <c:set var="start2" value="${fn:indexOf(addr, '(') + 1}" />
                                        <c:set var="end" value="${fn:indexOf(addr, ')')}" />
                                        <c:set var="end2" value="${fn:indexOf(addr, ')') + 2}" />
                                        <c:set var="length" value="${fn:length(addr)}" />
                                        <div>
                                            <input type="text" class="form-control" id="sample4_postcode"
                                                   placeholder="우편번호"
                                                   value="${fn:substring(addr, start2, end)}"
                                                   required readonly>
                                            <div class="valid-feedback"></div>
                                            <div class="invalid-feedback"></div>
                                        </div>
                                        <div class="col-12">
                                            <input type="button" class="form-control btn btn-success fw-bold"
                                                   onclick="sample4_execDaumPostcode();"
                                                   value="우편번호 찾기"><br>
                                        </div>

                                        <input type="text" class="form-control" id="sample4_roadAddress"
                                               placeholder="도로명주소"
                                               value="${fn:substring(addr, 0, start)}"
                                               required readonly>
                                        <input type="text" class="form-control" id="sample4_jibunAddress"
                                               placeholder="지번주소"
                                               value=""
                                               required readonly>
                                        <span id="guide" class="form-control" style="color:#999;display:none"></span>
                                        <input type="text" class="form-control" id="sample4_detailAddress"
                                               placeholder="상세주소"
                                               value="${fn:substring(addr, end2, length)}"
                                               required>
                                        <input type="text" class="form-control" id="sample4_extraAddress"
                                               placeholder="참고항목" required readonly>
                                    </div>

                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary w-100" id="submit"
                                                onclick="send(this.form);">Modify Account
                                        </button>
                                    </div>
                                    <div>
                                        <input type="hidden" name="user1_idx" value="${user1.user1_idx}"/>
                                        <input type="hidden" name="user1_regidate" value="${user1.user1_regidate}"/>
                                        <input type="hidden" name="user1_addr" value="">
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


    </main><!-- End #main -->
</div>

<script src="${pageContext.request.contextPath}/resources/js/httpRequest.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/register/register_modify.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</body>
</html>
