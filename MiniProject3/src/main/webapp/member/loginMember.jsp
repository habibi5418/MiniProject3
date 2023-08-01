<%@page import="com.kosa.service.MemberService"%>
<%@page import="com.kosa.dao.MemberDao"%>
<%@page import="com.kosa.dto.Member"%>
<%@page import="com.kosa.dao.OracleMemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<title>SSG LANDERS : 로그인 페이지</title>    
<%
    request.setCharacterEncoding("UTF-8");
        String memid = request.getParameter("memid");
        String pwd = request.getParameter("pwd");
        String message = "";
    	String location = "";
        
    	MemberDao memberDao = new OracleMemberDao();
        MemberService memberService = new MemberService(memberDao);
        Member member = memberService.login(memid, pwd);
        
        if (member.getMemid() != null) {
            session.setAttribute("loginMember", member);
            message = member.getMemid() + " 계정의 로그인에 성공하였습니다.";
    		location = "../index.jsp";
        } else {
            message = "아이디 또는 비밀번호가 잘못되었습니다";
    		location = "loginForm.jsp";
        }
    %>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>
