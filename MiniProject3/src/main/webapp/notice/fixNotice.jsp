	<%@page import="com.kosa.service.NoticeService"%>
<%@page import="com.kosa.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int noticeid = Integer.parseInt(request.getParameter("noticeid"));
	String doYN = request.getParameter("doYN");
	String message = "";
	String location = "";
	
	NoticeService noticeService = new NoticeService();
	int row = noticeService.fix(noticeid, doYN);
	
	if (row > 0) {
		if (doYN.equals("Y")) {
			message = "글 고정이 완료되었습니다.";
			location = "listNotice.jsp";
		} else if (doYN.equals("N")) {
			message = "글 고정 해제가 완료되었습니다.";
			location = "listNotice.jsp";
		} 
	} else {
		message = "글 고정 또는 해제에 실패하였습니다.";
		location = "detailNotice.jsp?noticeid=" + noticeid;
	}
%>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>
