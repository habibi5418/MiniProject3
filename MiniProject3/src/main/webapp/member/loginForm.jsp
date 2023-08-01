<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'>
<title>SSG LANDERS : 로그인</title>
<link rel="stylesheet" href="../css/style-index.css?ver=3">
</head>
<body>
	<div id="container">
	    <header>
	    	<%@ include file="../header.jsp" %>
	    </header>
		<form id="form" action="loginMember.jsp" method="post" autocomplete="off">
			<h1>LOGIN</h1>
			<input id="uid" type="text" name="uid" maxlength="8" placeholder="아이디" required/><br/>
			<input id="pwd" type="password" name="pwd" placeholder="비밀번호" required/><br/>
			<input id="submit" type="submit" value="로그인"/><br/>
			<div class="links">
				<a href="joinForm.jsp">회원가입</a><span>|</span>
				<a href="findUidForm.jsp">아이디 찾기</a><span>|</span>
				<a href="findPwdForm.jsp">비밀번호 찾기</a>
			</div>
		</form>
	    <footer>
	    	<%@ include file="../footer.jsp" %>
	    </footer>
	</div>
</body>
</html>