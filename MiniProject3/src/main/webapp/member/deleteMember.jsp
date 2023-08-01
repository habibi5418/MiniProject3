<%@page import="com.kosa.service.MemberService"%>
<%@page import="com.kosa.dao.OracleMemberDao"%>
<%@page import="com.kosa.dao.MemberDao"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>SSG LANDERS : 회원 탈퇴 페이지 </title>

<%
	request.setCharacterEncoding("UTF-8");
	String memid = request.getParameter("memid");
	String pwd = request.getParameter("pwd");
	String message = "";
	String location = "";
	boolean result = false;

	MemberDao memberDao = new OracleMemberDao();
	MemberService memberService = new MemberService(memberDao);
	result = memberService.delete(memid, pwd);
	
	if (result) {
		message = memid + "님의 회원탈퇴가 완료되었습니다.";
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