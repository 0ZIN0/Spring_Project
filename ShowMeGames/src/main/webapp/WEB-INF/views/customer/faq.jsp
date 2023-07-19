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
                <div id="dropdown-title">주제 선택</div>
                <div class="selectBox">
                    <select id="select">
                        <option value="all">모든 주제</option>
                        <option value="topic1">이용방법</option>
                        <option value="topic1">계정</option>
                        <option value="topic1">주문</option>
                        <option value="topic1">환불</option>
                        <option value="topic1">등록</option>
                        <option value="topic1">설치</option>
                        <option value="topic1">상품</option>
                        <option value="topic1">기타</option>
                    </select>
                    <svg role="presentation" class="icon--arrow" width="40" height="50" viewBox="0 0 40 40" fill="none"
                        xmlns="http://www.w3.org/2000/svg">
                        <path d="M24 17H15L19.6957 23L24 17Z" fill="#767676" />
                    </svg>
                </div>
            </div>
            <div>
                <button>필터 적용</button>
            </div>
        </div>
        <div id="thumbnails">
        	<c:forEach begin="1" end="9">
            <div class="thumbnail-container">
                <a class="thumbnail-items" href="./faq/detail">
                    <div class="thumbnail-topics">
                        <span>topic</span>
                    </div>
                    <div class="thumbnail-content">
                        <span>제목</span>
                        <span>내용</span>
                        <span>더 알아보기 &#9654;</span>
                    </div>
                </a>
            </div>
        	</c:forEach>
        </div>

        <div role="navigation" id="pageNav">
            <div aria-live="polite" aria-atomic="true">0개</div>
			<c:set var="nextPage" value="${paging.currPage + 1}" scope="page" />
			<c:set var="prePage" value="${paging.currPage - 1}" scope="page" />
			<div id="pageDiv">
				<c:choose>
					<c:when test="${prePage >= paging.firstPage}">
						<button class="btn" onclick="location.href='./faq?page=${prePage}'">&#9664;</button> 
					</c:when>
					<c:otherwise>
						<button class="btn disabled" disabled>&#9664;</button> 
					</c:otherwise>
				</c:choose>		
				<c:forEach items="${paging.pageList}" var="pageNum">
					<c:choose>
						<c:when test="${pageNum == paging.currPage}">
							<button id="now-page" class="btn" onclick="location.href='./faq?page=${pageNum}'">${pageNum}</button> 
						</c:when>
						<c:otherwise>
							<button class="btn" onclick="location.href='./faq?page=${pageNum}'">${pageNum}</button>
						</c:otherwise>
					</c:choose>		
				</c:forEach>
				<c:choose>
					<c:when test="${nextPage <= paging.lastPage}">
						<button class="btn" onclick="location.href='./faq?page=${nextPage}'">&#9654;</button>
					</c:when>
					<c:otherwise>
						<button class="btn disabled" disabled>&#9654;</button> 
					</c:otherwise>
				</c:choose>
			</div>
        </div>

		<%@ include file="/WEB-INF/views/include/customer/faq_qnadiv.jsp" %>
				
    </div>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
	
	<!-- page js -->
	<script src="${faq_js}"></script>
	<!-- header, footer js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp" %>
</body>
</html>