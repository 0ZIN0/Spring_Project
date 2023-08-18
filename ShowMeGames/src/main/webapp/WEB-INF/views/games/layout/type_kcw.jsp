<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- common url settings 각자 디테일 페이지에 추가해야함 -->
<c:url value="/resources/games/css/detail_common.css"
	var="detail_common_css" />
<c:url value="/resources/games/js/detail_common.js"
	var="detail_common_js" />
<c:url value="/resources/layout/kcw/layout_kcw.css"
	var="layout_kcw_css" />
<c:url value="/resources/layout/kcw/layout_kcw.js"
	var="layout_kcw_js" />
<c:url value="/resources/img/games/layout/kcw/" var="img" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${game.game_name}</title>
<!-- header, footer css -->
<%@ include file="/WEB-INF/views/include/link/common.jsp"%>
<!-- common css 각자 디테일 페이지에 추가해야함 -->
<link rel="stylesheet" href="${detail_common_css}">
<link rel="stylesheet" href="${layout_kcw_css }" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	<main class="background_layer1">
		<div class="background_layer2">
			<div id="game_detail_div">
				<%@ include file="/WEB-INF/views/games/include/detail_top.jsp"%>
			</div>
			<hr />
		<div class="detail_div">
			<div class="overflow first">
				<img src="${img }${game.game_id }/${layout.game_img_1}" alt="" />
			</div>
			<div class="overflow second">
				<img src="${img }${game.game_id}/${layout.game_img_2}" alt="" />
				<div class="detail_text">
					${layout.text_1 }
				</div>
			</div>
			<div class="overflow third">
				<img src="${img }${game.game_id}/${layout.game_img_3}" alt="" />
				<div class="detail_text">
					${layout.text_2 }
				</div>
			</div>
			<div class="overflow forth">
				<img src="${img }${game.game_id}/${layout.game_img_4}" alt="" />
				<div class="detail_text">
					${layout.text_3 }
				</div>
			</div>
		</div>
		<div class="spec">
				<img src="${img }${game.game_id}/${layout.game_img_5}" alt="" />
				<div class="detail_text">
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
				</div>
			</div>		
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	<script src="${detail_common_js}"></script>
	<script src="${layout_kcw_js }"></script>
</body>
</html>