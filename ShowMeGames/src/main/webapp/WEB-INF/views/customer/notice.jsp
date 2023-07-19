<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- url : set -->
<c:url value="/resources/customer/notice/notice.css" var="notice_css" />
<c:url value="/resources/customer/notice/notice.js" var="notice_js" />
<c:url value="/customer/notice/" var="conpath" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- css -->
<link rel="stylesheet" href="${notice_css}">
<!-- icon -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
<!-- header, footer css -->
<%@ include file="/WEB-INF/views/include/link/common.jsp"%>
<!-- jstl: set -->
<c:set var="endYear" value="2023"></c:set>
<c:set var="startYear" value="2016"></c:set>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	
	<main id="notice-main">
		<img id="notice-main-img" alt="" src="https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/5ZkoNGAqiIdAFDiDLu1fda/451e7acca889e06ef85e3356adb1e3ca/archive_rev.jpg">
		<div id="notice-sort">
			<h2>정렬기준:</h2>
			<select name="notice_year" id="notice-year-select">
				<c:forEach begin="${startYear}" end="${endYear}" var="i">
					<option value="${endYear - i + startYear}">${endYear - i + startYear}</option>
				</c:forEach>
			</select>
			<select name="notice_date" id="notice-date-select">
				<option value="">월 선택</option>
				<c:forEach begin="1" end="12" var="i">
					<option value="${i}">${i}월</option>
				</c:forEach>
			</select>
		</div>
		<div id="notice-grid">
			<a id="notice-id" href="${conpath}detail?id=1">
				<div class="notice-date">7월 2023년</div>
				<div class="notice-banner">
					<img alt="" src="https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/7neLQ1AbemfEXsYa9C8wlm/2ecc3dd82e8d268c37251a822a3f09a7/BrandNewsArticle_SummerSale-June23_960x540.jpg">
					<div class="notice-banner">
						<div class="banner-date">2023년 7월 19일</div>
						<div class="banner-title">Ubisoft Store 여름 세일 최대 75% 할인</div>
						<div class="banner-content">Assassin's Creed Valhalla, Far Cry 6, Anno 1800 등 다양한 게임을 저렴한 가격에 구매하세요.</div>
						<div class="banner-others-btn">
							<div>더 읽어보기</div>
							<div>
								<span class="material-symbols-outlined">arrow_right</span>
							</div>
						</div>
					</div>
				</div>
			</a>
		</div>
	</main>
	
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	
	<script src="${notice_js}"></script>
</body>
</html>