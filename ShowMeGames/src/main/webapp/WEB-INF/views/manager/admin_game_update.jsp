<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url value="/resources/manager" var="resource"/>
<c:url value="/resources/img/games/rated/" var="rated_img"/>
<%
	String[] genreArr = {"RPG", "슈팅", "전략", "호러", "인디", "레이싱", "퍼즐", "시뮬레이션"};
	String[] editorArr = {"curator", "jaehun", "gicheol", "roa", "gitae", "chanwoo", "yeoungmin"};
	String[] platformArr = {"PC", "WiiU", "Mobile", "XBox", "Playstation", "NintendoSwitch"};
	String[] layoutArr = {"LRA", "JYM", "HGT", "KCW", "SJH", "BGC"};
	pageContext.setAttribute("genreArr", genreArr);
	pageContext.setAttribute("editorArr", editorArr);
	pageContext.setAttribute("platformArr", platformArr);
	pageContext.setAttribute("layoutArr", layoutArr);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게임 정보 수정</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/admin_game_update.css">
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
					<h2 class="content_title">게임 정보 수정</h2>
					<div class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>${game.game_id}번 게임 상세 정보 수정</span>
							</div>
							<div class="content_update_wrapper">
								<button onclick="location.href = './admin_game_detail?game_id=${game.game_id}';"
									 class="btn">뒤로가기</button>
							</div>
						</div>
						<div>
							<form action="">
								<div class="input_layer_div">
									<div class="input_container_div">
										<div class="input_title_div">
											<span class="input_title_span">게임명</span>
										</div>
										<div class="input_content_div">
											<input type="text" id="input_game_name" name="game_name" value="${game.game_name}"/>
										</div>
									</div>
								</div>	
								<div class="input_layer_div">
									<div class="input_container_div">
										<div class="input_title_div">
											<span class="input_title_span">원가격</span>
										</div>
										<div class="input_content_div">
											<input type="number" id="input_game_price" name="game_price" value="${game.game_price}"/>
										</div>
									</div>
									<div class="input_container_div">
										<div class="input_title_div">
											<span class="input_title_span">할인율</span>
										</div>
										<div class="input_content_div">
											<input type="number" id="input_discount" name="discount" value="${game.discount}"/>
										</div>
									</div>
									<div class="input_container_div">
										<div class="input_title_div">
											<span class="input_title_span">최종가격</span>
										</div>
										<div class="input_content_div">
											<input id="discounted_price_span" type="number" disabled/>
										</div>
									</div>
								</div>
								<div class="input_layer_div">
									<div class="input_container_div">
										<div class="input_title_div">
											<span class="input_title_span">한국어지원여부</span>
										</div>
										<div id="input_korean_wrapper" class="input_content_div radio" data-korean="${game.korean}">
										    <input type="radio" id="input_korean1" name="korean" value="Y" />
										    <label for="input_korean1">지원</label>
										    <input type="radio" id="input_korean2" name="korean" value="N" />
										    <label for="input_korean2">미지원</label>
										</div>
									</div>
									<div class="input_container_div">
										<div class="input_title_div">
											<span class="input_title_span">게임모드</span>
										</div>
										<div id="input_game_mode_wrapper" class="input_content_div radio" data-mode="${game_mode}">
										    <input type="radio" id="input_game_mode1" name="game_mode" value="싱글" />
										    <label for="input_game_mode1">싱글</label>
										    <input type="radio" id="input_game_mode2" name="game_mode" value="멀티" />
										    <label for="input_game_mode2">멀티</label>
										    <input type="radio" id="input_game_mode3" name="game_mode" value="싱글 멀티" />
										    <label for="input_game_mode3">싱글/멀티</label>
										</div>
									</div>
								</div>
								<div class="input_layer_div">
									<div class="input_container_div">
										<div class="input_title_div">
											<span class="input_title_span">개발사</span>
										</div>
										<div class="input_content_div">
											<input type="text" id="input_develop_company" name="develop_company" value="${game.develop_company}"/>
										</div>
									</div>
								</div>
								<div class="input_layer_div">
									<div class="input_container_div">
										<div class="input_title_div">
											<span class="input_title_span">출시일</span>
										</div>
										<div class="input_content_div">
											<fmt:formatDate value="${game.release_date}" var="release_date" pattern="yyyy-MM-dd"/>
											<input type="date" id="input_release_date" name="release_date"
												 value="${release_date}"/>
										</div>
									</div>
									<div class="input_container_div">
										<div class="input_title_div">
											<span class="input_title_span">평점</span>
										</div>
										<div class="input_content_div">
											<input type="number" id="input_game_grade" name="game_grade" value="${game.game_grade}" step="0.1"/>
										</div>
									</div>
								</div>
								<div class="input_layer_div">
									<div class="input_container_div large">
										<div class="input_title_div">
											<span class="input_title_span">에디터추천</span>
										</div>
										<div id="input_editor_wrapper" class="input_content_div radio" data-mode="${game.editor}">
											<c:forEach items="${editorArr}" var="editor" varStatus="vars">
											    <input type="radio" id="input_editor${vars.count}" name="editor" value="${editor}" />
											    <label for="input_editor${vars.count}">${editor}</label>
											</c:forEach>
										    <input type="radio" id="input_editor8" name="editor" />
										    <label for="input_editor8">없음</label>
										</div>
									</div>
								</div>
								<div class="input_layer_div">
									<div class="input_container_div large">
										<div class="input_title_div">
											<span class="input_title_span">플랫폼</span>
										</div>
										<div class="input_content_div check_box">
											<c:forEach items="${platformArr}" var="platform" varStatus="vars">
												<div>
													<input type="checkbox" id="input_platform${vars.count}" name="platform" value="${platform}" />
													<label for="input_platform${vars.count}">${platform}</label>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="input_layer_div">
									<div class="input_container_div large">
										<div class="input_title_div">
											<span class="input_title_span">장르</span>
										</div>
										<div class="input_content_div check_box">
											<c:forEach items="${genreArr}" var="genre" varStatus="vars">
												<div>
													<input type="checkbox" id="input_game_genre${vars.count}" name="game_genre" value="${genre}" />
													<label for="input_game_genre${vars.count}">${genre}</label>
												</div>
											</c:forEach>
										</div>
									</div>
								</div>
								<div class="input_layer_div">
									<div class="input_container_div large">
										<div class="input_title_div">
											<span class="input_title_span">레이아웃 타입</span>
										</div>
										<div id="input_layout_wrapper" class="input_content_div radio" data-korean="${game.layout}">
										    <input type="radio" id="input_layout1" name="layout" />
										    <label for="input_layout1">기본</label>
										    <c:forEach items="${layoutArr}" var="layout_name" varStatus="vars">
											    <input type="radio" id="input_layout${vars.count + 1}" name="layout" value="${layout_name}" />
											    <label for="input_layout${vars.count + 1}">${layout_name}</label>
										    </c:forEach>
										</div>
									</div>
								</div>
								<div class="input_layer_div">
									<div class="input_container_div large">
										<div class="input_title_div">
											<span class="input_title_span">게임등급</span>
										</div>
										<div id="input_rated_wrapper" class="input_content_div check_box" data-korean="${game.rated}">
											<div>
												<input type="checkbox" id="input_rated1" name="rated" value="0" />
												<label for="input_rated1">
													<img src="${rated_img}${game.rated}.svg" alt="전체이용가_사진"> 
												</label>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script src="${resource}/js/admin_game_update.js"></script>	
</body>
</html>