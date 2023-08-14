<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/resources/manager" var="resource" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="sysYear">
	<fmt:formatDate value="${now}" pattern="yyyy" />
</c:set>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>사이트 통계 보기</title>
<%@ include file="/WEB-INF/views/manager/include/head_common.jsp"%>
<!-- page css -->
<link rel="stylesheet" href="${resource}/css/admin_chart.css">
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
					<h2 class="content_title">사이트 통계 보기</h2>
					<div id="public_profile" class="content_item">
						<div class="item_title">
							<span>매출 통계</span>
						</div>
						<div class="top-bar">
							<button id="day">일별</button>
							<button id="month">월별</button>
							<button id="year">년별</button>
						</div>
						<div>
							<canvas id="bar-chart" width="800" height="450"></canvas>
						</div>
					</div>
					<div id="public_profile" class="content_item">
						<div class="item_title">
							<span>에디터별 판매량</span>
						</div>
						<div>
							<canvas id="editorSales-chart" width="800" height="450"></canvas>
						</div>
					</div>
					<div id="public_profile" class="content_item">
						<div class="item_title">
							<span>성별 비율</span>
						</div>
						<div>
							<canvas id="gender-chart" width="800" height="450"></canvas>
						</div>
					</div>
					<div id="public_profile" class="content_item">
						<div class="item_title">
							<span>장르 선호도</span>
						</div>
						<div>
							<canvas id="genre-chart" width="800" height="450"></canvas>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	<script src="${resource}/js/admin_chart.js"></script>
</body>
</html>