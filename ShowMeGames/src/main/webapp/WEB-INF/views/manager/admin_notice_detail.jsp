<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/resources/manager" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>${param.id}번공지사항</title>
<%@ include file="/WEB-INF/views/manager/include/head_common.jsp"%>
<!-- page css -->
<link rel="stylesheet" href="${resource}/css/admin_notice_detail.css">
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
					<h2 class="content_title">${param.id}번 공지사항</h2>
					<div id="public_profile" class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>상세 정보</span>
							</div>
							<div class="content_update_wrapper">
								<button class="btn cancel" onclick="location.href='./admin_notice'">뒤로가기</button>
								<button class="change-notice-btn" onclick="location.href='./admin_notice_update_page?id=${notice.notice_id}'">수정</button>
							</div>
						</div>
						<div id="notice-content">
							<div id="notice-content-title">
								<div id="notice-title">${notice.notice_title}</div>
							</div>
							<div class="top_icon">
								<div>
									<i id="notice-write-date" class="fa-solid fa-calendar-days">
										<fmt:formatDate pattern="yyyy년 MM월 dd일"
											value="${notice.write_date}" />
									</i>
								</div>
							</div>
							<br>
							<div>
								<img class="img"
									src="/smg/resources/img/customer/notice/${notice.banner_url}"
									alt="공지사항 이미지" />
							</div>
							<br> <br>
							<div class="notice_content">${notice.notice_content}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

</body>
</html>