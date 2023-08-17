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
<c:url value="/resources/games/css/default.css" var="default_css" />
<c:url value="/resources/games/js/default.js" var="default_js" />
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
<link rel="stylesheet" href="${default_css}">
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
							<div id="war-content">※ 할인 상품은 한정 수량으로 조기 품절될 수 있습니다.</div>
							<div id="game-info-title-1">
								달려라, 살아남아라, 지켜라. <br> 끝없는 모험을 내 마음대로.
							</div>
							<div id="game-info-content-1">
								광대한 세계를 무대로 어디로 가든, 무엇을 하든, 모험의 모든 것을 당신이 원하는 대로 할 수 있습니다. <br>
								야생 동물을 사냥하며 지낼 것인가? 몬스터를 퇴치하러 갈 것인가? 절경 포인트를 보러 다닐 것인가? <br>달리고,
								헤엄치고, 날고, 높은 곳을 오르고, 광활한 세계에서 본인이 마음먹은 대로 모험할 수 있습니다. <br>Nintendo
								Switch를 통해, 자택의 TV로 느긋하게 플레이 하다가 그대로 들고 나가 외출 중에도 계속해서 모험을 즐길 수
								있는 등, 자유로운 플레이 스타일로 즐길 수 있습니다.
							</div>
							<div id="game-info-img-1">
								<img class="game-info-img" alt="${images[0].image_name}"
									src="${game_img}${images[0].image_url}">
							</div>
							<div id="game-story-1">
								대재앙이라고 불리는 재해가 일어나 하이랄 왕국은 멸망했다……. <br> 그로부터 100년 후, 주인공
								링크는 지하유적에서 오랜 잠으로부터 깨어나 신비한 목소리에 이끌려 대지로 발을 내딛는다.
							</div>
						</div>
						<!-- 리뷰 -->
						<div class="game_detail_divs" id="game_detail_comment_div" data-gab="${my_gab_list}" data-status="${my_status_list}">
							<c:choose>
								<c:when test="${is_use == true}">
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
												<c:choose>
													<c:when test="${empty my_com}">
														<textarea id="input_comment_content" name="comment_content"
															placeholder="리뷰를 작성하세요."></textarea>
													
													</c:when>
													<c:otherwise>
														<div>
															
														</div>
													</c:otherwise>
												</c:choose>
											</div>
											<div id="comment_submit_div">
												<button type="submit" id="comment_submit_btn">등록</button>
											</div>
										</div>
									</form>
								</c:when>
							</c:choose>
							<div id="comment_cnt">리뷰 (총 ${comment_len}개)</div>
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
																		${com.good_cnt}
																	</span>
																</div>
																<div class="down_btn bad-${com.comment_id}"
																	data-id="${com.comment_id}">
																	<span data-id="${com.comment_id}" id="thumb_down"
																		class="material-symbols-outlined up_down_btn">thumb_down</span>
																	<span class="gab_btn b-${com.comment_id}">
																		${com.bad_cnt}
																	</span>
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
																	${new_com.good_cnt}
																</span>
															</div>
															<div class="down_btn bad-${new_com.comment_id}"
																data-id="${new_com.comment_id}">
																<span data-id="${new_com.comment_id}"
																	id="new_thumb_down"
																	class="material-symbols-outlined new_up_down_btn">thumb_down</span>
																<span class="gab_btn b-${new_com.comment_id}">
																	${new_com.bad_cnt}
																</span>
															</div>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div id="comment_all_div">
								<a id="comment_all_btn" href="./review_all?game=${game.game_id }">모든 평가 보기</a>
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
									<div class="req_content">Windows 10</div>
								</div>
								<div>
									<div class="req_sub_title">운영체제</div>
									<div class="req_content">Windows 10</div>
								</div>
								<div>
									<div class="req_sub_title">프로세서</div>
									<div class="req_content">i5 4690k</div>
								</div>
								<div>
									<div class="req_sub_title">프로세서</div>
									<div class="req_content">i5 9400F</div>
								</div>
								<div>
									<div class="req_sub_title">메모리</div>
									<div class="req_content">8GB</div>
								</div>
								<div>
									<div class="req_sub_title">메모리</div>
									<div class="req_content">16GB</div>
								</div>
								<div>
									<div class="req_sub_title">스토리지</div>
									<div class="req_content">12GB</div>
								</div>
								<div>
									<div class="req_sub_title">스토리지</div>
									<div class="req_content">12GB</div>
								</div>
								<div>
									<div class="req_sub_title">DirectX</div>
									<div class="req_content">11</div>
								</div>
								<div>
									<div class="req_sub_title">DirectX</div>
									<div class="req_content">11</div>
								</div>
								<div>
									<div class="req_sub_title">그래픽 카드</div>
									<div class="req_content">GTX 1050 Ti(4GB VRAM)</div>
								</div>
								<div>
									<div class="req_sub_title">그래픽 카드</div>
									<div class="req_content">GTX 1070(8GB VRAM)</div>
								</div>
								<div>
									<div class="req_sub_title">로그인</div>
									<div class="req_content">Show Me Games 계정 필요</div>
								</div>
							</div>
							<div id="req_bottom_content">※ 시스템 요구 사항은 출시 버전을 기준으로 하며,
								컨텐츠 추가와 업데이트로 인한 변경 사항이 있을 수 있습니다.</div>
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
	<script src="${default_js}"></script>
</body>
</html>