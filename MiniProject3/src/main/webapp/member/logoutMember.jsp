<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<title>SSG LANDERS : 로그아웃 페이지</title>
<%
	session.invalidate();
%>
<script type="text/javascript">
	alert("로그아웃을 완료하였습니다.");
	window.location.href = "../index.jsp";
</script>