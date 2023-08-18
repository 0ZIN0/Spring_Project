<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:url value="/resources/games" var="resource" />
<c:url value="/resources/img/games/layout/hgt/" var="hgt_img"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>${game.game_name}</title>
	<!-- header, footer css -->
	<%@ include file="/WEB-INF/views/include/link/common.jsp"%>
	<!-- Google icon filled -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons"rel="stylesheet">
	<!-- common css 각자 디테일 페이지에 추가해야함 -->
	<link rel="stylesheet" href="${resource}/css/detail_common.css">
	<!-- review css -->
	<link rel="stylesheet" href="${resource}/css/review.css">
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/layout/type_hgt.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	<main class="background_layer1">
		<div class="background_layer2">
			<div id="game_detail_div">
				<%@ include file="/WEB-INF/views/games/include/detail_top.jsp"%>
				<div id="game_detail_content_wrapper">
					<div id="system_detail_wrapper">
						<button id="system_detail_btn">
							시스템 요구사항<span id="dropdown_icon" class="material-icons">arrow_drop_down</span>
						</button>
						<div id="system_dropdown_wrapper">
							<div id="system_detail_container">
								<div class="system_item_container">
									<div class="system_item_layer">
										<span class="system_item_title">최소</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">운영체제</span> <span
											class="system_item_content">${spec.min_os}</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">프로세서</span> <span
											class="system_item_content">${spec.min_processor}</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">메모리</span> <span
											class="system_item_content">${spec.min_memory}</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">스토리지</span> <span
											class="system_item_content">${spec.min_storage}</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">DirectX</span> <span
											class="system_item_content">${spec.min_directx}</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">그래픽카드</span> <span
											class="system_item_content">${spec.min_graphics_card}</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">로그인</span> <span
											class="system_item_content">${spec.login_method}</span>
									</div>
								</div>
								<div class="system_item_container">
									<div class="system_item_layer">
										<span class="system_item_title">권장</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">운영체제</span> <span
											class="system_item_content">${spec.rec_os}</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">프로세서</span> <span
											class="system_item_content">${spec.rec_processor}</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">메모리</span> <span
											class="system_item_content">${spec.rec_memory}</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">스토리지</span> <span
											class="system_item_content">${spec.rec_storage}</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">DirectX</span> <span
											class="system_item_content">${spec.rec_directx}</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">그래픽카드</span> <span
											class="system_item_content">${spec.rec_graphics_card}</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="game_detail_content">
						<div id="warn_content">${layout.warn_content}</div>
						<div id="detail_img_1">
							<img src="${hgt_img}${layout.game_img_1}"
								alt="${layout.game_id}_1_이미지">
						</div>
						<div id="detail_main_title" class="desc_text">
							${layout.game_main_title}</div>
						<div id="detail_main_text" class="desc_text">
							${layout.game_main_text}</div>
						<div id="detail_img_2">
							<img src="${hgt_img}${layout.game_img_2}"
								alt="${layout.game_id}_2_이미지">
						</div>
						<div id="detail_sub_title" class="desc_text">
							${layout.game_sub_title}</div>
						<div id="detail_sub_text" class="desc_text">
							${layout.game_sub_text}</div>
						<div id="detail_img_3">
							<img src="${hgt_img}${layout.game_img_3}"
								alt="${layout.game_id}_3_이미지">
						</div>
						<div id="detail_story_title" class="desc_text">
							${layout.game_story_title}</div>
						<div id="detail_story_text" class="desc_text">
							${layout.game_story_text}</div>
					</div>
				</div>
				<!-- 리뷰 -->
				<%@ include file="/WEB-INF/views/games/include/review.jsp" %>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	<script src="${resource}/js/detail_common.js"></script>
	<!-- review js -->
	<script src="${resource}/js/review.js"></script>
	<script src="${resource}/js/type_hgt.js"></script>
</body>
</html>