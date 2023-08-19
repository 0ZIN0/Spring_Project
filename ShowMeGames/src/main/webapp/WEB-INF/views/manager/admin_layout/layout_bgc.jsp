<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/manager" var="resource"/>
<c:url value="/resources/manager/admin_layout" var="resource_layout"/>
<c:url value="/resources/img/games/layout/default/" var="default_img"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>기본 레이아웃 설정</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- layout_common css -->
	<link rel="stylesheet" href="${resource_layout}/css/layout_common.css">
	<!-- page css -->
	<link rel="stylesheet" href="${resource_layout}/css/layout_default.css">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp" %>
	
	<main class="background_layer1" data-id="${game_id}">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp" %>
			<div id="main_content">
				<div id="account_content">
					<h2 class="content_title">기본 레이아웃 설정</h2>
					<div class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>${game_id}번 게임 상세페이지 레이아웃</span>
							</div>
							<div class="content_update_wrapper">
								<button class="btn cancel back">뒤로가기</button>
							</div>
						</div>
						<div>
							<form id="form_layout" action="./layout_update_default" method="POST" enctype="multipart/form-data">
								<input type="hidden" name="origin_game_id" value="${game_id}">
								<input type="hidden" name="game_id" value="${layout.game_id}">
								<div id="input_container_wrapper">
									<div id="input_layers_wrapper">
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>경고메세지</span>
												</div>
												<div class="input_content_div">
													<input id="input_warn_content" type="text" name="warn_content" value="${layout.warn_content}"/>
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>게임 정보 사진</span>
												</div>
												<div class="input_content_div">
													<input type="file" id="input_img_url" name="img_file" accept="image/jpg, image/jpeg, image/png">
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>게임 영상 1번</span>
												</div>
												<div class="input_content_div">
													<input type="file" id="input_game_detail_video_1"
														name="game_video_file_1"
														accept="video/mp4, video/mkv, video/x-m4v, video/webm">
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>게임 정보 사진</span>
												</div>
												<div class="input_content_div">
													<input type="file" id="input_img_url" name="img_file" accept="image/jpg, image/jpeg, image/png">
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>게임 영상 2번</span>
												</div>
												<div class="input_content_div">
													<input type="file" id="input_game_detail_video_2"
														name="game_video_file_2"
														accept="video/mp4, video/mkv, video/x-m4v, video/webm">
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>게임 정보 사진</span>
												</div>
												<div class="input_content_div">
													<input type="file" id="input_img_url" name="img_file" accept="image/jpg, image/jpeg, image/png">
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>게임 영상 3번</span>
												</div>
												<div class="input_content_div">
													<input type="file" id="input_game_detail_video_3"
														name="game_video_file_3"
														accept="video/mp4, video/mkv, video/x-m4v, video/webm">
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>게임 정보 사진</span>
												</div>
												<div class="input_content_div">
													<input type="file" id="input_img_url" name="img_file" accept="image/jpg, image/jpeg, image/png">
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>게임 영상 4번</span>
												</div>
												<div class="input_content_div">
													<input type="file" id="input_game_detail_video_4"
														name="game_video_file_4"
														accept="video/mp4, video/mkv, video/x-m4v, video/webm">
												</div>
											</div>
										</div>
									</div>
									<div id="preview_layout_div">
										<div class="input_title_div">
											<span>미리보기</span>
										</div>
										<div id="preview_content">
											<div id="war_content"></div>
											<div id="game_info_title_1"></div>
											<div id="game_info_content_1"></div>
											<div id="game_info_img_1" data-img="${layout.game_info_img_url}">
												<img id="game_info_img" src="${default_img}${layout.game_info_img_url}" alt="game_img">
											</div>
											<div id="game_story_1"></div>
										</div>
									</div>
								</div>
								<div id="des_div" class="input_layer_div">
									<span class="des_span">※ 실제 레이아웃에서는 영상과 이미지가 겹쳐집니다.</span>
									<span class="des_span">※ 미리보기의 배경과 글자색은 달라질 수 있습니다.</span>
									<span class="des_span">※ 실제 레이아웃은 1920px, 1080px 환경에 최적화 되어있습니다.</span>
								</div>
								<div class="input_layer_div">
									<div id="final_btn_div">
										<button type="button" class="btn cancel back">취소</button>
										<button type="submit" class="btn">등록</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<script src="${resource_layout}/js/layout_common.js"></script>
	<script src="${resource_layout}/js/layout_default.js"></script>
</body>
</html>