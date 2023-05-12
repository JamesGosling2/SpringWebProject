<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row gy-4 portfolio-container">
    <c:forEach var="reviewList" items="${reviewMap.reviewList}" varStatus="status">
        <c:if test="${reviewList.review_del_info ne -1}">
            <c:set var="index" value="${status.index}"></c:set>
            <div class="col-12 border border-success">
                <div class="card">
                    <div class="card-header bg-success bg-opacity-25">
                        <h5 class="fw-bold text-primary"><a class="text-primary"
                                                            href="detailview.do?product_idx=${reviewList.product_idx}">${reviewMap.productList[index].product_name}</a>
                            / 리뷰 작성일 : ${reviewList.review_regdate}</h5>
                    </div>
                    <div class="card-body">
                        <div class="card-text">
                            <span class="fw-bold text-success">상품 별점</span>
                            <input type="hidden" value="${reviewList.review_rating}"
                                   id="review_rating1">
                            <div class="star-ratings">
                                <div class="star-ratings-fill space-x-2 text-lg"
                                     style="width: ${reviewList.review_rating * 20}%;">
                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                </div>
                                <div class="star-ratings-base space-x-2 text-lg">
                                    <span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
                                </div>
                            </div>

                            <hr>

                            <p class="text-dark fw-bold">${reviewList.review_content}</p>

                            <c:if test="${reviewList.review_filename ne 'no_file'}">
                                <hr>
                                <div class="d-flex justify-content-center">
                                    <img class="image-fluid w-25"
                                         src="${pageContext.request.contextPath}/resources/upload/${reviewList.review_filename}"/>
                                </div>
                            </c:if>
                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="text-end">
                            <input type="button" class="btn btn-success"
                                   onclick="location.href='review_modify_form.do?review_idx=${reviewList.review_idx}'"
                                   value="수정">
                            <input type="button" class="btn btn-danger"
                                   onclick="location.href='review_delete.do?review_idx=${reviewList.review_idx}'"
                                   value="삭제">
                        </div>
                    </div>
                </div>
            </div>
        </c:if>
    </c:forEach>
</div>

</body>
</html>
