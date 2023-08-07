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
							<span>구매내역</span>
						</div>
						<c:choose>
							<c:when test="${fn:length(orders) > 0}">
								<div id="order-list">
									<div id="order-title">
										<div>No.</div>
										<div>날짜</div>
										<div>상품명</div>
										<div>가격</div>
										<div>상태</div>
									</div>
									<div id="order-content">
										<c:forEach items="${orders}" var="order">
											<a href="./orders/detail?id=${order.order_id}"
												class="order-content-front">
												<div>${order.imp_uid}</div>
												<div>
													<fmt:formatDate var="date" value="${order.order_date}"
														type="DATE" pattern="yyyy.MM.dd" />${date}
												</div>
												<div class="order-game">${order.order_product}</div>
												<div>
													₩
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${order.order_price}" />
												</div>
												<div class="order-status">
													<c:choose>
														<c:when test="${order.order_status eq 'paid'}">
														구매함
													</c:when>
													<c:otherwise>
														환불 요청
													</c:otherwise>
													</c:choose>
												</div>
											</a>
										</c:forEach>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div>구매 내역이 없습니다.</div>
							</c:otherwise>
						</c:choose>
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