<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- common url settings 각자 디테일 페이지에 추가해야함 -->
<c:url value="/resources/games/css/detail_common.css"
	var="detail_common_css" />
<c:url value="/resources/games/js/detail_common.js"
	var="detail_common_js" />
<c:url value="/resources/img/games" var="game_img" />
<!-- default resources -->
<c:url value="/resources/games/css/review_all.css" var="review_all_css" />
<c:url value="/resources/games/js/review_all.js" var="review_all_js" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 평가 보기</title>
<!-- header, footer css -->
<%@ include file="/WEB-INF/views/include/link/common.jsp"%>
<!-- common css 각자 디테일 페이지에 추가해야함 -->
<link rel="stylesheet" href="${detail_common_css}">
<!-- default css -->
<link rel="stylesheet" href="${review_all_css}">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	<main class="background_layer1">
		<div class="background_layer2">
			<div id="game_detail_div">
				<div class="title">
					<h3 style="color: #fff; font-size: 30px">
						${game.game_name}
					</h3>
					<button onclick="location.href='./?game=${game.game_id}'">
						게임 페이지
					</button>
				</div>
				<div class="game_detail_divs" id="game_detail_comment_div">
					<div id="comment_cnt">리뷰 (총 ${comment_len}개)</div>
					<c:choose>
						<c:when test="${comment_len > 0}">
							<div id="comment_grid">
									<c:forEach items="${comments}" var="com">
										<div class="comment_div">
											<div class="comment_div_left">
												<div>
													<img class="comment_user_profile" alt="유저의 프로필"
														src="/smg${com.profile_url}">
												</div>
												<div class="comment_user_nick_div">
													<div class="comment_user_grade">
														<c:choose>
															<c:when test="${com.user_grade eq 'S'}">
																<div class="profile-grade">
																	<img class="comment-grade-image"
																		src="${member_img}/grade/diamond_icon.png"
																		alt="다이아몬드 이미지">
																</div>
															</c:when>
															<c:when test="${com.user_grade eq 'A'}">
																<div class="profile-grade">
																	<img class="comment-grade-image"
																		src="${member_img}/grade/platinum_icon.png"
																		alt="플래티넘 이미지">
																</div>
															</c:when>
															<c:when test="${com.user_grade eq 'B'}">
																<div class="profile-grade">
																	<img class="comment-grade-image"
																		src="${member_img}/grade/gold_icon.png" alt="골드 이미지">
																</div>
															</c:when>
															<c:when test="${com.user_grade eq 'C'}">
																<div class="profile-grade">
																	<img class="comment-grade-image"
																		src="${member_img}/grade/silver_icon.png" alt="실버 이미지">
																</div>
															</c:when>
															<c:when test="${com.user_grade eq 'D'}">
																<div class="profile-grade">
																	<img class="comment-grade-image"
																		src="${member_img}/grade/bronze_icon.png" alt="등급 이미지">
																</div>
															</c:when>
														</c:choose>
													</div>
													<div class="comment_user_nick">${com.nick_name}</div>
												</div>
											</div>
											<div class="comment_div_right">
												<div class="comment_write_date">
													게시 일시:
													<fmt:formatDate pattern="yyyy. MM. dd"
														value="${com.write_date}" />
												</div>
												<div class="comment_content">${com.comment_content}</div>
											</div>
											<div class="up_down_div">
												<div class="up_btn">
													<span id="thumb_up"
														class="material-symbols-outlined up_down_btn">thumb_up</span>
													0
												</div>
												<div class="down_btn">
													<span id="thumb_down"
														class="material-symbols-outlined up_down_btn">thumb_down</span>
													0
												</div>
											</div>
										</div>
									</c:forEach>
							</div>
						</c:when>
						<c:otherwise>
							<div class="comment_grid_title">아직 리뷰가 없습니다.</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</main>
	
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<script src="${review_all_js }"></script>
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
</body>
</html>