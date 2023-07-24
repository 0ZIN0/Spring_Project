<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="resources/games/css/games.css" var="css1" />
<c:url value="resources/games/js/games.js" var="js1" />
<c:url value="resources/img/index" var="img"/>
<c:url value="resources/img/index/games" var="game_img"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 게임 보기</title>
<link rel="stylesheet" href="${css1}">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp" %>
	<div class="games_banner">
		<div class="banner_textbox">
			<h1>Show Me Games</h1>
			<p>Show Me Games의 최신 게임, 베스트셀러들을 구매하시고 플레이하세요!</p>
		</div>
	</div>
	<div class="editer_categories">
		<div class="grid-x">
			<c:forEach begin="1" end="5" var="1">
					<div class="category_card"></div>
			</c:forEach>
		</div>
	</div>
	<div id=best-seller class="slider">
            <div>
            	<div class="bar"></div><div class="head-title"><span class="title">최고 인기 게임</span></div>
            </div>
            <div id=best-seller-card-container class="card-container editer-container">
            	<div id=best-seller-prev-btn class="slider-prev-btn inactive">
					<span class="material-symbols-outlined" style="font-size: 48px"> arrow_back_ios </span>
				</div>
                <div class="blank"></div>
                <div class="card">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="card">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="card">
                    <img src="${game_img}/Tekken7/Tekken5.jpg" alt="사진">
                </div>
                <div class="card">
                    <img src="${game_img}/Forza_Horizon/Forza Horzon4.jpg" alt="사진">
                </div>
                <div class="card">
                    <img src="${game_img}/Elden_Ring/EldenRing8.jpeg" alt="사진">
                </div>
                <div class="card">
                    <img src="${game_img}/DarkSouls3/DarkSoul3_5.jpeg" alt="사진">
                </div>
                <div class="card">
                    <img src="${game_img}/CyberPunk/CyberPunk8.jpeg" alt="사진">                  
                </div>
                <div class="card">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="card">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="card">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="card">
                    <img src="${img}/black.png" alt="사진">
                </div>
			<div id=best-seller-next-btn class="slider-next-btn">
				<span class="material-symbols-outlined" style="font-size: 48px"> arrow_forward_ios </span>
			</div>
		</div>
	</div>
	<div class="pre_order">
		<h1 class="section_header title">출시 임박</h1>
			<div class="grid-x">
				<c:forEach begin="1" end="6" var="1">
					<div class="pre_order_card"></div>
				</c:forEach>
			</div>
	</div>
	<div id=week-best-seller class="slider">
            <div>
            	<div class="bar"></div><div><span class="title">이번주 베스트셀러</span></div>
            </div>
            <div id=week-best-seller-card-container class="card-container editer-container">
            	<div id=week-best-seller-prev-btn class="slider-prev-btn inactive">
					<span class="material-symbols-outlined" style="font-size: 48px"> arrow_back_ios </span>
				</div>
                <div class="blank"></div>
                <div class="card">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="card">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="card">
                    <img src="${game_img}/Tekken7/Tekken5.jpg" alt="사진">
                </div>
                <div class="card">
                    <img src="${game_img}/Forza_Horizon/Forza Horzon4.jpg" alt="사진">
                </div>
                <div class="card">
                    <img src="${game_img}/Elden_Ring/EldenRing8.jpeg" alt="사진">
                </div>
                <div class="card">
                    <img src="${game_img}/DarkSouls3/DarkSoul3_5.jpeg" alt="사진">
                </div>
                <div class="card">
                    <img src="${game_img}/CyberPunk/CyberPunk8.jpeg" alt="사진">                  
                </div>
                <div class="card">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="card">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="card">
                    <img src="${img}/black.png" alt="사진">
                </div>
                <div class="card">
                    <img src="${img}/black.png" alt="사진">
                </div>
			<div id=week-best-seller-next-btn class="slider-next-btn">
				<span class="material-symbols-outlined" style="font-size: 48px"> arrow_forward_ios </span>
			</div>
		</div>
	</div>
	<div class="grid_container">
		<div class="filter">
			<div class="filter_header">
				<div class="filter_header_title">
					<h1>필터</h1>
					<div class="search_result">
						<p class="search">검색건수: 100건</p>				
					</div>
				</div>
				<div class="tag_container">
				</div>
			</div>
				<div class="filter_content">
					<button class="filter_toggle">
						<span class="filter_label">개인 맞춤 추천</span> 
						<div class="arrow">
							<span class="material-symbols-outlined">
								expand_less 
							</span>
						</div>
					</button>
					<ul class="filter_list">
						<li class="filter_item">
							<input type="checkbox" value="개인 맞춤 추천"/> 
							<label for="">개인 맞춤 추천</label>
						</li>
					</ul>
				</div>
			<hr />
			<div class="filter_content">
				<button class="filter_toggle">
					<span class="filter_label">장르</span> 
					<div class="arrow">
					<span class="material-symbols-outlined">
						expand_less </span>
					</div>
				</button>
				<ul class="filter_list">
					<li class="filter_item"><input type="checkbox" /></li>
					<li class="filter_item"><input type="checkbox" /></li>
				</ul>
			</div>
			<hr />
				<div class="filter_content">
					<button class="filter_toggle">
						<span class="filter_label">에디터 추천</span> 
						<div class="arrow">
							<span class="material-symbols-outlined">
								expand_less 
							</span>
						</div>
					</button>
					<ul class="filter_list">
						<li class="filter_item"><input type="checkbox" value="Chanwoo's Pick"/> <label
							for="">Chanwoo's Pick</label></li>
						<li class="filter_item"><input type="checkbox" value="youngmin's Pick"/> <label
							for="">youngmin's Pick</label></li>
						<li class="filter_item"><input type="checkbox" value="Loa's Pick"/> <label
							for="">Loa's Pick</label></li>
						<li class="filter_item"><input type="checkbox" value="Jaehun's Pick"/> <label
							for="">Jaehun's Pick</label></li>
						<li class="filter_item"><input type="checkbox" value="Gicheul's Pick"/> <label
							for="">Gicheul's Pick</label></li>
						<li class="filter_item"><input type="checkbox" value="Gitae's Pick"/> <label
							for="">Gitae's Pick</label></li>
					</ul>
			</div>
		</div>
		<div class="primary">
			<div class="sort">
				<div class="sort_by">
					<span class="material-symbols-outlined"> sort </span>
					<label>정렬 기준:</label>
					<div class="sort_by_inner">
						<div class="sort_selector">
							<button class="label">
								<span class="label_text">정렬보기</span>
								<div class="arrow">
									<span class="material-symbols-outlined">
										expand_less 
									</span>								
								</div>
							</button>
							<ul class="option_list">
								<li class="option_item">베스트셀러</li>
								<li class="option_item">출시일</li>
								<li class="option_item">이름순</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="sort_result_content">
				<div class="sort_result_list">
					<c:forEach begin="1" end="10" var="1">
							<div class="sort_result_card"></div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	
	
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp" %>
	<script src="${js1 }"></script>
</body>
</html>