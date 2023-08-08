<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:url value="../resources/games/css/games.css" var="css1" />
<c:url value="../resources/games/js/games.js" var="js1" />
<c:url value="../resources/games/js/category.js" var="js2" />
<c:url value="../resources/img/index" var="img"/>
<c:url value="../resources/img/index/games" var="game_img"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 게임 보기</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
<link rel="stylesheet" href="${css1}">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp" %>
	<div class="background_layer1">
	<div class="background_layer2">
	<div class="games_banner">
				<div class="banner_textbox">
					<h3>무료 게임</h3>
					<p>무료가 최고입니다! SMG의 무료 게임들을 살펴보세요!</p>
				</div>
			</div>
	<div class="grid_container">
		<div class="secondary">
			<div class="filter">
				<div class="filter_header">
					<div class="filter_header_title">
						<h1>무료 게임</h1>
						<div class="search_result">
							<p class="search">검색건수: ${fn:length(games)}건</p>				
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
								<input type="checkbox" value="개인맞춤추천"/> 
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
					<ul class="filter_list genre-list">
						<li class="filter_item genre"><input type="checkbox" value="RPG"/><label for="">RPG</label></li>
						<li class="filter_item genre"><input type="checkbox" value="슈팅"/><label for="">슈팅</label></li>
						<li class="filter_item genre"><input type="checkbox" value="전략"/><label for="">전략</label></li>
						<li class="filter_item genre"><input type="checkbox" value="시뮬레이션"/><label for="">시뮬레이션</label></li>
						<li class="filter_item genre"><input type="checkbox" value="인디"/><label for="">인디</label></li>
						<li class="filter_item genre"><input type="checkbox" value="레이싱"/><label for="">레이싱</label></li>
						<li class="filter_item genre"><input type="checkbox" value="퍼즐"/><label for="">퍼즐</label></li>
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
						<ul class="filter_list editor-list">
							<li class="filter_item editor"><input type="checkbox" value="chanwoo"/> <label
								for="">Chanwoo's Pick</label></li>
							<li class="filter_item editor"><input type="checkbox" value="yeoungmin"/> <label
								for="">Yeoungmin's Pick</label></li>
							<li class="filter_item editor"><input type="checkbox" value="roa"/> <label
								for="">Roa's Pick</label></li>
							<li class="filter_item editor"><input type="checkbox" value="jaehun"/> <label
								for="">Jaehun's Pick</label></li>
							<li class="filter_item editor"><input type="checkbox" value="gicheul"/> <label
								for="">Gicheul's Pick</label></li>
							<li class="filter_item editor"><input type="checkbox" value="gitae"/> <label
								for="">Gitae's Pick</label></li>
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
							<button class="label">
								<span class="label_text">정렬보기</span>
								<div class="arrow">
									<span class="material-symbols-outlined">
										expand_less 
									</span>								
								</div>
							</button>
							<ul class="option_list">
								<li class="option_item" value="1">베스트셀러</li>
								<li class="option_item" value="2">출시일</li>
								<li class="option_item" value="3">이름순</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="sort_result_content">
				<div class="sort_result_list">
				<c:choose>
 					 <c:when test="${games != null and not empty games}">
					<c:forEach items="${games}" var="game">
						<div class="recmd-items toDetailBtn" data-id="${game.game_id}" data-layout="${game.layout}">
							<div>
								<img src="../${game.banner_img_url}" alt="${game.game_name}_배너사진">
							</div>
							<div class="item_text_box">
								<div>
									<span class="game_title">${game.game_name}</span>
								</div>
								<c:choose>
									<c:when test="${game.game_price == 0}">
										<div>
										</div>
										<div>
											<span></span>
											<span>무료</span>
										</div>
									</c:when>
									<c:when test="${game.discount == 0}">
										<div>
										</div>
										<div>
											<span></span>	
											<span>
												₩<fmt:formatNumber type="number"
														maxFractionDigits="3" value="${game.discounted_price}" />
											</span>
										</div>	
									</c:when>
									<c:otherwise>
										<div>
											<span>-${game.discount}%</span>	
										</div>
										<div>
											<span>
												₩<fmt:formatNumber type="number" maxFractionDigits="3"
													value="${game.game_price}" />	
											</span>
											<span>
												₩<fmt:formatNumber type="number"
														maxFractionDigits="3" value="${game.discounted_price}" />
											</span>
										</div>	
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</c:forEach>
			  	</c:when>
			  <c:otherwise>
				<span style="color: #fff; font-size: 30px;">검색 결과가 없습니다.</span>
			  </c:otherwise>
			</c:choose>
				</div>
			</div>
		</div>
	</div>	
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp" %>
	</div>
	</div>
	<script src="${js1 }"></script>
	<script src="${js2 }"></script>
</body>
</html>