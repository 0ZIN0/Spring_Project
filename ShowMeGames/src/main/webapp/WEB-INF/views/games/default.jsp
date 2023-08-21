<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- common url settings 각자 디테일 페이지에 추가해야함 -->
<c:url value="/resources/games/css/detail_common.css" var="detail_common_css" />
<c:url value="/resources/games/js/detail_common.js" var="detail_common_js" />
<c:url value="/resources/img/games/layout/default/" var="detail_img" />
<!-- default resources -->
<c:url value="/resources/games/css/default.css" var="default_css" />
<c:url value="/resources/games/js/default.js" var="default_js" />
<c:url value="/resources/games" var="resource" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${game.game_name}</title>
<!-- header, footer css -->
<%@ include file="/WEB-INF/views/include/link/common.jsp"%>
<!-- common css 각자 디테일 페이지에 추가해야함 -->
<link rel="stylesheet" href="${detail_common_css}">
<!-- default css -->
<link rel="stylesheet" href="${default_css}">
<!-- review css -->
<link rel="stylesheet" href="${resource}/css/review.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	<main class="background_layer1">
		<div class="background_layer2">
			<div id="game_detail_div">
				<%@ include file="/WEB-INF/views/games/include/detail_top.jsp"%>
				<!-- 아래부터는 free layout -->
				<div id="game_bottom_div">
					<div id="game_detail_tab">
						<div id="tab_game_info_div" class="detail_tab tab_selected">게임정보</div>
						<div id="tab_game_comment_div"
							class="detail_tab tab_border_bottom">리뷰</div>
						<div id="tab_game_req_div" class="detail_tab tab_border_bottom">시스템
							요구사항</div>
						<div id="tab_blank"></div>
					</div>
					<!-- detail div list -->
					<div id="game_detail_div_list">
						<!-- 게임정보 DIV -->
						<div class="game_detail_divs" id="game_detail_info_div">
							<c:if test="${layout.game_id eq null}">
								<p id="none_layout_desc">
									※ 상세 페이지가 아직 준비 되지 않았습니다.
								</p>
							</c:if>
							<div id="war-content">${layout.warn_content}</div>
							<div id="game-info-title-1">
								${layout.game_info_title }
							</div>
							<div id="game-info-content-1">
								${layout.game_info_content }
							</div>
							<div id="game-info-img-1">
								<c:if test="${layout.game_info_img_url ne null}">
									<img class="game-info-img" alt="${images[0].image_name}"
										src="${detail_img }${layout.game_info_img_url}">
								</c:if>
							</div>
							<div id="game-story-1">
								${layout.game_story }
							</div>
						</div>
						<!-- 리뷰 -->
						<%@ include file="/WEB-INF/views/games/include/review.jsp" %>
						<!-- 시스템 요구사항 -->
						<div class="game_detail_divs" id="game_detail_req_div">
							<div id="game_req_title">사양</div>
							<div id="game_req_grid">
								<div id="game_req_min">
									<div class="req_sub_title">최소</div>
								</div>
								<div id="game_req_rev">
									<div class="req_sub_title">권장</div>
								</div>
								<div>
									<div class="req_sub_title">운영체제</div>
									<div class="req_content">${spec.min_os }</div>
								</div>
								<div>
									<div class="req_sub_title">운영체제</div>
									<div class="req_content">${spec.rec_os }</div>
								</div>
								<div>
									<div class="req_sub_title">프로세서</div>
									<div class="req_content">${spec.min_processor }</div>
								</div>
								<div>
									<div class="req_sub_title">프로세서</div>
									<div class="req_content">${spec.rec_processor }</div>
								</div>
								<div>
									<div class="req_sub_title">메모리</div>
									<div class="req_content">${spec.min_memory }</div>
								</div>
								<div>
									<div class="req_sub_title">메모리</div>
									<div class="req_content">${spec.rec_memory }</div>
								</div>
								<div>
									<div class="req_sub_title">스토리지</div>
									<div class="req_content">${spec.min_storage }</div>
								</div>
								<div>
									<div class="req_sub_title">스토리지</div>
									<div class="req_content">${spec.rec_storage }</div>
								</div>
								<div>
									<div class="req_sub_title">DirectX</div>
									<div class="req_content">${spec.min_directx }</div>
								</div>
								<div>
									<div class="req_sub_title">DirectX</div>
									<div class="req_content">${spec.rec_directx }</div>
								</div>
								<div>
									<div class="req_sub_title">그래픽 카드</div>
									<div class="req_content">${spec.min_graphics_card }</div>
								</div>
								<div>
									<div class="req_sub_title">그래픽 카드</div>
									<div class="req_content">${spec.rec_graphics_card }</div>
								</div>
								<div>
									<div class="req_sub_title">로그인</div>
									<div class="req_content">${spec.login_method }</div>
								</div>
							</div>
							<div id="req_bottom_content">※ 시스템 요구 사항은 출시 버전을 기준으로 하며,
								컨텐츠 추가와 업데이트로 인한 변경 사항이 있을 수 있습니다.</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	<script src="${detail_common_js}"></script>
	<script src="${default_js}"></script>
	
	<!-- review js -->
	<script src="${resource}/js/review.js"></script>
</body>
</html>