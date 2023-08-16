<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/resources/manager" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>유저 정보 수정</title>
<%@ include file="/WEB-INF/views/manager/include/head_common.jsp"%>
<!-- page css -->
<link rel="stylesheet" href="${resource}/css/admin_user_edit.css">

</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp"%>

	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp"%>
			<div id="main_content">
				<div id="account_content">
					<h2 class="content_title">유저 정보 수정</h2>
					<div class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>${user.user_num}번 유저</span>
							</div>
						</div>
						<div id="content_container_wrapper">

							<form id="update_user_form" action="./update_info" method="post">
								<input type="hidden" name="user_num" value="${user.user_num}" />
								<div id="personal_info_update_content">
									<div>
										<div class="info_title">이메일 주소</div>
										<div class="info_content">
											<input id="user_id" name="user_id" class="info_input"
												type="text" value="${user.user_id}" />
										</div>
									</div>
									<div>
										<div class="info_title">비밀번호</div>
										<div class="info_content">
											<input id="new_password" name="newPassword"
												class="info_input" type="password" required />
										</div>
									</div>
									<div>
										<div class="info_title">이름</div>
										<div class="info_content">
											<input id="user_name" name="user_name" class="info_input"
												type="text" value="${user.user_name}" />
										</div>
									</div>
									<div>
										<div class="info_title">성별</div>
										<div class="info_content">
											<select id="gender" name="gender" class="info_input">
												<c:choose>
													<c:when test="${user.gender == 1}">
														<option value="1" selected>남</option>
														<option value="2">여</option>
														<option value="0">미정</option>
													</c:when>
													<c:when test="${user.gender == 2}">
														<option value="1">남</option>
														<option value="2" selected>여</option>
														<option value="0">미정</option>
													</c:when>
													<c:otherwise>
														<option value="1">남</option>
														<option value="2">여</option>
														<option value="0" selected>미정</option>
													</c:otherwise>
												</c:choose>
											</select>
										</div>
									</div>
									<div>
										<div class="info_title">생년월일</div>
										<div class="info_content">
											<fmt:formatDate var="birth_date_str"
												value="${user.birth_date}" pattern="yyyy-MM-dd" />
											<input id="birth_date" name="birth_date" class="info_input"
												type="date" value="${birth_date_str}" />
										</div>
									</div>
									<div>
										<div class="info_title">전화번호</div>
										<div class="info_content">
											<input id="phone_number" name="phone_number"
												class="info_input" type="text" value="${user.phone_number}" />
										</div>
									</div>
									<div>
										<div class="info_title">닉네임</div>
										<div class="info_content">
											<input id="nick_name" name="nick_name" class="info_input"
												type="text" value="${user.nick_name}" />
										</div>
									</div>
									<div>
										<div class="info_title">등급</div>
										<div class="info_content">
											<select id="user_grade" name="user_grade" class="info_input">
												<option value="S"
													${user.user_grade == 'S' ? 'selected' : ''}>다이아몬드</option>
												<option value="A"
													${user.user_grade == 'A' ? 'selected' : ''}>플래티넘</option>
												<option value="B"
													${user.user_grade == 'B' ? 'selected' : ''}>골드</option>
												<option value="C"
													${user.user_grade == 'C' ? 'selected' : ''}>실버</option>
												<option value="D"
													${user.user_grade == 'D' ? 'selected' : ''}>브론즈</option>
											</select>
										</div>
									</div>
									<div>
										<div class="info_title">포인트</div>
										<div class="info_content">
											<input id="user_point" name="user_point" class="info_input"
												type="text" value="${user.user_point}" />
										</div>
									</div>
									<div id="btnDiv">
										<button id="userinfo_cancel_btn" class="btn cancel"
											type="button">취소</button>
										<button id="userinfo_update_btn" class="btn" type="submit">변경</button>
									</div>
								</div>
							</form>


						</div>
					</div>
				</div>
			</div>
		</div>

	</main>
	<script src="${resource}/js/admin_user_edit.js"></script>
</body>
</html>