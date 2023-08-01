<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/" var="conPath" />
<script src="https://kit.fontawesome.com/c48a5ad62b.js"
	crossorigin="anonymous"></script>
	
	
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<header>
	<div id="header-top">
		<div>
			<ul class="header-top-menu" id="header-top-ul">
				<li class="clickable-li" onclick="window.location.href='${conPath}'">
					<a id="logo-btn" href="${conPath}"></a> 로고
				</li>
				<li class="clickable-li" onclick="window.location.href='${conPath}'">
					<a id="game-btn" href="${conPath}"></a> 게임
				</li>
				<li class="clickable-li"
					onclick="window.location.href='${conPath}customer/notice'"><a
					id="notices-btn" href="${conPath}customer/notice"></a> 공지사항</li>
				<li class="clickable-li"
					onclick="window.location.href='${conPath}customer/faq'"><a
					id="customer-btn" href="${conPath}customer/faq"></a> 고객지원</li>
				<li></li>

				<!-- 사용자가 로그인한 경우 이 li 요소를 보여줍니다. -->
				<c:if test="${not empty sessionScope.isLoggedIn}">
					<li id="point-li">
						<div id="point-div">
							현재 보유량:&nbsp;<i class="fa-brands fa-bitcoin" id="point-i">&nbsp;&nbsp;${user.user_point} </i> 
							<div class="clickable-li" id="login-li">
								<i class="fa-regular fa-circle-user fa-2xl" id="login-icon2"
									style="color: #a1a1a1;"></i> <a id="login-btn"></a>
							</div>
							
						</div>

					</li>
				</c:if>

				<!-- 사용자가 로그인하지 않은 경우 이 li 요소를 보여줍니다. -->
				<c:if test="${empty sessionScope.isLoggedIn}">
					<li class="clickable-li" id="login-li" onclick="openLoginPopup()"
						onmouseover="changeIconColor('login-icon', 'white')"
						onmouseout="changeIconColor('login-icon', '#a1a1a1')"><i
						class="fa-solid fa-circle-user fa-xl" id="login-icon"
						style="color: #a1a1a1;"></i> <a id="login-btn"></a>로그인</li>
				</c:if>


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
		</div>
	</div>
	<div id="header-bottom" class="header-bottom-up">
		<div id="header-bottom-logo">로고</div>
		<div>
			<ul id="header-bottom-ul">
				<li class="title-div">
					<div class="header-bottom-btn" id="category">
						<div class="bottom-btns">카테고리</div>
						<div id="category-arrow" class="bottom-btns expand_more">
							<span class="material-symbols-outlined"> expand_more </span>
						</div>
					</div>
					<ul id="category-li" class="sub-ul">
						<li onclick="location.href='${conPath}category/best-sellers'"><a>베스트
								셀러</a></li>
						<li onclick="location.href='${conPath}category/chanwoo-pick'"><a>Chanwoo
								Pick</a></li>
						<li onclick="location.href='${conPath}category/latest-releases'"><a>최신
								출시작</a></li>
						<li onclick="location.href='${conPath}category/gicheol-pick'"><a>Gicheol
								Pick</a></li>
						<li onclick="location.href='${conPath}category/free-games'"><a>무료
								게임</a></li>
						<li onclick="location.href='${conPath}category/jaehun-pick'"><a>Jaehun
								Pick</a></li>
						<li onclick="location.href='${conPath}category/sale-games'"><a>할인중인
								게임</a></li>
						<li onclick="location.href='${conPath}category/roa-pick'"><a>Roa
								Pick</a></li>
						<li></li>
						<li onclick="location.href='${conPath}category/yeoungmin-pick'"><a>Yeoungmin
								Pick</a></li>
						<li></li>
						<li onclick="location.href='${conPath}category/gitae-pick'"><a>Gitae
								Pick</a></li>
					</ul>
				</li>
				<li class="title-div">
					<div class="header-bottom-btn" id="header-genre">
						<div class="bottom-btns">장르</div>
						<div id="genre-arrow" class="bottom-btns expand_more">
							<span class="material-symbols-outlined"> expand_more </span>
						</div>
					</div>
					<ul id="genre-li" class="sub-ul">
						<li onclick="location.href='${conPath}genre/rpg'"><a>RPG</a></li>
						<li onclick="location.href='${conPath}genre/action-adventure'"><a>액션
								/ 어드벤처</a></li>
						<li onclick="location.href='${conPath}genre/casual'"><a>캐주얼</a></li>
						<li onclick="location.href='${conPath}genre/shooter-fps'"><a>슈팅
								/ FPS</a></li>
						<li onclick="location.href='${conPath}genre/strategy-simulation'"><a>전략
								/ 시뮬</a></li>
						<li onclick="location.href='${conPath}genre/puzzle'"><a>퍼즐</a></li>
						<li onclick="location.href='${conPath}genre/multi-coop'"><a>멀티
								/ 협동</a></li>
						<li onclick="location.href='${conPath}genre/racing'"><a>레이싱</a></li>
						<li onclick="location.href='${conPath}genre/sports'"><a>스포츠</a></li>
					</ul>
				</li>
				<li class="title-div"><div class="header-bottom-btn"
						id="editor">
						<div class="bottom-btns">큐레이터 추천</div>
						<div id="editor-arrow" class="bottom-btns expand_more">
							<span class="material-symbols-outlined"> expand_more </span>
						</div>
					</div>
					<ul id="editor-pink-li" class="sub-ul">
						<li><a>젤다의 전설</a></li>
						<li><a>슬레이 더 스파이어</a></li>
						<li><a>마리오 카트</a></li>
						<li><a>포탈</a></li>
						<li><a>하프라이프</a></li>
						<li><a>카운터스트라이크</a></li>
						<li><a>레인보우6</a></li>
						<li><a>에이펙스</a></li>
					</ul></li>
				<li><div class="bottom-title" id="header-games-btn"
						onclick="location.href='${conPath}games'">모든 게임 보기</div></li>
			</ul>
		</div>
		<div id="blank"></div>

		<div>
			<form id="search-form" action="${conPath}search">
				<input type="text" id="search" name="search"
					placeholder="게임을 검색하세요!"></input>
				<button type="submit" id="submit-btn">
					<i class="fa-solid fa-magnifying-glass"
						style="color: #008aa4; font-size: 25px;"></i>
				</button>
			</form>
		</div>

		<div id="header-cart">
			<a class="bottom-title" id="cart-btn" href="${conPath}cart">
				<i id="cart-icon" class="fa-solid fa-cart-shopping"></i>
				<span id="cart-title">장바구니</span> <span class="cart-quantity"></span> 
			</a>
			
			<!-- 장바구니 마우스 오버 시 나올 MiniCart -->
			<div id="minicart" class="">
				<div class="minicart-header minicart-common">
					<div class="minicart-title">장바구니</div>
				</div>
				<div class="empty-minicart-content minicart-common">
						<div class="empty-minicart-message minicart-common">장바구니가 비어있습니다.</div>
						<div class="empty-minicart-image minicart-common">
							<img alt="Empty Minicart"src="resources/img/cart/SMG_EmptyMarket_img.jpg">
						</div>
						<div class="empty-minicart-buttons minicart-common" onclick="location.href='${conPath}games'">쇼핑하러 가기2</div>
				</div>
			</div> <!-- minicart Part End -->
		</div> <!-- header-cart Part End -->

	</div>



</header>