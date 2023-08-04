<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="${user.profile_url}" var="profile_img"/>
<c:url value="/" var="toMain"/>
<c:url value="/" var="conPath" />
<script src="https://kit.fontawesome.com/c48a5ad62b.js"
	crossorigin="anonymous"></script>


<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />

<header>
	<div id="header-top">
		<div id="header-name">
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
							현재 보유량:&nbsp;<i class="fa-brands fa-bitcoin" id="point-i">&nbsp;&nbsp;${user.user_point}
							</i>
							<div class="clickable-li" id="login-li">
								<i class="fa-regular fa-circle-user fa-2xl" id="login-icon2"
									style="color: #a1a1a1;"></i>
							</div>

						</div>

						<div id="dropdown-content">
							<div class="profile">
								<div class="profile-left"><img src="${profile_img}" alt="프로필사진"></div>
								<div class="profile-right">${user.nick_name}</div>
							</div>
							<div class="separator"></div>
							<div class="rec-title">추천게임</div>
							<div class="recommend"></div>
							<div class="separator"></div>
							<section>
								<ul>
									<li><a href="${conPath}mypage/my_account">내 계정</a></li>
									<li><a href="#">내 주문</a></li>
									<li><a href="${conPath}customer/faq">고객 지원 <i
											class="fa-solid fa-arrow-up-right-from-square"
											style="color: #ffffff;"></i></a></li>
									<li id="profile-logout"><a href="${conPath}member/sessionLogout">로그아웃
											<i class="fa-solid fa-arrow-right-from-bracket fa-xl"
											style="color: #1a91ff;"></i>
									</a></li>
								</ul>
							</section>

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
						<li onclick="location.href='${conPath}category/bestseller'"><a>베스트
								셀러</a></li>
						<li onclick="location.href='${conPath}category/editor?editor=chanwoo'"><a>Chanwoo
								Pick</a></li>
						<li onclick="location.href='${conPath}category/lastest'"><a>최신
								출시작</a></li>
						<li onclick="location.href='${conPath}category/editor?editor=gicheol'"><a>Gicheol
								Pick</a></li>
						<li onclick="location.href='${conPath}category/free'"><a>무료
								게임</a></li>
						<li onclick="location.href='${conPath}category/editor?editor=jaehun'"><a>Jaehun
								Pick</a></li>
						<li onclick="location.href='${conPath}category/discount'"><a>할인중인
								게임</a></li>
						<li onclick="location.href='${conPath}category/editor?editor=roa'"><a>Roa
								Pick</a></li>
						<li></li>
						<li onclick="location.href='${conPath}category/editor?editor=yeoungmin'"><a>Yeoungmin
								Pick</a></li>
						<li></li>
						<li onclick="location.href='${conPath}category/editor?editor=gitae'"><a>Gitae
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
						<li onclick="location.href='${conPath}games?genre=RPG#game_list'"><a>RPG</a></li>
						<li onclick="location.href='${conPath}games?genre=액션#game_list'"><a>액션
								/ 어드벤처</a></li>
						<li onclick="location.href='${conPath}games?genre=캐주얼#game_list'"><a>캐주얼</a></li>
						<li onclick="location.href='${conPath}games?genre=슈팅#game_list'"><a>슈팅
								/ FPS</a></li>
						<li onclick="location.href='${conPath}games?genre=전략#game_list'"><a>전략
								/ 시뮬</a></li>
						<li onclick="location.href='${conPath}games?genre=퍼즐#game_list'"><a>퍼즐</a></li>
						<li onclick="location.href='${conPath}games?genre=멀티#game_list'"><a>멀티
								/ 협동</a></li>
						<li onclick="location.href='${conPath}games?genre=레이싱#game_list'"><a>레이싱</a></li>
						<li onclick="location.href='${conPath}games?genre=스포츠#game_list'"><a>스포츠</a></li>
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
			<a class="bottom-title" id="cart-btn" href="${conPath}cart"> <i
				id="cart-icon" class="fa-solid fa-cart-shopping"></i> <span
				id="cart-title">장바구니</span> <span class="cart-quantity"></span>
			</a>

			<!-- 장바구니 마우스 오버 시 나올 MiniCart -->
			<div id="minicart" class="">
				<div class="minicart-header minicart-common">
					<div class="minicart-title">장바구니</div>
				</div>
				
				<div id="minicart-content" class="minicart-common">
					<div class="empty-minicart-content minicart-common">
						<div class="empty-minicart-message minicart-common">
							장바구니가 비어있습니다.
						</div>
						<div class="empty-minicart-image minicart-common">
							<img alt="Empty Minicart" src="resources/img/cart/SMG_EmptyMarket_img.jpg">
						</div>
						<div class="empty-minicart-buttons minicart-common" onclick="location.href='${conPath}games'">
							쇼핑하러 가기40
						</div>	
					</div>
				</div>
				<!-- minicart-content Part End -->
			</div>
			<!-- minicart Part End -->
		</div>
		<!-- header-cart Part End -->

	</div>



</header>