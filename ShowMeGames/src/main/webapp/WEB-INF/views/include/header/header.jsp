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
					<a id="category-btn">카테고리</a>
					<ul>
						<li>베스트 셀러</li>
						<li>최신 출시작</li>
						<li>무료 게임</li>
						<li>할인중인 게임</li>
						<li>Chanwoo Pick</li>
						<li>Gicheol Pick</li>
						<li>Jaehun Pick</li>
						<li>Roa Pick</li>
						<li>Yeoungmin Pick</li>
						<li>Gitae Pick</li>
					</ul>
				</li>
				<li>
					<a id="genre-btn">장르</a>
					<ul>
						<li>액션/어드벤처</li>
						<li>캐주얼</li>
						<li>협동</li>
						<li>Indies</li>
						<li>멀티플레이어</li>
						<li>레이싱</li>
						<li>슈팅</li>
						<li>시뮬레이션</li>
						<li>전략</li>
					</ul>
				</li>
				<li><a id="editor-pick">Editor Pick</a></li>
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

