<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- c:url settings -->
<c:url value="/resources/cart/css/cart.css" var="cart_css" />
<c:url value="/resources/cart/js/cart.js" var="cart_js" />
<c:url value="/resources/img/cart/page/" var="img" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<!-- header, footer css -->
<%@ include file="/WEB-INF/views/include/link/common.jsp"%>
<!-- css -->
<link rel="stylesheet" href="${cart_css}">
<!-- c:set settings -->
<c:set var="gamesLen" scope="session" value="${gamesLength}" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>

	<main id="cart-main">
		<div></div>
		<c:choose>
			<c:when test="${gamesLen != 0}">
					<div id="cart-main-grid">
						<div id="cart-content-grid">
							<h3 id="cart-title">고객님의 장바구니 (1 상품)</h3>
							<div id="games-info-grid">
								<c:forEach begin="1" end="3" var="i">
									<div class="game-img">img ${i}</div>
									<div class="game-content">
										<a class="game-name">title</a>
										<div class="game-short-title">short title</div>
										<div class="game-content-bottom">
											<a class="cart-delete" href="./cart"> <span
												class="material-symbols-outlined">delete</span>
												<div>제거</div>
											</a>
											<div></div>
											<div class="game-price price">￦ 가격</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<div id="cart-bottom-grid">
								<h3>이 상품을 구매한 분들은 이런 상품도 구매했습니다</h3>
								<div id="cart-pick-grid">
									<div></div>
									<div></div>
									<div></div>
								</div>
							</div>
						</div>
						<div id="nav-bar">
							<h3>요약</h3>
							<div id="nav-grid">
								<div id="summary-grid">
									<div>
										<div>소계 (3 항목)</div>
										<div class="price" id="lower-order">￦ 소계</div>
									</div>
									<div>
										<div>합계</div>
										<div>부가세 포함</div>
										<div></div>
										<div class="price" id="total-order">￦ 합계</div>
									</div>
									<div>
										<div>해당 구매로 획득하는 유닛</div>
										<div class="price">
											<i class="fa-brands fa-bitcoin"></i>100
										</div>
									</div>
									<div>
										<a id="check-out-btn">체크 아웃</a>
									</div>
									<a href="./">쇼핑 계속하기</a>
								</div>
								<div>
									<a id="refund-btn" href="./"> <i id="refund-icon"
										class="fa-solid fa-rotate">&nbsp;</i>구매 확정 혹은 환불
									</a>
								</div>

								<div id="safe-deal-grid">
									<div>
										<span class="material-symbols-outlined">credit_score</span> 안전
										거래
									</div>
									<div id="cart-secured-payment">
										<img alt=""
											src="https://store.ubisoft.com/on/demandware.static/-/Library-Sites-shared-library-web/default/dw74531a5f/images/psp/Master_Card.svg">
										<img alt=""
											src="https://store.ubisoft.com/on/demandware.static/-/Library-Sites-shared-library-web/default/dw9599f331/images/psp/Amex.svg"">
										<img alt=""
											src="https://store.ubisoft.com/on/demandware.static/-/Library-Sites-shared-library-web/default/dw879a8b40/images/psp/Visa.svg">
										<img alt=""
											src="https://store.ubisoft.com/on/demandware.static/-/Library-Sites-shared-library-web/default/dw4beeff1b/images/psp/Kakaopay.svg">
										<img alt=""
											src="https://store.ubisoft.com/on/demandware.static/-/Library-Sites-shared-library-web/default/dw61e186d1/images/psp/Culture_land.svg">
										<img alt=""
											src="https://store.ubisoft.com/on/demandware.static/-/Library-Sites-shared-library-web/default/dwb80a922b/images/psp/Toss.svg">
										<img alt=""
											src="https://store.ubisoft.com/on/demandware.static/-/Library-Sites-shared-library-web/default/dwf8fdd41b/images/psp/Mobile_payment.svg">
									</div>
								</div>
							</div>
						</div>
					</div>
			</c:when>
			<c:otherwise>
				<div id="nothing-main-grid">
					<div id="nothing-cart-top-grid">
						<div id="nothing-games-grid">
							<div id="nothing-content">
								<h2 id="nothing-title">장바구니가 비었습니다!</h2>
								<div>
									<a id="go-shopping-btn" href="./">쇼핑 계속하기</a>
								</div>
							</div>
							<img alt="장바구니가 비어있음을 나타내는 이미지"
								src="https://store.ubisoft.com/on/demandware.static/-/Library-Sites-shared-library-web/default/dwa62d0a1e/images/cart/empty_cart_image.png">
						</div>
					</div>
					<div id="cart-bottom-grid">
						<h3>이번주 베스트 셀러</h3>
						<div id="week-best-grid">
							<div></div>
							<div></div>
							<div></div>
							<div></div>
							<div></div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		<div></div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	<script src="${cart_js}"></script>

</body>
</html>