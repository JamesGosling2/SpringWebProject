let isIdCheck = false;

let isEmailValid;

function email_check(event) {
    isEmailValid = true;
    let input_user_email = this.value;
    let check_user_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

    if (!check_user_email.test(input_user_email)) {
        isEmailValid = false;
    }
    if (isEmailValid) {
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
    } else {
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
        event.stopPropagation();
    }
} // end of email_check()

// email(ID) validity
document.querySelector("#user1_email").addEventListener("input", email_check);

let isPwdValid;

function pwd_check() {
    isPwdValid = true;
    let input_user_pwd = this.value;
    let check_user_pwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}/;

    if (!check_user_pwd.test(input_user_pwd)) {
        isPwdValid = false;
    }

    if (isPwdValid) {
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
    } else {
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
    }
} // end of pwd_check()

// pwd validity
document.querySelector("#user1_pwd").addEventListener("input", pwd_check);

let isPwdCheckValid;

function pwd_check_check() {
    isPwdCheckValid = true;
    let input_user_pwd_check = this.value;
    let input_user_pwd = document.getElementById("user1_pwd").value;

    if (input_user_pwd_check != input_user_pwd) {
        isPwdCheckValid = false;
    }

    if (isPwdCheckValid) {
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
    } else {
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
    }
} // end of pwd_check_check()

// pwd_check validity
document.querySelector("#user_pwd_check").addEventListener("input", pwd_check_check);

let isNameValid;

function name_check() {
    isNameValid = true;
    let input_user_name = this.value;
    let check_user_name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
    if (!check_user_name.test(input_user_name)) {
        isNameValid = false;
    }

    if (isNameValid) {
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
    } else {
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
    }

} // end of name_check()

// user_name validity
document.querySelector("#user1_name").addEventListener("input", name_check);

let isBirthDate;

function birthdate_check() {
    isBirthDate = true;
    let input_user_birthdate = this.value;
    let check_user_birthdate = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
    if (!check_user_birthdate.test(input_user_birthdate)) {
        isBirthDate = false;
    }

    if (isBirthDate) {
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
    } else {
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
    }
} // end of birthdate_check()

// user_birthdate validity
document.querySelector("#user1_birthdate").addEventListener("input", birthdate_check);

function idRepetitionCheck() {
    let user1_email = document.getElementById("user1_email").value;
    // alert(user1_email);

    var url = "idRepetitionCheck.do";
    var param = "user1_email=" + encodeURIComponent(user1_email);

    sendRequest(url, param, resultFn, "get");
} // end of idCheck()

function resultFn() {
    if (xhr.readyState == 4 && xhr.status == 200) {
        // alert(xhr.readyState);
        // alert(xhr.status);
        // alert(xhr.responseText);
        var result = xhr.responseText;

        if (result == '가능') {
            isIdCheck = true;
            document.getElementById("idCheckSpan").innerHTML = "중복된 아이디가 없습니다."
        } else {
            document.getElementById("idCheckSpan").innerHTML = "이미 가입된 아이디가 있습니다."
        }
    }
} // end of resultFn()

function idChange() {
    isIdCheck = false;
} // end of idChange()

function nickname_check() {
    let isNicknameValid = true;
    let input_user_nickname = this.value;
    let check_user_nickname = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;

    if (!check_user_nickname.test(input_user_nickname)) {
        isNicknameValid = false;
    }
    if (isNicknameValid) {
        this.classList.remove("is-invalid");
        this.classList.add("is-valid");
    } else {
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
    }
} // end of nickname_check()

// nickname validity
document.querySelector("#user1_nickname").addEventListener("input", nickname_check);

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
    //outlineColor: "" //테두리
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
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
            document.getElementById("jibunAddress").value = data.jibunAddress;

            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if (roadAddr !== '') {
                document.getElementById("extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("extraAddress").value = '';
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

function send5(f) {
    alert("test");

    let user1_addr = f.sample4_roadAddress.value + " (" + f.sample4_postcode.value + ") " + f.sample4_detailAddress.value;
    $("input[name=user1_addr]").attr('value', user1_addr);

    let user1_email = f.user1_email.value;
    let user1_pwd = f.user1_pwd.value;
    let user1_pwd_check = document.getElementById("user_pwd_check").value;
    let user1_name = f.user1_name.value;
    let user1_birthdate = f.user1_birthdate.value;

    let check_user_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    let check_user_pwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}/;
    let check_user_name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
    let check_user_birthdate = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

    let user1_nickname = f.user1_nickname.value;
    let user1_phonenumber = f.user1_phonenumber.value;
    let user1_postcode = f.sample4_postcode.value;
    let user1_detailAddress = f.sample4_detailAddress.value;

    let check_user_nickname = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
    let check_user_phonenumber = /^01([0|1|6|7|8|9])-([0-9]{3,4})-([0-9]{4})$/;

    if (check_user_email.test(user1_email) && check_user_pwd.test(user1_pwd) && (user1_pwd === user1_pwd_check) &&
        check_user_name.test(user1_name) && check_user_birthdate.test(user1_birthdate)
        && check_user_nickname.test(user1_nickname) && check_user_phonenumber.test(user1_phonenumber) &&
        (user1_postcode != '') && (user1_detailAddress != '')) {
        alert("유효성 검사 통과");
        document.getElementById("register_modify_form2").setAttribute("onsubmit", "return true");
        f.action = "register_modify.do";
        f.method = "post";
        f.submit();
    } else {
        alert("유효성 검사 실패");
        return;
    }

} // end of send()

function temporary(){
    alert("tempory");
}

























