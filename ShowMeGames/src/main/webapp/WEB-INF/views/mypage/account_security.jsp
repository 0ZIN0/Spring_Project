<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/mypage" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>계정 보안</title>
	<!-- mypage 공통 css -->
	<link rel="stylesheet" href="${resource}/css/common.css">
	<!-- security css -->
	<link rel="stylesheet" href="${resource}/css/account_security.css">
	<!-- header, footer css -->
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
	<!-- google font -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/mypage/include/top_bar.jsp" %>

	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/mypage/include/side_bar.jsp" %>
			<div id="main_content">
				<h2 class="content_title">보안</h2>
				<div id="pwd_update" class="content_item">
					<div class="item_title_wrapper">
						<div class="item_title">
							<span>암호</span>
						</div>
						<div class="content_update_wrapper">
							<button>변경</button>
						</div>
					</div> 
					<div id="password_content_wrapper">
						<div id="password_content">
							<div>
								<span class="pwd_dot"></span>
								<span class="pwd_dot"></span>
								<span class="pwd_dot"></span>
								<span class="pwd_dot"></span>
								<span class="pwd_dot"></span>
								<span class="pwd_dot"></span>
								<span class="pwd_dot"></span>
								<span class="pwd_dot"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>
</body>
</html>