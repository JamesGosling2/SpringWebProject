<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
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
    <%-- <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/css/bootstrap.min.css"
           rel="stylesheet">
     <link href="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap-icons/bootstrap-icons.css"
           rel="stylesheet">--%>

    <!-- Template Main CSS File -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/style.css" rel="stylesheet">


</head>

<body>
<c:if test="${check ne null}">
    <button type="button" id="modalBtn" class="btn btn-primary visually-hidden" data-bs-toggle="modal"
            data-bs-target="#basicModal">
    </button>
    <div class="modal" id="basicModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">회원가입정보</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <c:choose>
                    <c:when test="${check eq 1}">
                        <div class="modal-body">
                            회원가입에 성공했습니다. 로그인 해주세요.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </c:when>
                    <c:when test="${check eq 2}">
                        <div class="modal-body">
                            회원가입에 실패했습니다. 다시 회원가입을 진행해주세요.
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </c:when>
                    <c:when test="${check eq 3}">
                        <div class="modal-body">
                            로그인 성공!<br>
                            <input type="hidden" value="${user_email}" id="modal_email"/><br>
                            <input type="hidden" value="${user_pwd}"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" onclick="loginSuccess();" class="btn btn-secondary"
                                    data-bs-dismiss="modal">Close
                            </button>
                        </div>
                    </c:when>
                    <c:when test="${check eq 4}">
                        <div class="modal-body">
                            아이디 불일치!
                            <input type="hidden" value="${user_email}" id="modal_email4"/>
                            <input type="hidden" value="${user_pwd}" id="modal_pwd4"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" onclick="mismatch('${user_email}', '${user_pwd}');"
                                    class="btn btn-secondary" data-bs-dismiss="modal">Close
                            </button>
                        </div>
                    </c:when>
                    <c:when test="${check eq 5}">
                        <div class="modal-body">
                            비밀번호 불일치!
                            <input type="hidden" value="${user_email}"/>
                            <input type="hidden" value="${user_pwd}"/>
                        </div>
                        <div class="modal-footer">
                            <button type="button" onclick="mismatch('${user_email}', '${user_pwd}');"
                                    class="btn btn-secondary" data-bs-dismiss="modal">Close
                            </button>
                        </div>
                    </c:when>
                </c:choose>
            </div>
        </div>
    </div>
    <!-- End Basic Modal-->
</c:if>

<main>
    <div class="container">

        <section class="section register min-vh-70 d-flex flex-column align-items-center justify-content-center py-4">
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
                                    <h5 class="card-title text-center pb-0 fs-4">Login to Your Account</h5>
                                    <p class="text-center small">Enter your ID & password to login</p>
                                </div>

                                <form class="row g-3 needs-validation" onsubmit="return false;" novalidate>
                                    <div class="col-12" id="naver_id_login">
                                        <button type="button" class="btn btn-success w-100"
                                                onclick="location.href='naverUrl.do'">Naver로 시작하기
                                        </button>
                                    </div>

                                    <div class="col-12">
                                        <button type="button" class="btn btn-warning w-100"
                                                onclick="location.href='kakaoUrl.do'">Kakao로 시작하기
                                        </button>
                                    </div>

                                    <div class="col-12">
                                        <button class="btn btn-primary w-100" type="submit">Email로 시작하기</button>
                                    </div>

                                    <div class="col-12">
                                        <label for="user_email" class="form-label">ID</label>
                                        <div class="input-group has-validation">
                                            <span class="input-group-text" id="inputGroupPrepend">@</span>
                                            <c:choose>
                                                <c:when test="${modal_email ne null}">
                                                    <input type="text" name="user_email" class="form-control" id="user_email"
                                                           value="${modal_email}" required>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" name="user_email" class="form-control" id="user_email"
                                                           required>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="invalid-feedback">Please enter your ID.</div>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <label for="user_pwd" class="form-label">Password</label>
                                        <c:choose>
                                            <c:when test="${modal_pwd ne null}">
                                                <input type="password" name="user_pwd" class="form-control" id="user_pwd"
                                                       value="${modal_pwd}" required>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="password" name="user_pwd" class="form-control" id="user_pwd"
                                                       required>
                                            </c:otherwise>
                                        </c:choose>

                                        <div class="invalid-feedback">Please enter your password!</div>
                                    </div>

                                    <div class="col-12">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="true"
                                                   id="rememberMe">
                                            <label class="form-check-label" for="rememberMe">Remember me</label>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <input class="btn btn-dark w-100" id="login" type="button"
                                               onclick="user_login(this.form);" value="Login"/>
                                    </div>
                                    <div class="col-12">
                                        <p class="small mb-0">Don't have account? <a href="register_form.do">Create an
                                            account</a></p>
                                    </div>
                                </form>

                            </div>
                        </div>

                        <div class="credits">
                            Designed by <a href="https://bootstrapmade.com/">GoodCheese92 &amp BootstrapMade</a>
                        </div>

                    </div>
                </div>
            </div>

        </section>

    </div>
</main><!-- End #main -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<script src="${pageContext.request.contextPath}/resources/assets/js/httpRequest.js"></script>

<!-- Vendor JS Files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<%--<script src="${pageContext.request.contextPath}/resources/assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>--%>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/register/login.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js"
        charset="utf-8"></script>
<script>
    function user_login(f) {
        alert("login() 실행됨");
        let user_email = f.user_email.value.trim();
        let user_pwd = f.user_pwd.value.trim();
        // alert(user_email);
        // alert(user_pwd);

        var url = "user_login.do";
        var param = "user1_email=" + encodeURIComponent(user_email) + "&user1_pwd=" + encodeURIComponent(user_pwd);
        sendRequest(url, param, resultFn, "post");

    } // end of login

    function resultFn() {
        // alert(xhr.readyState);
        // alert(xhr.status);
        if (xhr.readyState == 4 && xhr.status == 200) {
            // alert(xhr.responseText);
            var result = xhr.responseText;
            var check;
            if (result == '로그인 성공') {
                check = 3;
            } else if (result == '아이디 불일치') {
                check = 4;
            } else if (result == '비밀번호 불일치') {
                check = 5;
            } else {
                check = 4;
            }

            let user_email = document.getElementById("user_email").value;
            let user_pwd = document.getElementById("user_pwd").value;

            location.href = "login.do?check=" + check + "&user_email=" + encodeURIComponent(user_email)
                + "&user_pwd=" + encodeURIComponent(user_pwd);
        }
    } // end of resultFn()
</script>
</body>

</html>