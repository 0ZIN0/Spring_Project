<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/resources/mypage" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게임보유리스트</title>
	<!-- mypage 공통 css -->
	<link rel="stylesheet" href="${resource}/css/common.css">
	<!-- gamelist css -->
	<link rel="stylesheet" href="${resource}/css/account_gamelist.css">
	<!-- header, footer css -->
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
	<!-- google font -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/mypage/include/top_bar.jsp" %>

	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/mypage/include/side_bar.jsp" %>
			<div id="main_content">
				<h2 class="content_title">게임보유리스트</h2>
				<div class="content_item">
					<div class="item_title_wrapper">
						<div id="order-list-div" class="item_title_wrapper">
						<div class="item_title">
							<span>게임리스트</span>
						</div>
						<div id="order-list">
							<div id="order-title">
								<div>날짜</div>
								<div>게임명</div>
								<div>가격</div>
								<div>상태</div>
								<div></div>
							</div>
							<div id="order-content">
								<c:forEach begin="1" end="3" var="i">
									<div class="order-content-front">
										<div>2023.02.28</div>
										<div class="order-game">리그오브레전드</div>
										<div>
											₩
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="10000" />
										</div>
										<div class="order-status">구매함</div>
										<div>
											<button class="btn key-btn" data-key="key-${i}">키 확인</button>
										</div>
										<div id="key-${i}" class="order-content-back">
											<div class="back-game-name">리그오브레전드</div>
											<div class="back-game-key">
												KEY : <span class="back-game-key-id">&nbsp;2NCU-JRTW-56VO-7S68</span>
											</div>
											<div>
												<button class="btn order-detail-btn" data-key="key-${i}">결제 내역</button>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
					</div> 
				</div>
			</div>
		</div>
	</main>
	
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>
	<script src="${resource}/js/common.js"></script>
	<script src="${resource}/js/account_gamelist.js"></script>
</body>
</html>