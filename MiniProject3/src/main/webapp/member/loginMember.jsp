<%@page import="com.kosa.dto.Member"%>
<%@page import="com.kosa.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<title>SSG LANDERS : 로그인 페이지</title>    
<%
    request.setCharacterEncoding("UTF-8");
    String memid = request.getParameter("memid");
    String pwd = request.getParameter("pwd");
    String message = "";
    
    MemberDao memberDao = new MemberDao();
    Member member = memberDao.getMemberListByMemid(memid);
    if (member.getMemid() != null) {
        session.setAttribute("loginMember", member);
        message = member.getMemid() + " 계정의 로그인에 성공하였습니다.";
    } else {
        message = "아이디 또는 비밀번호가 잘못되었습니다";
    }
%>

<script>
	alert("<%=message%>");
	window.location.href = "../index.jsp";
</script>
