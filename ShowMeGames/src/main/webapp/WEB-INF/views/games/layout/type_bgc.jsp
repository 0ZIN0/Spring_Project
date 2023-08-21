<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- common url settings 각자 디테일 페이지에 추가해야함 -->
<c:url value="/resources/games/css/detail_common.css" var="detail_common_css" />
<c:url value="/resources/games/js/detail_common.js" var="detail_common_js" />
<c:url value="/resources/games/css/type_bgc.css" var="type_bgc_css" />
<c:url value="/resources/games/js/type_bgc.js" var="type_bgc_js" />
<c:url value="/resources/img/games/gicheol/" var="img_path"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${game.game_name}</title>
<!-- header, footer css -->
<%@ include file="/WEB-INF/views/include/link/common.jsp"%>
<!-- common css 각자 디테일 페이지에 추가해야함 -->
<link rel="stylesheet" href="${detail_common_css}">
<link rel="stylesheet" href="${type_bgc_css}">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	<main class="background_layer1">
		<div class="background_layer2">
			<div id="game_detail_div">
				<%@ include file="/WEB-INF/views/games/include/detail_top.jsp"%>
				<!-- 아래부터는 free layout -->
					<!-- 리뷰 -->
						<div class="game_detail_divs" id="game_detail_comment_div"
							data-gab="${my_gab_list}" data-status="${my_status_list}">
							<c:choose>
								<c:when test="${is_use == true}">
							<div id="my_com_grid" class="comment_cnt">MY 리뷰</div>
									<c:choose>
										<c:when test="${empty my_com}">
											<form action="" method="POST">
												<div id="my_comment_grid">
													<div class="comment_div_left">
														<div>
															<img class="comment_user_profile" alt="유저의 프로필"
																src="/smg${user.profile_url}">
														</div>
														<div class="comment_user_nick_div">
															<div class="comment_user_grade">
																<c:choose>
																	<c:when test="${user.user_grade eq 'S'}">
																		<div class="profile-grade">
																			<img class="comment-grade-image"
																				src="${member_img}/grade/diamond_icon.png"
																				alt="다이아몬드 이미지">
																		</div>
																	</c:when>
																	<c:when test="${user.user_grade eq 'A'}">
																		<div class="profile-grade">
																			<img class="comment-grade-image"
																				src="${member_img}/grade/platinum_icon.png"
																				alt="플래티넘 이미지">
																		</div>
																	</c:when>
																	<c:when test="${user.user_grade eq 'B'}">
																		<div class="profile-grade">
																			<img class="comment-grade-image"
																				src="${member_img}/grade/gold_icon.png" alt="골드 이미지">
																		</div>
																	</c:when>
																	<c:when test="${user.user_grade eq 'C'}">
																		<div class="profile-grade">
																			<img class="comment-grade-image"
																				src="${member_img}/grade/silver_icon.png"
																				alt="실버 이미지">
																		</div>
																	</c:when>
																	<c:when test="${user.user_grade eq 'D'}">
																		<div class="profile-grade">
																			<img class="comment-grade-image"
																				src="${member_img}/grade/bronze_icon.png"
																				alt="등급 이미지">
																		</div>
																	</c:when>
																</c:choose>
															</div>
															<div class="comment_user_nick">${user.nick_name}</div>
														</div>
													</div>
													<div class="comment_div_right">
														<input type="hidden" name="comment_id" value="${my_com.comment_id}" />
														<textarea id="input_comment_content"
															name="comment_content" placeholder="리뷰를 작성하세요."></textarea>
													</div>
													<div id="comment_submit_div">
														<button type="submit" id="comment_submit_btn">등록</button>
													</div>
												</div>
											</form>
										</c:when>
										<c:otherwise>
											<div class="my_comment_div">
												<div class="comment_div_left">
													<div>
														<img class="comment_user_profile" alt="유저의 프로필"
															src="/smg${my_com.profile_url}">
													</div>
													<div class="comment_user_nick_div">
														<div class="comment_user_grade">
															<c:choose>
																<c:when test="${my_com.user_grade eq 'S'}">
																	<div class="profile-grade">
																		<img class="comment-grade-image"
																			src="${member_img}/grade/diamond_icon.png"
																			alt="다이아몬드 이미지">
																	</div>
																</c:when>
																<c:when test="${my_com.user_grade eq 'A'}">
																	<div class="profile-grade">
																		<img class="comment-grade-image"
																			src="${member_img}/grade/platinum_icon.png"
																			alt="플래티넘 이미지">
																	</div>
																</c:when>
																<c:when test="${my_com.user_grade eq 'B'}">
																	<div class="profile-grade">
																		<img class="comment-grade-image"
																			src="${member_img}/grade/gold_icon.png" alt="골드 이미지">
																	</div>
																</c:when>
																<c:when test="${my_com.user_grade eq 'C'}">
																	<div class="profile-grade">
																		<img class="comment-grade-image"
																			src="${member_img}/grade/silver_icon.png"
																			alt="실버 이미지">
																	</div>
																</c:when>
																<c:when test="${my_com.user_grade eq 'D'}">
																	<div class="profile-grade">
																		<img class="comment-grade-image"
																			src="${member_img}/grade/bronze_icon.png"
																			alt="등급 이미지">
																	</div>
																</c:when>
															</c:choose>
														</div>
														<div class="comment_user_nick">${my_com.nick_name}</div>
													</div>
												</div>
												<div class="comment_div_right my_com_div_right">
													<div class="comment_write_date">
														게시 일시:
														<fmt:formatDate pattern="yyyy. MM. dd"
															value="${my_com.write_date}" />
													</div>
													<div class="comment_content my_com_content">${my_com.comment_content}</div>
												</div>
												<div class="up_down_div my_com_gab_div">
													<div class="up_btn good-${my_com.comment_id}"
														data-id="${my_com.comment_id}">
														<span data-id="${my_com.comment_id}" id="thumb_up"
															class="material-symbols-outlined up_down_btn">thumb_up</span>
														<span class="gab_btn g-${my_com.comment_id}">
															${my_com.good_cnt} </span>
													</div>
													<div class="down_btn bad-${my_com.comment_id}"
														data-id="${my_com.comment_id}">
														<span data-id="${my_com.comment_id}" id="thumb_down"
															class="material-symbols-outlined up_down_btn">thumb_down</span>
														<span class="gab_btn b-${my_com.comment_id}">
															${my_com.bad_cnt} </span>
													</div>
												</div>
												<div id="my_com_btns_div">
													<button class="my_com_btn" id="my_com_update_btn"><span class="my_com_btns material-symbols-outlined">edit</span></button>
													<button data-game="${param.game}" data-layout="${param.layout}" data-content="${my_com.comment_content}" data-comid="${my_com.comment_id}" class="my_com_btn" id="my_com_delete_btn"><span class="my_com_btns material-symbols-outlined">close</span></button>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:when>
							</c:choose>
							<div class="comment_cnt">리뷰 (총 ${comment_len}개)</div>
							<c:choose>
								<c:when test="${comment_len > 0}">
									<div id="comment_grid">
										<div id="comment_best_grid">
											<div class="comment_grid_title">베스트 리뷰</div>
											<c:choose>
												<c:when test="${best_comment_len > 0}">
													<c:forEach items="${best_comments}" var="com">
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
																						src="${member_img}/grade/gold_icon.png"
																						alt="골드 이미지">
																				</div>
																			</c:when>
																			<c:when test="${com.user_grade eq 'C'}">
																				<div class="profile-grade">
																					<img class="comment-grade-image"
																						src="${member_img}/grade/silver_icon.png"
																						alt="실버 이미지">
																				</div>
																			</c:when>
																			<c:when test="${com.user_grade eq 'D'}">
																				<div class="profile-grade">
																					<img class="comment-grade-image"
																						src="${member_img}/grade/bronze_icon.png"
																						alt="등급 이미지">
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
																<div class="up_btn good-${com.comment_id}"
																	data-id="${com.comment_id}">
																	<span data-id="${com.comment_id}" id="thumb_up"
																		class="material-symbols-outlined up_down_btn">thumb_up</span>
																	<span class="gab_btn g-${com.comment_id}">
																		${com.good_cnt} </span>
																</div>
																<div class="down_btn bad-${com.comment_id}"
																	data-id="${com.comment_id}">
																	<span data-id="${com.comment_id}" id="thumb_down"
																		class="material-symbols-outlined up_down_btn">thumb_down</span>
																	<span class="gab_btn b-${com.comment_id}">
																		${com.bad_cnt} </span>
																</div>
															</div>
														</div>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<div class="comment_none">아직 베스트 리뷰가 없습니다.</div>
												</c:otherwise>
											</c:choose>
										</div>
										<div id="comment_new_grid">
											<div class="comment_grid_title">최신 리뷰</div>
											<div id="comment_new_div_list">
												<c:forEach items="${new_comments}" var="new_com">
													<div class="comment_new_div">
														<div class="comment_div_left">
															<div>
																<img class="new_comment_user_profile" alt="유저의 프로필"
																	src="/smg${new_com.profile_url}">
															</div>
															<div class="comment_user_nick_div">
																<div class="comment_user_nick">${new_com.nick_name}</div>
															</div>
														</div>
														<div class="comment_div_right">
															<div class="comment_write_date">
																게시 일시:
																<fmt:formatDate pattern="yyyy. MM. dd"
																	value="${new_com.write_date}" />
															</div>
															<div class="new_comment_content">${new_com.comment_content}</div>
														</div>
														<div class="up_down_div">
															<div class="up_btn good-${new_com.comment_id}"
																data-id="${new_com.comment_id}">
																<span data-id="${new_com.comment_id}" id="new_thumb_up"
																	class="material-symbols-outlined new_up_down_btn">thumb_up</span>
																<span class="gab_btn g-${new_com.comment_id}">
																	${new_com.good_cnt} </span>
															</div>
															<div class="down_btn bad-${new_com.comment_id}"
																data-id="${new_com.comment_id}">
																<span data-id="${new_com.comment_id}"
																	id="new_thumb_down"
																	class="material-symbols-outlined new_up_down_btn">thumb_down</span>
																<span class="gab_btn b-${new_com.comment_id}">
																	${new_com.bad_cnt} </span>
															</div>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
									<div id="comment_all_div">
										<a id="comment_all_btn">모든 평가 보기</a>
									</div>
								</c:when>
								<c:otherwise>
									<div class="comment_grid_title">아직 리뷰가 없습니다.</div>
								</c:otherwise>
							</c:choose>
						</div>
				<!-- 레이아웃 -->
				<div class='contents-wrap'>
					<div class="video_img">
						<img id="main_img" src="${img_path}apex/apex_01.jpg" alt="image" />
						
							<video  class="video" loop>
								<source src="${img_path}apex/movie480_vp1.webm" type="video/webm"></source>
							</video>						
					</div>
				</div>				
				<div class='contents-wrap'>
					<div class="video_img">
						<img id="main_img" src="${img_path}apex/apex_02.jpg" alt="image" />
							<video  class="video" loop>
								<source src="${img_path}apex/movie480_vp2.webm" type="video/webm"></source>
							</video>						
					</div>
				</div>				
				<div class='contents-wrap'>
					<div class="video_img">
						<img id="main_img" src="${img_path}apex/apex_03.jpg" alt="image" />
						
							<video  class="video" loop>
								<source src="${img_path}apex/movie480_vp3.webm" type="video/webm"></source>
							</video>						
					</div>
				</div>				
				<div class='contents-wrap'>
					<div class="video_img">
						<div class="video_contents">
						<img id="main_img" src="${img_path}apex/apex_04.jpg" alt="image" />
						<iframe class="video" src="https://www.youtube.com/embed/C-WQcCqecHg?mute=1&loop=1"  width='1063px' title="YouTube video player" style="border:0;" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
						</div>										
					</div>
				</div>				
				<div class="specifications">
					<div style="color:#c0c0c0; border-bottom:solid 3px #c0c0c0;"><h2>시스템 사양</h2></div>
					<div class="specs">
						<div>
							<span class="span1">최소</span>
							<span class="span2"></span>					
						</div>
						<div>
							<span class="span1">권장</span>
							<span class="span2"></span>
						</div>
					</div>					
					<div class="specs">
						<div>
							<span class="span1">운영체제</span>
							<span class="span2">${spec.min_os}</span>
						</div>
						<div>
							<span class="span1">운영체제</span>
							<span class="span2">${spec.rec_os}</span>
						</div>
					</div>
					<div class="specs">
						<div>
							<span class="span1">프로세서</span>
							<span class="span2">${spec.min_processor}</span>
						</div>
						<div>
							<span class="span1">프로세서</span>
							<span class="span2">${spec.rec_processor}</span>
						</div>
					</div>
					<div class="specs">
						<div>
							<span class="span1">메모리</span>
							<span class="span2">${spec.min_memory}</span>
						</div>
						<div>
							<span class="span1">메모리</span>
							<span class="span2">${spec.rec_memory}</span>
						</div>
					</div>
					<div class="specs">
						<div>
							<span class="span1">스토리지</span>
							<span class="span2">${spec.min_storage}</span>
						</div>
						<div>
							<span class="span1">스토리지</span>
							<span class="span2">${spec.rec_storage}</span>
						</div>
					</div>
					<div class="specs">
						<div>
							<span class="span1">그래픽 카드</span>
							<span class="span2">${spec.min_graphics_card}</span>
						</div>
						<div>
							<span class="span1">그래픽 카드</span>
							<span class="span2">${spec.rec_graphics_card}</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	<script src="${detail_common_js}"></script>
	<script src="${type_bgc_js}"></script>
	
</body>
</html>