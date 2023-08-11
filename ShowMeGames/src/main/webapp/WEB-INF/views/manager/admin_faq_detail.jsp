<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/resources/manager" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${param.id}번 FAQ</title>
<%@ include file="/WEB-INF/views/manager/include/head_common.jsp"%>
<!-- page css -->
<link rel="stylesheet" href="${resource}/css/admin_faq_detail.css">
<script src="https://kit.fontawesome.com/e49f385ff0.js"
	crossorigin="anonymous"></script>
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
					<h2 class="content_title">${param.id}번 FAQ</h2>
					<div id="public_profile" class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>상세 정보</span>
							</div>
							<div class="content_update_wrapper">
								<button class="btn cancel" onclick="location.href='./admin_faq'">뒤로가기</button>
								<button class="change-notice-btn" onclick="location.href='./admin_faq_update_page?id=${faq.qna_id}'">수정</button>
							</div>
						</div>
						<div id="faq-content">
							<div id="faq-content-title">
								<div id="faq-title">[${faq.qna_topic}] ${faq.qna_title}</div>
							</div>
							<br> <br>
							<div id="faq-text">${faq.qna_content}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

</body>
</html>