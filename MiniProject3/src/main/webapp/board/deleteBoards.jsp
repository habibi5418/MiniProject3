<%@page import="com.kosa.service.BoardService"%>
<%@page import="com.kosa.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String deleteBoards = request.getParameter("deleteBoards");
	String message = "";
	String location = "listBoard.jsp";
	
	BoardService boardService = new BoardService();
	int row = boardService.deletes(deleteBoards);
	
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
