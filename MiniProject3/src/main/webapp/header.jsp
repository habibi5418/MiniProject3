<%@page import="com.kosa.dto.Member"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Member loginMember = (Member) session.getAttribute("loginMember");
String root = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SSG LANDERS</title>
  <link rel="stylesheet" href="<%=root %>/css/style-index.css?ver=223">
</head>
<body>
	<div id="logo">
	  <a href="<%=root %>/index.jsp">
	    <h1>SSG LANDERS</h1>
	  </a>
	</div>
	<nav>
	  <ul id="topMenu">
	    <li>
	      <a href="#">LANDERS</a>
	      <ul>
	        <li><a href="#">연혁</a></li>
	        <li><a href="#">엠블럼</a></li>
	        <li><a href="#">후원사</a></li>
	        <li><a href="#">구단정보</a></li>
	      </ul>
	    </li>
	    <li>
	      <a href="#">PLAYERS</a>
	      <ul>
	        <li><a href="#">코칭 스태프</a></li>
	        <li><a href="#">투수</a></li>
	        <li><a href="#">야수</a></li>
	      </ul>
	    </li>
	    <li>
	      <a href="#">MEDIA</a>
	      <ul>
	        <li><a href="#">랜더스 소식</a></li>
	        <li><a href="#">랜더스 포토</a></li>
	      </ul>
	    </li>
	    <li>
	      <a href="#">STADIUM</a>
	      <ul>
	        <li><a href="#">구장소개</a></li>
	        <li><a href="#">찾아오시는 길</a></li>
	      </ul>
	    </li>
	    <% if (loginMember != null) { %>
	    <li id="header3">
	      <a href="<%=root %>/member/myPage.jsp">${loginMember.mname }님<br>반갑습니다.</a>
	      <ul>
	        <li><a href="<%=root %>/member/logoutMember.jsp">LOGOUT</a></li>
	      	<li><a href="<%=root %>/member/myPage.jsp">MYPAGE</a></li>
	      </ul>
	    </li>
	 	<% } else { %>
	    <li id="header1">
	      <a href="<%=root %>/member/loginForm.jsp">LOGIN</a>
	    </li>
	    <li id="header2">
	      <a href="<%=root %>/member/joinForm.jsp">JOIN</a>
	    </li>
	    <% } %>
	  </ul>
	</nav>
</body>
</html>