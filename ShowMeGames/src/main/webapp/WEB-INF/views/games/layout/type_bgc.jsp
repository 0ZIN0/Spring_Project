<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- common url settings 각자 디테일 페이지에 추가해야함 -->
<c:url value="/resources/games/css/detail_common.css" var="detail_common_css" />
<c:url value="/resources/games/js/detail_common.js" var="detail_common_js" />
<c:url value="/resources/games/css/type_bgc.css" var="type_bgc_css" />
<c:url value="/resources/games/js/type_bgc.js" var="type_bgc_js" />
<c:url value="/resources/img/games/layout/bgc/" var="bgc_img"/>
<c:url value="/resources/img/games/slider/gicheol/" var="img_path"/>
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
<link rel="stylesheet" href="${type_bgc_css}">
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
				<!-- 레이아웃 -->
				<div id="warn_content">${layout.warn_content}</div>		
				<div class='contents-wrap'>
					<div class="video_img">
					 	<img id="main_img" src="${bgc_img}${layout.game_img1}" alt="image" />						
						<video  class="video" loop>
							<source src="${bgc_img}${layout.game_video1}" type="video/webm"></source>
						</video>						
					</div>
				</div>				
				<div class='contents-wrap'>
					<div class="video_img">
						<img id="main_img" src="${bgc_img}${layout.game_img2}" alt="image" />
						<video  class="video" loop>
							<source src="${bgc_img}${layout.game_video2}" type="video/webm"></source>
						</video>						
					</div>
				</div>				
				<div class='contents-wrap'>
					<div class="video_img">
						<img id="main_img" src="${bgc_img}${layout.game_img3}" alt="image" />							
						<video  class="video" loop>
							<source src="${bgc_img}${layout.game_video3}" type="video/webm"></source>
						</video>								
					</div>
				</div>				
				<div class='contents-wrap'>
					<div class="video_img">						
						<img id="main_img" src="${bgc_img}${layout.game_img4}" alt="image" />
						<video  class="video" loop>
							<source src="${bgc_img}${layout.game_video4}" type="video/webm"></source>
						</video>																
					</div>
				</div>
				
				<!-- 리뷰 -->
				<div class="contents_review">
				<%@ include file="/WEB-INF/views/games/include/review.jsp" %>	
				</div>
				<!-- 시스템 사양 -->
				<div class="specifications">
					<div style="color:#c0c0c0; border-bottom:solid 3px #c0c0c0;"><h2>시스템 사양</h2></div>
					<div class="specs">
						<div>
							<span class="span1">최소</span>
							<span class="span2"></span>					
						</div>
						<div>
							<span class="span1">권장</span>
							<span class="span2"></span>
						</div>
					</div>					
					<div class="specs">
						<div>
							<span class="span1">운영체제</span>
							<span class="span2">${spec.min_os}</span>
						</div>
						<div>
							<span class="span1">운영체제</span>
							<span class="span2">${spec.rec_os}</span>
						</div>
					</div>
					<div class="specs">
						<div>
							<span class="span1">프로세서</span>
							<span class="span2">${spec.min_processor}</span>
						</div>
						<div>
							<span class="span1">프로세서</span>
							<span class="span2">${spec.rec_processor}</span>
						</div>
					</div>
					<div class="specs">
						<div>
							<span class="span1">메모리</span>
							<span class="span2">${spec.min_memory}</span>
						</div>
						<div>
							<span class="span1">메모리</span>
							<span class="span2">${spec.rec_memory}</span>
						</div>
					</div>
					<div class="specs">
						<div>
							<span class="span1">스토리지</span>
							<span class="span2">${spec.min_storage}</span>
						</div>
						<div>
							<span class="span1">스토리지</span>
							<span class="span2">${spec.rec_storage}</span>
						</div>
					</div>
					<div class="specs">
						<div>
							<span class="span1">그래픽 카드</span>
							<span class="span2">${spec.min_graphics_card}</span>
						</div>
						<div>
							<span class="span1">그래픽 카드</span>
							<span class="span2">${spec.rec_graphics_card}</span>
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
	<script src="${type_bgc_js}"></script>
	<!-- review js -->
	<script src="${resource}/js/review.js"></script>
	
</body>
</html>