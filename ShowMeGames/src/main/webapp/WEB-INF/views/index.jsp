<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="resources/index/css/index.css" var="css1" />
<c:url value="resources/img/index" var="img"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Show Me Games</title>
	<!-- css -->
	<link rel="stylesheet" href="${css1}">
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp" %>
	
	<div id="main">
	    <div id="banner">
	        <img src="${img}/HomeHero_SummerSale-June23_desk 1.png" alt="배너사진">
	    </div>
	    <div id="bestGame">
	        <div class="btn">
	            <button>btn</button>
	        </div>
	        <div class="best_games">
	            <img src="${img}/black.png" alt="사진">
	            <div class="bottom-right1"><span class="old-p">원가격</span></div>
	            <div class="bottom-right2"><span class="dis-p">할인율</span><span class="pre-p">현재가격</span></div>
	        </div>
	        <div class="best_games">
	            <img src="${img}/black.png" alt="사진">
	            <div class="bottom-right1"><span class="old-p">원가격</span></div>
	            <div class="bottom-right2"><span class="dis-p">할인율</span><span class="pre-p">현재가격</span></div>
	        </div>
	        <div class="best_games">
	            <img src="${img}/black.png" alt="사진">
	            <div class="bottom-right1"><span class="old-p">원가격</span></div>
	            <div class="bottom-right2"><span class="dis-p">할인율</span><span class="pre-p">현재가격</span></div>
	        </div>
	        <div class="btn">
	            <button>btn</button>
	        </div>
	    </div>
	
	    <div id="subBanner">
	        <img src="${img}/SubBanner1.png" alt="서브배너사진">
	    </div>
	
	    <div class="recmd">
	
	    </div>
	
	    <div class="recmd">
	
	    </div>
	
	    <div id="genre">
	        <div class="blank"></div>
	        <div><span class="title">장르별로 살펴보기.</span> <span class="sub-title">다양한 장르속 다양한 게임.</span></div>
	        <div class="blank"></div>
	        <div class="btn">
	            <button>btn</button>
	        </div>
	        <div class="genres">
	            <img src="${img}/black.png" alt="사진">
	        </div>
	        <div class="genres">
	            <img src="${img}/black.png" alt="사진">
	        </div>
	        <div class="genres">
	            <img src="${img}/black.png" alt="사진">
	        </div>
	        <div class="genres">
	            <img src="${img}/black.png" alt="사진">
	        </div>
	        <div class="btn">
	            <button>btn</button>
	        </div>
	    </div>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
	
	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp" %>
</body>
</html>