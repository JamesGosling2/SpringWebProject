<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Main</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

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

    <style>
        .star-ratings {
            color: #aaa9a9;
            position: relative;
            unicode-bidi: bidi-override;
            width: max-content;
            -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
            -webkit-text-stroke-width: 1.3px;
            -webkit-text-stroke-color: #2b2a29;
        }

        .star-ratings-fill {
            color: #fff58c;
            padding: 0;
            position: absolute;
            z-index: 1;
            display: flex;
            top: 0;
            left: 0;
            overflow: hidden;
            -webkit-text-fill-color: gold;
        }

        .star-ratings-base {
            z-index: 0;
            padding: 0;
        }
    </style>
</head>
<body>
<%-- header --%>
<jsp:include page="../main/header.jsp"></jsp:include>

<main id="main" class="mainContainer">
    <div class="row"><br><br><br></div>
    <section id="portfolio" class="portfolio sections-bg">
        <div class="container" data-aos="fade-up">

            <div class="section-header">
                <h2>Review List</h2>
                <p>본인이 작성한 리뷰 리스트입니다.</p>
            </div>

            <div class="portfolio-isotope" data-portfolio-filter="*" data-portfolio-layout="masonry"
                 data-portfolio-sort="original-order" data-aos="fade-up" data-aos-delay="100">

                <div>
                    <ul class="portfolio-flters">
                        <li data-filter="*" class="filter-active fw-bold text-primary">리뷰 전체보기</li>
                        <li data-filter=".filter-possible" class="fw-bold text-success">작성한 리뷰보기</li>
                        <li data-filter=".filter-done" class="fw-bold text-danger">삭제한 리뷰보기</li>
                    </ul><!-- End Portfolio Filters -->
                </div>

                <div class="row gy-4 portfolio-container border border-primary">
                    <div class="filter-possible col-3 border border-danger"></div>
                    <div class="filter-possible col-6 border border-dark">
                        <jsp:include page="user_reviewList_on.jsp"></jsp:include>
                    </div>
                    <div class="filter-possible col-3 border border-warning"></div>
                </div>
                <div class="row gy-4 portfolio-container border border-primary">
                    <div class="filter-done col-3 border border-danger"></div>
                    <div class="filter-done col-6 border border-dark">
                        <jsp:include page="user_reviewList_on.jsp"></jsp:include>
                    </div>
                    <div class="filter-done col-3 border border-warning"></div>
                </div>
            </div>
        </div>
    </section>

</main>

<%-- footer--%>
<jsp:include page="../main/footer.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Vendor JS Files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/main_js/main.js"></script>
<script>
    window.onload = function () {
        let portfolioContainer = document.querySelector('.portfolio-container');
        if (portfolioContainer) {
            let filterSelector = localStorage.getItem('activeFilter') || '.filter-app';
            let activeItem = portfolioContainer.querySelector('[data-filter="' + filterSelector + '"]');
            if (activeItem) {
                activeItem.classList.add('filter-active');
                portfolioContainer.insertBefore(activeItem, portfolioContainer.firstChild);
            }

            let portfolioIsotope = new Isotope(portfolioContainer, {
                itemSelector: '.portfolio-item',
                filter: filterSelector
            });

            let portfolioFilters = document.querySelectorAll('#portfolio-flters li');
            for (let i = 0; i < portfolioFilters.length; i++) {
                portfolioFilters[i].addEventListener('click', function (e) {
                    e.preventDefault();
                    let filterSelector = this.getAttribute('data-filter');

                    for (let j = 0; j < portfolioFilters.length; j++) {
                        portfolioFilters[j].classList.remove('filter-active');
                    }
                    this.classList.add('filter-active');

                    localStorage.setItem('activeFilter', filterSelector);

                    portfolioIsotope.arrange({
                        filter: filterSelector
                    });
                    portfolioIsotope.on('arrangeComplete', function () {
                        AOS.refresh()
                    });
                });
            }
        }
    }
</script>
</body>
</html>
