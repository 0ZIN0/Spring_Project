<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/" var="conPath" />
<script src="https://kit.fontawesome.com/c48a5ad62b.js"
	crossorigin="anonymous"></script>
<header>
	<div id="header-top">
		<div>
			<ul class="header-top-menu" id="header-top-ul">
				<li><a id="logo-btn" href="${conPath}">로고</a></li>
				<li><a id="game-btn" href="${conPath}">게임</a></li>
				<li><a id="notices-btn" href="${conPath}customer/notice">공지
						사항</a></li>
				<li><a id="customer-btn" href="${conPath}customer/faq">고객
						지원</a></li>
				<li></li>
				<li><i class="fa-solid fa-circle-user fa-lg"
					style="color: #a1a1a1;"></i><a id="login-btn" href="./member/login">로그인</a></li>
			</ul>
		</div>
		<div id="header-top-underline">
			<ul id="header-top-ul-underline">
				<li></li>
				<li id="game-btn-underline"></li>
				<li id="notices-btn-underline"></li>
				<li id="customer-btn-underline"></li>
				<li></li>
				<li></li>
			</ul>
			<ul id="header-top-ul-underline2"></ul>
		</div>
	</div>
	<div id="header-bottom">
		<div>
			<ul id="header-bottom-ul">
				<li class="title-div" id="category">카테고리
					<ul id="category-li" class="sub-ul">
						<li><a>베스트 셀러</a></li>
						<li><a>Chanwoo Pick</a></li>
						<li><a>최신 출시작</a></li>
						<li><a>Gicheol Pick</a></li>
						<li><a>무료 게임</a></li>
						<li><a>Jaehun Pick</a></li>
						<li><a>할인중인 게임</a></li>
						<li><a>Roa Pick</a></li>
						<li></li>
						<li><a>Yeoungmin Pick</a></li>
						<li></li>
						<li><a>Gitae Pick</a></li>
					</ul>
				</li>
				<li class="title-div" id="header-genre">장르
					<ul id="genre-li" class="sub-ul">
						<li><a>RPG</a></li>
						<li><a>액션 / 어드벤처</a></li>
						<li><a>캐주얼</a></li>
						<li><a>슈팅 / FPS</a></li>
						<li><a>전략 / 시뮬</a></li>
						<li><a>퍼즐</a></li>
						<li><a>멀티 / 협동</a></li>
						<li><a>레이싱</a></li>
						<li><a>스포츠</a></li>
					</ul>
				</li>
				<li class="title-div" id="editor">큐레이터 추천
					<ul id="editor-pink-li" class="sub-ul">
						<li><a>젤다의 전설</a></li>
						<li><a>슬레이 서 스파이어</a></li>
						<li><a>마리오 카트</a></li>
						<li><a>포탈</a></li>
						<li><a>하프라이프</a></li>
						<li><a>카운터스트라이크</a></li>
						<li><a>레인보우6</a></li>
						<li><a>에이펙스</a></li>
					</ul>
				</li>
				<li><a class="bottom-title" id="all-game-btn" href="./games">모든
						게임 보기</a></li>
			</ul>
		</div>
		<div id="blank"></div>
		<form id="search-form" action="${conPath}search">
			<input type="text" id="search" name="search" placeholder="게임을 검색하세요!"></input>
			<button type="submit" id="submit-btn">
				<i class="fa-solid fa-magnifying-glass"
					style="color: #008aa4; font-size: 25px;"></i>
			</button>
		</form>
		<div id="header-cart" onclick="location.href='${conPath}cart'">
			<a class="bottom-title" id="cart-btn" href="${conPath}cart"><i
				id="cart-icon" class="fa-solid fa-cart-shopping"></i>장바구니</a>
		</div>
	</div>

</header>
