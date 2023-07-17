<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="resources/games/css/games.css" var="css1" />
<c:url value="resources/games/js/games.js" var="js1" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 게임 보기</title>
<link rel="stylesheet" href="${css1}">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp" %>
	<div class="games_banner">배너</div>
	<div class="editer_categories">에디터 픽</div>
	<h1>최고 인기작 게임입니다!</h1>
	<div class="best_seller">베스트 셀러</div>
	<h1>출시 임박</h1>
	<div class="pre_order">출시임박</div>
	<h1>이번주 베스트 셀러</h1>
	<div class="week_best_seller">이번주 베스트 셀러</div>
	<div class="grid_container">
		<div class="filter">
			<div class="filter_header">필터</div>
			<div>
				<button class="filter_toggle">
					<span>개인 맞춤 추천</span>
					<span class="material-symbols-outlined">
						expand_less 
					</span>
				</button>
				<div class="filter_content">
					<ul class="filter_list">
						<li><input type="checkbox" /></li>
					</ul>
				</div>
			</div>
			<hr />
			<div>
				<button class="filter_toggle">
					<span>장르</span>
					<span class="material-symbols-outlined">
						expand_less 
					</span>
				</button>
				<div class="filter_content">
					<ul class="filter_list">
						<li>
							<input type="checkbox" />
						</li>
						<li>
							<input type="checkbox" />
						</li>
					</ul>
				</div>
			</div>
			<hr />
			<div>
				<button class="filter_toggle">
					<span>에디터 추천</span>
					<span class="material-symbols-outlined">
						expand_less 
					</span>
				</button>
				<div class="filter_content">
					<ul class="filter_list">
						<li>
							<input type="checkbox" />
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="primary">
			<div class="sort">
				<div class="sort_by">
					<span class="material-symbols-outlined"> sort </span>
					<label>정렬 기준:</label>
					<div class="sort_by_inner">
						<div class="sort_selector">
								<span>베스트셀러</span>
							<div class="selector_items">
								<ul>
									<li>베스트셀러</li>
									<li>출시일</li>
									<li>이름순</li>
								</ul>
							</div>				
						</div>
					</div>
				</div>
			</div>
			<div class="sort_result_content">
				<ul class="card_list">
					<c:forEach begin="1" end="10" var="1">
						<li>
							<div class="card">
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>

	
	
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
	<script src="${js1 }"></script>
</body>
</html>