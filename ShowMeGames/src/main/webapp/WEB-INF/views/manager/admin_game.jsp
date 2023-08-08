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
										<span>수정</span>
									</div>
								</div>
								<div class="content_grid">
									<div class="content_grid_item">
										<span>1</span>
									</div>
									<div class="content_grid_item">
										<span>2</span>
									</div>
									<div class="content_grid_item">
										<span>3</span>
									</div>
									<div class="content_grid_item">
										<span>4</span>
									</div>
									<div class="content_grid_item">
										<button class="btn item_update_btn">수정</button>
									</div>
								</div>
								<div class="content_grid">
									<div class="content_grid_item">
										<span>1</span>
									</div>
									<div class="content_grid_item">
										<span>2</span>
									</div>
									<div class="content_grid_item">
										<span>3</span>
									</div>
									<div class="content_grid_item">
										<span>4</span>
									</div>
									<div class="content_grid_item">
										<button class="btn item_update_btn">수정</button>
									</div>
								</div>
								<div class="content_grid">
									<div class="content_grid_item">
										<span>1</span>
									</div>
									<div class="content_grid_item">
										<span>2</span>
									</div>
									<div class="content_grid_item">
										<span>3</span>
									</div>
									<div class="content_grid_item">
										<span>4</span>
									</div>
									<div class="content_grid_item">
										<button class="btn item_update_btn">수정</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
</body>
</html>