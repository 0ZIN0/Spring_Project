<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/customer/faq/faq.css" var="faq_css" />
<c:url value="/resources/customer/faq/faq.js" var="faq_js"/>
<c:url value="/resources/img/customer/faq" var="faq_img" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>자주 묻는 질문</title>
	<!-- css -->
	<link rel="stylesheet" href="${faq_css}">
	<!-- header, footer css -->
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp" %>
	
    <div id="main">
    
		<%@ include file="/WEB-INF/views/include/customer/main_header.jsp" %>
			
        <div id="main-category">
            <div>
            	<form id="topicForm" action="${pageContext.request.contextPath}/customer/faq"></form>
                <div id="dropdown-title">주제 선택</div>
                <div class="selectBox">
                    <select id="select" name="topic" form="topicForm" >
                        <option value="all">모든 주제</option>
                        <option value="이용방법">이용방법</option>
                        <option value="계정">계정</option>
                        <option value="주문">주문</option>
                        <option value="환불">환불</option>
                        <option value="등록">등록</option>
                        <option value="설치">설치</option>
                        <option value="상품">상품</option>
                        <option value="기타">기타</option>
                    </select>
                    <svg role="presentation" class="icon--arrow" width="40" height="50" viewBox="0 0 40 40" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path d="M24 17H15L19.6957 23L24 17Z" fill="#767676" />
                    </svg>
                </div>
            </div>
            <div>
                <button type="submit" form="topicForm">필터 적용</button>
            </div>
        </div>
        
        <c:if test="${search != null }">
        
	        <div id="searchResult">
	        	<h1>"${search}"에 대한 검색 결과 [${totalSize}개]</h1>
	        </div>
        
        </c:if>

		<c:if test="${totalSize <= 0}">
			<div class="qna_blank"></div>
			<div id="searchResultZero">
				<div>
					<h2>검색 결과가 없습니다.</h2>
					<button onclick="location.href='./faq'">목록으로</button>
				</div>
			</div>
		</c:if>

		<c:if test="${totalSize > 0}">
		
	        <div id="thumbnails">
	        	<c:forEach items="${faqList}" var="faq">
	            <div class="thumbnail-container">
	                <a class="thumbnail-items" href="./faq/detail?id=${faq.qna_id}">
	                    <div class="thumbnail-topics">
	                        <span>${faq.qna_topic}</span>
	                    </div>
	                    <div class="thumbnail-content">
	                        <span>${faq.qna_title}</span>
	                        <span>${faq.qna_content}</span>
	                        <span>더 알아보기 &#9654;</span>
	                    </div>
	                </a>
	            </div>
	        	</c:forEach>
	        </div>
			
	        <div role="navigation" id="pageNav">
	            <div aria-live="polite" aria-atomic="true">${totalSize}개</div>
				<c:set var="nextPage" value="${paging.currPage + 1}" scope="page" />
				<c:set var="prePage" value="${paging.currPage - 1}" scope="page" />
				
				<c:if test="${search == null}">
					<c:set var="second_para" value="topic=${topic}" />
				</c:if>
				
				<c:if test="${search != null}">
					<c:set var="second_para" value="search=${search}" />
				</c:if>
				
				<div id="pageDiv">
					<c:choose>
						<c:when test="${prePage >= paging.firstPage}">
							<button class="btn" onclick="location.href='./faq?page=${nextPage}&&${second_para}'">&#9664;</button> 
						</c:when>
						<c:otherwise>
							<button class="btn disabled" disabled>&#9664;</button> 
						</c:otherwise>
					</c:choose>		
					<c:forEach items="${paging.pageList}" var="pageNum">
						<c:choose>
							<c:when test="${pageNum == paging.currPage}">
								<button id="now-page" class="btn" onclick="location.href='./faq?page=${pageNum}&&${second_para}'">${pageNum}</button> 
							</c:when>
							<c:otherwise>
								<button class="btn" onclick="location.href='./faq?page=${pageNum}&&${second_para}'">${pageNum}</button>
							</c:otherwise>
						</c:choose>		
					</c:forEach>
					<c:choose>
						<c:when test="${nextPage <= paging.lastPage}">
							<button class="btn" onclick="location.href='./faq?page=${nextPage}&&${second_para}'">&#9654;</button>
						</c:when>
						<c:otherwise>
							<button class="btn disabled" disabled>&#9654;</button> 
						</c:otherwise>
					</c:choose>
				</div>
	        </div>
		
		</c:if>		
		
		<%@ include file="/WEB-INF/views/include/customer/faq_qnadiv.jsp" %>
				
    </div>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
	
	<!-- page js -->
	<script src="${faq_js}"></script>
	<!-- header, footer js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp" %>
</body>
</html>