<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <title>Board List</title>

    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->

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

</head>
<body>
<%-- header --%>
<header>
    <jsp:include page="../main/header.jsp"></jsp:include>
</header>

<div class="row"><br><br><br><br></div>

<main id="main" class="main">
    <div class="container">
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <h1 class="text-center fs-1 fw-bold text-primary">게시판 보기</h1>
                <div class="card">
                    <div class="card-header text-center">
                        <span class="fs-3 fw-bolder text-dark"> ${board_vo.board1_subject}</span>
                    </div>
                    <div class="card-body">
                        <div class="col-12">
                            <table class="table table-bordered text-center">
                                <tr>
                                    <th>작성자</th>
                                    <td>${user_vo.user1_nickname}</td>
                                    <th>작성일</th>
                                    <td>${board_vo.board1_regdate}</td>
                                    <th>조회수</th>
                                    <td>${board_vo.board1_readhit}</td>
                                </tr>
                            </table>
                            <%--<span class="card-title fs-5 fw-bold text-success">작성자 : ${user_vo.user1_nickname}</span>
                            <span class="fs-5 text-dark">&nbsp;/&nbsp;</span>
                            <span class="card-title fs-5 fw-bold text-secondary">작성일 : ${board_vo.board1_regdate}</span>
                            <span class="fs-5 text-dark">&nbsp;/&nbsp;</span>
                            <span class="fs-5 fw-bold text-info">조회수 : ${board_vo.board1_readhit}</span>--%>
                        </div>
                        <hr class="hr">
                        <div class="card-text">
                            <p>${board_vo.board1_content}</p>
                            <div class="text-center">
                                <c:if test="${board_vo.board1_filename ne 'no_file'}">
                                    <img src="${pageContext.request.contextPath}/resources/upload/${board_vo.board1_filename}"
                                         class="image-fluid w-25">
                                </c:if>
                            </div>
                        </div>
                        <%-- <textarea id="summernote" class="summernote" name="board1_content" aria-readonly="true">
                             ${board_vo.board1_content}
                         </textarea><!-- End Summernote Editor -->--%>
                    </div>
                    <div class="card-footer text-end">
                        <c:if test="${user1.user1_idx eq user_vo.user1_idx}">
                            <input type="button" class="btn btn-primary fw-bold"
                                   onclick="location.href='board_modify_form.do?board1_idx=${board_vo.board1_idx}&user1_idx=${user_vo.user1_idx}'"
                                   value="수정하기"/>
                            <button type="button" class="btn btn-danger fw-bold"
                                    data-bs-toggle="modal" data-bs-target="#basicModal">
                                삭제하기
                            </button>
                            <%-- modal --%>
                            <div class="modal" id="basicModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4 class="modal-title text-primary fw-bold">게시판 삭제 정보</h4>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body fw-bold text-start">
                                        정말 삭제하시겠습니까?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal"
                                                onclick="location.href='board_delete.do?board1_idx=${board_vo.board1_idx}&page=${param.page}'">
                                            확인
                                        </button>
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                    </div>
                                </div>
                            </div>
                    </div>


                        </c:if>
                        <c:if test="${user1 ne null}">
                            <input type="button" class="btn btn-success fw-bold"
                                   onclick="location.href='board_reply_view.do?board1_idx=${board_vo.board1_idx}&user1_idx=${user_vo.user1_idx}'"
                                   value="댓글달기"/>
                        </c:if>
                        <input type="button" class="btn btn-secondary fw-bold" value="뒤로가기"
                               onclick="location.href='board_list.do?page=${param.page}'"/>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>

        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <div class="card">
                    <div class="card-header">
                        <h4 class="fw-bold text-success">댓글</h4>
                    </div>
                    <div class="card-body">
                        <c:forEach var="reply_list" items="${board_reply_map.board_reply_list}" varStatus="status">
                            <c:set var="index" value="${status.index}"></c:set>
                            <div class="d-flex justify-content-between">
                                <div class="d-flex justify-content-start text-dark fw-bolder">
                                    <c:if test="${reply_list.board1_del_info ne -1}">
                                        ${board_reply_map.user_list[index].user1_nickname} : ${reply_list.board1_content}
                                    </c:if>
                                    <c:if test="${reply_list.board1_del_info eq -1}">
                                        ${board_reply_map.user_list[index].user1_nickname} : <span
                                            class="text-danger text-decoration-line-through" id="reply_delete">삭제된 댓글입니다.</span>
                                    </c:if>
                                </div>
                                <div class="text-end">
                                    <c:if test="${user1.user1_idx eq reply_list.user1_idx}">
                                        <c:if test="${reply_list.board1_del_info ne -1}">
                                        <input type="button" class="btn btn-primary fw-bold btn-sm" onclick="location.href='reply_modify_form.do?board1_idx=${reply_list.board1_idx}&user1_idx=${reply_list.user1_idx}'" value="수정"/>
                                        <button type="button" class="btn btn-danger fw-bold btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#replyModal">
                                            삭제
                                        </button>
                                        </c:if>
                                        <%-- modal --%>
                                        <div class="modal" id="replyModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1">
                                            <div class="modal-dialog">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h4 class="modal-title text-primary fw-bold">댓글 삭제 정보</h4>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body fw-bold text-start">
                                                        정말 삭제하시겠습니까?
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-danger" data-bs-dismiss="modal" onclick="location.href='board_delete.do?board1_idx=${reply_list.board1_idx}&page=${param.page}'">
                                                            확인
                                                        </button>
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <input type="hidden" value="${reply_list.board1_idx}" id="ajaxIdx">
                                    </c:if>
                                </div>
                            </div>
                            <hr>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="col-1"></div>
        </div>
    </div>

</main>

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
    window.onload = function () {
        window.reload();
    }

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
            // ['fontname', ['fontname']],
            // ['fontsize', ['fontsize']],
            // ['style', ['bold', 'italic', 'underline', 'strikethrough', 'clear']],
            // ['color', ['forecolor', 'color']],
            // ['para', ['ul', 'ol', 'paragraph']],
            // ['height', ['height']],
        ],
        height: 300,                 // 에디터 높이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체', '바탕체'],
        fontSizes: ['8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '28', '30', '36', '50', '72']
    });

    // 서머노트 쓰기 비활성화
    // $('#summernote').summernote('disable');

    function reply_delete() {
        alert("reply_delete()");
        var url = "board_reply_delete.do";
        let idx = document.getElementById("ajaxIdx").value;
        var param = "board1_idx=" + idx;
        sendRequest(url, param, resultFn, "get");
    } // end of reply_delete()

    function resultFn() {
        alert(xhr.readyState);
        alert(xhr.status);
        if (xhr.readyState == 4 && xhr.status == 200) {
            let result = xhr.responseText;
            alert(result);
            document.getElementById("reply_delete").innerHTML = result;
        }
    } // end of sendRequest()

</script>

</body>
</html>
