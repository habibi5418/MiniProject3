<%@page import="com.kosa.service.BoardService"%>
<%@page import="com.kosa.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 글 작성 페이지</title>
<link rel="stylesheet" href="../css/style-index.css?ver=19">
</head>
<body>
  <div id="container">
    <header>
    	<%@ include file="../header.jsp" %>
    </header>
    <div id="writeContainer">
    	<a href="listBoard.jsp" id="listButton" class="detailBtns">취소</a>
		<div id="detailBoard">
			<h1>글 작성</h1>
		    <form action="writeBoard.jsp" method="post" autocomplete="off">
		        <input type="text" id="title" name="title" placeholder="제목을 입력하세요." required>
		        <textarea id="content" name="content" rows="8" placeholder="내용을 입력하세요." required></textarea>
		        <input type="submit" value="작성">
		    </form>
		</div>
  	</div>
    <footer>
    	<%@ include file="../footer.jsp" %>
    </footer>
  </div>
</body>
</html>