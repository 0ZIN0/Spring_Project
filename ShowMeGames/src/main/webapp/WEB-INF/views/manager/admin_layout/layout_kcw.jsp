<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/manager" var="resource" />
<c:url value="/resources/manager/admin_layout" var="resource_layout" />
<c:url value="/resources/img/games/layout/kcw/" var="kcw_img" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>기본 레이아웃 설정</title>
<%@ include file="/WEB-INF/views/manager/include/head_common.jsp"%>
<!-- layout_common css -->
<link rel="stylesheet" href="${resource_layout}/css/layout_common.css">
<!-- page css -->
<link rel="stylesheet" href="${resource_layout}/css/layout_kcw.css">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp"%>

	<main class="background_layer1" data-id="${game_id}">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp"%>
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
							<form id="form_layout" action="./layout_update_kcw" method="POST"
								enctype="multipart/form-data">
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
													<input id="input_warn_content" type="text"
														name="warn_content" value="${layout.warn_content}" />
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>게임 첫번째 사진</span>
												</div>
												<div class="input_content_div">
													<input type="file" id="input_game_img_1"
														name="game_img_file_1"
														accept="image/jpg, image/jpeg, image/png, image/gif">
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>게임 두번째 사진</span>
												</div>
												<div class="input_content_div">
													<input type="file" id="input_game_img_2"
														name="game_img_file_2"
														accept="image/jpg, image/jpeg, image/png, image/gif">
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>텍스트 1</span>
												</div>
												<div class="input_content_div">
													<textarea id="input_game_main_text" name="game_main_text"
														class="textarea-custom">${layout.text_1}</textarea>
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>게임 세번째 사진</span>
												</div>
												<div class="input_content_div">
													<input type="file" id="input_game_img_2"
														name="game_img_file_2"
														accept="image/jpg, image/jpeg, image/png, image/gif">
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>텍스트 2</span>
												</div>
												<div class="input_content_div">
													<textarea id="input_game_sub_title" name="game_sub_title"
														class="textarea-custom">${layout.text_2}</textarea>
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>게임 네번째 사진</span>
												</div>
												<div class="input_content_div">
													<input type="file" id="input_game_img_2"
														name="game_img_file_2"
														accept="image/jpg, image/jpeg, image/png, image/gif">
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>텍스트 3</span>
												</div>
												<div class="input_content_div">
													<textarea id="input_game_sub_text" name="game_sub_text"
														class="textarea-custom">${layout.text_3}</textarea>
												</div>
											</div>
										</div>
										<div class="input_layer_div">
											<div class="input_container_div large">
												<div class="input_title_div">
													<span>게임 다섯번째 사진</span>
												</div>
												<div class="input_content_div">
													<input type="file" id="input_game_img_3"
														name="game_img_file_3"
														accept="image/jpg, image/jpeg, image/png, image/gif">
												</div>
											</div>
										</div>
									</div>
									<div id="preview_layout_div">
										<div class="input_title_div">
											<span>미리보기</span>
										</div>
										<div id="preview_content">
											<div id="warn_content">${layout.warn_content}</div>

											<div class="detail_div">
												<div id="game_img_div_1" class="overflow first" data-img="${layout.game_img_1}">
													<img id="game_img_1" src="${kcw_img }${game_id }/${layout.game_img_1}"
														alt="" />
												</div>
												<div id="game_img_div_2" class="overflow second" data-img="${layout.game_img_2}">
													<img id="game_img_2" src="${kcw_img }${game_id}/${layout.game_img_2}"
														alt="" />
													<div id="game_main_text" class="detail_text">${layout.text_1 }</div>
												</div>
												<div id="game_img_div_3" class="overflow third" data-img="${layout.game_img_3}">
													<img id="game_img_4" src="${kcw_img }${game_id}/${layout.game_img_3}"
														alt="" />
													<div id="game_sub_title" class="detail_text">${layout.text_2 }</div>
												</div>
												<div id="game_img_div_4" class="overflow forth" data-img="${layout.game_img_4}">
													<img id="game_img_4" src="${kcw_img }${game_id}/${layout.game_img_4}"
														alt="" />
													<div id="game_sub_text" class="detail_text">${layout.text_3 }</div>
												</div>
											</div>
											<div id="game_img_div_5" class="spec" data-img="${layout.game_img_5}">
												<img id="game_img_5" src="${kcw_img }${game_id}/${layout.game_img_5}" alt="" />
											</div>
										</div>
									</div>
								</div>
								<div id="des_div" class="input_layer_div">
									<span class="des_span">※ 미리보기의 배경과 글자색은 달라질 수 있습니다.</span> <span
										class="des_span">※ 실제 레이아웃은 1920px, 1080px 환경에 최적화
										되어있습니다.</span> <span class="des_span">※ 사용가능한 이미지 확장자는 "jpg",
										"jpeg", "png", "gif" 입니다.</span>
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
	<script src="${resource_layout}/js/layout_hgt.js"></script>
</body>
</html>