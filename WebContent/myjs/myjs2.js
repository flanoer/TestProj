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
    if (flag === 1 && obj.value === "Password") {
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
	else{
		document.getElementById('validate').innerHTML = '';
	}
}