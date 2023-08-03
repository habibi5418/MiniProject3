<%@page import="com.kosa.service.NoticeService"%>
<%@page import="com.kosa.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String deleteNotices = request.getParameter("deleteNotices");
	String message = "";
	String location = "listNotice.jsp";
	
	NoticeService noticeService = new NoticeService();
	int row = noticeService.deletes(deleteNotices);
	
	if (row > 0) {
		message = "선택한 글 삭제가 완료되었습니다.";
	} else {
		message = "선택한 글 삭제에 실패하였습니다.";
	}
%>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>
