<%@page import="com.kosa.service.NoticeService"%>
<%@page import="com.kosa.dto.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeService noticeService = new NoticeService();
	Notice notice = noticeService.getNoticeByNoticeid(Integer.parseInt(request.getParameter("noticeid")));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글 수정 페이지</title>
<link rel="stylesheet" href="../css/style-index.css?ver=19">
</head>
<body>
  <div id="container">
    <header>
    	<%@ include file="../header.jsp" %>
    </header>
    <div id="writeContainer">
    	<a href="detailNotice.jsp?noticeid=<%=notice.getNoticeid() %>" id="listButton" class="detailBtns">취소</a>
		<div id="detailBoard">
			<h1>글 수정</h1>
		    <form action="updateNotice.jsp" method="post" autocomplete="off">
		    	<input type="hidden" name="noticeid" value="<%=notice.getNoticeid() %>">
		        <input type="text" id="title" name="title" value="<%=notice.getTitle() %>" placeholder="제목을 입력하세요." required>
		        <textarea id="content" name="content" rows="8" placeholder="내용을 입력하세요." required><%=notice.getContents() %></textarea>
		        <input type="submit" value="수정">
		    </form>
		</div>
  	</div>
    <footer>
    	<%@ include file="../footer.jsp" %>
    </footer>
  </div>
</body>
</html>