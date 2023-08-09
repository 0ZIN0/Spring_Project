<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/manager" var="resource"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게임 정보 관리</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/admin_game.css">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp" %>
	
	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp" %>
			<div id="main_content">
				<div id="account_content">
					<h2 class="content_title">게임 정보 관리</h2>
					<div class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>게임 리스트</span>
							</div>
							<div class="content_update_wrapper">
								<button class="btn">추가</button>
							</div>
						</div>
						<div id="game_content_wrapper">
							<div>
								<div id="content_grid_header" class="content_grid">
									<div class="content_grid_item header">
										<span>ID</span>
									</div>
									<div class="content_grid_item header">
										<span>이름</span>
									</div>
									<div class="content_grid_item header">
										<span>가격</span>
									</div>
									<div class="content_grid_item header">
										<span>할인</span>
									</div>
									<div class="content_grid_item header">
										<span>표시타입</span>
									</div>
								</div>
								<c:forEach items="${gameList}" var="game">
									<div class="content_grid">
										<div class="content_grid_item">
											<span>${game.game_id}</span>
										</div>
										<div class="content_grid_item">
											<span class="game_name_span" data-id="${game.game_id}">${game.game_name}</span>
										</div>
										<div class="content_grid_item">
											<span>${game.game_price}</span>
										</div>
										<div class="content_grid_item">
											<span>${game.discount}</span>
										</div>
										<c:choose>
											<c:when test="${game.layout eq null}">
												<div class="content_grid_item">
													<span>Default</span>
												</div>
											</c:when>
											<c:otherwise>
												<div class="content_grid_item">
													<span>${game.layout}</span>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
								</c:forEach>
							</div>
							<%@ include file="/WEB-INF/views/manager/include/paging.jsp" %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<script src="${resource}/js/admin_game.js"></script>
	<script src="${resource}/js/paging.js"></script>
</body>
</html>