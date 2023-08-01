<%@page import="com.kosa.dao.MemberDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="com.kosa.dto.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.File"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>SSG LANDERS : 회원가입 페이지 </title>
<%
	request.setCharacterEncoding("UTF-8");
	String memid = request.getParameter("memid");
	String pwd = request.getParameter("pwd");
	String mname = request.getParameter("mname");
	String phone = request.getParameter("phone");
	String message = "";
	String location = "";

	MemberDao memberDao = new MemberDao();
	Member member = new Member(memid, mname, pwd, phone);
	
	if (memberDao.getMemberListByMemid(memid) == null) {
		memberDao.insertMember(member);
		
		message = "회원가입이 완료되었습니다. 환영합니다. " + memid + "님!";
		location = "loginForm.jsp";
	} else {
		message = "이미 존재하는 아이디입니다.";
		location = "joinForm.jsp";
	}
%>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>
