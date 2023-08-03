<%@page import="com.kosa.service.NoticeService"%>
<%@page import="com.kosa.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int noticeid = Integer.parseInt(request.getParameter("noticeid"));
	String message = "";
	String location = "";
	
	NoticeService noticeService = new NoticeService();
	int row = noticeService.delete(noticeid);
	
	if (row > 0) {
		message = "글 삭제가 완료되었습니다.";
		location = "listNotice.jsp";
	} else {
		message = "글 삭제에 실패하였습니다.";
		location = "detailNotice.jsp?noticeid=" + noticeid;
	}
%>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>
