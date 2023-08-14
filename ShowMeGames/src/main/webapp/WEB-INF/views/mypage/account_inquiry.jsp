<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/mypage" var="resource" />
<c:url value="/resources/img/customer/inquiries/" var="inquiries_img"/>
<c:url value="/resources/mypage/js/account_inquiry.js" var="account_inquiry"/>
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
					<div id="board_content">
						<c:forEach items="${myContents}" var="myContent">
							<div id="board" class="board">
								<div class="board_subject">${myContent.inquiry_subject}</div>
								<div class="board_title">${myContent.inquiry_title}</div>
								<div class="board_btn">
									<div class="board_check">
										검토중
									</div>
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
						<svg role="presentation" class="icon--arrow" width="40" height="50" viewBox="0 0 40 40" fill="none"
                     	xmlns="http://www.w3.org/2000/svg">
                      	<path d="M24 17H15L19.6957 23L24 17Z" fill="#767676" />
                 		</svg>
                 		<div role="navigation" id="pageNav">
			            <div aria-live="polite" aria-atomic="true">${totalSize}개</div>
						<c:set var="nextPage" value="${paging.currPage + 1}" scope="page" />
						<c:set var="prePage" value="${paging.currPage - 1}" scope="page" />
												
						<div id="pageDiv">
							<c:choose>
								<c:when test="${prePage >= paging.firstPage}">
									<button class="btn" onclick="location.href='./inquiry?page=${nextPage}&&${second_para}'">&#9664;</button> 
								</c:when>
								<c:otherwise>
									<button class="btn disabled" disabled>&#9664;</button> 
								</c:otherwise>
							</c:choose>		
							<c:forEach items="${paging.pageList}" var="pageNum">
								<c:choose>
									<c:when test="${pageNum == paging.currPage}">
										<button id="now-page" class="btn" onclick="location.href='./inquiry?page=${pageNum}&&${second_para}'">${pageNum}</button> 
									</c:when>
									<c:otherwise>
										<button class="btn" onclick="location.href='./inquiry?page=${pageNum}&&${second_para}'">${pageNum}</button>
									</c:otherwise>
								</c:choose>		
							</c:forEach>
							<c:choose>
								<c:when test="${nextPage <= paging.lastPage}">
									<button class="btn" onclick="location.href='./inquiry?page=${nextPage}&&${second_para}'">&#9654;</button>
								</c:when>
								<c:otherwise>
									<button class="btn disabled" disabled>&#9654;</button> 
								</c:otherwise>
							</c:choose>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</main>						
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<script src="${resource}/js/common.js"></script>	
	
	<script src="${account_inquiry}"></script>

</body>
</html>