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
<title>SSG LANDERS : 회원가입 페이지 </title>
<%
	request.setCharacterEncoding("UTF-8");
	String uid = request.getParameter("uid");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String message = "";
	String location = "";
	
	MemberMethod method = new MemberMethod();
	List<Member> memberList = method.memberList;

	System.out.println("회원가입 전 : " + memberList);

	boolean result = method.existUid(uid);
	if (result) {
		memberList.add(new Member(uid, name, pwd, phone));
		
		method.saveMemberList(memberList);
		
		message = "회원가입이 완료되었습니다. 환영합니다. " + uid + "님!";
		location = "loginForm.jsp";
		
		System.out.println("회원가입 후 : " + memberList);
		
	} else {
		message = "이미 존재하는 아이디입니다.";
		location = "joinForm.jsp";
	}
%>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>
