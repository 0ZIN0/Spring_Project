<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/resources/manager" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>유저 정보 수정</title>
<%@ include file="/WEB-INF/views/manager/include/head_common.jsp"%>
<!-- page css -->
<link rel="stylesheet" href="${resource}/css/admin_user_edit.css">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp"%>

	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp"%>
			<div id="main_content">
				<div id="account_content">
					<h2 class="content_title">유저 정보 수정2</h2>
					<div class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>${user.user_num}번 유저</span>
							</div>

						</div>
						<div id="content_container_wrapper">
							<div class="item_layer_div item2">
								<div class="item_div">
									<span class="item_span_title">유저이름</span> <span id="game_title"
										class="item_span_content"></span>
								</div>
								<div class="item_div"></div>
							</div>
							<div class="item_layer_div item3"></div>
							<div class="item_layer_div item3"></div>
							<div class="item_layer_div item3"></div>
							<div class="item_layer_div item3"></div>
							<div class="item_layer_div"></div>
							<div class="item_layer_div item3"></div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

</body>
</html>