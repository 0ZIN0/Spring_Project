<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- common url settings 각자 디테일 페이지에 추가해야함 -->
<c:url value="/resources/games/css/detail_common.css" var="detail_common_css" />
<c:url value="/resources/games/js/detail_common.js" var="detail_common_js" />

<!-- JYM resources -->
<c:url value="/resources/games/css/layout/type_jym.css" var="jym_css" />
<c:url value="/resources/games/js/layout/type_jym.js" var="jym_js" />
<c:url value="/resources/img/games/layout/jym/" var="jym_img" />
<!--  temp  -->
<c:url value="/resources/img/games/slider" var="game_img" />
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
<link rel="stylesheet" href="${jym_css}">
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
				<div id="mainContainer">
				
					<div id="tabs">
					    <button class="tabBtns" data-tab="gameInfo">게임정보</button>
					    <button class="tabBtns" data-tab="gameSpec">게임사양</button>
					    <button class="tabBtns" data-tab="reviews">리뷰</button>
					</div>
					
					<!-- Contents Parts -->
					<div id="gameInfoContent contents_Box" class="tabContent">
						<div id="warn_text">${layout.warn_content}</div>
						<div id="top_Banner">
							<img alt="MapleStory Top Banner Image" src="${jym_img}${layout.game_top_banner_img}">
						</div>
							<div id="main_Contents">
								<div id="cont_Video1">
									<video class="cont_Video_effect1" src="${jym_img}${layout.game_cont_video_1}" controls></video>
								</div>
								<div id="cont_Box1" class="cont_Common_Effect">
									<div class="cont_img1">
										<img alt="MapleStory Cont Image1" src="${jym_img}${layout.game_cont_img_1}">
									</div>
									<div class="cont_text1">
										<div class="main_text1">${layout.game_main_text_1}</div>
										<div class="sub_text1">${layout.game_sub_text_1}</div>
									</div>
								</div>
								<div id="cont_Box2">
									<div class="cont_Effect1"></div>
									<div class="cont_text2">
										<div class="main_text2">${layout.game_main_text_2}</div>
										<div class="sub_text2">${layout.game_sub_text_2}</div>
									</div>
									<div class="cont_img2"><img alt="MapleStory Cont Image2" src="${jym_img}${layout.game_cont_img_2}"></div>
								</div>
								<div id="cont_Box3" class="cont_Common_Effect">
									<div id="cont_img3" class="cont_Common_Img_Effect"><img alt="MapleStory Cont Image3" src="${jym_img}${layout.game_cont_img_3}"></div>
									<div id="cont_text3" class="cont_Common_text_Effect">
										<div class="main_text3 main_text_common">${layout.game_main_text_3}</div>
										<div class="sub_text3 sub_text_common	">${layout.game_sub_text_3}</div>
									</div>
								</div>
								<div id="cont_Box4" class="cont_Common_Effect">
									<div id="cont_img4" class="cont_Common_Img_Effect"><img alt="MapleStory Cont Image4" src="${jym_img}${layout.game_cont_img_4}"></div>
									<div id="cont_text4" class="cont_Common_text_Effect">
										<div class="main_text4 main_text_common">${layout.game_main_text_4}</div>
										<div class="sub_text4 sub_text_common">${layout.game_sub_text_4}</div>
									</div>
								</div>
								<div id="cont_Box5">
									<div class="cont_Effect1"></div>
									<div class="cont_text5">
										<div class="main_text5">${layout.game_main_text_5}</div>
										<div class="sub_text5">${layout.game_sub_text_5}</div>
									</div>
									<div class="cont_img5"><img alt="MapleStory Cont Image5" src="${jym_img}${layout.game_cont_img_5}"></div>
								</div>
							</div> <!-- Main_Contents Parts End -->
						<div id="bottom_Banner">
							<img alt="MapleStory Bottom Banner Image" src="${jym_img}${layout.game_bottom_banner_img}">
						</div>
					</div> <!-- Contents_Box Parts End -->
						
						<!-- 리뷰 -->
						<%@ include file="/WEB-INF/views/games/include/review.jsp" %>
						
						<!-- 시스템 요구사항 -->
						<div id="gameSpecContent" class="tabContent">
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
								컨텐츠 추가와 업데이트로 인한 변경 사항이 있을 수 있습니다.
							</div>
						</div>
				</div><!-- Main-Container Parts End -->
			</div> <!-- ㅎ -->
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	<script src="${detail_common_js}"></script>
	<script src="${jym_js}"></script>
	
	<!-- review js -->
	<script src="${resource}/js/review.js"></script>
</body>
</html>