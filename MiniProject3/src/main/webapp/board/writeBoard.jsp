<%@page import="com.kosa.service.BoardService"%>
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
	
	BoardService boardService = new BoardService();
	int row = boardService.write(title, contents, writer_uid);
	
	if (row > 0) {
		message = "글 작성이 완료되었습니다.";
		location = "listBoard.jsp";
	} else {
		message = "글 작성에 실패하였습니다.";
		location = "writeBoardForm.jsp";
	}
%>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>
