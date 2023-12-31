<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta mname="viewport" content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'>
<title>SSG LANDERS : 회원가입</title>
<link rel="stylesheet" href="../css/style-index.css?ver=4131121">
</head>
<body>
	<div id="container">
	    <header>
	    	<%@ include file="../header.jsp" %>
	    </header>
		<form action="insertMember.jsp" method="post" autocomplete="off">
			<h1>JOIN</h1>
			<input id="memid" type="text" name="memid" maxlength="20" placeholder="아이디 (영문과 숫자의 조합, 최대 20글자 제한)" required="required"/>
			<input type="button" value="중복 체크"/><br/>
			<input id="pwd" type="password" name="pwd" maxlength="20" placeholder="비밀번호(8~20자리 영문, 숫자, 특수문자의 조합)" required="required"/><br/>
			<input id="pwd2" type="password" name="pwd2" maxlength="20" placeholder="비밀번호 확인" required="required"/><br/>
			<input id="mname" type="text" name="mname" maxlength="20" placeholder="이름(한글이나 영문)" required="required"/><br/>
			<input id="phone" type="text" name="phone" maxlength="13" placeholder="전화번호(숫자만 입력 가능. '-' 자동 작성)" required="required"/><br/>
			<input id="idcheck" type="hidden" name="idcheck" value="iduncheck"/>
			<input type="submit" value="회원가입"/>
		</form>
	    <footer>
	    	<%@ include file="../footer.jsp" %>
	    </footer>
	</div>
	<script type="text/javascript">
		function memidCheck(memid) {
			var memidForm = /^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{2,20}$/;
			return memidForm.test(memid);
		}
		function pwdCheck(pwd) {
			var pwdForm = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,20}$/;
			return pwdForm.test(pwd);
		}
		function pwd2Check(pwd2) {
			if (document.querySelector("#pwd").value == pwd2) return true;
			return false;
		}
		function mnameCheck(mname) {
			var mnameForm = /^[ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z]+$/;
			return mnameForm.test(mname);
		}
		
		document.querySelector("#memid").addEventListener("input", function() {
			var memidResult = memidCheck(this.value);
			if (!memidResult) {
				this.setCustomValidity("아이디는 영문과 숫자가 각각 최소 1글자씩 포함된 조합만 가능합니다.");
				this.reportValidity();
			} else {
				this.setCustomValidity("");
				this.reportValidity();
			}
		});
		document.querySelector("#pwd").addEventListener("input", function() {
			var pwdResult = pwdCheck(this.value);
			if (!pwdResult) {
				this.setCustomValidity("비밀번호는 영문과 숫자, 특수문자 조합의 최소 8글자여야 합니다.");
				this.reportValidity();
			} else {
				this.setCustomValidity("");
				this.reportValidity();
			}
		});
		document.querySelector("#pwd2").addEventListener("input", function() {
			var pwd2Result = pwd2Check(this.value);
			if (!pwd2Result) {
				this.setCustomValidity("입력한 비밀번호와 다릅니다.");
				this.reportValidity();
			} else {
				this.setCustomValidity("");
				this.reportValidity();
			}
		});
		document.querySelector("#mname").addEventListener("input", function() {
			var mnameResult = mnameCheck(this.value);
			if (!mnameResult) {
				this.setCustomValidity("이름은 한글과 영문만 사용이 가능합니다.");
				this.reportValidity();
			} else {
				this.setCustomValidity("");
				this.reportValidity();
			}
		});
		document.querySelector("#phone").addEventListener("input", function() {
			var val = this.value.replace(/[^0-9]/g, "");
			var leng = val.length;
			var result = "";
			
			if (leng < 4) result = val;
			else if (leng < 8) {
				result += val.substring(0, 3);
				result += "-";
				result += val.substring(3);
			} else if (leng > 7) {
				result += val.substring(0, 3);
				result += "-";
				result += val.substring(3, 7);
				result += "-";
				result += val.substring(7);
			}
			
			this.value = result;
		});
	</script>
</body>
</html>