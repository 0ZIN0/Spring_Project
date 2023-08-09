<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/manager" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게임 키 관리</title>
<%@ include file="/WEB-INF/views/manager/include/head_common.jsp"%>
<!-- page css -->
<link rel="stylesheet" href="${resource}/css/admin_key.css">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp"%>

	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp"%>
			<div id="main_content">
					<h2 class="content_title">게임 키 관리</h2>
					<div class="content_item">
					<div class="item_title_wrapper">
						<div id="key-list-div" class="item_title_wrapper">
						<div class="item_title">
							<span>게임리스트</span>
						</div>
						<div id="key-list">
							<div id="column-title">
								<div>키 번호</div>
								<div>게임 번호</div>
								<div>키 ID</div>
								<div>소유 계정</div>
								<div></div>
							</div>
							<div id="row-content">
								<c:forEach items="${gameKeys }" var="key">
									<div class="row-content">
										<div class="key_num">${key.key_num }</div>
										<div class="game-title">${key.game_id}</div>
										<div class="key-id">${key.key_id }</div>
										<div class="game-status">${key.user_num }</div>
										<div>
											<button class="btn key-btn" data-key="key-${key.key_num}">키
												확인</button>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
			</div>
	</main>

</body>
</html>