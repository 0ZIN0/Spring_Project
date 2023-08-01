<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- c:url settings -->
<c:url value="/resources/checkout/checkout.css" var="checkout_css" />
<c:url value="/resources/checkout/checkout.js" var="checkout_js" />
<c:url value="/resources/img/checkout/" var="img" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체크 아웃</title>
<script src="https://kit.fontawesome.com/c48a5ad62b.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<!-- css -->
<link rel="stylesheet" href="${checkout_css}">
<!-- payment port one api -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="refund-popup" class="refund-none">
		<div id="refund-content">
			<div id="refund-top">
				<i id="refund-big-icon" class="fa-solid fa-rotate">&nbsp;</i> <span
					id="refund-close-btn" class="material-symbols-outlined">close</span>
			</div>
			<div id="refund-bottom">
				<div>PC 게임 구매에 대한 환불</div>
				<div class="refund_innder">
					<p>게임 플레이 시간이 2시간 미만이라면, 구매일로부터 14일 이내에 PC 게임의 환불을 요청할 수 있습니다.</p>
					<p>Show me games의 주문 내역 페이지에서 PC 게임 환불 요청을 신청할 수 있습니다.</p>
					<p>*다음의 제품을 구매하는 경우, 구매자는 콘텐츠를 즉시 이용할 수 있으며, 철회권을 포기한다는 점에
						동의하게됩니다. 그에 따라 다음 상품의 구매는 최종적이며 환불 대상이 아닙니다. 소모품, 디지털 콘솔 키 다운로드
						가능한 콘텐츠(예: 확장팩), 게임 내 화폐, 게임 내 상점에서 이루어진 구매</p>
				</div>
			</div>
		</div>
	</div>
	<header id="checkout-header">
		<div id="header-top">
			<a id="logo-btn" href="./">로고</a>
			<div id="unit-info">
				<i class="fa-brands fa-bitcoin"></i> 100
			</div>
		</div>
		<div id="header-bottom">
			<div>
				<a id="back-link-btn" href="./cart">
					<div>
						<span class="material-symbols-outlined">arrow_back</span>
					</div>
					<div>뒤로</div>
				</a>
				<div id="header-checkout-info">
					<a id="cart-link-btn" class="header-bottom-info" href="./cart">
						<div>
							<span class="material-symbols-outlined header-info">check_circle</span>
						</div>
						<div>장바구니</div>
					</a>
					<div>
						<span class="material-symbols-outlined header-info-arrow">arrow_forward_ios</span>
					</div>
					<div class="header-bottom-info">
						<div>
							<span class="material-symbols-outlined header-info">counter_2</span>
						</div>
						<div>결제</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<main id="checkout-main">
		<div id="checkout-content">
			<div id="checkout-main-content">
				<div>
					<h3 id="checkout-title">&nbsp;결제</h3>
					<span class="material-symbols-outlined">credit_score</span>
					<div>안전거래</div>
				</div>
				<div id="checkout-form">
					<div>
						<label for="name">이름 *</label> <input class="input-ok checkout-input-form" id="first-name" type="text"
							value="" />
						<p id="first-name-p" class="input-p">다음 정보가 필요합니다.</p>
					</div>
					<div>
						<label for="name">성 *</label> <input class="input-ok checkout-input-form" id="last-name" type="text"
							value="" />
						<p id="last-name-p" class="input-p">다음 정보가 필요합니다.</p>
					</div>
					<div>
						<label for="name">주소 *</label> <input class="input-ok checkout-input-form" id="address" type="text"
							value="" />
						<p id="address-p" class="input-p">다음 정보가 필요합니다.</p>
					</div>
					<div>
						<label for="name">우편번호 *</label> <input class="input-ok checkout-input-form" id="post-num" type="text"
							value="" />
						<p id="post-num-p" class="input-p">다음 정보가 필요합니다.</p>
					</div>
					<div>
						<button id="check-out-btn">결제하기</button>
					</div>
				</div>
				<p id="checkout-main-content-info">Show me games는 상품 구매 목적을 위해
					사용자의 개인정보를 처리합니다. 개인정보 처리 및 권리 행사에 대한 자세한 정보는 Show me games 개인정보
					보호정책을 확인하세요.</p>
			</div>
			<div id="nav-bar">
				<div id="nav-top">
					<div>
						<h3>&nbsp;고객님의 장바구니</h3>
						<a id="cart-change-btn" href="./cart">수정</a>
					</div>
					<div id="top-cart-list">
						<div id="checkout-cart-top">
							<div>${cart_len} 항목</div>
							<div id="banner-list-div">
								<c:forEach items="${cart_list}" var="game">
									<img class="game_banner_img" alt=""
										src="${game.banner_img_url}">
								</c:forEach>
							</div>
						</div>
						<div class="display-none" id="checkout-cart-mid">
							<c:forEach items="${cart_list}" var="game" varStatus="status">
								<div class="game-detail-grid" id="game-detail-${game.game_id}">
									<img class="game_detail_banner_img" alt=""
										src="${game.banner_img_url}">
									<div class="game_detail_content-grid">
										<div class="detail-game-name">${game.game_name}</div>
										<div class="detail-game-platform">플랫폼: ${platforms[status.index]}</div>
										<div class="detail-game-price">
											<c:choose>
												<c:when test="${game.discounted_price > 0}">
													₩ <fmt:formatNumber type="number" maxFractionDigits="3"
														value="${game.discounted_price}" />
												</c:when>
												<c:otherwise>
													₩ 무료
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div id="checkout-cart-bottom">
							<div>장바구니 상세정보</div>
							<span class="material-symbols-outlined expand_more">expand_more</span>
						</div>
					</div>
				</div>
				<div>
					<h3>&nbsp;요약</h3>
					<div id="nav-grid">
						<div id="summary-grid">
							<div>
								<div>소계 (${cart_len} 항목)</div>
								<div class="price" id="lower-order">
									₩
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${total_price}" />
								</div>
							</div>
							<div>
								<div>합계</div>
								<div>부가세 포함</div>
								<div></div>
								<div class="price" id="total-order">
									₩
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${total_price}" />
								</div>
							</div>
							<div>
								<div>해당 구매로 획득하는 유닛</div>
								<div class="price">
									<i class="fa-brands fa-bitcoin"></i> ${unit}
								</div>
							</div>
						</div>
						<div>
							<a id="refund-btn"> <i id="refund-icon"
								class="fa-solid fa-rotate">&nbsp;</i>구매 확정 혹은 환불
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<footer id="checkout-footer"> </footer>

	<!-- js -->
	<script src="${checkout_js}"></script>

</body>
</html>