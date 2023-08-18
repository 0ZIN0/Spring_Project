<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
								<div>
									<c:choose>
										<c:when test="${user.user_grade eq 'S'}">
											<div class="com-profile-grade">
												<img class="comment-grade-image"
													src="${member_img}/grade/diamond_icon.png"
													alt="다이아몬드 이미지">
											</div>
										</c:when>
										<c:when test="${user.user_grade eq 'A'}">
											<div class="com-profile-grade">
												<img class="comment-grade-image"
													src="${member_img}/grade/platinum_icon.png"
													alt="플래티넘 이미지">
											</div>
										</c:when>
										<c:when test="${user.user_grade eq 'B'}">
											<div class="com-profile-grade">
												<img class="comment-grade-image"
													src="${member_img}/grade/gold_icon.png" alt="골드 이미지">
											</div>
										</c:when>
										<c:when test="${user.user_grade eq 'C'}">
											<div class="com-profile-grade">
												<img class="comment-grade-image"
													src="${member_img}/grade/silver_icon.png"
													alt="실버 이미지">
											</div>
										</c:when>
										<c:when test="${user.user_grade eq 'D'}">
											<div class="com-profile-grade">
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
							<div class="input_game_grade_content">
								<input type="number" class="input_game_grade" id="input_game_grade"
									oninput="drawStar(this)" name="game_grade" step="0.1"
									max="5.0" min="0" value="0" required />
								<div class="comment_grade">
									<div class="starpoint_title">별점&nbsp;</div>
									<div class="my_rating">
										★★★★★ <span id="starpoint" class="starpoint">★★★★★</span>
										<input id="star_range" type="range" oninput="drawStar(this)" step="0.1" max="5.0" min="0">
									</div>
								</div>
							</div>
							<textarea id="input_comment_content" name="comment_content" placeholder="리뷰를 작성하세요."></textarea>
						</div>
						<div id="comment_submit_div">
							<button type="button" id="comment_submit_btn" data-user="${user.user_num}" data-gameid="${param.game}">등록</button>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="my_comment_div">
						<div class="comment_div_left">
							<div>
								<img class="comment_user_profile" alt="유저의 프로필" src="/smg${my_com.profile_url}">
							</div>
							<div class="comment_user_nick_div">
								<div>
									<c:choose>
										<c:when test="${my_com.user_grade eq 'S'}">
											<div class="com-profile-grade">
												<img class="comment-grade-image"
													src="${member_img}/grade/diamond_icon.png" alt="다이아몬드 이미지">
											</div>
										</c:when>
										<c:when test="${my_com.user_grade eq 'A'}">
											<div class="com-profile-grade">
												<img class="comment-grade-image"
													src="${member_img}/grade/platinum_icon.png" alt="플래티넘 이미지">
											</div>
										</c:when>
										<c:when test="${my_com.user_grade eq 'B'}">
											<div class="com-profile-grade">
												<img class="comment-grade-image"
													src="${member_img}/grade/gold_icon.png" alt="골드 이미지">
											</div>
										</c:when>
										<c:when test="${my_com.user_grade eq 'C'}">
											<div class="com-profile-grade">
												<img class="comment-grade-image"
													src="${member_img}/grade/silver_icon.png" alt="실버 이미지">
											</div>
										</c:when>
										<c:when test="${my_com.user_grade eq 'D'}">
											<div class="com-profile-grade">
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
						<div class="comment_div_right">
							<div class="comment_write_date">
								게시 일시: <fmt:formatDate pattern="yyyy. MM. dd" value="${my_com.write_date}" />
							</div>
							<div class="input_game_grade_content">
								<input type="hidden" class="input_game_grade"
									name="game_grade" step="0.1" max="5.0" min="0"
									value="${my_com.grade}" required />
								<div class="comment_grade">
									<div class="starpoint_title">별점&nbsp;</div>
									<div class="my_rating">
										★★★★★ <span class="starpoint">★★★★★</span>
									</div>
								</div>
							</div>
							<div class="comment_content">${my_com.comment_content}</div>
						</div>
						<div class="up_down_div">
							<div class="up_btn good-${my_com.comment_id}" data-id="${my_com.comment_id}">
								<span data-id="${my_com.comment_id}" id="thumb_up" class="material-symbols-outlined thumb_up">thumb_up</span>
								<span class="gab_btn g-${my_com.comment_id}"> ${my_com.good_cnt} </span>
							</div>
							<div class="down_btn bad-${my_com.comment_id}"
								data-id="${my_com.comment_id}">
								<span data-id="${my_com.comment_id}" class="material-symbols-outlined thumb_down">thumb_down</span>
								<span class="gab_btn b-${my_com.comment_id}"> ${my_com.bad_cnt} </span>
							</div>
						</div>
						<div id="my_com_btns_div">
							<button class="my_com_btn" id="my_com_update_btn">
								<span class="my_com_btns material-symbols-outlined">edit</span>
							</button>
							<button data-game="${param.game}"
								data-layout="${param.layout}"
								data-comid="${my_com.comment_id}" class="my_com_btn" id="my_com_delete_btn">
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
														<div class="com-profile-grade">
															<img class="comment-grade-image"
																src="${member_img}/grade/diamond_icon.png"
																alt="다이아몬드 이미지">
														</div>
													</c:when>
													<c:when test="${com.user_grade eq 'A'}">
														<div class="com-profile-grade">
															<img class="comment-grade-image"
																src="${member_img}/grade/platinum_icon.png"
																alt="플래티넘 이미지">
														</div>
													</c:when>
													<c:when test="${com.user_grade eq 'B'}">
														<div class="com-profile-grade">
															<img class="comment-grade-image"
																src="${member_img}/grade/gold_icon.png"
																alt="골드 이미지">
														</div>
													</c:when>
													<c:when test="${com.user_grade eq 'C'}">
														<div class="com-profile-grade">
															<img class="comment-grade-image"
																src="${member_img}/grade/silver_icon.png"
																alt="실버 이미지">
														</div>
													</c:when>
													<c:when test="${com.user_grade eq 'D'}">
														<div class="com-profile-grade">
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
										<div class="input_game_grade_content">
											<input type="hidden" class="input_game_grade input_game_grade_${com.comment_id}"
												name="game_grade" step="0.1" max="5.0" min="0"
												value="${com.grade}" required />
											<div class="comment_grade">
												<div class="starpoint_title">별점&nbsp;</div>
												<div class="rating">
													★★★★★ <span class="starpoint starpoint_${com.comment_id}">★★★★★</span>
												</div>
											</div>
										</div>
										<div class="comment_content">${com.comment_content}</div>
									</div>
									<div class="up_down_div">
										<div class="up_btn good-${com.comment_id}" data-id="${com.comment_id}">
											<span data-id="${com.comment_id}" class="material-symbols-outlined thumb_up">thumb_up</span> 
											<span class="gab_btn g-${com.comment_id}"> ${com.good_cnt} </span>
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
										<input type="hidden" class="input_game_grade input_game_grade_${new_com.comment_id}"
											name="game_grade" step="0.1" max="5.0" min="0"
											value="${new_com.grade}" required />
										<div class="comment_grade">
											<div class="starpoint_title">별점&nbsp;</div>
											<div class="rating">
												★★★★★ <span class="starpoint starpoint_${new_com.comment_id}">★★★★★</span>
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
				<a id="comment_all_btn" href="./detail/review_all?game=${game.game_id }">모든 평가 보기</a>
			</div>
		</c:when>
		<c:otherwise>
			<div class="comment_grid_title">아직 리뷰가 없습니다.</div>
		</c:otherwise>
	</c:choose>
</div>    
