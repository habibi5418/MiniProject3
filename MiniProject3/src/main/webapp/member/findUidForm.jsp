<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'>
<title>SSG LANDERS : 아이디 찾기</title>
  <link rel="stylesheet" href="css/style-index.css?ver=4131121">
</head>
<body>
	<div id="container">
	    <header>
	    	<%@ include file="../header.jsp" %>
	    </header>
		<form action="findMemberUid.jsp" method="post" autocomplete="off">
			<h1>FIND UID</h1>
			<input id="mname" type="text" name="mname" maxlength="20" placeholder="이름" required/><br/>
			<input id="phone" type="text" name="phone" maxlength="13" placeholder="전화번호" required/><br/>
			<input type="submit" value="아이디 찾기"/><br/>
			<div class="links">
				<a href="joinForm.jsp">회원가입</a><span>|</span>
				<a href="findPwdForm.jsp">비밀번호 찾기</a>
			</div>
		</form>
	    <footer>
	    	<%@ include file="../footer.jsp" %>
	    </footer>
    </div>
    <script type="text/javascript">
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