<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/manager" var="resource"/>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게임 요구사항 등록/수정</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/admin_game_req_update.css">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp" %>
	
	<main class="background_layer1" data-id="${game.game_id}">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp" %>
			<div id="main_content">
				<div>
					<h2 class="content_title">게임 요구사항 등록/수정</h2>
					<div class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>${game_id}번 게임 요구사항 등록/수정</span>
							</div>
							<div class="content_update_wrapper">
								<button class="btn cancel">뒤로가기</button>
							</div>
						</div>
						<div>
							<form action="./admin_game_req" method="POST">
								<input type="hidden" name="origin_game_id" value="${spec.game_id}"/>
								<input type="hidden" name="game_id" value="${game_id}"/>
								<div id="req_layer_div">
									<div class="item_div">
										<span class="item_span_title">최저요구사항</span>
										<div class="req_container_wrapper">
											<div class="req_container">
												<span class="req_title">운영체제</span>
												<input type="text" name="min_os" value="${spec.min_os}"/>
											</div>
											<div class="req_container">
												<span class="req_title">프로세서</span>
												<input type="text" name="min_processor" value="${spec.min_processor}"/>
											</div>
											<div class="req_container">
												<span class="req_title">메모리</span>
												<input type="text" name="min_memory" value="${spec.min_memory}"/>
											</div>
											<div class="req_container">
												<span class="req_title">스토리지</span>
												<input type="text" name="min_storage" value="${spec.min_storage}"/>
											</div>
											<div class="req_container">
												<span class="req_title">DirectX</span>
												<input type="text" name="min_directx" value="${spec.min_directx}"/>
											</div>
											<div class="req_container">
												<span class="req_title">그래픽카드</span>
												<input type="text" name="min_graphics_card" value="${spec.min_graphics_card}"/>
											</div>
											<div class="req_container">
												<span class="req_title">로그인</span>
												<input type="text" name="login_method" value="${spec.login_method}"/>
											</div>
										</div>
									</div>
									<div class="item_div">
										<span class="item_span_title">권장요구사항</span>
										<div class="req_container_wrapper">
											<div class="req_container">
												<span class="req_title">운영체제</span>
												<input type="text" name="rec_os" value="${spec.rec_os}"/>
											</div>
											<div class="req_container">
												<span class="req_title">프로세서</span>
												<input type="text" name="rec_processor" value="${spec.rec_processor}"/>
											</div>
											<div class="req_container">
												<span class="req_title">메모리</span>
												<input type="text" name="rec_memory" value="${spec.rec_memory}"/>
											</div>
											<div class="req_container">
												<span class="req_title">스토리지</span>
												<input type="text" name="rec_storage" value="${spec.rec_storage}"/>
											</div>
											<div class="req_container">
												<span class="req_title">DirectX</span>
												<input type="text" name="rec_directx" value="${spec.rec_directx}"/>
											</div>
											<div class="req_container">
												<span class="req_title">그래픽카드</span>
												<input type="text" name="rec_graphics_card" value="${spec.rec_graphics_card}"/>
											</div>
										</div>
									</div>
								</div>
								<div class="input_layer_div">
									<div id="final_btn_div">
										<button type="button" class="btn cancel">취소</button>
										<button type="submit" class="btn">등록/수정</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<script src="${resource}/js/admin_game_req_update.js"></script>
</body>
</html>