<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="resources/index/css/index.css" var="css1" />
<c:url value="resources/img/index" var="img"/>
<c:url value="resources/img/index/games" var="game_img"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Show Me Games</title>
	<!-- css -->
	<link rel="stylesheet" href="${css1}">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<!-- header, footer css -->
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp" %>
	
	<div id="main">
	    <div id="mainBanner" class="banner">
	        <img src="${img}/HomeHero_SummerSale-June23_desk 1.png" alt="배너사진">
	    </div>
	    <div id="bestGame">
	       <div class="btn"> 
                    <i class="material-icons" id="best-prev-button" style="font-size:48px;">arrow_back_ios_new</i>				
                </div>
	        <div class="best_games">
	            <img src="${game_img}/CyberPunk/CyberPunk8.jpeg" alt="사진">
	            <div class="bottom-right1"><span class="old-p">원가격</span></div>
	            <div class="bottom-right2"><span class="dis-p">할인율</span><span class="pre-p">현재가격</span></div>
	        </div>
	        <div class="best_games">
	            <img src="${game_img}/DarkSouls3/DarkSoul3_5.jpeg" alt="사진">
	            <div class="bottom-right1"><span class="old-p">원가격</span></div>
	            <div class="bottom-right2"><span class="dis-p">할인율</span><span class="pre-p">현재가격</span></div>
	        </div>
	        <div class="best_games">
	            <img src="${game_img}/Elden_Ring/EldenRing8.jpeg" alt="사진">
	            <div class="bottom-right1"><span class="old-p">원가격</span></div>
	            <div class="bottom-right2"><span class="dis-p">할인율</span><span class="pre-p">현재가격</span></div>
	        </div>
	        <div class="btn"> 
                <i class="material-icons" id="best-next-button"style="font-size:48px;">arrow_forward_ios</i>
			</div>
	    </div>
	
	    <div id="subBanner" class="banner">
	        <img src="${img}/SubBanner1.png" alt="서브배너사진">
	    </div>
	
        <div class="recmd">
            <div><span class="title">에디터 추천.</span> <span class="sub-title">이런 장르 게임은 어떤가요?</span></div>
            <div class="recmd-container editer-container">
            	<div class="recmd-prev-btn"> 
                    <i class="material-icons" id="editer-prev-button" style="font-size:48px;">arrow_back_ios_new</i>				
                </div>
                <div class="blank">                    
                </div>
                <div class="recmd-items">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="recmd-items">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="recmd-items">
                    <img src="${game_img}/Tekken7/Tekken5.jpg" alt="사진">
                </div>
                <div class="recmd-items">
                    <img src="${game_img}/Forza_Horizon/Forza Horzon4.jpg" alt="사진">
                </div>
                <div class="recmd-items">
                    <img src="${game_img}/Elden_Ring/EldenRing8.jpeg" alt="사진">
                </div>
                <div class="recmd-items">
                    <img src="${game_img}/DarkSouls3/DarkSoul3_5.jpeg" alt="사진">
                </div>
                <div class="recmd-items">
                    <img src="${game_img}/CyberPunk/CyberPunk8.jpeg" alt="사진">                  
                </div>
                <div class="recmd-items">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="recmd-items">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="recmd-items">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="recmd-items">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="recmd-next-btn"> 
                    <i class="material-icons" id="editer-next-button"style="font-size:48px;">arrow_forward_ios</i>
				</div>
            </div>
        </div>

        <div class="recmd">
            <div><span class="title">출시 예정 게임.</span> <span class="sub-title">곧 다가올 게임들을 만나봅니다.</span></div>
            <div class="recmd-container cms-container">
            	<div class="recmd-prev-btn"> 
                    <i class="material-icons" id="cms-prev-button" style="font-size:48px;">arrow_back_ios_new</i>				
                </div>
                <div class="blank">                    
                </div>
                <div class="recmd-items">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="recmd-items">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="recmd-items">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="recmd-items">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="recmd-items">
                    <img src="${img}/black.png" alt="사진">                   
                </div>
                <div class="recmd-next-btn"> 
                    <i class="material-icons" id="cms-next-button"style="font-size:48px;">arrow_forward_ios</i>
				</div>
            </div>
        </div>
	
	    <div id="genre">
	        <div class="blank"></div>
	        <div><span class="title">장르별로 살펴보기.</span> <span class="sub-title">다양한 장르속 다양한 게임.</span></div>
	        <div class="blank"></div>
	        <div class="btn"> 
                <i class="material-icons" id="genre-prev-button" style="font-size:48px;">arrow_back_ios_new</i>				
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
                <i class="material-icons" id="genre-next-button"style="font-size:48px;">arrow_forward_ios</i>
			</div>
	    </div>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
	
	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp" %>
	<script src="./resources/index/js/index.js"></script>
</body>
</html>