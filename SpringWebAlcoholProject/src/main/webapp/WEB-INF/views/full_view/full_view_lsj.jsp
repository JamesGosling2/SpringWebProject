<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>전체상품 보기</title>
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

    <%-- 인텔리 제이 --%>
    <link
            href="${pageContext.request.contextPath}/resources/css/fullview.css?ver=1"
            rel="stylesheet"/>
    <%-- 이클립스 --%>
    <!--  <link href="/alcohol/resources/css/fullview.css?ver=1" rel="stylesheet"/> -->

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
            href="${pageContext.request.contextPath}/resources/css/fullview_css/main.css"
            rel="stylesheet">

</head>
<body>
<c:if test="${isUser1 ne null}">
    <!-- Button trigger modal -->
    <button type="hidden" id="modalBtn" class="btn btn-primary"
            data-bs-toggle="modal" data-bs-target="#exampleModal">
        Launch demo modal
    </button>

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
                            data-bs-dismiss="modal">Close
                    </button>
                </div>
            </div>
        </div>
    </div>
</c:if>

<!-- ======= Header ======= -->
<jsp:include page="../main/header.jsp"></jsp:include>

<main id="main" class="main">
    <div class="head">
        <h3 class="fullview">전체상품</h3>
        <h5 class="introduce">주당들의 모든 술을 만나보세요!</h5>
    </div>

    <!-- Search select -->

    <div class="head">
        <table align="left" class="search_table">
            <tr>
                <!-- 주종 -->
                <td>

                    <div class="multiselect" id="type" multiple="multiple"
                         data-target="multi-0">
                        <div class="title noselect" onclick="text('주종');">
                            <span class="text" value="주종">주종</span> <span class="close-icon">&times;</span>
                            <span class="expand-icon">&#9660;</span>
                        </div>
                        <div class="container" id="container">
                            <option value="탁주">탁주</option>
                            <option value="약주청주">약&#183;청주</option>
                            <option value="과실주">과실주</option>
                            <option value="증류주">증류주</option>
                        </div>
                    </div>

                </td>

                <!-- 도수 -->
                <td>
                    <div class="multiselect" id="alcohol_degree" multiple="multiple"
                         data-target="multi-0">
                        <div class="title noselect" onclick="text('도수');">
                            <span class="text" value="도수">도수</span> <span class="close-icon">&times;</span>
                            <span class="expand-icon">&#9660;</span>
                        </div>
                        <div class="container">
                            <option value="010">0% - 10%</option>
                            <option value="1020">10% - 20%</option>
                            <option value="2030">20% - 30%</option>
                            <option value="30up">30%이상</option>

                        </div>
                    </div>
                </td>

                <!-- 가격 -->
                <td>
                    <div class="multiselect" id="price" multiple="multiple"
                         data-target="multi-0">
                        <div class="title noselect" onclick="text('가격');">
                            <span class="text" value="가격">가격</span> <span class="close-icon">&times;</span>
                            <span class="expand-icon">&#9660;</span>
                        </div>
                        <div class="container">
                            <option value="1down">1만원 이하</option>
                            <option value="1to3">1만원 - 3만원</option>
                            <option value="3to5">3만원 - 5만원</option>
                            <option value="5to10">5만원 - 10만원</option>
                            <option value="10up">10만원 이상</option>

                        </div>
                    </div>
                </td>

                <!-- 단맛 -->
                <td>
                    <div class="multiselect" id="sweet" multiple="multiple"
                         data-target="multi-0">
                        <div class="title noselect" onclick="text('단맛');">
                            <span class="text" value="단맛">단맛</span> <span class="close-icon">&times;</span>
                            <span class="expand-icon">&#9660;</span>
                        </div>
                        <div class="container">
                            <option value="약한">약한</option>
                            <option value="중간">중간</option>
                            <option value="강한">강한</option>
                        </div>
                    </div>
                </td>

                <!-- 신맛 -->
                <td>
                    <div class="multiselect" id="sour" multiple="multiple"
                         data-target="multi-0">
                        <div class="title noselect" onclick="text('신맛');">
                            <span class="text" value="신맛">신맛</span> <span class="close-icon">&times;</span>
                            <span class="expand-icon">&#9660;</span>
                        </div>
                        <div class="container">
                            <option value="약한">약한</option>
                            <option value="중간">중간</option>
                            <option value="강한">강한</option>
                        </div>
                    </div>
                </td>

                <!-- 탄산 -->
                <td>
                    <div class="multiselect" id="sparkling" multiple="multiple"
                         data-target="multi-0">
                        <div class="title noselect" onclick="text('탄산');">
                            <span class="text" value="탄산">탄산</span> <span class="close-icon">&times;</span>
                            <span class="expand-icon">&#9660;</span>
                        </div>
                        <div class="container">
                            <option value="약한">약한</option>
                            <option value="중간">중간</option>
                            <option value="강한">강한</option>
                        </div>
                    </div>

                </td>

                <!-- 바디감 -->
                <td>
                    <div class="multiselect" id="body" multiple="multiple"
                         data-target="multi-0">
                        <div class="title noselect" onclick="text('바디감');">
                            <span class="text" value="바디감">바디감</span> <span
                                class="close-icon">&times;</span> <span class="expand-icon">&#9660;</span>
                        </div>
                        <div class="container">
                            <option value="약한">약한</option>
                            <option value="중간">중간</option>
                            <option value="강한">강한</option>
                        </div>
                    </div>
                </td>
                <td>
                    <div>
                        <input class="search_btn" type="button" value="검색" onclick="search();">
                    </div>

                </td>

            </tr>
        </table>

        <form>
            <div align="right" class="right">

                <input name="search" class="search" type="search" placeholder="검색어를 입력해주세요">
                <input name="search_btn" class="search_button" type="button" value="search"
                       onclick="typing_search(this.form);">
            </div>
        </form>
    </div>

    <div class="head">
        <h5>
            <span class="full">${ product_count }</span>건의 품목이 조회되었습니다!
        </h5>
    </div>


    <!-- Full view -->
    <div class="intinite">
        <table>
            <tr>
                <c:forEach var="list" items="${ product_list }" varStatus="status">
                <c:if test="${status.index%5==0}">
            </tr>
            <tr>
                </c:if>
                <td><a href="detailview.do?product_idx=${ list.product_idx }">
                    <article class="allcard">
                        <img class="card__background"
                             src="${pageContext.request.contextPath}/resources/alcohol_image/${ list.product_thumbnail_filename }"
                             alt="${ list.product_name }" width="1920" height="2193"/>
                        <div class="card__content | flow">
                            <div class="card__content--container | flow">
                                <h2 class="card__title">${ list.product_name }</h2>
                                <p class="card__description">${ list.product_simple_content }
                                </p>
                            </div>
                        </div>
                    </article>

                    <div class="product">
                        <h3 class="h3">${ list.product_name }</h3>
                        <h4 class="h4">
                            <span class="full">${ list.product_price }</span>원
                        </h4>
                        <hr>
                    </div>
                </a></td>
                </c:forEach>
            </tr>
        </table>
    </div>
</main>
<!-- End #main -->

<jsp:include page="../main/footer.jsp"></jsp:include>
<!-- End Footer -->

<a href="#"
   class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>


<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/fullview_js/main.js"></script>
<!-- Vendor JS Files -->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>


<script src="/alcohol/resources/assets/js/httpRequest.js"></script>
<script>
    var txt = "";
    var servlet = "";
    var select = [];
    var pt = "";
    var pad = "";
    var pp = "";
    var wr = "";
    var sr = "";
    var pr = "";
    var pbr = "";

    function text(param) {
        if (param == '주종') {
            txt = "주종";
        } else if (param == '도수') {
            txt = "도수";
        } else if (param == '가격') {
            txt = "가격";
        } else if (param == '단맛') {
            txt = "단맛";
        } else if (param == '신맛') {
            txt = "신맛";
        } else if (param == '탄산') {
            txt = "탄산";
        } else if (param == '바디감') {
            txt = "바디감";
        }


        Array.prototype.search = function (elem) {
            for (var i = 0; i < this.length; i++) {
                if (this[i] == elem)
                    return i;
            }

            return -1;
        };

        var Multiselect = function (selector) {
            if (!$(selector)) {
                console
                    .error("ERROR: Element %s does not exist.",
                        selector);
                return;
            }

            this.selector = selector;
            this.selections = [];

            (function (that) {
                that.events();
            })(this);
        };

        Multiselect.prototype = {


            open: function (that) {
                var target = $(that).parent().attr("data-target");

                if (!this.selections) {
                    this.selections = [];
                }

                $(this.selector + ".multiselect").toggleClass("active");
            },

            close: function () {
                $(this.selector + ".multiselect").removeClass("active");
            },

            events: function () {
                var that = this;

                $(document)
                    .on(
                        "click",
                        that.selector + ".multiselect > .title",
                        function (e) {
                            if (e.target.className
                                .indexOf("close-icon") < 0) {
                                that.open();
                            }
                        });

                $(document).on(
                    "click",
                    that.selector + ".multiselect option",
                    function (e) {
                        var selection = $(this).attr("value");
                        var target = $(this).parent().parent().attr(
                            "data-target");

                        var io = that.selections.search(selection);

                        if (io < 0)
                            that.selections.push(selection);
                        else

                            that.selections.splice(io, 1);

                        that.selectionStatus();
                        that.setSelectionsString();
                    });

                $(document).on(
                    "click",
                    that.selector
                    + ".multiselect > .title > .close-icon",
                    function (e) {
                        that.clearSelections();
                    });

                $(document)
                    .click(
                        function (e) {
                            if (e.target.className.indexOf("title") < 0) {
                                if (e.target.className
                                    .indexOf("text") < 0) {
                                    if (e.target.className
                                        .indexOf("-icon") < 0) {
                                        if (e.target.className
                                                .indexOf("selected") < 0
                                            || e.target.localName != "option") {
                                            that.close();
                                        }
                                    }
                                }
                            }
                        });

            },

            selectionStatus: function () {
                var obj = $(this.selector + ".multiselect");

                if (this.selections.length)
                    obj.addClass("selection");
                else
                    obj.removeClass("selection");
            },

            clearSelections: function () {
                this.selections = [];
                this.selectionStatus();
                this.setSelectionsString();

            },

            getSelections: function () {
                return this.selections;
            },

            setSelectionsString: function () {

                var selects = this.getSelectionsString().split(", ");
                $(this.selector + ".multiselect > .title").attr("title",
                    selects);

                var opts = $(this.selector + ".multiselect option");

                if (selects.length > 6) {
                    var _selects = this.getSelectionsString().split(", ");
                    _selects = _selects.splice(0, 6);
                    alert(_selects);
                    $(this.selector + ".multiselect > .title > .text")
                        .text(_selects + " [...]");
                } else {
                    $(this.selector + ".multiselect > .title > .text")
                        .text(selects);
                }

                for (var i = 0; i < opts.length; i++) {
                    $(opts[i]).removeClass("selected");
                }

                for (var j = 0; j < selects.length; j++) {
                    var select = selects[j];

                    for (var i = 0; i < opts.length; i++) {
                        if ($(opts[i]).attr("value") == select) {
                            $(opts[i]).addClass("selected");
                            break;
                        }
                    }
                }

                var menu = "";
                if (txt == "주종") {
                    menu = "product_type";
                } else if (txt == "도수") {
                    menu = "product_alcohol_degree";
                } else if (txt == "가격") {
                    menu = "product_price"
                } else if (txt == "단맛") {
                    menu = "product_sweet_rating";
                } else if (txt == "신맛") {
                    menu = "product_sourish_rating";
                } else if (txt == "탄산") {
                    menu = "product_sparkling_rating";
                } else if (txt == "바디감") {
                    menu = "product_bodytaste_rating";
                }


                select = this.selections;

                if (txt == "주종") {
                    menu = "product_type";
                    if (select != null) {
                        pt = "";
                        for (var i = 0; i < select.length; i++) {
                            pt += "&product_type=" + select[i];
                        }
                    }
                    //alert(pt);

                } else if (txt == "도수") {
                    menu = "product_alcohol_degree";
                    if (select != null) {
                        pad = "";
                        for (var i = 0; i < select.length; i++) {
                            pad += "&product_alcohol_degree=" + select[i];
                        }
                    }

                } else if (txt == "가격") {
                    menu = "product_price"
                    if (select != null) {
                        pp = "";
                        for (var i = 0; i < select.length; i++) {
                            pp += "&product_price=" + select[i];
                        }
                    }
                } else if (txt == "단맛") {
                    menu = "product_sweet_rating";
                    if (select != null) {
                        wr = "";
                        for (var i = 0; i < select.length; i++) {
                            wr += "&product_sweet_rating=" + select[i];
                        }
                    }
                } else if (txt == "신맛") {
                    menu = "product_sourish_rating";
                    if (select != null) {
                        sr = "";
                        for (var i = 0; i < select.length; i++) {
                            sr += "&product_sourish_rating=" + select[i];
                        }
                    }
                } else if (txt == "탄산") {
                    menu = "product_sparkling_rating";
                    if (select != null) {
                        pr = "";
                        for (var i = 0; i < select.length; i++) {
                            pr += "&product_sparkling_rating=" + select[i];
                        }
                    }
                } else if (txt == "바디감") {
                    menu = "product_bodytaste_rating";
                    if (select != null) {
                        pbr = "";
                        for (var i = 0; i < select.length; i++) {
                            pbr += "&product_bodytaste_rating=" + select[i];
                        }
                    }
                }

                servlet = pt + pad + pp + wr + sr + pr + pbr;

                //alert(servlet);


            },

            getSelectionsString: function () {

                if (this.selections.length > 0) {

                    return this.selections.join(", ");
                } else
                    return txt;
            },

            setSelections: function (arr) {
                if (!arr[0]) {
                    error("ERROR: This does not look like an array.");
                    return;
                }

                this.selections = arr;
                this.selectionStatus();
                this.setSelectionsString();

            },
        };

        if (txt == "주종") {
            $(document).ready(function () {
                var multi = new Multiselect("#type");
            });
        } else if (txt == "도수") {
            $(document).ready(function () {
                var multi = new Multiselect("#alcohol_degree");
            });
        } else if (txt == "가격") {
            $(document).ready(function () {
                var multi = new Multiselect("#price");
            });
        } else if (txt == "단맛") {
            $(document).ready(function () {
                var multi = new Multiselect("#sweet");
            });
        } else if (txt == "신맛") {
            $(document).ready(function () {
                var multi = new Multiselect("#sour");
            });
        } else if (txt == "탄산") {
            $(document).ready(function () {
                var multi = new Multiselect("#sparkling");
            });
        } else if (txt == "바디감") {
            $(document).ready(function () {
                var multi = new Multiselect("#body");
            });
        }


    };

    function search() {

        //lert(select);

        location.href = "search.do?" + servlet;
    }

    function typing_search(f) {
        let search = f.search.value;

        if (search == null || search.trim() == "") {
            alert("검색어를 입력해주세요");
        } else {
            f.action = "typing_search.do";
            f.submit();

        }

    }


</script>

</body>
</html>
