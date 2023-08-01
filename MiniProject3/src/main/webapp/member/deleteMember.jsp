<%@page import="java.util.ArrayList"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.ObjectOutputStream"%>
<%@page import="project.Member"%>
<%@page import="java.util.List"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.ObjectInputStream"%>
<%@page import="java.io.File"%>
<%@page import="project.MemberMethod" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>SSG LANDERS : 회원 탈퇴 페이지 </title>

<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	String message = "";
	String location = "";
	boolean result = false;
	
	MemberMethod method = new MemberMethod();

	result = method.deleteMember(uid, pwd);
	
	if (result) {
		message = uid + "님의 회원탈퇴가 완료되었습니다.";
		location = "../index.jsp";
		session.invalidate();
	} else {
		message = "비밀번호가 일치하지 않아 회원탈퇴를 실패했습니다.";
		location = "deleteMemberForm.jsp";
	}
%>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>