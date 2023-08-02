<%@page import="com.kosa.service.BoardService"%>
<%@page import="com.kosa.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardid = Integer.parseInt(request.getParameter("boardid"));
	BoardService boardService = new BoardService();
	Board board = boardService.getBoardByBoardid(boardid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style-index.css?ver=1">
</head>
<body>
  <div id="container">
    <header>
    	<%@ include file="../header.jsp" %>
    </header>
    <div id="detailContainer">
    	<a href="#" id="listButton" class="detailBtns">목록</a>
		<div id="detailBoard">
			<div id="detailTitle">
			    <h1><%=board.getTitle() %></h1>
			    <p class="writer"><%=board.getWriter_uid() %></p>
			    <p class="date"><%=board.getReg_date() %> 조회 <%=board.getView_count() %></p>

		    </div>
		    <p class="contents"><%=board.getContents() %></p>
	  	</div>
    	<a href="#" id="updateButton" class="detailBtns">수정</a>
    	<a href="#" id="deleteButton" class="detailBtns">삭제</a>
  	</div>
    <footer>
    	<%@ include file="../footer.jsp" %>
    </footer>
  </div>
</body>
</html>