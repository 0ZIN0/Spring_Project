<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<!-- payment port one api -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	<main class="background_layer1">
		<div id="cart-main" class="background_layer2">
			<div></div>
			<c:choose>
				<c:when test="${cart_len > 0}">
					<div id="cart-main-grid">
						<div id="cart-content-grid">
							<h3 id="cart-title">&nbsp;고객님의 장바구니 (${cart_len} 상품)</h3>
							<div id="games-info-grid">
								<c:forEach items="${cart_list}" var="game" varStatus="status">
									<img class="game-img" alt="" src="${game.banner_img_url}">
									<div class="game-content">
										<a class="game-name" href="./detail?game=${game.game_id}">${game.game_name}</a>
										<div class="game-select-form">
											<c:choose>
												<c:when test="${fn:length(platforms[status.index]) > 1}">
													<div>플랫폼:</div>
													<div
														class="plat-form-select options-ok options-${game.game_id}"
														data-game="options-${game.game_id}"
														data-id="${game.game_id}">
														<div id="platform-view-${game.game_id}"
															class="options-ok options-${game.game_id}"
															data-game="options-${game.game_id}"
															data-id="${game.game_id}">${platforms[status.index][0]}</div>
														<div
															class="option-open-btn options-ok options-${game.game_id}"
															data-game="options-${game.game_id}"
															data-id="${game.game_id}">
															<span
																class="material-symbols-outlined options-ok options-${game.game_id}"
																data-game="options-${game.game_id}"
																data-id="${game.game_id}">expand_more</span>
															<div class="plat-form-options display-none"
																id="options-${game.game_id}">
																<c:forEach var="platformArr"
																	items="${platforms[status.index]}">
																	<c:forEach items="${platformArr}" var="platform">
																		<div class="option ${platform}"
																			data-platform="${platform}" data-id="${game.game_id}">${platform}</div>
																	</c:forEach>
																</c:forEach>
															</div>
														</div>
													</div>
												</c:when>
												<c:otherwise>
													<div>플랫폼:</div>
													<div class="plat-form-select">
														<div>${platforms[status.index][0]}</div>
													</div>
												</c:otherwise>
											</c:choose>
											<input form="cart-form" id="select-platform-${game.game_id}"
												type="hidden" name="platform"
												value="${platforms[status.index][0]}" />
										</div>
										<div class="game-content-bottom">
											<a class="cart-delete" data-gameid="${game.game_id}"> <span
												class="material-symbols-outlined"
												data-gameid="${game.game_id}">delete</span>
												<div data-gameid="${game.game_id}">제거</div>
											</a>
											<div></div>
											<div class="game-price price">
												<c:choose>
													<c:when test="${game.discounted_price > 0}">
													₩ <fmt:formatNumber type="number" maxFractionDigits="3"
															value="${game.discounted_price}" />
													</c:when>
													<c:otherwise>
													무료
												</c:otherwise>
												</c:choose>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<div id="cart-bottom-grid">
								<h3>이 상품을 구매한 분들은 이런 상품도 구매했습니다</h3>
								<div id="cart-pick-grid">
									<c:forEach items="${new_games}" var="game">
										<a class="new-game-link" href="./detail?game=${game.game_id}">
											<img class="week-best-img" alt=""
											src="${game.banner_img_url}">
											<div class="week-best-info">
												<div class="new-game-title">${game.game_name}</div>
												<div class="new-game-price-info">
													<c:choose>
														<c:when test="${game.discount > 0}">
															<div class="new-game-discount">
																<div>-${game.discount}%</div>
															</div>
															<div>
																<div class="new-game-price">
																	₩
																	<fmt:formatNumber type="number" maxFractionDigits="3"
																		value="${game.game_price}" />
																</div>
																<div class="new-game-discount-price">
																	<c:choose>
																		<c:when test="${game.discounted_price > 0}">
																	₩
																	<fmt:formatNumber type="number" maxFractionDigits="3"
																				value="${game.discounted_price}" />
																		</c:when>
																		<c:otherwise>
																		무료
																		</c:otherwise>
																	</c:choose>
																</div>
															</div>
														</c:when>
														<c:otherwise>
															<div></div>
															<div class="new-game-discount-price">
																<c:choose>
																	<c:when test="${game.discounted_price > 0}">
														₩
														<fmt:formatNumber type="number" maxFractionDigits="3"
																			value="${game.discounted_price}" />
																	</c:when>
																	<c:otherwise>
														무료
														</c:otherwise>
																</c:choose>
															</div>
														</c:otherwise>
													</c:choose>
												</div>
											</div>
										</a>
									</c:forEach>
								</div>
							</div>
						</div>
						<div id="nav-bar">
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
									<div>
										<button id="check-out-btn" type="submit" form="cart-form">체크
											아웃</button>
										<form action="./checkout" id="cart-form" method="POST">
										</form>
									</div>
									<a href="./">쇼핑 계속하기</a>
								</div>
								<div>
									<a id="refund-btn"> <i id="refund-icon"
										class="fa-solid fa-rotate">&nbsp;</i>구매 확정 혹은 환불
									</a>
								</div>

								<div id="safe-deal-grid">
									<div>
										<span class="material-symbols-outlined">credit_score</span>&nbsp;안전
										거래
									</div>
									<div id="cart-secured-payment">
										<img alt=""
											src="https://store.ubisoft.com/on/demandware.static/-/Library-Sites-shared-library-web/default/dw74531a5f/images/psp/Master_Card.svg">
										<img alt=""
											src="https://store.ubisoft.com/on/demandware.static/-/Library-Sites-shared-library-web/default/dw9599f331/images/psp/Amex.svg">
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
							<h3>이런 최신 게임은 어떠신가요?</h3>
							<div id="week-best-grid">
								<c:forEach items="${new_games}" var="game">
									<a class="new-game-link" href="./detail?game=${game.game_id}">
										<img class="week-best-img" alt="" src="${game.banner_img_url}">
										<div class="week-best-info">
											<div class="new-game-title">${game.game_name}</div>
											<div class="new-game-price-info">
												<c:choose>
													<c:when test="${game.discount > 0}">
														<div class="new-game-discount">
															<div>-${game.discount}%</div>
														</div>
														<div>
															<div class="new-game-price">
																₩
																<fmt:formatNumber type="number" maxFractionDigits="3"
																	value="${game.game_price}" />
															</div>
															<c:choose>
																<c:when test="${game.discounted_price > 0}">
																	<div class="new-game-discount-price">
																		₩
																		<fmt:formatNumber type="number" maxFractionDigits="3"
																			value="${game.discounted_price}" />
																	</div>
																</c:when>
																<c:otherwise>
																	<div class="new-game-discount-price">무료</div>
																</c:otherwise>
															</c:choose>
														</div>
													</c:when>
													<c:otherwise>
														<div></div>
														<div class="new-game-discount-price">
															<c:choose>
																<c:when test="${game.discounted_price > 0}">
														₩
														<fmt:formatNumber type="number" maxFractionDigits="3"
																		value="${game.discounted_price}" />
																</c:when>
																<c:otherwise>
														무료
														</c:otherwise>
															</c:choose>
														</div>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			<div></div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	<script src="${cart_js}"></script>

</body>
</html>