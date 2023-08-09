<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/resources/manager" var="resource"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>공지사항 관리</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/admin_notice.css">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp" %>
	
	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp" %>
			<div id="main_content">
				<div id="account_content">
					<h2 class="content_title">공지사항 관리</h2>
					<div id="public_profile" class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>공지사항 리스트</span>
							</div>
							<div class="content_update_wrapper">
								<button class="add-notice-btn">추가</button>
							</div>
						</div>
						<div id="notice-content">
							<div id="notice-content-title">
								<div>No.</div>
								<div>날짜</div>
								<div>제목</div>
								<div>게시자</div>
								<div></div>
							</div>
							<div id="notice-list">
							<c:forEach items="${notices}" var="notice" varStatus="status">
								<div class="notice-div">
									<div>${status.count}</div>
									<div><fmt:formatDate pattern="yyyy. MM. dd" value="${notice.write_date}"/></div>
									<div class="notice-title">${notice.notice_title}</div>
									<div>${notice.mng_num} 관리자님</div>
									<div>
										<button class="btn notice-change-btn">수정</button>
									</div>
								</div>
							</c:forEach>
							</div>
							<%@ include file="/WEB-INF/views/manager/include/paging.jsp" %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
</body>
</html>