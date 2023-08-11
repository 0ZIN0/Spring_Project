<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/resources/manager" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>
<%@ include file="/WEB-INF/views/manager/include/head_common.jsp"%>
<!-- page css -->
<link rel="stylesheet" href="${resource}/css/admin_notice_update.css">
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
					<h2 class="content_title">공지사항 작성</h2>
					<div id="public_profile" class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>새 글 작성하기</span>
							</div>
							<div class="content_update_wrapper">
								<button class="btn cancel"
									onclick="location.href='./admin_notice'">뒤로가기</button>
							</div>
						</div>
						<div id="notice-content">
							<form action="./admin_notice_add" method="POST" enctype="multipart/form-data">
								<div id="input-div">
									<div class="notice-input-grid">
										<div class="notice-input-title">제목</div>
										<input class="input-notice" id="notice-title" type="text"
											name="notice_title" placeholder="제목을 입력하세요." />
									</div>
									<div class="notice-input-grid">
										<div class="notice-input-title">간단 소개</div>
										<input class="input-notice" id="short_content" type="text"
											name="short_content" placeholder="간단한 소개 글을 입력하세요." />
									</div>
									<div class="notice-input-grid">
										<div class="notice-input-title">내용</div>
										<textarea class="input-notice" id="notice-text" rows="50"
											cols="10" name="notice_content" placeholder="내용을 입력하세요."></textarea>
									</div>
									<div class="notice-input-grid">
										<div class="notice-input-title">첨부파일</div>
										<input id="imp-file" type="file" name="imgFile" accept="image/jpeg image/png image/gif"/>
									</div>
									<div class="notice-input-grid">
										<div></div>
										<div id="url-comment">첨부파일은 최대 2MB입니다. (사용가능 파일 형식 - jpg
											/ gif / png )</div>
									</div>
								</div>
								<div id="submit-btn-div">
									<button id="submit-btn" type="submit" class="btn">확인</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<!-- js -->
	<script src="${resource}/js/admin_notice_add.js"></script>
	
</body>
</html>