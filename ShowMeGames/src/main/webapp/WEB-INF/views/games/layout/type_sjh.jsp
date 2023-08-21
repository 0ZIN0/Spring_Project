<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- common url settings 각자 디테일 페이지에 추가해야함 -->
<c:url value="/resources/games/css/detail_common.css"
 	var="detail_common_css" />
<c:url value="/resources/games/css/layout/type_sjh.css" var="sjh_css" />
<c:url value="/resources/games/js/detail_common.js"
	var="detail_common_js" />
<c:url value="/resources/img/games" var="game_img" />
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
<link rel="stylesheet" href="${sjh_css}">

<link rel="stylesheet" href="${resource}/css/review.css">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	<main class="background_layer1">
		<div class="background_layer2">
			<div id="game_detail_div">
				<%@ include file="/WEB-INF/views/games/include/detail_top.jsp"%>
				<!-- 아래부터는 free layout -->
				<!-- <div class="game_detail_divs" id="game_detail_spec_div"> -->
				
				<div class="separator_div"></div>
				
				<div class="game_detail_divs">


			
			<!-- 디테일 -->
						<%-- <div class="game_detail_divs" id="game_detail_info_div">
							<div id="war-content">${layout.title}</div>
							<div id="game-main-title-1" class="game-info-title">
								${layout.content}
							</div>		
						</div>		 --%>
						<div class="game_detail_title">${layout.title}</div>
						<div class="game_detail_content">${layout.content}</div>
				
				
			<div class="separator_div"></div>
			<!-- 리뷰 -->
						<%@ include file="/WEB-INF/views/games/include/review.jsp" %>
				
			<div class="separator_div"></div>	
			<!-- 사양 -->				
						<div id="game_spec_title">시스템 사양 정보</div>
						<div id="game_spec_grid">
							<div id="game_spec_min">
								<div class="spec_sub_title">최소</div>
							</div>
							<div id="game_spec_rev">
								<div class="spec_sub_title">권장</div>
							</div>
							<div>
								<div class="spec_sub_title">운영체제</div>
								<div class="spec_content">${spec.min_os }</div>
							</div>
							<div>
								<div class="spec_sub_title">운영체제</div>
								<div class="spec_content">${spec.rec_os }</div>
							</div>
							<div>
								<div class="spec_sub_title">프로세서</div>
								<div class="spec_content">${spec.min_processor }</div>
							</div>
							<div>
								<div class="spec_sub_title">프로세서</div>
								<div class="spec_content">${spec.rec_processor }</div>
							</div>
							<div>
								<div class="spec_sub_title">메모리</div>
								<div class="spec_content">${spec.min_memory }</div>
							</div>
							<div>
								<div class="spec_sub_title">메모리</div>
								<div class="spec_content">${spec.rec_memory }</div>
							</div>
							<div>
								<div class="spec_sub_title">스토리지</div>
								<div class="spec_content">${spec.min_storage }</div>
							</div>
							<div>
								<div class="spec_sub_title">스토리지</div>
								<div class="spec_content">${spec.rec_storage }</div>
							</div>
							<div>
								<div class="spec_sub_title">DirectX</div>
								<div class="spec_content">${spec.min_directx }</div>
							</div>
							<div>
								<div class="spec_sub_title">DirectX</div>
								<div class="spec_content">${spec.rec_directx }</div>
							</div>
							<div>
								<div class="spec_sub_title">그래픽 카드</div>
								<div class="spec_content">${spec.min_graphics_card }</div>
							</div>
							<div>
								<div class="spec_sub_title">그래픽 카드</div>
								<div class="spec_content">${spec.rec_graphics_card }</div>
							</div>
							<div>
								<div class="spec_sub_title">로그인</div>
								<div class="spec_content">${spec.login_method }</div>
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
	<script src="${resource}/js/review.js"></script>
</body>
</html>