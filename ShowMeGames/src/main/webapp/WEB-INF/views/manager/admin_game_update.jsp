<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/manager" var="resource"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게임 정보 수정</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/admin_game_update.css">
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
					<h2 class="content_title">게임 정보 수정</h2>
					<div class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>${game.game_id}번 게임 상세 정보 수정</span>
							</div>
							<div class="content_update_wrapper">
								<button onclick="location.href = './admin_game_detail?game_id=${game.game_id}';"
									 class="btn">뒤로가기</button>
							</div>
						</div>
						<div>
							<div class="input_container_div">
								<div class="input_title_div">
									<span class="input_title_span">게임명</span>
								</div>
								<div class="input_content_div">
									<input type="text" id="input_game_name" name="game_name" value="${game.game_name}">
								</div>
							</div>
							<div class="input_container_div upper">
								<div class="input_container_div">
									<div class="input_title_div">
										<span class="input_title_span">원가격</span>
									</div>
									<div class="input_content_div">
										<input type="number" id="input_game_price" name="game_price" value="${game.game_price}">
									</div>
								</div>
								<div class="input_container_div">
									<div class="input_title_div">
										<span class="input_title_span">할인율</span>
									</div>
									<div class="input_content_div">
										<input type="number" id="input_discount" name="discount" value="${game.discount}">
									</div>
								</div>
								<div class="input_container_div">
									<div class="input_title_div">
										<span class="input_title_span">최종가격</span>
									</div>
									<div class="input_content_div">
										<span>
										</span>
										<input type="number" id="input_discount" name="discount" value="${game.discount}">
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