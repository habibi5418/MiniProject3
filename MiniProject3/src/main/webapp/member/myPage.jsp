<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'>
<title>SSG LANDERS : 마이페이지</title>
  <link rel="stylesheet" href="css/style-index.css?ver=4131121">
</head> 
<body>
	<div id="container">
	    <header>
	    	<%@ include file="../header.jsp" %>
	    </header>
		<form>
			<h1>MYPAGE</h1>
			<p>아이디</p>
			<input type="text" value="${loginMember.memid}" readonly="readonly"/><br/>
			<p>비밀번호</p>
			<input type="text" value="${loginMember.pwd}" readonly="readonly"/><br/>
			<p>이 름</p>
			<input type="text" value="${loginMember.mname}" readonly="readonly"/><br/>
			<p>전화번호</p>
			<input type="text" value="${loginMember.phone}" readonly="readonly"/><br/>
			<div class="links">
				<input type="button" onclick="location.href='updateMemberForm.jsp'" value="정보 수정하기"/><br>
				<input id="deleteBtn" type="button" onclick="location.href='deleteMemberForm.jsp'" value="회원 탈퇴하기"/><br>
				<% if (loginMember.getMemid().equals("admin")) { %>
				<input id="printBtn" type="button" onclick="location.href='allMemberPrint.jsp'" value="전체 회원 목록 출력하기"/><br>
				<% } %>
			</div>
		</form>
	    <footer>
	    	<%@ include file="../footer.jsp" %>
	    </footer>
	</div>
</body>
</html>