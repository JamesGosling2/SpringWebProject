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

function accept() {
    let checkAccept = document.getElementById("acceptTerms").checked;
    if (checkAccept) {
        this.classList.add("is-valid");
        this.classList.remove("is-invalid");
    } else {
        this.classList.remove("is-valid");
        this.classList.add("is-invalid");
    }
} // end of accept()


// accept validity 확인
document.querySelector("#acceptTerms").addEventListener("input", accept);

function send1(f){
    let user1_email = f.user1_email.value;
    let user1_pwd = f.user1_pwd.value;
    let user1_pwd_check = document.getElementById("user_pwd_check").value;
    let user1_name = f.user1_name.value;
    let user1_birthdate = f.user1_birthdate.value;
    let accept = document.getElementById("acceptTerms").checked;

    let check_user_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    let check_user_pwd = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,16}/;
    let check_user_name = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
    let check_user_birthdate = /^(19[0-9][0-9]|20\d{2})(0[0-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;

    // alert('1 : ' + check_user_email.test(user1_email));
    // alert('2 : ' + check_user_pwd.test(user1_pwd));
    // alert('3 : ' + (user1_pwd === user1_pwd_check));
    // alert('4 : ' + check_user_name.test(user1_name));
    // alert('5 : ' + check_user_birthdate.test(user1_birthdate));
    // alert('6 : ' + accept);


    if (check_user_email.test(user1_email) && check_user_pwd.test(user1_pwd) && (user1_pwd === user1_pwd_check) &&
        check_user_name.test(user1_name) && check_user_birthdate.test(user1_birthdate) && accept && isIdCheck) {
        alert("유효성 true");
        document.getElementById("register_form").setAttribute("onsubmit", "return true");
        f.action = "register_detail_form.do";
        f.method = "post";
        f.submit();
    } else {
        alert("유효성 false");
        return;
    }

} // end of send1()

function idRepetitionCheck() {
    let user1_email = document.getElementById("user1_email").value;
    let check_user_email = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    if (!check_user_email.test(user1_email)) {
        document.getElementById("idCheckSpan").innerHTML = "아이디를 정확하게 입력해주세요.";
        return;
    }
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
            document.getElementById("idCheckSpan").innerHTML = "중복된 아이디가 없습니다.";
        } else {
            document.getElementById("idCheckSpan").innerHTML = "이미 가입된 아이디가 있습니다.";
        }
    }
} // end of resultFn()

function idChange() {
    isIdCheck = false;
    return;
} // end of idChange()




