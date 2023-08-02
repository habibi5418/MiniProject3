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
	    	<% if (loginMember != null) {
	  			if (loginMember.getMemid().equals("admin")) { %>
    				<a href="writeNotice.jsp" id="listWriteButton" class="detailBtns">글작성</a>
    				<a href="deleteNotices.jsp" id="listDeleteButton" class="detailBtns">삭제</a>
		    	<% }
	  		} %>
			<table class="table">
				<caption>ALL NOTICE</caption>
				<tr>
					<% if (loginMember != null) { 
		  					if (loginMember.getMemid().equals("admin")) { %>
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
			    		 <% }
		  			   } else { %>
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
    </script>
</body>
</html>