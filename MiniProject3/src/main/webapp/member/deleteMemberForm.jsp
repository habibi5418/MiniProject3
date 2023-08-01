<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'>
<title>SSG LANDERS : 회원 탈퇴</title>
<link rel="stylesheet" href="../css/style-index.css?ver=41321121">
</head>
<body>
	<div id="container">
	    <header>
	    	<%@ include file="../header.jsp" %>
	    </header>
		<form id="form" action="deleteMember.jsp" method="post" autocomplete="off">
			<h1>LEAVE</h1>
			<input type="hidden" name="memid" value="${loginMember.memid}"/> 
			<input id="pwd" type="password" name="pwd" maxlength="20" placeholder="비밀번호 확인"/><br/>
			<input id="deleteBtn" type="button" value="탈퇴"/><br/>
			<input type="button" onclick="location.href='myPage.jsp'" value="취소"/><br>
		</form>
	    <footer>
	    	<%@ include file="../footer.jsp" %>
	    </footer>
	</div>
	<script type="text/javascript">
		document.querySelector("#deleteBtn").addEventListener("click", function() {
			var yesNo = confirm("정말로 탈퇴하시겠습니까 ?");
			
			if (yesNo) document.querySelector("#form").submit();
		});
	</script>
</body>
</html>