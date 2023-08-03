<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- url : set -->
<c:url value="/resources/customer/notice/notice.css" var="notice_css" />
<c:url value="/resources/customer/notice/notice.js" var="notice_js" />
<c:url value="/customer/notice/" var="conpath" />
<c:url value="/resources/img/customer/notice/" var="notice_img" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<!-- css -->
<link rel="stylesheet" href="${notice_css}">
<!-- header, footer css -->
<%@ include file="/WEB-INF/views/include/link/common.jsp"%>
<!-- jstl: set -->
<c:set var="endYear" value="2023"></c:set>
<c:set var="startYear" value="2016"></c:set>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	<div class="background_layer1">
		<div class="background_layer2">
		
	
	<div id="conpath" style="visibility: hidden;" data-conpath="${notice_img}"></div>
	
	<main id="notice-main">
		<div id="notice-img">
			<img id="notice-main-img" alt=""
				src="https://staticctf.ubisoft.com/J3yJr34U2pZ2Ieem48Dwy9uqj5PNUQTn/5ZkoNGAqiIdAFDiDLu1fda/451e7acca889e06ef85e3356adb1e3ca/archive_rev.jpg">
		</div>
		<div id="notice-text">
			<p id="notice-main-text">공지사항</p>
		</div>
		<div id="notice-sort">
			<h2>정렬기준:</h2>
			<select name="notice_year" id="notice-year-select"
				class="selects select-year select-none">
				<c:forEach begin="${startYear}" end="${endYear}" var="i">
					<option value="${endYear - i + startYear}">${endYear - i + startYear}</option>
				</c:forEach>
			</select> 
			<select name="notice_date" id="notice-date-select"
				class="selects select-date select-none">
				<option value="0">월 선택</option>
				<c:forEach begin="1" end="12" var="i">
					<option value="${i}">${i}월</option>
				</c:forEach>
			</select>
		</div>
		<div id="notice-grid">
			<div></div>
			<div id="notice-grid-content" class="notice-grid-view">
				<div class="notice-date">전체</div>
				<c:forEach items="${notices}" var="notice">
					<a class="notice-content" id="notice-id" href="${conpath}notice_detail?id=${notice.notice_id}">
						<div class="notice-banner">
							<img class="banner-img" alt=""
								src="${notice_img}${notice.banner_url}">
							<div class="notice-detail-banner">
								<div class="banner-date">
									<fmt:formatDate pattern="yyyy년 MM월 dd일" value="${notice.write_date}"/>
								</div>
								<div class="banner-title">${notice.notice_title}</div>
								<div class="banner-content">${notice.short_content}</div>
								<div class="banner-others-btn">
									<div>더 읽어보기</div>
									<div>
										<span class="material-symbols-outlined">arrow_right</span>
									</div>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>
			</div>
			<div></div>
		</div>
	</main>

		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>

	<script src="${notice_js}"></script>
</body>
</html>