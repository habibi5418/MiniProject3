<%@page import="com.kosa.service.NoticeService"%>
<%@page import="com.kosa.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int noticeid = Integer.parseInt(request.getParameter("noticeid"));
	String newTitle = request.getParameter("title");
	String newContents = request.getParameter("content");
	String message = "";
	String location = "detailNotice.jsp?noticeid=" + noticeid;
	
	NoticeService noticeService = new NoticeService();
	int row = noticeService.update(noticeid, newTitle, newContents);
	
	if (row > 0) {
		message = "글 수정이 완료되었습니다.";
	} else {
		message = "글 작성에 실패하였습니다.";
	}
%>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>
