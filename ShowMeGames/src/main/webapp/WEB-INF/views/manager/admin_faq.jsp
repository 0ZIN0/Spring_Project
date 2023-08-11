<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/resources/manager" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>자주묻는질문(FAQ) 관리</title>
<%@ include file="/WEB-INF/views/manager/include/head_common.jsp"%>
<!-- page css -->
<link rel="stylesheet" href="${resource}/css/admin_faq.css">
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
					<h2 class="content_title">자주묻는질문(FAQ) 관리</h2>
					<div id="public_profile" class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>FAQ 리스트</span>
							</div>
							<div id="select-topic-div">
								<form action="./admin_faq" id="topicForm">
									<select name="topic" id="faq-topic">
										<option value="all">전체</option>
										<option value="이용방법">이용방법</option>
										<option value="계정">계정</option>
										<option value="주문">주문</option>
										<option value="환불">환불</option>
										<option value="등록">등록</option>
										<option value="설치">설치</option>
										<option value="상품">상품</option>
										<option value="기타">기타</option>
									</select>
									<div>
										<button class="filterBtn btn" type="submit" form="topicForm">필터 적용</button>
									</div>
								</form>
							</div>
							<div class="content_update_wrapper">
								<button class="add-notice-btn"
									onclick="location.href='./admin_faq_add_page'">추가</button>
							</div>
						</div>
						<div id="notice-content">
							<div id="notice-content-title">
								<div>ID</div>
								<div>주제</div>
								<div>제목</div>
							</div>
							<div id="faq-list">
								<c:forEach items="${faqs}" var="faq" varStatus="status">
									<a href="./admin_faq_detail?id=${faq.qna_id}" class="faq-div">
										<div>${faq.qna_id}</div>
										<div>${faq.qna_topic}</div>
										<div class="qna-title">${faq.qna_title}</div>
									</a>
								</c:forEach>
							</div>
							<div id="pagingDiv" data-id="admin_faq"></div>
							<div id="topicData" data-topic="${param.topic}"></div>
							<%@ include file="/WEB-INF/views/manager/include/paging.jsp"%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- js -->
	<script src="${resource}/js/paging_faq.js"></script>
</body>
</html>