<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/manager" var="resource"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게임 정보 수정</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/admin_game_update.css">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp" %>
	
	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp" %>
			<div id="main_content">
				<div id="account_content">
					<h2 class="content_title">게임 정보 수정</h2>
					<div id="public_profile" class="content_item">
						<div class="item_title">
							<span>${game.game_id}번 게임 상세 정보 수정</span>
						</div>
						<div>
							<span>게임명</span><span>${game.game_name}</span>
							<span></span><span></span> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
</body>
</html>