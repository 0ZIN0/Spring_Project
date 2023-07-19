<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="resources/games/css/games.css" var="css1" />
<c:url value="resources/index/css/index.css" var="css2" />
<c:url value="resources/games/js/games.js" var="js1" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 게임 보기</title>
<link rel="stylesheet" href="${css1}">
<link rel="stylesheet" href="${css2}">
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
	<div class="best_seller">
		<h1 class="section_header">최고 인기작 게임입니다!</h1>
			<div class="grid-x">
				<c:forEach begin="1" end="8" var="1">
					<div class="best_seller_card"></div>
				</c:forEach>
			</div>
	</div>
	<div class="pre_order">
		<h1 class="section_header">출시 임박</h1>
			<div class="grid-x">
				<c:forEach begin="1" end="6" var="1">
					<div class="pre_order_card"></div>
				</c:forEach>
			</div>
	</div>
	<div class="week_best_seller">
		<h1 class="section_header">이번주 베스트 셀러</h1>
		<div class="grid-x">
			<c:forEach begin="1" end="8" var="1">
					<div class="weekly_card"></div>
			</c:forEach>
		</div>
	</div>
	<div class="grid_container">
		<div class="filter">
			<div class="filter_header">
				<h1>필터</h1>
				<div>
					<p class="search">검색건수: 100건</p>				
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
						<li class="filter_item"><input type="checkbox" /> <label
							for="">개인 맞춤 추천</label></li>
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
						<li class="filter_item"><input type="checkbox" /> <label
							for="">Chanwoo's Pick</label></li>
						<li class="filter_item"><input type="checkbox" /> <label
							for="">youngmin's Pick</label></li>
						<li class="filter_item"><input type="checkbox" /> <label
							for="">Loa's Pick</label></li>
						<li class="filter_item"><input type="checkbox" /> <label
							for="">Jaehun's Pick</label></li>
						<li class="filter_item"><input type="checkbox" /> <label
							for="">Gicheul's Pick</label></li>
						<li class="filter_item"><input type="checkbox" /> <label
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
	<script src="${js1 }"></script>
</body>
</html>