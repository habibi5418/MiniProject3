<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SSG LANDERS</title>
  <link rel="stylesheet" href="css/style-index.css?ver=2">
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
          <div id="notice" class="tabContent">
            <ul>
              <li><a href="#">SSG랜더스 이재원, 인하대병원과 함께 ‘23시즌 희망 드림 캠페인’ 협약 체결</a><span>2023.06.30</span></li>
              <li><a href="#">SSG랜더스 추신수, ‘행복 랜딩’ 캠페인으로 3년째 기부 프로그램 추진</a><span>2023.06.30</span></li>
              <li><a href="#">SSG랜더스, ‘헤드앤숄더와 함께하는 쓱싹데이’ 실시</a><span>2023.06.27</span></li>
              <li><a href="#">SSG랜더스, CJ제일제당과 함께 ‘고메 소바바치킨 브랜드 데이’ 실시</a><span>2023.06.24</span></li>
              <li><a href="#">SSG랜더스, 시즌 네 번째 만원 관중 달성</a><span>2023.06.18</span></li>
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
</body>
</html>