<%@page import="com.kosa.service.MemberService"%>
<%@page import="com.kosa.dao.OracleMemberDao"%>
<%@page import="com.kosa.dao.MemberDao"%>
<%@page import="com.kosa.dto.Member"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<title>SSG LANDERS : 정보 수정 페이지 </title>

<%
	request.setCharacterEncoding("UTF-8");
	String memid = request.getParameter("memid");
	String mname = request.getParameter("mname");
	String pwd = request.getParameter("pwd");
	String phone = request.getParameter("phone");
	String message = "";
	String location = "";
	
	Member oldMember = (Member) session.getAttribute("loginMember");
	Member newMember = new Member(memid, mname, pwd, phone);
	session.setAttribute("loginMember", newMember);

	MemberDao memberDao = new OracleMemberDao();
	MemberService memberService = new MemberService(memberDao);
	memberService.update(newMember);
	
	message = memid + "님의 정보가 성공적으로 수정되었습니다."
		+ "\\n비밀번호 : " + oldMember.getPwd() + " -> " + pwd
		+ "\\n이름 : " + oldMember.getMname() + " -> " + mname
		+ "\\n전화번호 : " + oldMember.getPhone() + " -> " + phone;
	location = "myPage.jsp";
%>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>