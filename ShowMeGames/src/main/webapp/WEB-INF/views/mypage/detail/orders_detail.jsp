<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/resources/mypage" var="resource" />
<c:url value="/WEB-INF/views/games/detail" var="game-detail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구매 상세페이지</title>
<!-- mypage 공통 css -->
<link rel="stylesheet" href="${resource}/css/common.css">
<!-- orders detail css -->
<link rel="stylesheet" href="${resource}/css/orders_detail.css">
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
			<div id="main_content">
				<h2 class="content_title">구매 상세페이지</h2>
				<div class="content_item">
					<div id="order-list-div" class="item_title_wrapper">
						<div class="item_title">
							<span>${id}번 상세 내역</span>
						</div>
						<div id="order-list-btn-div">
							<button class="btn order-list-btn" onclick="location.href='../orders'">목록</button>
						</div>
					</div>
					<div id="od-grid">
						<div id="od-left">
							<div class="od-row">
								<div class="od-title">주문번호</div>
								<div>${order.imp_uid}</div>
							</div>
							<div class="od-row">
								<div class="od-title">구매한 게임</div>
								<div id="get-games">
								<c:forEach items="${games}" var="game">
									<a href="../../detail?game=${game.game_id}">${game.game_name}</a>
								</c:forEach>	
								</div>
							</div>
						</div>
						<div id="od-right">
							<div class="od-row">
								<div class="od-title">결제 타입</div>
								<div>${order.pay_method}</div>
							</div>
							<div class="od-row">
								<div class="od-title">결제일시</div>
								<div>
									<fmt:formatDate  var="date" value="${order.order_date}" type="DATE" pattern="yyyy.MM.dd HH:mm"/>${date}
								</div>
							</div>
							<div class="od-row">
								<div class="od-title">획득한 Byte</div>
								<div>${order.add_point}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>
	<script src="${resource}/js/common.js"></script>
	<script src="${resource}/js/orders_detail.js"></script>
</body>
</html>