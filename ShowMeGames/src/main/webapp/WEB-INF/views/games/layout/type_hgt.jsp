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
	<link rel="stylesheet" href="${resource}/css/type_hgt.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	<main class="background_layer1">
		<div class="background_layer2">
			<div id="game_detail_div">
				<%@ include file="/WEB-INF/views/games/include/detail_top.jsp"%>
				
				<div id="game_detail_content_wrapper">
					<div id="system_detail_wrapper">
						<button id="system_detail_btn">시스템 요구사항<span id="dropdown_icon" class="material-icons">arrow_drop_down</span></button>
						<div id="system_dropdown_wrapper">
							<div id="system_detail_container">
								<div class="system_item_container">
									<div class="system_item_layer">
										<span class="system_item_title">최소</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">운영체제</span>
										<span class="system_item_content">Windows </span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">프로세서</span>
										<span class="system_item_content">4690k</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">메모리</span>
										<span class="system_item_content">8GB</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">스토리지</span>
										<span class="system_item_content">12GB</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">DirectX</span>
										<span class="system_item_content">11</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">그래픽카드</span>
										<span class="system_item_content">GTX 1050 Ti(4GB VRAM)</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">로그인</span>
										<span class="system_item_content">GTX 1050 Ti(4GB VRAM)</span>
									</div>
								</div>
								<div class="system_item_container">
									<div class="system_item_layer">
										<span class="system_item_title">권장</span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">운영체제</span>
										<span class="system_item_content"></span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">프로세서</span>
										<span class="system_item_content"></span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">메모리</span>
										<span class="system_item_content"></span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">스토리지</span>
										<span class="system_item_content"></span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">DirectX</span>
										<span class="system_item_content"></span>
									</div>
									<div class="system_item_layer">
										<span class="system_item_title">그래픽카드</span>
										<span class="system_item_content"></span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div id="game_detail_content">
						<div id="warn_content"></div>
						<div id="detail_img_1">
							<img src="${hgt_img}1016/1016_1.gif" alt="1016_1_이미지">
						</div>
						<div id="detail_main_title" class="desc_text">
							미지를 탐험하세요!
						</div>
						<div id="detail_main_text" class="desc_text">
							자원을 찾아 행성을 개발하고 생존하기에 충분한 기술을 개발하세요! <br>
							당신은 항상 배고프고, 부족하고, 피곤한 상태에 놓일 것입니다.
						</div>
						<div id="detail_img_2">
							<img src="${hgt_img}1016/1016_2.gif" alt="1016_2_이미지">
						</div>
						<div id="detail_sub_title" class="desc_text">
							자원을 적절히 활용하세요!
						</div>
						<div id="detail_sub_text" class="desc_text">
							기체, 고체, 액체로 이루어진 다양한 자원들이 당신을 기다립니다.
						</div>
						<div id="detail_img_3">
							<img src="${hgt_img}1016/1016_3.gif" alt="1016_3_이미지">
						</div>
						<div id="detail_story_title" class="desc_text">
							미지의 미개발 행성에 불시착한 듀플리칸트들의 생존을 도모해보세요.
						</div>
						<div id="detail_story_text" class="desc_text">
							당신은 안전하지 않습니다
						</div>
					</div>		
				</div>

			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	<script src="${resource}/js/detail_common.js"></script>
	<script src="${resource}/js/type_hgt.js"></script>
</body>
</html>