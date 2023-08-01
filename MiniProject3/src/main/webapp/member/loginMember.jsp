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
<title>SSG LANDERS : 로그인 페이지</title>    
<%
    request.setCharacterEncoding("UTF-8");
    String uid = request.getParameter("uid");
    String pwd = request.getParameter("pwd");
    String message = "";
    
    MemberMethod method = new MemberMethod();
    List<Member> memberList = method.memberList;
    Optional<Member> optionalMember = method.findMemberUidPwd(uid, pwd); 
    
    if (optionalMember.isPresent()) {
        session.setAttribute("loginMember", optionalMember.get());
        message = optionalMember.get().getUid() + " 계정의 로그인에 성공하였습니다.";
    } else {
        message = "아이디 또는 비밀번호가 잘못되었습니다";
    }
%>

<script>
	alert("<%=message%>");
	window.location.href = "../index.jsp";
</script>
