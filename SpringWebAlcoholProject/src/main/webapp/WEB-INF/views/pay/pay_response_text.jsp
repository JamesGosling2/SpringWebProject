<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 현황</title>
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
</head>
<body>
성공?
{
    "resultCode": "0000",
    "resultMsg": "정상 처리되었습니다.",
    "tid": "UT0000113m01012111051714341073",
    "cancelledTid": null,
    "orderId": "c74a5960-830b-4cd8-82a9-fa1ce739a18f",
    "ediDate": "2021-11-05T17:14:35.150+0900",
    "signature": "63b251b31c909eebef1a9f4fcc19e77bdcb8f64fc1066a29670f8627186865cd",
    "status": "paid",
    "paidAt": "2021-11-05T17:14:35.000+0900",
    "failedAt": "0",
    "cancelledAt": "0",
    "payMethod": "CARD",
    "amount": 1004,
    "balanceAmt": 1004,
    "goodsName": "나이스페이-상품",
    "mallReserved": null,
    "useEscrow": false,
    "currency": "KRW",
    "channel": "pc",
    "approveNo": "000000",
    "buyerName": null,
    "buyerTel": null,
    "buyerEmail": "null",
    "receiptUrl": "https://npg.nicepay.co.kr/issue/IssueLoader.do?type=0&innerWin=Y&TID=UT0000113m01012111051714341073",
    "mallUserId": null,
    "issuedCashReceipt": false,
    "coupon": null,
    "card": {
        "cardCode": "04",
        "cardName": "삼성",
        "cardNum": "12341234****1234",
        "cardQuota": 0,
        "isInterestFree": false,
        "cardType": "credit",
        "canPartCancel": true,
        "acquCardCode": "04",
        "acquCardName": "삼성"
    },
    "vbank": null,
    "cancels": null,
    "cashReceipts": null
}
<script src="https://pay.nicepay.co.kr/v1/js/"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/register/mainjs.js"></script>
<!-- Vendor JS Files -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/js/main_js/main.js"></script>
</body>
</html>