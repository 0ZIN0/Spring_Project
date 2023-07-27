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
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>

	<div id="main" class="background_layer1">
		<div class="background_layer2">
			<div id="mainBanner" class="banner">
				<div>
					<div>
						<img src="${img}/Forza-horizon-5 1.png" alt="배너문구">
					</div>
				</div>
				<img src="${img}/HomeHero_SummerSale-June23_desk 1.png" alt="배너사진">
			</div>
			<div id="newGame">
				<div>
					<div id="newGame_title">
						<span class="title">최신 게임.</span><span class="sub-title"> 따끈따끈한 새 게임의 세계로.</span>
					</div>
					<div id="newGame_container">
						<c:forEach begin="1" end="4" varStatus="status">
							<div class="newgames">
								<img src="${img}/temp/best${status.count}.png" alt="사진${status.count}">
							</div>
						</c:forEach>
					</div>
				</div>
			</div>

			<div id="subBanner" class="banner">
				<img src="${img}/Rectangle 50.png" alt="서브배너사진">
			</div>

			<div class="recmd">
				<div class="title_div">
					<span class="title">에디터 추천. </span><span class="sub-title">나만 알기에는 너무 아까운 게임.</span>
				</div>
				<div class="card-container">
					<div class="slider-prev-btn inactive">
						<i class="material-icons" id="editer-prev-button"
							style="font-size: 48px;">arrow_back_ios_new</i>
					</div>
					<div class="blank"></div>
					<c:forEach begin="1" end="10">
						<div class="recmd-items">
							<div>
								<img src="${img}/temp/temp2.png" alt="사진">
							</div>
							<div class="item_text_box">
								<div>
									<span class="game_title">로렘 Ipsum</span>
								</div>
								<div>
									<span>-50%</span>
								</div>
								<div>
									<span>₩18,000</span><span>₩9,000</span>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="slider-next-btn">
						<i class="material-icons" id="editer-next-button"
							style="font-size: 48px;">arrow_forward_ios</i>
					</div>
				</div>
			</div>

			<div class="recmd">
				<div class="title_div"> 
					<span class="title">파격 할인. </span> <span class="sub-title">놓치지 않을거에요.</span>
				</div>
				<div class="card-container">
					<div class="slider-prev-btn inactive">
						<i class="material-icons" id="cms-prev-button"
							style="font-size: 48px;">arrow_back_ios_new</i>
					</div>
					<div class="blank"></div>
					<c:forEach begin="1" end="8">
						<div class="recmd-items">
							<div>
								<img src="${img}/temp/temp1.png" alt="사진">
							</div>
							<div class="item_text_box">
								<div>
									<span class="game_title">로렘 Ipsum</span>
								</div>
								<div>
									<span>-50%</span>
								</div>
								<div>
									<span>₩18,000</span><span>₩9,000</span>
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="slider-next-btn">
						<i class="material-icons" id="cms-next-button"
							style="font-size: 48px;">arrow_forward_ios</i>
					</div>
				</div>
			</div>

			<div id="genre" class="recmd">
				<div class="title_div">
					<span class="title">장르별로 살펴보기.</span>
				</div>
				<div id="genre-div">
					<div class="btn">
						<i class="material-icons" id="genre-prev-button"
							style="font-size: 48px;">arrow_back_ios_new</i>
					</div>
					<div id="genre-container" data-imgurl="${img}/genre">
						<div class="genres" style="background-image: url(${img}/genre/genre1.png;">
							<span>캐주얼</span>
						</div>
						<div class="genres" style="background-image: url(${img}/genre/genre2.png;">
							<span>전략/시뮬</span>
						</div>
						<div class="genres" style="background-image: url(${img}/genre/genre3.png;">
							<span>RPG</span>
						</div>
						<div class="genres" style="background-image: url(${img}/genre/genre4.png;">
							<span>퍼즐</span>
						</div>
					</div>
					<div class="btn">
						<i class="material-icons" id="genre-next-button"
							style="font-size: 48px;">arrow_forward_ios</i>
					</div>
				</div>
			</div>
			
			<div id="hotgame_container">
				<div>
					<div class="title_div">
						<span class="title">이번주 HOT 게임. </span><span class="sub-title">수
							많은 플레이어가 선택한 게임. </span>
					</div>
					<div id="hotgame_content">
						<div class="game_item">
							<div>
								<img src="${img}/temp/Img1.png" alt="임시사진">
							</div>
							<div class="item_text_box">
								<div>
									<span class="game_title">title</span>
								</div>
								<div>
									<span>-50%</span>
								</div>
								<div>
									<span>₩18,000</span><span>₩9,000</span>
								</div>
							</div>
						</div>
						<div class="game_item">
							<div>
								<img src="${img}/temp/Img2.png" alt="임시사진2">
							</div>
							<div class="item_text_box">
								<div>
									<span class="game_title">title</span>
								</div>
								<div>
									<span>-50%</span>
								</div>
								<div>
									<span>₩18,000</span> <span>₩9,000</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<div id="curator" class="recmd">
				<div> 
					<div class="title_div">
						<span class="title">큐레이터 추천. </span><span class="sub-title">몰랐던 띵작들을 만나보세요. </span>
					</div>
					<div id="curator-content">
						<div class="game_item">
							<div>
								<img src="${img}/temp/Img1.png" alt="임시사진">
							</div>
							<div class="item_text_box">
								<div>
									<span class="game_title">title</span>
								</div>
								<div>
									<span>-50%</span>
								</div>
								<div>
									<span>₩18,000</span><span>₩9,000</span>
								</div>
							</div>
						</div>
						<div class="game_item">
							<div>
								<img src="${img}/temp/Img1.png" alt="임시사진">
							</div>
							<div class="item_text_box">
								<div>
									<span class="game_title">title</span>
								</div>
								<div>
									<span>-50%</span>
								</div>
								<div>
									<span>₩18,000</span><span>₩9,000</span>
								</div>
							</div>
						</div>
						<div class="game_item">
							<div>
								<img src="${img}/temp/Img1.png" alt="임시사진">
							</div>
							<div class="item_text_box">
								<div>
									<span class="game_title">title</span>
								</div>
								<div>
									<span>-50%</span>
								</div>
								<div>
									<span>₩18,000</span><span>₩9,000</span>
								</div>
							</div>
						</div>
						<div class="game_item">
							<div>
								<img src="${img}/temp/Img1.png" alt="임시사진">
							</div>
							<div class="item_text_box">
								<div>
									<span class="game_title">title</span>
								</div>
								<div>
									<span>-50%</span>
								</div>
								<div>
									<span>₩18,000</span><span>₩9,000</span>
								</div>
							</div>
						</div>
						<div class="game_item">
							<div>
								<img src="${img}/temp/Img1.png" alt="임시사진">
							</div>
							<div class="item_text_box">
								<div>
									<span class="game_title">title</span>
								</div>
								<div>
									<span>-50%</span>
								</div>
								<div>
									<span>₩18,000</span><span>₩9,000</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>
	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp" %>
	<script src="./resources/index/js/index.js"></script>
</body>
</html>