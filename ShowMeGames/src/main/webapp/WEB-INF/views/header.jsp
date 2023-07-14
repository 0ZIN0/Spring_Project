<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
		<h2>Main Page 입니다.</h2>
		<div id="header-top">
			<div>
				<ul>
					<li><a id="logo-btn" href="./">로고</a></li>
					<li><a id="game-btn" href="./">게임</a></li>
					<li><a id="notices-btn" href="./customer/notice">공지 사항</a></li>
				</ul>
			</div>
			<div>
				<dl>
					<dt>고객 지원</dt>
					<dd><a id="faq-btn" href="./customer/faq">자주 묻는 질문</a></dd>
					<dd><a id="qna-btn" href="./customer/qna">문의하기</a></dd>
				</dl>
			</div>
			<div>
				<a id="login-btn" href="./member/login">로그인</a>
			</div>
		</div>
		<div id="header-bottom">
			<div>
				<ul>
					<li><a id="category-btn">카테고리</a></li>
					<li><a id="genre-btn">장르</a></li>
					<li><a id="all-game-btn" href="./games">모든 게임 보기</a></li>
				</ul>
			</div>
			<div>
				<form action="./search">
					검색 <input type="text" id="search" name="search"></input>
					<input id="submit-btn" type="submit" value="검색하기">
				</form>
			</div>
			<div>
				<a id="cart-btn" href="./cart">장바구니</a>
			</div>
		</div>