<%@page import="com.kosa.dto.Notice"%>
<%@page import="com.kosa.service.NoticeService"%>
<%@page import="com.kosa.dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.kosa.service.BoardService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardService boardService = new BoardService();
	List<Board> recentBoardList = boardService.recent();

	NoticeService noticeService = new NoticeService();
	List<Notice> recentNoticeList = noticeService.recent();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SSG LANDERS</title>
  <link rel="stylesheet" href="css/style-index.css?ver=232">
</head>
<body>
  <div id="container">
    <header>
    	<%@ include file="header.jsp" %>
    </header>
    <main>
      <div id="slideShow">
        <div id="slides">
          <img src="images/slide-photo1.png" alt="">
          <img src="images/slide-photo2.jpg" alt="">
          <img src="images/slide-photo3.png" alt="">
          <button id="prev">&lang;</button>
          <button id="next">&rang;</button>
        </div>
      </div>
      <div id="contents">
        <div id="tabMenu">
          <input type="radio" id="tab1" name="tabs" checked>
          <label for="tab1">공지사항</label>
          <input type="radio" id="tab2" name="tabs">
          <label for="tab2">랜더스 포토</label>
          <input type="radio" id="tab3" name="tabs">
          <label for="tab3">자유게시판</label>
          <a id="more">전체 보기</a>
          <div id="notice" class="tabContent">
            <ul>
              <% for (Notice notice : recentNoticeList) { %>
	                <li><a href="notice/detailNotice.jsp?noticeid=<%=notice.getNoticeid() %>"><%=notice.getTitle() %></a><span><%=notice.getReg_date() %></span></li>
	          <% } 
	          	 if (recentNoticeList.size() == 0) { %>
	          	 	<li><h3>게시물이 존재하지 않습니다.</h3></li>
	          <% } %>
            </ul>
          </div>
          <div id="gallery" class="tabContent">
          	<span id="photo1" data-src="images/photo1.jpg" class="pic"></span>
          	<span id="photo2" data-src="images/photo2.jpg" class="pic"></span>
          	<span id="photo3" data-src="images/photo3.jpg" class="pic"></span>
          	<span id="photo4" data-src="images/photo4.jpg" class="pic"></span>
          	<span id="photo5" data-src="images/photo5.jpg" class="pic"></span>
          	<span id="photo6" data-src="images/photo6.jpg" class="pic"></span>
          </div>
          <div id="board" class="tabContent">
            <ul>
              <% for (Board board : recentBoardList) { %>
	                <li><a href="notice/detailBoard.jsp?boardid=<%=board.getBoardid() %>"><%=board.getTitle() %></a><span><%=board.getReg_date() %></span></li>
	          <% } 
	          	 if (recentBoardList.size() == 0) { %>
	          	 	<li><h3>게시물이 존재하지 않습니다.</h3></li>
	          <% } %>
            </ul>
          </div>
        </div>
        <div id="links">
          <ul>
            <li>
              <a href="https://www.ticketlink.co.kr/sports/baseball/476#reservation" target="_blank">
                <span id="quick-icon1"></span>
                <p>티켓 예매</p>
              </a>
            </li>
            <li>
              <a href="https://ssglanderseshop.co.kr/" target="_blank">
                <span id="quick-icon2"></span>
                <p>온라인샵 by emart</p>
              </a>
            </li>
            <li>
              <a href="https://www.ssglandersstore.co.kr/" target="_blank">
                <span id="quick-icon3"></span>
                <p>온라인샵 by hyungji</p>
              </a>
            </li>
          </ul>
        </div>
      </div>
    </main>
    <footer>
    	<%@ include file="footer.jsp" %>
    </footer>
  	<div id="lightbox">
		<img src="images/photo1.jpg" alt="" id="lightboxImage">			
    </div>
  </div>
  <script src="js/lightbox.js?ver=45"></script>
  <script src="js/slideshow.js?ver=45"></script>
  <script type="text/javascript">
  	document.querySelector("#more").addEventListener("click", function() {
  		var tabs = document.getElementsByName("tabs");
  		var checked;
  		
  		tabs.forEach(tab => {
  			if (tab.checked) checked = tab.getAttribute('id');
  		})

  		if (checked == "tab1") {
  			location.href = "notice/listNotice.jsp";
  		} else if (checked == "tab3") {
  			location.href = "board/listBoard.jsp";
  		}
  	});
  </script>
</body>
</html>