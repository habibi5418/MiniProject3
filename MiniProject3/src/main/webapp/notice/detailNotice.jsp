<%@page import="com.kosa.service.NoticeService"%>
<%@page import="com.kosa.dto.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int noticeid = Integer.parseInt(request.getParameter("noticeid"));
	NoticeService noticeService = new NoticeService();
	noticeService.increaseViews(noticeid);
	Notice notice = noticeService.getNoticeByNoticeid(noticeid);
	if (notice.getTitle() == null) { %>
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
<title>공지사항 상세페이지 - <%=notice.getTitle() %></title>
<link rel="stylesheet" href="../css/style-index.css?ver=1">
</head>
<body>
  <div id="container">
    <header>
    	<%@ include file="../header.jsp" %>
    </header>
    <div id="detailContainer">
    	<a href="listNotice.jsp" id="listButton" class="detailBtns">목록</a>
		<div id="detailBoard">
			<div id="detailTitle">
			    <h1><%=notice.getTitle() %></h1>
			    <p class="writer"><%=notice.getWriter_uid() %></p>
			    <p class="date"><%=notice.getReg_date() %> 
			    <% if (notice.doMod()) { %>
			    	(수정시각 : <%=notice.getMod_date() %>) 
			    <% } %>
			    	조회 <%=notice.getView_count() %>
			    </p>
		    </div>
		    <p class="contents"><%=notice.getContents() %></p>
	  	</div>
	  	<% if (loginMember != null) {
	  			if (loginMember.getMemid().equals("admin")) { %>
			    	<a href="updateNoticeForm.jsp?noticeid=<%=notice.getNoticeid() %>" id="updateButton" class="detailBtns">수정</a>
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
  		if (confirm("게시물을 삭제하시겠습니까 ?")) location.href = "deleteNotice.jsp?noticeid=<%=notice.getNoticeid() %>";
  	});
  </script>
</body>
</html>