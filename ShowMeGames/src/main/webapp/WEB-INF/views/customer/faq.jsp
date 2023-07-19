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
        <div id="main-header">
            <div id="main-header-img">
                <img src="${faq_img}/Img-header.jpg" alt="헤더이미지">
            </div>
            <div id="main-header-content">
                <div>
                    <h1>무엇을 도와드릴까요?</h1>
                </div>
                <div>
                    <div id="search-container">
                        <form action="">
                            <input type="text" placeholder="질문이나 키워드를 적으십시오..."/>
                            <button type="submit"><i class="fa-solid fa-magnifying-glass"style="color: #fff; font-size: 25px;"></i></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div id="main-category">
            <div>
                <div id="dropdown-title">주제 선택</div>
                <div class="selectBox">
                    <select id="select">
                        <option value="all">모든 주제</option>
                        <option value="topic1">주제1</option>
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
            <div>
                <button>&#9664;</button>
                <button class="now-page">1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>
                <button>&#9654;</button>
            </div>
        </div>

        <div class="qna_blank"></div>

        <div id="qnaDiv">
            <h1>찾으시는 정보가 없습니까?</h1>
            <div></div>
            <button>문의</button>
        </div>

        <div class="qna_blank"></div>
        
    </div>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
	
	<!-- page js -->
	<script src="${faq_js}"></script>
	<!-- header, footer js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp" %>
</body>
</html>