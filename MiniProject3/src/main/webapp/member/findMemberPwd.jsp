<%@page import="com.kosa.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<title>SSG LANDERS : 비밀번호 찾기 페이지</title>    
<%
	request.setCharacterEncoding("UTF-8");
	String memid = request.getParameter("memid");
	String mname = request.getParameter("mname");
	String message = "";
	String location = "";
	
	MemberDao memberDao = new MemberDao();
	String pwd = memberDao.getPwdByMemidMname(memid, mname);

	if (!pwd.equals("")) {
		message = memid + "님의 비밀번호는 " + pwd + "입니다.";
		location = "loginForm.jsp";
	} else {
		message = "아이디 또는 이름이 잘못되었습니다.";
		location = "findPwdForm.jsp";
	}
%>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>