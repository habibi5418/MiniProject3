<%@page import="com.kosa.service.BoardService"%>
<%@page import="com.kosa.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int boardid = Integer.parseInt(request.getParameter("boardid"));
	BoardService boardService = new BoardService();
	boardService.increaseViews(boardid);
	Board board = boardService.getBoardByBoardid(boardid);
	if (board.getTitle() == null) { %>
		<script>
			alert("삭제된 게시물입니다.");
			history.back();
		</script>
<% 		return;
	}
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
			    <p class="date"><%=board.getReg_date() %> 
			    <% if (board.doMod()) { %>
			    	(수정시각 : <%=board.getMod_date() %>) 
			    <% } %>
			    	조회 <%=board.getView_count() %>
			    </p>
		    </div>
		    <p class="contents"><%=board.getContents() %></p>
	  	</div>
	  	<% if (loginMember != null) {
	  			if (loginMember.getMemid().equals(board.getWriter_uid())) { %>
			    	<a href="updateBoardForm.jsp?boardid=<%=board.getBoardid() %>" id="updateButton" class="detailBtns">수정</a>
			    	<a id="deleteButton" class="detailBtns">삭제</a>
		    	<% } else if (loginMember.getMemid().equals("admin")) { %>
		    		<a id="deleteButton" class="detailBtns">삭제</a>
		    	<% }
	  		} %>
  	</div>
    <footer>
    	<%@ include file="../footer.jsp" %>
    </footer>
  </div>
  <script type="text/javascript">
  	document.querySelector("#deleteButton").addEventListener("click", function() {
  		if (confirm("게시물을 삭제하시겠습니까 ?")) location.href = "deleteBoard.jsp?boardid=<%=board.getBoardid() %>";
  	});
  </script>
</body>
</html>