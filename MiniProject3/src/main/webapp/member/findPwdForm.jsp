<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'>
<title>SSG LANDERS : 비밀번호 찾기</title>
  <link rel="stylesheet" href="css/style-index.css?ver=4131121">
</head>
<body>
	<div id="container">
	    <header>
	    	<%@ include file="../header.jsp" %>
	    </header>
		<form action="findMemberPwd.jsp" method="post" autocomplete="off">
			<h1>FIND PASSWORD</h1>
			<input id="memid" type="text" name="memid" maxlength="20" placeholder="아이디" required="required"/><br/>
			<input id="mname" type="text" name="mname" maxlength="20" placeholder="이름" required="required"/><br/>
			<input type="submit" value="비밀번호 찾기"/><br/>
			<div class="links">
				<a href="joinForm.jsp">회원가입</a><span>|</span>
				<a href="findUidForm.jsp">아이디 찾기</a>
			</div>
		</form>
	    <footer>
	    	<%@ include file="../footer.jsp" %>
	    </footer>
	</div>
</body>
</html>