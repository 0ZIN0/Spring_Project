<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/resources/manager" var="resource"/>
<c:url value="/resources/img/games/rated/" var="rate_img"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게임 상세 정보 보기</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/admin_game_detail.css">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp" %>
	
	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp" %>
			<div id="main_content">
				<div id="account_content">
					<h2 class="content_title">게임 상세 정보</h2>
					<div class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>${game.game_id}번 게임</span>
							</div>
							<div class="content_update_wrapper">
								<button onclick="location.href = './admin_game_update?game_id=${game.game_id}';"
									 class="btn">수정</button>
							</div>
						</div>
						<div id="content_container_wrapper">
							<div class="item_layer_div item2">
								<div class="item_div">
									<span class="item_span_title">게임명</span>
									<span id="game_title" class="item_span_content">${game.game_name}</span>
								</div>
								<div class="item_div">
									<div class="game_detail_img_div">
										<img src="${pageContext.request.contextPath}/${game.banner_img_url}" alt="${game.game_name}_섬네일">
									</div>
								</div>
							</div>
							<div class="item_layer_div item3">
								<div class="item_div">
									<span class="item_span_title">원가격</span>
									<span class="item_span_content">${game.game_price}원</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">할인율</span>
									<span class="item_span_content">${game.discount}%</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">최종가격</span>
									<span class="item_span_content">${game.discounted_price}원</span>
								</div>
							</div>
							<div class="item_layer_div item3">
								<div class="item_div">
									<span class="item_span_title">장르</span>
									<span class="item_span_content">${game.game_genre}</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">주의표기</span>
									<div id="rate_container">
										<c:forEach items="${rated}" var="rate">
											<div class="rate_div">
												<img src="${rate_img}${rate}.svg" alt="${rate}_이미지"> 
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="item_layer_div item3">
								<div class="item_div">
									<span  class="item_span_title">한국어지원</span>
									<span class="item_span_content">${game.korean}</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">출시일</span>
									<span class="item_span_content">
										<fmt:formatDate value="${game.release_date}" pattern="yyyy년 MM월 dd일"/>	
									</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">지원 플랫폼</span>
									<span class="item_span_content">${game.platform}</span>
								</div>
							</div>
							<div class="item_layer_div item3">
								<div class="item_div">
									<span class="item_span_title">게임모드(싱글/멀티)</span>
									<span class="item_span_content">${game.game_mode}</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">개발사</span>
									<span class="item_span_content">${game.develop_company}</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">별점(5점 기준)</span>
									<div class="stararea_wrapper">
										<div class="stararea">
											<span class="starpoint" style="width: ${100 * game.game_grade/5}%;">
												★★★★★
											</span>
										</div>
										<span>(${game.game_grade})</span>	
									</div>
								</div>
							</div>
							<div class="item_layer_div">
								<div class="item_div">
									<span class="item_span_title">섬네일</span>
									<span class="item_span_content">${game.banner_img_url}</span>
								</div>
							</div>
							<div class="item_layer_div item3">
								<div class="item_div">
									<span class="item_span_title">편집자 추천</span>
									<span class="item_span_content">${game.editor}</span>
								</div>
								<div class="item_div">
									<span class="item_span_title">게임페이지 표시타입</span>
									<span class="item_span_content">${game.layout}</span>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
</body>
</html>