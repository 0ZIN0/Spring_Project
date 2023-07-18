<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/customer/faq_detail/faq_detail.css" var="faq_detail_css" />
<c:url value="/resources/img/customer/faq" var="faq_img" />
<!DOCTYPE html>
<html>
<head lang="ko">
	<meta charset="UTF-8">
	<title>글 제목</title>
	<link rel="stylesheet" href="${faq_detail_css}">
	<!-- icons -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
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
        
        <div class="qna_blank">
            <button id="toList" onclick="location.href='../faq#main-category';" >목록</button>
        </div>

        <div id="main-body">
            <div id="main-content">
                <h1>제목</h1>
                <div class="main-content-text">
                    본문
                </div>
                <div>
                    <h3>글 번호</h3>
                    <span class="content-num">0001234</span>
                </div>
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

	<!-- header, footer js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp" %>
</body>
</html>