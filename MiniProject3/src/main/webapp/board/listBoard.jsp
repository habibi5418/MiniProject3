<%@page import="java.util.List"%>
<%@page import="com.kosa.service.BoardService"%>
<%@page import="com.kosa.dto.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardService boardService = new BoardService();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<link rel="stylesheet" href="../css/style-index.css?ver=12">
</head>
<body>
	<div id="container">
	    <header>
	    	<%@ include file="../header.jsp" %>
	    </header>
		<table class="table">
			<caption>ALL BOARD</caption>
			<tr>
				<th width="5%"><input id="allCheck" type="checkbox"></th>
				<th width="50%">글제목</th>
				<th width="20%">작성자</th>
				<th width="15%">작성일자</th>
				<th width="10%">조회</th>
			</tr>
			<%=boardService.allBoardPrint() %>
		</table>
	    <footer>
	    	<%@ include file="../footer.jsp" %>
	    </footer>
    </div>
    <script type="text/javascript">
    	document.querySelector("#allCheck").addEventListener("click", function() {
    		var checks = document.querySelectorAll("input[type='checkbox']");
    		checks.forEach(checkbox => {
    			checkbox.checked = this.checked;
    		});
    	});
    </script>
</body>
</html>