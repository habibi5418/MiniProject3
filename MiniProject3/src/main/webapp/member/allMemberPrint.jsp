<%@page import="com.kosa.service.MemberService"%>
<%@page import="com.kosa.dao.OracleMemberDao"%>
<%@page import="com.kosa.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
	MemberDao memberDao = new OracleMemberDao();
	MemberService memberService = new MemberService(memberDao);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no'>
<title>SSG LANDERS : 전체 회원 목록 출력</title>
<link rel="stylesheet" href="../css/style-index.css?ver=4">
</head> 
<body>
	<div id="container">
	    <header>
	    	<%@ include file="../header.jsp" %>
	    </header>
		<table class="table">
			<caption>ALL MEMBER</caption>
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
				<th>전화번호</th>
			</tr>
			<%=memberService.allMemberPrint() %>
		</table>
	    <footer>
	    	<%@ include file="../footer.jsp" %>
	    </footer>
    </div>
</body>
</html>