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
<title>SSG LANDERS : 아이디 찾기 페이지</title>    
<%	
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String message = "";
	String location = "";

	MemberMethod method = new MemberMethod();
	List<Member> memberList = method.memberList;
	Optional<Member> optionalMember = method.findMemberNamePhone(name, phone); 
	
	if (optionalMember.isPresent()) {
		message = name + "님의 아이디는 " + optionalMember.get().getUid() + "입니다.";
		location = "loginForm.jsp";
	} else {
		message = "이름 또는 전화번호가 잘못되었습니다.";
		location = "findUidForm.jsp";
	}
%>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>
