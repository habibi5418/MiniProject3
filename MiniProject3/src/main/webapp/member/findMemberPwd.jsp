<%@page import="java.util.Optional"%>
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
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<title>SSG LANDERS : 비밀번호 찾기 페이지</title>    
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String name = request.getParameter("name");
	String message = "";
	String location = "";

	MemberMethod method = new MemberMethod();
	List<Member> memberList = method.memberList;
	Optional<Member> optionalMember = method.findMemberUidName(uid, name); 

	if (optionalMember.isPresent()) {
		message = uid + "님의 비밀번호는 " + optionalMember.get().getPwd() + "입니다.";
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