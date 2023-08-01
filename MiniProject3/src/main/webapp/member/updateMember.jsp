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
<title>SSG LANDERS : 정보 수정 페이지 </title>

<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String message = "";
	String location = "";
	
	MemberMethod method = new MemberMethod();
	Member oldMember = (Member) session.getAttribute("loginMember");
	Member newMember = new Member(uid, name, pwd, phone);
	
	method.updateMember(uid, newMember);
	session.setAttribute("loginMember", newMember);

	message = uid + "님의 정보가 성공적으로 수정되었습니다."
		+ "\\n비밀번호 : " + oldMember.getPwd() + " -> " + pwd
		+ "\\n이름 : " + oldMember.getName() + " -> " + name
		+ "\\n전화번호 : " + oldMember.getPhone() + " -> " + phone;
	location = "myPage.jsp";
%>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>