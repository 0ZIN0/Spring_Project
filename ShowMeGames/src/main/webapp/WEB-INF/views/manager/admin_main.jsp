<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/manager" var="resource"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>메인페이지</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- manager main css -->
	<link rel="stylesheet" href="${resource}/css/admin_main.css">
</head>
<body>
	<main class="background_layer1">
		<div id="main_wrapper" class="background_layer2">
			<div id="content_wrapper">
				<h2 class="content_title">환영합니다. 쇼미게임즈 code:${manager_token} 관리자님</h2>
				<div id="content_container">
					<div class="item_title">
						<span>관리자 메뉴</span>
					</div>
					<div id="select_btn_container">
						<div class="select_btn_div" data-id="admin_game">
							<span class="material-icons">videogame_asset</span>
							<h4 class="select_div_title">게임 정보 관리</h4>
						</div>
						<div class="select_btn_div" data-id="admin_user">
							<span class="material-icons">people_alt</span>
							<h4 class="select_div_title">유저 정보 관리</h4>
						</div>
						<div class="select_btn_div" data-id="admin_chart">
							<span class="material-icons">waterfall_chart</span>
							<h4 class="select_div_title">사이트 통계 보기</h4>
						</div>
						<div class="select_btn_div" data-id="admin_inquiry">
							<span class="material-icons">live_help</span> 
							<h4 class="select_div_title">문의사항 관리</h4>
						</div>
						<div class="select_btn_div" data-id="admin_notice">
							<span class="material-icons">flag</span>
							<h4 class="select_div_title">공지사항 관리</h4>
						</div>
						<div class="select_btn_div" data-id="admin_faq">
							<span class="material-icons">question_answer</span>
							<h4 class="select_div_title">자주묻는질문(FAQ) 관리</h4>
						</div>
						<div class="select_btn_div" data-id="admin_key">
							<span class="material-icons">key</span>
							<h4 class="select_div_title">게임키 관리</h4>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<script src="${resource}/js/admin_main.js"></script>
</body>
</html>