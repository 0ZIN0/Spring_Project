<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/resources/manager" var="resource"/>
<c:url value="/resources/img/games/rated/" var="rate_img"/>
<c:url value="/resources/img/games/slider" var="game_img" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게임 상세 정보 보기</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/admin_game_detail.css">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp" %>
	
	<main class="background_layer1" data-id="${game.game_id}" data-prePageInfo="${prePageInfo}">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp" %>
			<div id="main_content">
				<div id="account_content">
					<h2 class="content_title">게임 상세 정보</h2>
					<div class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>${game.game_id}번 게임</span>
							</div>
							<div id="layout_btn_wrapper">
								<button id="game_layout_btn" class="btn" data-layout="${game.layout}">상세페이지 설정</button>
								<c:choose>
									<c:when test="${layout_chk eq 1}">
										<span id="layout_check_span" class="layout_check chk">설정됨</span>
									</c:when>
									<c:otherwise>
										<span id="layout_check_span" class="layout_check">미설정</span>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="content_update_wrapper">
								<button id="game_delete_btn" class="btn">삭제</button> 
								<button id="admin_update_btn" class="btn">수정</button>
								<button id="admin_cancel_btn" class="btn cancel">목록으로</button>
							</div>
						</div>
						<div id="content_container_wrapper">
							<div class="item_layer_div item2">
								<div class="item_div">
									<span class="item_span_title">게임명</span>
									<span id="game_title" class="item_span_content">${game.game_name}</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">섬네일 미리보기</span>
									<div class="game_detail_img_div">
										<img src="${pageContext.request.contextPath}/${game.banner_img_url}" alt="${game.game_name}_섬네일">
									</div>
								</div>
							</div>
							<div class="item_layer_div item3">
								<div class="item_div">
									<span class="item_span_title">원가격</span>
									<span class="item_span_content">${game.game_price}원</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">할인율</span>
									<span class="item_span_content">${game.discount}%</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">최종가격</span>
									<span class="item_span_content">${game.discounted_price}원</span>
								</div>
							</div>
							<div class="item_layer_div item3">
								<div class="item_div">
									<span class="item_span_title">장르</span>
									<span class="item_span_content">${game.game_genre}</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">주의표기</span>
									<div id="rate_container">
										<c:forEach items="${rated}" var="rate">
											<div class="rate_div">
												<img src="${rate_img}${rate}.svg" alt="${rate}_이미지"> 
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="item_layer_div item3">
								<div class="item_div">
									<span  class="item_span_title">한국어지원</span>
									<span class="item_span_content">${game.korean}</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">출시일</span>
									<span class="item_span_content">
										<fmt:formatDate value="${game.release_date}" pattern="yyyy년 MM월 dd일"/>	
									</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">지원 플랫폼</span>
									<span class="item_span_content">${game.platform}</span>
								</div>
							</div>
							<div class="item_layer_div item3">
								<div class="item_div">
									<span class="item_span_title">게임모드(싱글/멀티)</span>
									<span class="item_span_content">${game.game_mode}</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">개발사</span>
									<span class="item_span_content">${game.develop_company}</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">별점(5점 기준)</span>
									<div class="stararea_wrapper">
										<div class="stararea">
											<span class="starpoint" style="width: ${100 * game.game_grade/5}%;">
												★★★★★
											</span>
										</div>
										<span>(${game.game_grade})</span>	
									</div>
								</div>
							</div>
							<div class="item_layer_div">
								<div class="item_div">
									<span class="item_span_title">섬네일 경로</span>
									<span class="item_span_content">${game.banner_img_url}</span>
								</div>
							</div>
							<div class="item_layer_div item3">
								<div class="item_div">
									<span class="item_span_title">편집자 추천</span>
									<span class="item_span_content">${game.editor}</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">게임페이지 표시타입</span>
									<span class="item_span_content">
										<c:if test="${game.layout == null}">Default</c:if>
										${game.layout}
									</span>
								</div>
							</div>
						</div>
					</div>
					<h2 class="content_title">게임 이미지 슬라이드 정보</h2>
					<div class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>${game.game_name} 슬라이드</span>
							</div>
							<div class="content_update_wrapper">
								<button id="admin_slide_update_btn" class="btn">등록/수정</button>
							</div>
						</div>
						<div id="img_slide_container_wrapper">
							<div id="img_slide_container">
								<c:forEach items="${images}" var="image" varStatus="status">
									<div class="imgSlides">
										<img class="game_img_selected" alt="${image.image_name}"
											src="${game_img}${image.image_url}">
									</div>
								</c:forEach>
								<div id="demo_img_list">
									<div id="prev-btn" class="img-arrow">
										<span class="material-icons img-arrow-btn">arrow_back_ios</span>
									</div>
									<c:forEach items="${images}" var="image" varStatus="status">
										<div>
											<img data-id="img_${image.image_id}" id="img_${image.image_id}"
												class="demo game_img_dto" alt="${image.image_name}"
												src="${game_img}${image.image_url}"
												onclick="currentSlide(${status.count})">
										</div>
									</c:forEach>
									<div id="next-btn" class="img-arrow">
										<span class="material-icons img-arrow-btn">arrow_forward_ios</span>
									</div>
								</div>
							</div>
							<div id="img_slide_text_container">
								<div id="game_detail_img_div">
									<img id="right_img" alt="${sub_banner.image_name}"
										src="${game_img}${sub_banner.image_url}">
								</div>
								<div id="img_slide_desc_container">
									<span class="desc_text">※ 미리보기 이미지입니다.</span>
									<span class="desc_text">※ 사진은 서브배너 제외 최대 5장까지 등록 가능합니다.</span>
								</div>
							</div>
						</div>
					</div>
					<h2 class="content_title">게임 요구 사항</h2>
					<div class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>${game.game_name} 요구사항</span>
							</div>
							<div class="content_update_wrapper">
								<button id="game_req_update_btn" class="btn">등록/수정</button>
							</div>
						</div>
						<div>
							<c:choose>
								<c:when test="${spec == null}">
									<div class="item_layer_div">
										<div class="item_div">
											<span class="item_span_title">요구사항 등록</span>
											<span class="item_span_content">요구사항이 등록되지 않았습니다. 요구사항을 입력해주세요.</span>
										</div>
									</div>
								</c:when>
								<c:otherwise>
									<div id="req_layer_div">
										<div class="item_div">
											<span class="item_span_title">최저요구사항</span>
											<div class="req_container_wrapper">
												<div class="req_container">
													<span class="req_title">운영체제</span>
													<span class="req_content">${spec.min_os}</span>
												</div>
												<div class="req_container">
													<span class="req_title">프로세서</span>
													<span class="req_content">${spec.min_processor}</span>
												</div>
												<div class="req_container">
													<span class="req_title">메모리</span>
													<span class="req_content">${spec.min_memory}</span>
												</div>
												<div class="req_container">
													<span class="req_title">스토리지</span>
													<span class="req_content">${spec.min_storage}</span>
												</div>
												<div class="req_container">
													<span class="req_title">DirectX</span>
													<span class="req_content">${spec.min_directx}</span>
												</div>
												<div class="req_container">
													<span class="req_title">그래픽카드</span>
													<span class="req_content">${spec.min_graphics_card}</span>
												</div>
												<div class="req_container">
													<span class="req_title">로그인</span>
													<span class="req_content">${spec.login_method}</span>
												</div>
											</div>
										</div>
										<div class="item_div">
											<span class="item_span_title">권장요구사항</span>
											<div class="req_container_wrapper">
												<div class="req_container">
													<span class="req_title">운영체제</span>
													<span class="req_content">${spec.rec_os}</span>
												</div>
												<div class="req_container">
													<span class="req_title">프로세서</span>
													<span class="req_content">${spec.rec_processor}</span>
												</div>
												<div class="req_container">
													<span class="req_title">메모리</span>
													<span class="req_content">${spec.rec_memory}</span>
												</div>
												<div class="req_container">
													<span class="req_title">스토리지</span>
													<span class="req_content">${spec.rec_storage}</span>
												</div>
												<div class="req_container">
													<span class="req_title">DirectX</span>
													<span class="req_content">${spec.rec_directx}</span>
												</div>
												<div class="req_container">
													<span class="req_title">그래픽카드</span>
													<span class="req_content">${spec.rec_graphics_card}</span>
												</div>
											</div>
										</div>
									</div>
								</c:otherwise>
							</c:choose>
						</div>				
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<button id="upward_btn" class="btn">
		<span class="material-icons">vertical_align_top</span>
	</button>
	
	<script src="${resource}/js/admin_game_detail.js"></script>
</body>
</html>