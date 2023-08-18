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
<!-- lra resources -->
<c:url value="/resources/games/css/type_lra.css" var="lra_css" />
<c:url value="/resources/games/js/type_lra.js" var="lra_js" />
<c:url value="/resources/games/layout/lra" var="img" />
<!--  temp  -->
<c:url value="/resources/img/games/slider" var="game_img" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${game.game_name}</title>
<!-- header, footer css -->
<%@ include file="/WEB-INF/views/include/link/common.jsp"%>
<!-- common css 각자 디테일 페이지에 추가해야함 -->
<link rel="stylesheet" href="${detail_common_css}">
<!-- default css -->
<link rel="stylesheet" href="${lra_css}">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	<main class="background_layer1">
		<div class="background_layer2">
			<div id="game_detail_div">
				<%@ include file="/WEB-INF/views/games/include/detail_top.jsp"%>
				<!-- 아래부터는 free layout -->
				<div id="game_bottom_div">
					<div id="game_detail_tab">
						<div id="tab_game_info_div" class="detail_tab tab_selected">게임정보</div>
						<div id="tab_game_comment_div"
							class="detail_tab tab_border_bottom">리뷰</div>
						<div id="tab_game_req_div" class="detail_tab tab_border_bottom">시스템
							요구사항</div>
						<div id="tab_blank"></div>
					</div>
					<!-- detail div list -->
					<div id="game_detail_div_list">
						<!-- 게임정보 DIV -->
						<div class="game_detail_divs" id="game_detail_info_div">
							<div id="war-content">※ 무료 게임은 한정 수량으로 조기 품절이 될 수 있습니다.</div>
							<div id="game-info-title-1" class="game-info-title">신규 모드:
								플래그전 출시!</div>
							<div id="game-info-sub_title-1" class="game-info-sub_title">
								깃발을 모아 우리팀 진영으로! <br> 더 많은 포인트를 획득하여 승리하세요!
							</div>
							<div id="game-info-img-1">
								<img class="game-info-img" alt="게임 이미지 1"
									src="${game_img}${images[0].image_url}">
							</div>
							<div id="game-info-title-2" class="game-info-title">게임 플레이
								이벤트</div>
							<div id="game-info-sub_title-2" class="game-info-sub_title">
								여름에도 계속되는 풍성한 이벤트<br> 뜨겁게 달리고 시원하게 보상 받자!
							</div>
							<div id="game-info-img-2">
								<img class="game-info-img" alt="게임 이미지 2"
									src="${game_img}${images[3].image_url}">
							</div>
							<!-- 1 -->
							<div id="game-detail-title-1" class="game-info-title-left">
								취향에 맞게 즐기는 다양한 <br>게임 모드
								<div id="game-detail-content-1" class="game-info-content-left">
									한 번의 공격으로 승패가 바뀔 수 있는 긴장감 넘치는 아이템전<br> 짜릿한 스피드를 극대화, 드리프트
									스킬과 부스터로 빠르기를 겨루는 스피드전<br> 혼자 또는 함께, 쉽고 재미있게 즐기는 캐주얼 레이싱
									게임, 카트라이더: 드리프트
								</div>
							</div>
							<video autoplay loop muted preload playsinline
								class="video_background">
								<source
									src="https://kdgow-vod.dn.nexoncdn.co.kr/resource/02_game_intro_BG_1.mp4"
									type="video/mp4">
							</video>
							<!-- 2 -->
							<div id="game-detail-title-2" class="game-info-title-right">
								개성 넘치는 레이서 캐릭터
								<div id="game-detail-content-2" class="game-info-content-right">
									생동감 넘치는 카트라이더 캐릭터들을 만나보세요.<br> 각자의 개성이 잘 드러나는 코스튬과 이모트도
									준비되어 있습니다. <br> 마음에 드는 캐릭터를 선택하고, 여러분의 감성을 표현해보세요.
								</div>
							</div>
							<video autoplay loop muted preload playsinline
								class="video_background">
								<source
									src="https://kdgow-vod.dn.nexoncdn.co.kr/resource/02_KD_Character.mp4">
							</video>
							<div id="play-btn" class="game-info-sub_title">지금 바로 플레이 해보세요!</div>
						</div>
					</div>
					<!-- 리뷰 -->
					<div class="game_detail_divs" id="game_detail_comment_div"
						data-gab="${my_gab_list}" data-status="${my_status_list}">
						<c:choose>
							<c:when test="${is_use == true}">
								<div id="my_com_grid" class="comment_cnt"
									data-game="${param.game}" data-layout="${param.layout}">MY
									리뷰</div>
								<c:choose>
									<c:when test="${empty my_com}">
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
																		src="${member_img}/grade/silver_icon.png" alt="실버 이미지">
																</div>
															</c:when>
															<c:when test="${user.user_grade eq 'D'}">
																<div class="profile-grade">
																	<img class="comment-grade-image"
																		src="${member_img}/grade/bronze_icon.png" alt="등급 이미지">
																</div>
															</c:when>
														</c:choose>
													</div>
													<div class="comment_user_nick">${user.nick_name}</div>
												</div>
											</div>
											<div class="comment_div_right">
												<input type="hidden" name="comment_id"
													value="${my_com.comment_id}" />
												<div id="input_game_grade_content" class="input_content_div">
													<input type="number" class="input_game_grade"
														id="input_game_grade" oninput="drawStar(this)"
														name="game_grade" step="0.1" max="5.0" min="0" value="0"
														required />
													<div class="comment_grade">
														<div class="starpoint_title">별점&nbsp;</div>
														<div class="my_rating">
															★★★★★ <span id="starpoint" class="starpoint">★★★★★</span>
															<input id="star_range" type="range"
																oninput="drawStar(this)" step="0.1" max="5.0" min="0">
														</div>
													</div>
												</div>
												<textarea id="input_comment_content" name="comment_content"
													placeholder="리뷰를 작성하세요."></textarea>
											</div>
											<div id="comment_submit_div">
												<button type="button" id="comment_submit_btn"
													data-user="${user.user_num}" data-gameid="${param.game}">등록</button>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="my_comment_div">
											<div class="my_com_left comment_div_left">
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
																		src="${member_img}/grade/silver_icon.png" alt="실버 이미지">
																</div>
															</c:when>
															<c:when test="${my_com.user_grade eq 'D'}">
																<div class="profile-grade">
																	<img class="comment-grade-image"
																		src="${member_img}/grade/bronze_icon.png" alt="등급 이미지">
																</div>
															</c:when>
														</c:choose>
													</div>
													<div class="comment_user_nick">${my_com.nick_name}</div>
												</div>
											</div>
											<div class="comment_div_right my_com_div_right">
												<div class="comment_write_date my_com_content">
													게시 일시:
													<fmt:formatDate pattern="yyyy. MM. dd"
														value="${my_com.write_date}" />
												</div>
												<div id="input_game_grade_content" class="input_content_div">
													<input type="hidden"
														class="input_game_grade input_game_grade_${my_com.comment_id}"
														name="game_grade" step="0.1" max="5.0" min="0"
														value="${my_com.grade}" required />
													<div class="comment_grade">
														<div class="starpoint_title">별점&nbsp;</div>
														<div class="my_rating">
															★★★★★ <span
																class="starpoint starpoint_${my_com.comment_id}">★★★★★</span>
														</div>
													</div>
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
												<button class="my_com_btn" id="my_com_update_btn">
													<span class="my_com_btns material-symbols-outlined">edit</span>
												</button>
												<button data-game="${param.game}"
													data-layout="${param.layout}"
													data-comid="${my_com.comment_id}" class="my_com_btn"
													id="my_com_delete_btn">
													<span class="my_com_btns material-symbols-outlined">close</span>
												</button>
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
															<div id="input_game_grade_content"
																class="input_content_div">
																<input type="hidden"
																	class="input_game_grade input_game_grade_${com.comment_id}"
																	name="game_grade" step="0.1" max="5.0" min="0"
																	value="${com.grade}" required />
																<div class="comment_grade">
																	<div class="starpoint_title">별점&nbsp;</div>
																	<div class="rating">
																		★★★★★ <span
																			class="starpoint starpoint_${com.comment_id}">★★★★★</span>
																	</div>
																</div>
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
														<div id="input_game_grade_content"
															class="input_content_div">
															<input type="hidden"
																class="input_game_grade input_game_grade_${new_com.comment_id}"
																name="game_grade" step="0.1" max="5.0" min="0"
																value="${new_com.grade}" required />
															<div class="comment_grade">
																<div class="starpoint_title">별점&nbsp;</div>
																<div class="rating">
																	★★★★★ <span
																		class="starpoint starpoint_${new_com.comment_id}">★★★★★</span>
																</div>
															</div>
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
															<span data-id="${new_com.comment_id}" id="new_thumb_down"
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
									<a id="comment_all_btn"
										href="./detail/review_all?game=${game.game_id }">모든 평가 보기</a>
								</div>
							</c:when>
							<c:otherwise>
								<div class="comment_grid_title">아직 리뷰가 없습니다.</div>
							</c:otherwise>
						</c:choose>
					</div>
					<!-- 시스템 요구사항 -->
					<div class="game_detail_divs" id="game_detail_req_div">
						<div id="game_req_title">사양</div>
						<div id="game_req_grid">
							<div id="game_req_min">
								<div class="req_sub_title">최소</div>
							</div>
							<div id="game_req_rev">
								<div class="req_sub_title">권장</div>
							</div>
							<div>
								<div class="req_sub_title">운영체제</div>
								<div class="req_content">${spec.min_os }</div>
							</div>
							<div>
								<div class="req_sub_title">운영체제</div>
								<div class="req_content">${spec.rec_os }</div>
							</div>
							<div>
								<div class="req_sub_title">프로세서</div>
								<div class="req_content">${spec.min_processor }</div>
							</div>
							<div>
								<div class="req_sub_title">프로세서</div>
								<div class="req_content">${spec.rec_processor }</div>
							</div>
							<div>
								<div class="req_sub_title">메모리</div>
								<div class="req_content">${spec.min_memory }</div>
							</div>
							<div>
								<div class="req_sub_title">메모리</div>
								<div class="req_content">${spec.rec_memory }</div>
							</div>
							<div>
								<div class="req_sub_title">스토리지</div>
								<div class="req_content">${spec.min_storage }</div>
							</div>
							<div>
								<div class="req_sub_title">스토리지</div>
								<div class="req_content">${spec.rec_storage }</div>
							</div>
							<div>
								<div class="req_sub_title">DirectX</div>
								<div class="req_content">${spec.min_directx }</div>
							</div>
							<div>
								<div class="req_sub_title">DirectX</div>
								<div class="req_content">${spec.rec_directx }</div>
							</div>
							<div>
								<div class="req_sub_title">그래픽 카드</div>
								<div class="req_content">${spec.min_graphics_card }</div>
							</div>
							<div>
								<div class="req_sub_title">그래픽 카드</div>
								<div class="req_content">${spec.rec_graphics_card }</div>
							</div>
							<div>
								<div class="req_sub_title">로그인</div>
								<div class="req_content">${spec.login_method }</div>
							</div>
						</div>
						<div id="req_bottom_content">※ 시스템 요구 사항은 출시 버전을 기준으로 하며,
							컨텐츠 추가와 업데이트로 인한 변경 사항이 있을 수 있습니다.</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	<script src="${detail_common_js}"></script>
	<script src="${lra_js}"></script>
</body>
</html>