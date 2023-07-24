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
							<div class="">
								<div class="game_img">img</div>
							</div>
							<div>게임2</div>
						</div>
					</div>
					<div id="nav-bar">
						<h3>요약</h3>
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