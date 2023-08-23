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

					<ul id="menu_Tab">
						<li class="menu">게임정보</li>
						<li class="menu">게임사양</li>
						<li class="menu">리뷰</li>
					</ul>
					
					<!-- Contents Parts -->
					<div id="contents_Box">
						<div id="warn_text">${layout.warn_content}</div>
						<div id="top_Banner">
							<img alt="MapleStory Top Banner Image" src="${jym_img}${layout.game_top_banner_img}">
						</div>
							<div id="Main_Contents">
								<div id="cont_Video1">
									<video class="cont_Video_effect1" src="${jym_img}${layout.game_cont_video_1}" controls></video>
								</div>
								<div id="cont_Box1" class="cont_Common_Effect">
									<div class="cont_img1">
										<img alt="MapleStory Cont Image1" src="${jym_img}${layout.game_cont_img_1}">
									</div>
									<div class="cont_text1">
										<div class="main_text">${layout.game_main_text_1}</div>
										<div class="sub_text">${layout.game_sub_text_1}</div>
									</div>
								</div>
								<div id="cont_Box2">
									<div class="cont_Effect1"></div>
									<div class="cont_text2">
										<div class="main_text">${layout.game_main_text_2}</div>
										<div class="sub_text">${layout.game_sub_text_2}</div>
									</div>
									<div class="cont_img2"><img alt="MapleStory Cont Image2" src="${jym_img}${layout.game_cont_img_2}"></div>
								</div>
								<div id="cont_Box3" class="cont_Common_Effect">
									<div class="cont_img3"><img alt="MapleStory Cont Image3" src="${jym_img}${layout.game_cont_img_3}"></div>
									<div class="cont_text3">
										<div class="main_text">${layout.game_main_text_3}</div>
										<div class="sub_text">${layout.game_sub_text_3}</div>
									</div>
								</div>
								<div id="cont_Box4" class="cont_Common_Effect">
									<div class="cont_img4"><img alt="MapleStory Cont Image4" src="${jym_img}${layout.game_cont_img_4}"></div>
									<div class="cont_text4">
										<div class="main_text">${layout.game_main_text_4}</div>
										<div class="sub_text">${layout.game_sub_text_4}</div>
									</div>
								</div>
								<div id="cont_Box5">
									<div class="cont_Effect1"></div>
									<div class="cont_text5">
										<div class="main_text">${layout.game_main_text_5}</div>
										<div class="sub_text">${layout.game_sub_text_5}</div>
									</div>
									<div class="cont_img5"><img alt="MapleStory Cont Image5" src="${jym_img}${layout.game_cont_img_5}"></div>
								</div>
							</div> <!-- Main_Contents Parts End -->
						<div id="bottom_Banner">
							<img alt="MapleStory Bottom Banner Image" src="${jym_img}${layout.game_bottom_banner_img}"></div>
					</div> <!-- Contents_Box Parts End -->
				</div><!-- Main-Container Parts End -->
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	<script src="${detail_common_js}"></script>
</body>
</html>