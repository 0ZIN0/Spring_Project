<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/manager" var="resource"/>
<c:url value="/resources/img/games/slider" var="game_img" />    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게임 슬라이드 이미지 등록/수정</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/admin_game_slide_update.css">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp" %>
	
	<main class="background_layer1" data-id="${game_id}">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp" %>
			<div id="main_content">
				<div>
					<h2 class="content_title">게임 슬라이드 이미지 등록/수정</h2>
					<div class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>${game_id}번 게임 슬라이드 이미지 등록/수정</span>
							</div>
							<div class="content_update_wrapper">
								<button class="btn cancel">뒤로가기</button>
							</div>
						</div>
						<div id="img_container_wrapper">
							<c:forEach items="${images}" var="img" varStatus="status">
								<div class="img_container">
									<span class="item_span_title">
										<c:choose>
											<c:when test="${status.index eq 0}">메인배너</c:when>
											<c:otherwise>${status.index}번사진</c:otherwise>
										</c:choose>
									</span>
									<div class="img_wrapper">
										<span id="none_icon${status.index}" class="material-icons none_icon" data-id="${img.image_id}">image_not_supported</span>
										<img id="slide_img_preview${status.index}" class="slide_img" src="${game_img}${img.image_url}" alt="${game_id}_${status.index}_img" data-id="${img.image_id}" />
									</div>
								</div>
							</c:forEach>
						</div>
						<div id="slide_img_select_div">
							<c:forEach begin="0" end="4" varStatus="status" step="1">
								<div class="filebox_wrapper">
									<div class="filebox_title">
										<span>
											<c:choose>
												<c:when test="${status.index eq 0}">
													메인배너 파일선택
												</c:when>
												<c:otherwise>
													${status.index}번 이미지 파일선택
												</c:otherwise>
											</c:choose>
										</span>
									</div>
									<div class="filebox">
									    <label for="slide_file${status.index}">파일찾기</label> 
									    <input id="slide_img_file_name${status.index}" class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
									    <input type="file" id="slide_file${status.index}" name="slide_file${status.index}" accept="image/jpg, image/jpeg, image/png, image/gif, image/webp" form="form_slide">
									</div>
								</div>
							</c:forEach>
						</div>
						<div class="input_layer_div">
							<div class="final_btn_div">
								<button class="btn cancel">뒤로가기</button>
								<button id="form_slide_btn" type="submit" class="btn" form="form_slide" disabled>등록/수정</button>
							</div>
						</div>
						<form id="form_slide" action="./admin_game_slide" method="POST" enctype="multipart/form-data">
							<input type="hidden" name="game_id" value="${game_id}"/>
						</form>
					</div>
					<h2 class="content_title">게임 서브배너 이미지 등록/수정</h2>
					<div class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>${game_id}번 서브배너 이미지 등록/수정</span>
							</div>
						</div>
						<div id="sub_banner_select_div">
							<div>
								<div id="img_select_div_inner">
									<span id="none_icon_sub_banner" class="material-icons none_icon" data-id="${sub_banner.image_id}">image_not_supported</span>
									<img id="sub_img_preview" class="slide_img" src="${game_img}${sub_banner.image_url}" alt="프로필사진" data-id="${sub_banner.image_id}">
								</div>
							</div>
							<div>
								<div class="filebox">
								    <label for="sub_img_file">파일찾기</label> 
								    <input id="sub_img_file_name" class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
								    <input type="file" id="sub_img_file" name="sub_img_file" accept="image/jpg, image/jpeg, image/png, image/gif, image/webp" form="form_sub_banner">
								</div>
							</div>
						</div>
						<div class="input_layer_div">
							<div class="final_btn_div">
								<button class="btn cancel">뒤로가기</button>
								<button id="form_sub_banner_btn" type="submit" class="btn" form="form_sub_banner" disabled>등록/수정</button>
							</div>
						</div>
						<form id="form_sub_banner" action="./admin_sub_banner_set" method="POST" enctype="multipart/form-data">
							<input type="hidden" name="game_id" value="${game_id}"/>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<script src="${resource}/js/admin_game_slide_update.js"></script>
</body>
</html>