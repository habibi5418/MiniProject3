<%@page import="com.kosa.service.BoardService"%>
<%@page import="com.kosa.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardid = Integer.parseInt(request.getParameter("boardid"));
	BoardService boardService = new BoardService();
	boardService.increaseViews(boardid);
	Board board = boardService.getBoardByBoardid(boardid);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 게시물 상세페이지 - <%=board.getTitle() %></title>
<link rel="stylesheet" href="../css/style-index.css?ver=1">
</head>
<body>
  <div id="container">
    <header>
    	<%@ include file="../header.jsp" %>
    </header>
    <div id="detailContainer">
    	<a href="listBoard.jsp" id="listButton" class="detailBtns">목록</a>
		<div id="detailBoard">
			<div id="detailTitle">
			    <h1><%=board.getTitle() %></h1>
			    <p class="writer"><%=board.getWriter_uid() %></p>
			    <p class="date"><%=board.getReg_date() %> 조회 <%=board.getView_count() %></p>

		    </div>
		    <p class="contents"><%=board.getContents() %></p>
	  	</div>
	  	<% if (loginMember != null) {
	  			if (loginMember.getMemid().equals(board.getWriter_uid())) { %>
			    	<a href="#" id="updateButton" class="detailBtns">수정</a>
			    	<a href="#" id="deleteButton" class="detailBtns">삭제</a>
		    	<% } else if (loginMember.getMemid().equals("admin")) { %>
		    		<a href="#" id="deleteButton" class="detailBtns">삭제</a>
		    	<% }
	  		} %>
  	</div>
    <footer>
    	<%@ include file="../footer.jsp" %>
    </footer>
  </div>
</body>
</html>