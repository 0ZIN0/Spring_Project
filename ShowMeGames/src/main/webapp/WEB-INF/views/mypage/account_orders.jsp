<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/resources/mypage" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>구매내역</title>
<!-- mypage 공통 css -->
<link rel="stylesheet" href="${resource}/css/common.css">
<!-- orders css -->
<link rel="stylesheet" href="${resource}/css/account_orders.css">
<!-- header, footer css -->
<%@ include file="/WEB-INF/views/include/link/common.jsp"%>
<!-- google font -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/mypage/include/top_bar.jsp"%>

	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/mypage/include/side_bar.jsp"%>
			<div id="main_content">
				<h2 class="content_title">구매내역</h2>
				<div class="content_item">
					<div id="order-list-div" class="item_title_wrapper">
						<div class="item_title">
							<span>게임리스트</span>
						</div>
						<div id="order-list">
							<div id="order-title">
								<div>No.</div>
								<div>날짜</div>
								<div>상품명</div>
								<div>가격</div>
								<div>상태</div>
							</div>
							<div id="order-content">
								<c:forEach begin="1" end="3" var="i">
									<a href="./order/detail?id=${i}" class="order-content-front">
										<div>imp12345</div>
										<div>2023.02.28</div>
										<div class="order-game">리그오브레전드 외 3</div>
										<div>
											₩
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="10000" />
										</div>
										<div class="order-status">구매함</div>
									</a>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>
	<script src="${resource}/js/common.js"></script>
	<script src="${resource}/js/account_orders.js"></script>
</body>
</html>