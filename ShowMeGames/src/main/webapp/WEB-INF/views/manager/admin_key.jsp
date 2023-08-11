<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:url value="/resources/manager" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>게임 키 관리</title>
<%@ include file="/WEB-INF/views/manager/include/head_common.jsp"%>
<!-- page css -->
<link rel="stylesheet" href="${resource}/css/admin_key.css">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp"%>

	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp"%>
			<div id="main_content">
				<h2 class="content_title">게임 키 관리</h2>
				<div class="content_item">
					<div class="item_title_wrapper">
						<div id="key-list-div" class="item_title_wrapper">
							<div class="header">
								<div class="item_title">
									<span>게임리스트</span>
								</div>
								<div class="game_search">
									<div>
										<form id="search" action="./admin_key" method="GET">
											<label>검색 : </label> <input type="text" name="search" />
											<select name="search_tag" id="">
												<option value="key_num">키 번호</option>
												<option value="game_id">게임 번호</option>
												<option value="key_id">키 ID</option>
												<option value="nick_name">닉네임</option>
											</select>
										</form>
									</div>
									<c:if test="${search != null}">
									<div class="result">
										<span>'${search }'에 대한 검색 결과</span> 
									</div>
									</c:if>
								</div>
							</div>
							<div id="key-list">
								<div id="column-title">
									<div>키 번호</div>
									<div>게임 번호</div>
									<div>키 ID</div>
									<div>소유 계정</div>
									<div></div>
								</div>
								<div id="row-content">
								<c:choose>
									<c:when test="${gameKeys != null and not empty gameKeys}">
										<c:forEach items="${gameKeys }" var="key">
											<form id="key_modify ${key.key_num }" action="./key_modify" method="POST">
												<div class="row-content" data-key="key-${key.key_num}">
													<input class="key_num" name="key_num" value="${key.key_num }" readonly/>
													<div class="game-title">${key.game_id}</div>
													<input type="text" name="key_id" class="key-id" data-originKey="${key.key_id }"
													value="${key.key_id }" readonly></input>
													<input type="text" name="nick_name" class="nick_name" data-originName="${key.nick_name }"
													value="${key.nick_name }" readonly></input>
													<div>
														<button type="submit" class="btn key-btn"
															data-key="key-${key.key_num}">수정</button>
													</div>
												</div>
											</form>
										</c:forEach>
									</c:when>
									<c:otherwise>
									<div class="empty">
										<span>검색 결과가 없습니다</span>									
									</div>
									</c:otherwise>
								</c:choose>
								</div>
								<div class="end"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<script src="${resource}/js/admin_key.js"></script>
</body>
</html>