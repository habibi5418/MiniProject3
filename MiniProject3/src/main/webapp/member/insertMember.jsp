<%@page import="com.kosa.service.MemberService"%>
<%@page import="com.kosa.dao.MemberDao"%>
<%@page import="com.kosa.dao.OracleMemberDao"%>
<%@page import="com.kosa.dto.Member"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>SSG LANDERS : 회원가입 페이지 </title>
<%
	request.setCharacterEncoding("UTF-8");
	String memid = request.getParameter("memid");
	String mname = request.getParameter("mname");
	String pwd = request.getParameter("pwd");
	String phone = request.getParameter("phone");
	String message = "";
	String location = "";

	MemberDao memberDao = new OracleMemberDao();
	MemberService memberService = new MemberService(memberDao);
	Member member = new Member(memid, mname, pwd, phone);
	
	if (!memberService.existMemid(memid)) {
		memberService.insert(member);
		
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
