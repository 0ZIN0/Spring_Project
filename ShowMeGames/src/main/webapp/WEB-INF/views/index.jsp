<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="resources/index/css/index.css" var="css1" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Show Me Games</title>
	<link rel="stylesheet" href="${css1}">
</head>
<body>
	<header>
		<h2>Main Page 입니다.</h2>
		<div>
			<button id="logo-btn">로고</button>
			<button id="game-btn">게임</button>
			<button id="notices-btn">공지 사항</button>
			<button id="cs-btn">고객 지원</button>
			<button id="login-btn">로그인</button>
		</div>
		<div>
			<button id="category-btn">카테고리</button>
			<button id="genre-btn">장르</button>
			<button id="all-game-btn">모든 게임 보기</button>
			<button id="search-btn">검색</button>
			<button id="cart-btn">장바구니</button>
		</div>
	</header>
	
	<a href="./detail?id=1">게임1로 가기</a>
	
</body>
</html>