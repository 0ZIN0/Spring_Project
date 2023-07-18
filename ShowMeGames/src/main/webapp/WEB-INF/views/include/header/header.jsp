<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<header>
	<div id="header-top">
		<div>
			<ul id="header-top-ul">
				<li><a id="logo-btn" href="./">로고</a></li>
				<li><a id="game-btn" href="./">게임</a></li>
				<li><a id="notices-btn" href="./customer/notice">공지 사항</a></li>
				<li>
					<a id="customer-btn" href="">고객 지원</a>
					<ul id="customer-ul">
						<li><a id="faq-btn" href="./customer/faq">자주 묻는 질문</a></li>
						<li><a id="qna-btn" href="./customer/qna">문의하기</a></li>
					</ul>
				</li>
				<li><a id="login-btn" href="./member/login">로그인</a></li>
			</ul>
		</div>
	</div>
	<div id="header-bottom">
		<div>
			<ul id="header-bottom-ul">
				<li>
					<a id="category-btn" href="">카테고리</a>
					<ul class="sub-ul">
						<li><a>베스트 셀러</a></li>
						<li><a>최신 출시작</a></li>
						<li><a>무료 게임</a></li>
						<li><a>할인중인 게임</a></li>
						<li><a>Chanwoo Pick</a></li>
						<li><a>Gicheol Pick</a></li>
						<li><a>Jaehun Pick</a></li>
						<li><a>Roa Pick</a></li>
						<li><a>Yeoungmin Pick</a></li>
						<li><a>Gitae Pick</a></li>
					</ul>
				</li>
				<li>
					<a id="genre-btn" href="">장르</a>
					<ul class="sub-ul">
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
				<li>
					<a id="editor-pick" href="">Editor Pick</a>
					<ul class="sub-ul">
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
				<li><a id="all-game-btn" href="./games">모든 게임 보기</a></li>
			</ul>
		</div>
		<div>
			<form action="./search">
				검색 <input type="text" id="search" name="search"></input> <input
					id="submit-btn" type="submit" value="검색하기">
			</form>
		</div>
		<div>
			<a id="cart-btn" href="./cart">장바구니</a>
		</div>
	</div>
</header>

