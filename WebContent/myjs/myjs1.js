function fnUserMy(flag, obj) {
    if (flag === 1 && obj.value === "ID") {
        obj.value = "";
        obj.style.color = "black";
    }
    else {
        if (obj.value === '') {
            obj.value = 'ID';
            obj.style.color = "black";
        }
    }
};
function fnPassMy(flag, obj) {
    if (flag === 1 && obj.value === "Password" || obj.value === "Password Check") {
        obj.type = "password";
        obj.value = "";
        obj.style.color = "black";
    }
    else {
        if (obj.value === '') {
            obj.type = "text";
            obj.value = "Password";
            obj.style.color = "black";
        }

    }
};
function fnPassCk(flag, obj){
	if (flag === 1 && obj.value === "Password Check") {
        obj.type = "password";
        obj.value = "";
        obj.style.color = "black";
    }
	else{
        if (obj.value === ''){
        	obj.type = "text";
            obj.value = "Password Check";
            obj.style.color = "black";
        }
	}
}
function fnMail(flag, obj) {
    if (flag === 1 && obj.value === "E-Mail") {
        obj.value = "";
        obj.style.color = "black";
    }
    else {
        if (obj.value === '') {
            obj.value = 'E-Mail';
            obj.style.color = "black";
        }
    }
};
function fnName(flag, obj) {
    if (flag === 1 && obj.value === "Name") {
        obj.value = "";
        obj.style.color = "black";
    }
    else {
        if (obj.value === '') {
            obj.value = 'Name';
            obj.style.color = "black";
        }
    }
};
function isValidate(form){
	if(form.id.value == 'ID'){
		document.getElementById('validate').innerHTML = '아이디를 입력하세요!';
		form.id.focus();
		return false;
	}
	else if(form.pw.value == 'Password'){
		document.getElementById('validate').innerHTML = '비밀번호를 입력하세요!';
		form.pw.focus();
		return false;
	}
	else if(form.email.value == 'E-Mail'){
		document.getElementById('validate').innerHTML = '이메일 주소를 입력하세요!';
		form.email.focus();
		return false;
	}
	else if(form.name.value == 'Name'){
		document.getElementById('validate').innerHTML = '이름을 입력하세요!';
		form.name.focus();
		return false;
	}
	else{
		document.getElementById('validate').innerHTML = '';
	}
	if(form.pwcheck.value == 'Password Check'){
		document.getElementById('validate').innerHTML = '비밀번호 확인을 입력하세요!';
		form.pwcheck.focus();
    	return false;
	}
	else if(form.pwcheck.value.length != 0 && form.pwcheck.value != form.pw.value){
		document.getElementById('validate').innerHTML = '비밀번호가 일치하지 않습니다!';
		form.pwcheck.focus();
		return false;
	}
	else{
		document.getElementById('validate').innerHTML = '';
	}
}