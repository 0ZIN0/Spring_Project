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
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
</head>
<body>
	<div id="delete-popup" class="delete-none">
		<div id="delete-content">
			<div id="delete-top">
				<i id="delete-big-icon" class="fa-solid fa-trash-can">&nbsp;</i>
			</div>
			<div id="delete-bottom">
				<div>${param.id}번 FAQ 삭제</div>
				<div class="delete_innder">
					<p>선택한 게시글을 정말 삭제하시겠습니까?</p>
					<p>한 번 삭제한 게시글은 복구할 수 없습니다.</p>
					<div id="popup-btns">
						<button id="delete-close-btn" class="btn cancel">취소</button>
						<button class="btn" onclick="location.href='./admin_faq_delete?id=${param.id}'">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
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
								<button class="btn cancel" onclick="location.href='./admin_faq'">목록</button>
								<button class="change-notice-btn" onclick="location.href='./admin_faq_update_page?id=${faq.qna_id}'">수정</button>
								<button id="delete-btn" class="btn cancel">삭제</button>
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
	
	<script src="${resource}/js/admin_faq_detail.js"></script>
	
</body>
</html>