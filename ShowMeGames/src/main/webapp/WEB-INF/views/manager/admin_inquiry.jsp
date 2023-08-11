<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/manager" var="resource"/>
<c:url value="/resources/manager/js/admin_inquiry.js" var="admin_inquiry"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>문의사항 관리</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/admin_inquiry.css">
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
					<h2 class="content_title">문의사항 관리</h2>
					<div id="public_profile" class="content_item">
						<div class="item_title">
							<span>문의사항 리스트</span>
						</div>
						
							<div id="board_content">
								<div id="board_content_title">
									<div>글 번호</div>
									<div>문의구분</div>
									<div>제목</div>
									<div>글쓴이</div>
									<div>문의현황</div>
								</div>
							<c:forEach items="${contents}" var="content">
								<div id="board" class="board">
									<div class="board_id">${content.inquiry_id}</div>
									<div class="board_subject">${content.inquiry_subject}</div>
									<div class="board_title">${content.inquiry_title}</div>
									<div class="board_writer">${content.nick_name}</div>
									<div class="board_answer">
										<c:if test="${empty content.inquiry_answer}">
											<button>답변하기</button>
										</c:if>
										<c:if test="${not empty content.inquiry_answer}">
											<button>답변완료</button>
										</c:if>
									</div>															
									<div class="board_detail">
										<div class="board_content">
											<div>
												내용  
											</div>
											<div>
												${myContent.inquiry_content}
											</div>
										</div>
										<div class="board_attachment">
											<div>첨부파일</div>
											<div class="board_img">
												<img class="myImg"src="${inquiries_img}${myContent.attachment}" alt="첨부파일" />
											</div>
											<div id="myModal" class="modal">
											  <!-- The Close Button -->
											  <span class="close">&times;</span>										
											  <!-- Modal Content (The Image) -->
											  <img class="modal-content" id="img01" src="${inquiries_img}${myContent.attachment}"/>										
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
						</div> 
						<div id="pagingDiv" data-id="admin_inquiry"></div>
						<%@ include file="/WEB-INF/views/manager/include/paging.jsp" %>		
					</div>
				</div>
			</div>
		</div>
	</main>
	<script src="${admin_inquiry}"></script>
	<script src="${resource}/js/paging.js"></script>
</body>
</html>