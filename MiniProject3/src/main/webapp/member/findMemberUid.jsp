<%@page import="com.kosa.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<title>SSG LANDERS : 아이디 찾기 페이지</title>    
<%	
	request.setCharacterEncoding("UTF-8");
	String mname = request.getParameter("mname");
	String phone = request.getParameter("phone");
	String message = "";
	String location = "";

	MemberDao memberDao = new MemberDao();
    String memid = memberDao.getMemidByMnamePhone(mname, phone);

    if (!memid.equals("")) {
		message = mname + "님의 아이디는 " + memid + "입니다.";
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
