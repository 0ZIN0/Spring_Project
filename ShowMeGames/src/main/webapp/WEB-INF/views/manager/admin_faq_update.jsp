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
<link rel="stylesheet" href="${resource}/css/admin_faq_update.css">
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
					<h2 class="content_title">${param.id}번 FAQ 수정</h2>
					<div id="public_profile" class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>수정하기</span>
							</div>
							<div class="content_update_wrapper">
								<button id="back-link-btn" class="btn cancel"
									onclick="location.href='./admin_faq'">목록</button>
							</div>
						</div>
						<div id="faq-content">
							<form action="./admin_faq_update?id=${param.id}" method="POST">
								<input type="hidden" name="qna_id" value="${param.id}" />
								<div id="input-div">
									<div class="faq-input-grid">
										<div class="faq-input-title">주제</div>
										<select name="qna_topic" id="faq-topic">
											<option value="이용방법">이용방법</option>
											<option value="계정">계정</option>
											<option value="주문">주문</option>
											<option value="환불">환불</option>
											<option value="등록">등록</option>
											<option value="설치">설치</option>
											<option value="상품">상품</option>
											<option value="기타">기타</option>
										</select>
									</div>
									<div class="faq-input-grid">
										<div class="faq-input-title">제목</div>
										<input class="input-faq" id="faq-title" type="text"
											name="qna_title" value="${faq.qna_title}" />
									</div>
									<div class="faq-input-grid">
										<div class="faq-input-title">내용</div>
										<textarea class="input-faq" id="faq-text" rows="50" cols="10"
											name="qna_content">${faq.qna_content}</textarea>
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
	<script src="${resource}/js/admin_faq_update.js"></script>

</body>
</html>