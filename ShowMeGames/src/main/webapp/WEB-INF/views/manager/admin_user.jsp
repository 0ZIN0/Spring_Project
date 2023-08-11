<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/manager" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
<script src="https://kit.fontawesome.com/c48a5ad62b.js"
	crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>유저 정보 관리</title>
<%@ include file="/WEB-INF/views/manager/include/head_common.jsp"%>
<!-- page css -->
<link rel="stylesheet" href="${resource}/css/admin_user.css">
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
					<h2 class="content_title">유저 정보 관리</h2>
					<div id="public_profile" class="content_item">
						<div class="item_title">
							<span>유저 리스트</span>
						</div>
						<div class="input-group">
							<div class="form-outline">
								<input id="search-input" type="search" name="title"
									class="form-control" placeholder="이름으로 검색"
									onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt();}" />
								<button id="search-button" class="btn btn-primary"
								onclick="searchBoard()">
								<i class="fa-solid fa-magnifying-glass"></i>
							</button>
							</div>
						</div>
						<div>
						<hr />
							<c:forEach items="${userList}" var="user">
								<div class="content_grid">
									<div class="content_grid_item">
										<span>${user.user_num}</span>
									</div>
								   <div class="content_grid_item">
										<span class="user_name_span" data-id="${user.user_num}">${user.user_name}</span>
									</div>
									<div class="content_grid_item">
										<span>${user.user_id}</span>
									</div>
							       <div class="content_grid_item">
										<span>${user.nick_name}</span>
									</div>
									<div class="content_grid_item">
										<span>${user.user_grade}</span>
									</div>
									<div class="content_grid_item">
										<span>${user.phone_number}</span>
									</div>
									<div class="content_grid_item">
										<span>${user.user_point}</span>
									</div>
									<div class="content_grid_item">
										<span>${user.birth_date}</span>
									</div>
									<div class="content_grid_item">
										<span>${user.gender}</span>
									</div>

									<div class="content_grid_item">
										<span>${user.user_pw}</span>
									</div>
								</div>
							</c:forEach>
						</div>
						
					</div>
					
				</div>
			</div>
		</div>
	</main>
	
	<script src="${resource}/js/admin_user.js"></script>
  
</body>
</html>