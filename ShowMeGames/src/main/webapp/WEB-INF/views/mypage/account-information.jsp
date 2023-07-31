<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/mypage" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>계정 정보</title>
	<!-- mypage 공통 css -->
	<link rel="stylesheet" href="${resource}/common.css">
	<!-- header, footer css -->
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
	<!-- google font -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>

	<div id="top_bar">
		<div id="top_bar_logo">로고</div>
		<div></div>
		<div id="top_bar_account">아이디</div>
	</div>

	<main class="background_layer1">
		<div class="background_layer2">
			<div id="side_nav">
				<div id="side_nav_logo">로고</div>
				<a href="./my_account">
					<div class="nav_item">
						<div class="nav_item_wrapper">
							<span class="material-icons">person</span> <span>계정 정보</span>
						</div>
					</div>
				</a>
				<a href="./my_account">
					<div class="nav_item">
						<div class="nav_item_wrapper">
							<span class="material-icons">lock_person</span> <span>보안</span>
						</div>
					</div>
				</a>
				<a href="./my_account">
					<div class="nav_item">
						<div class="nav_item_wrapper">
							<span class="material-icons">groups</span> <span>커뮤니케이션</span>
						</div>
					</div>
				</a>
				<a href="./my_account">
					<div class="nav_item">
						<div class="nav_item_wrapper">
							<span class="material-icons">sports_esports</span> <span>게임보유리스트</span>
						</div>
					</div>
				</a>
				<a href="./my_account">
					<div class="nav_item">
						<div class="nav_item_wrapper">
							<span class="material-icons">payment</span> <span>구매내역</span>
						</div>
					</div>
				</a>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>
</body>
</html>