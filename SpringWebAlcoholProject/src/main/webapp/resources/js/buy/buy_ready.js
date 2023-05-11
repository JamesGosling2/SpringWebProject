function phonenumber_check() {
    let isPhoneNumberValid = true;
    let input_user_phonenumber = this.value;
    let check_user_phonenumber = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;

    if (!check_user_phonenumber.test(input_user_phonenumber)) {
        isPhoneNumberValid = false;
    }
    if (isPhoneNumberValid) {
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
    } else {
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
    }
} // end of phonenumber_check()

// phonenumber validity
document.querySelector("#user1_phonenumber").addEventListener("input", phonenumber_check);

// 주소창 테마
var themeObj = {
    //bgColor: "", //바탕 배경색
    searchBgColor: "#208801", //검색창 배경색
    contentBgColor: "#FFFFFF", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
    //pageBgColor: "", //페이지 배경색
    //textColor: "", //기본 글자색
    queryTextColor: "#FFFFFF" //검색창 글자색
    //postcodeTextColor: "", //우편번호 글자색
    //emphTextColor: "", //강조 글자색
    //outlineColor: "", //테두리
};

function sample4_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if (data.buildingName !== '' && data.apartment === 'Y') {
                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if (extraRoadAddr !== '') {
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample4_postcode').value = data.zonecode;
            document.getElementById("sample4_roadAddress").value = roadAddr;
            document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if (roadAddr !== '') {
                document.getElementById("sample4_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("sample4_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if (data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if (data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }, theme: themeObj
    }).open();
} // end of sample4_execDaumPostcode()

function buy(f) {

    let user1_addr = f.sample4_roadAddress.value + " (" + f.sample4_postcode.value + ") " + f.sample4_detailAddress.value;
    $("input[name=user1_addr]").attr('value', user1_addr);

    
    let user1_phonenumber = f.user1_phonenumber.value;
    let user1_postcode = f.sample4_postcode.value;
    let user1_detailAddress = f.sample4_detailAddress.value;

    let check_user_phonenumber = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;

    if (check_user_phonenumber.test(user1_phonenumber) &&
        (user1_postcode != '') && (user1_detailAddress != '')) {
        f.setAttribute("onsubmit", "return true");
        f.submit();
    }

} // end of buy()


document.getElementById('buy_ready_form').addEventListener('submit', function(event) {
    event.preventDefault(); // prevent default form submission
    var formData = new FormData(this); // create FormData object
    var xhr = new XMLHttpRequest(); // create XMLHttpRequest object

    xhr.open('POST', 'pay.do', true); // configure AJAX request

 	xhr.onload = function() {
		if (xhr.status == 200) {
			pay();
    	}
   	}
    xhr.send(formData); // send AJAX request with form data
});

function pay(){
	AUTHNICE.requestPay({
		clientId: document.getElementById('clientId').value,
		method: 'all',
		orderId: document.getElementById('orderId').value,
		amount: document.getElementById('cost').value,
		goodsName: document.getElementById('user1_nickname').innerHTML,
		returnUrl: 'http://localhost:9090/alcohol/bill.do',
		fnError: function (result) {
		alert('개발자확인용 : ' + result.errorMsg + '')
		}
	});
}






















