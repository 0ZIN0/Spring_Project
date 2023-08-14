<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/manager" var="resource"/>
<c:url value="/resources/img/games/rated/" var="rated_img"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>게임 추가</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/admin_game_add.css">
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
					<h2 class="content_title">게임 추가</h2>
					<div class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>게임 추가하기</span>
							</div>
							<div class="content_update_wrapper">
								<button class="btn cancel">뒤로가기</button>
							</div>
						</div>
						<div id="game_add_wrapper">
						<div class="input_layer_div">
								<div class="input_container_div">
									<div class="input_title_div">
										<span class="input_title_span">게임명</span>
									</div>
									<div class="input_content_div">
										<input type="text" id="input_game_name" name="game_name" form="game_add_form" required/>
									</div>
								</div>
							</div>	
							<div class="input_layer_div">
								<div class="input_container_div">
									<div class="input_title_div">
										<span class="input_title_span">원가격</span>
									</div>
									<div class="input_content_div">
										<input type="number" id="input_game_price" name="game_price" min="0" form="game_add_form" required/>
									</div>
								</div>
								<div class="input_container_div">
									<div class="input_title_div">
										<span class="input_title_span">할인율</span>
									</div>
									<div class="input_content_div">
										<input type="number" id="input_discount" name="discount" min="0" max="100" form="game_add_form" required/>
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
								<div id="input_korean_container" class="input_container_div">
									<div class="input_title_div">
										<span class="input_title_span">한국어지원여부</span>
									</div>
									<div id="input_korean_wrapper" class="input_content_div radio">
									    <input type="radio" id="input_korean1" name="korean" value="Y" form="game_add_form" required/>
									    <label for="input_korean1">지원</label>
									    <input type="radio" id="input_korean2" name="korean" value="N" form="game_add_form"/>
									    <label for="input_korean2">미지원</label>
									</div>
								</div>
								<div id="input_game_mode_container" class="input_container_div">
									<div class="input_title_div">
										<span class="input_title_span">게임모드</span>
									</div>
									<div id="input_game_mode_wrapper" class="input_content_div radio">
									    <input type="radio" id="input_game_mode1" name="game_mode" value="싱글" form="game_add_form" required/>
									    <label for="input_game_mode1">싱글</label>
									    <input type="radio" id="input_game_mode2" name="game_mode" value="멀티" form="game_add_form"/>
									    <label for="input_game_mode2">멀티</label>
									    <input type="radio" id="input_game_mode3" name="game_mode" value="싱글 멀티" form="game_add_form"/>
									    <label for="input_game_mode3">싱글/멀티</label>
									</div>
								</div>
							</div>
							<div class="input_layer_div">
								<div id="input_develop_container" class="input_container_div">
									<div class="input_title_div">
										<span class="input_title_span">개발사</span>
									</div>
									<div class="input_content_div">
										<input type="text" id="input_develop_company" name="develop_company" form="game_add_form" required/>
									</div>
								</div>
								<div id="input_release_date_container" class="input_container_div">
									<div class="input_title_div">
										<span class="input_title_span">출시일</span>
									</div>
									<div class="input_content_div">
										<input type="date" id="input_release_date" name="release_date" form="game_add_form" required/>
									</div>
								</div>
								<div id="input_game_grade_container" class="input_container_div">
									<div class="input_title_div">
										<span class="input_title_span">평점</span>
									</div>
									<div id="input_game_grade_content" class="input_content_div">
										<input type="number" id="input_game_grade" name="game_grade" step="0.1" max="5.0" min="0" form="game_add_form" required/>
										<div class="stararea_wrapper">
											<span id="starpoint" class="starpoint" >★★★★★</span>
										</div>
									</div>
								</div>
							</div>
							<div class="input_layer_div">
								<div class="input_container_div large">
									<div class="input_title_div">
										<span class="input_title_span">에디터추천</span>
									</div>
									<div id="input_editor_wrapper" class="input_content_div radio">
										<c:forEach items="${editorArr}" var="editor" varStatus="vars">
										    <input type="radio" id="input_editor${vars.count}" name="editor" value="${editor}" form="game_add_form"/>
										    <label for="input_editor${vars.count}">${editor}</label>
										</c:forEach>
									    <input type="radio" id="input_editor8" name="editor" form="game_add_form" required/>
									    <label for="input_editor8">없음</label>
									</div>
								</div>
							</div>
							<div class="input_layer_div">
								<div class="input_container_div large">
									<div class="input_title_div">
										<span class="input_title_span">플랫폼</span>
									</div>
									<div id="input_platform_wrapper" class="input_content_div check_box">
										<c:forEach items="${platformArr}" var="platform" varStatus="vars">
											<div>
												<input type="checkbox" id="input_platform${vars.count}" name="platform_piece" value="${platform}"/>
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
									<div id="input_genre_wrapper" class="input_content_div check_box">
										<c:forEach items="${genreArr}" var="genre" varStatus="vars">
											<div>
												<input type="checkbox" id="input_game_genre${vars.count}" name="game_genre_piece" value="${genre}"/>
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
									<div id="input_layout_wrapper" class="input_content_div radio">
									    <input type="radio" id="input_layout1" name="layout" form="game_add_form" required/>
									    <label for="input_layout1">기본</label>
									    <c:forEach items="${layoutArr}" var="layout_name" varStatus="vars">
										    <input type="radio" id="input_layout${vars.count + 1}" name="layout" value="${layout_name}" form="game_add_form"/>
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
									<div id="input_rated_wrapper" class="input_content_div check_box">
										<c:forEach items="${ratedArr}" var="rated" varStatus="vars">
											<div>
												<input type="checkbox" id="input_rated${vars.count}" name="rated_piece" value="${rated}"/>
												<label for="input_rated${vars.count}">
													<img src="${rated_img}${rated}.svg" alt="${rated}_사진"> 
												</label>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
							<div class="input_layer_div">
								<div class="input_container_div large">
									<div class="input_title_div">
										<span class="input_title_span">게임 배너 사진 수정</span>
									</div>
									<div id="input_file_container">
										<div>
											<div id="input_banner_img_wrapper" class="input_content_div">
												<input type="file" id="img_file" name="img_file" accept="image/jpg, image/jpeg, image/png" form="game_add_form" required>
											</div>
											<div class="desc_span_div">
												<span class="desc_span">※ 섬네일을 반드시 등록해야 합니다</span>
												<span class="desc_span">※ 파일명은 한 번 등록하면 변경할 수 없습니다.</span>
												<span class="desc_span">※ 선택가능 확장자 ".jpg, .jpeg, .png"</span>
												<span class="desc_span">※ 변경할 파일명은 확장자 없이 이름만 입력하세요</span>
											</div>
											<div id="input_file_name_wrapper">
												<input type="text" id="img_file_name" name="file_name" form="game_add_form" placeholder="파일명을 입력하세요..." required/>
											</div>
										</div>
										<div>
											<div id="thumbnail_container">
												<span id="thumbnail_title">이미지 미리보기(350 x 300)</span>
												<img id="img_preview" src="" alt="미리보기_이미지">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="input_layer_div">
								<div id="final_btn_div">
									<button class="btn cancel">취소</button>
									<button type="submit" class="btn" form="game_add_form">추가</button>
								</div>
							</div>
							<form id="game_add_form" action="./admin_game_add" method="POST" enctype="multipart/form-data">
								<input type="hidden" id="hidden_platform" name="platform"/>
								<input type="hidden" id="hidden_genre" name="game_genre"/>
								<input type="hidden" id="hidden_rated" name="rated"/>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<script src="${resource}/js/admin_game_add.js"></script>
</body>
</html>