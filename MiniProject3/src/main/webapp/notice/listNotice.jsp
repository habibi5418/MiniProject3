<%@page import="java.util.List"%>
<%@page import="com.kosa.service.NoticeService"%>
<%@page import="com.kosa.dto.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	NoticeService noticeService = new NoticeService();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 목록</title>
<link rel="stylesheet" href="../css/style-index.css?ver=12">
</head>
<body>
	<div id="container">
	    <header>
	    	<%@ include file="../header.jsp" %>
	    </header>
	    <div id="listContainer">
	    	<% if (loginMember != null && loginMember.isAdmin("admin")) { %>
    				<a href="writeNoticeForm.jsp" id="listWriteButton" class="detailBtns">글작성</a>
    				<a id="listDeleteButton" class="detailBtns">삭제</a>
		    <% } %>
			<table class="table">
				<caption>ALL NOTICE</caption>
				<tr>
					<% if (loginMember != null && loginMember.isAdmin("admin")) { %>
							<th width="5%"><input id="allCheck" type="checkbox"></th>
							<th width="50%">글제목</th>
							<th width="20%">작성자</th>
							<th width="15%">작성일자</th>
							<th width="10%">조회</th>
				</tr>
				<%=noticeService.allNoticePrintAdmin() %>
			    	<% } else { %>
		  			   		<th width="55%">글제목</th>
							<th width="20%">작성자</th>
							<th width="15%">작성일자</th>
							<th width="10%">조회</th>
				</tr>
				<%=noticeService.allNoticePrint() %>
		  			<% } %>
			</table>
		</div>
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
    	
    	document.querySelector("#listDeleteButton").addEventListener("click", function() {
      		if (confirm("선택한 게시물들을 삭제하시겠습니까 ?")) {
        		var deleteNotices = "";
        		var checks2 = document.querySelectorAll("input[type='checkbox']");
        		
        		checks2.forEach(checkbox => {
        			if (checkbox.checked) deleteNotices += checkbox.value + ",";
        		});
        		deleteNotices = deleteNotices.substr(0, deleteNotices.length - 1);
        		
      			location.href = "deleteNotices.jsp?deleteNotices=" + deleteNotices;
      		}
      	});
    </script>
</body>
</html>