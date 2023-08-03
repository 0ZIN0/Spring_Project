<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/mypage" var="resource" />
<c:url value="/resources/img/customer/inquiries/" var="inquiries_img"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>문의사항</title>
	<!-- mypage 공통 css -->
	<link rel="stylesheet" href="${resource}/css/common.css">
	<!-- inquiry css -->
	<link rel="stylesheet" href="${resource}/css/account_inquiry.css">
	<!-- header, footer css -->
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
	<!-- google font -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/mypage/include/top_bar.jsp" %>

	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/mypage/include/side_bar.jsp" %>
			<div id="main_content">
				<h2 class="content_title">문의사항</h2>
				<div class="content_item">
					<div class="item_title_wrapper">
						<div class="item_title">
							<span>문의사항 보기</span>
						</div>
						<div class="content_update_wrapper">
							<button>버튼</button>
						</div>
					</div>
					<div>
						<c:forEach items="${myContents}" var="myContent">
							<div>${myContent.inquiry_subject}</div>
							<div>
								${myContent.inquiry_title}
							</div>
							<div>
								${myContent.inquiry_content}
							</div>
							<div>
								<div>첨부파일</div>
								<div>
									<img src="${inquiries_img}${myContent.attachment}" alt="첨부파일" />
								</div>
							</div>							
						</c:forEach>	
					</div> 
				</div>
			</div>
		</div>
	</main>
	
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>
	<script src="${resource}/js/common.js"></script>
</body>
</html>