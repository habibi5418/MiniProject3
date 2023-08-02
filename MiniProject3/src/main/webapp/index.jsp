<%@page import="com.kosa.dto.Board"%>
<%@page import="java.util.List"%>
<%@page import="com.kosa.service.BoardService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardService boardService = new BoardService();
	List<Board> recentBoardList = boardService.recent();

	int boardid1 = recentBoardList.get(0).getBoardid();
	int boardid2 = recentBoardList.get(1).getBoardid();
	int boardid3 = recentBoardList.get(2).getBoardid();
	int boardid4 = recentBoardList.get(3).getBoardid();
	int boardid5 = recentBoardList.get(4).getBoardid();

	String title1 = recentBoardList.get(0).getTitle();
	String title2 = recentBoardList.get(1).getTitle();
	String title3 = recentBoardList.get(2).getTitle();
	String title4 = recentBoardList.get(3).getTitle();
	String title5 = recentBoardList.get(4).getTitle();
	
	String red_date1 = recentBoardList.get(0).getReg_date().substring(0, 10);
	String red_date2 = recentBoardList.get(1).getReg_date().substring(0, 10);
	String red_date3 = recentBoardList.get(2).getReg_date().substring(0, 10);
	String red_date4 = recentBoardList.get(3).getReg_date().substring(0, 10);
	String red_date5 = recentBoardList.get(4).getReg_date().substring(0, 10);
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
          <label for="tab1">랜더스 소식</label>
          <input type="radio" id="tab2" name="tabs">
          <label for="tab2">랜더스 포토</label>
          <input type="radio" id="tab3" name="tabs">
          <label for="tab3">자유게시판</label>
          <a id="more">전체 보기</a>
          <div id="notice" class="tabContent">
            <ul>
              <li><a href="#"><%=recentBoardList.get(0).getTitle() %></a><span><%=recentBoardList.get(0).getReg_date().substring(0, 10) %></span></li>
              <li><a href="#"><%=recentBoardList.get(1).getTitle() %></a><span><%=recentBoardList.get(1).getReg_date().substring(0, 10) %></span></li>
              <li><a href="#"><%=recentBoardList.get(2).getTitle() %></a><span><%=recentBoardList.get(2).getReg_date().substring(0, 10) %></span></li>
              <li><a href="#"><%=recentBoardList.get(3).getTitle() %></a><span><%=recentBoardList.get(3).getReg_date().substring(0, 10) %></span></li>
              <li><a href="#"><%=recentBoardList.get(4).getTitle() %></a><span><%=recentBoardList.get(4).getReg_date().substring(0, 10) %></span></li>
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
              <li><a href="board/detailBoard.jsp?boardid=<%=boardid1 %>"><%=title1 %></a><span><%=red_date1 %></span></li>
              <li><a href="board/detailBoard.jsp?boardid=<%=boardid2 %>"><%=title2 %></a><span><%=red_date2 %></span></li>
              <li><a href="board/detailBoard.jsp?boardid=<%=boardid3 %>"><%=title3 %></a><span><%=red_date3 %></span></li>
              <li><a href="board/detailBoard.jsp?boardid=<%=boardid4 %>"><%=title4 %></a><span><%=red_date4 %></span></li>
              <li><a href="board/detailBoard.jsp?boardid=<%=boardid5 %>"><%=title5 %></a><span><%=red_date5 %></span></li>
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