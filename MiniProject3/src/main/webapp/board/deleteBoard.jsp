<%@page import="com.kosa.service.BoardService"%>
<%@page import="com.kosa.dto.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	int boardid = Integer.parseInt(request.getParameter("boardid"));
	String message = "";
	String location = "";
	
	BoardService boardService = new BoardService();
	int row = boardService.delete(boardid);
	
	if (row > 0) {
		message = "글 삭제가 완료되었습니다.";
		location = "listBoard.jsp";
	} else {
		message = "글 삭제에 실패하였습니다.";
		location = "detailBoard.jsp?boardid=" + boardid;
	}
%>

<script>
	alert("<%=message%>");
	window.location.href = "<%=location %>";
</script>
