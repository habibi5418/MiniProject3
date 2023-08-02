<%@page import="com.kosa.service.NoticeService"%>
<%@page import="com.kosa.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	Member loginMember = (Member) session.getAttribute("loginMember");
	String title = request.getParameter("title");
	String contents = request.getParameter("content");
	String writer_uid = loginMember.getMemid();
	String message = "";
	String location = "";
	
	NoticeService noticeService = new NoticeService();
	int row = noticeService.write(title, contents, writer_uid);
	
	if (row > 0) {
		message = "글 작성이 완료되었습니다.";
		location = "listNotice.jsp";
	} else {
		message = "글 작성에 실패하였습니다.";
		location = "writeNoticeForm.jsp";
	}
%>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>
