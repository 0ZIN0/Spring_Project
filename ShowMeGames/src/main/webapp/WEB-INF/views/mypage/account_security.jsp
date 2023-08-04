<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/mypage" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>계정 보안</title>
	<!-- mypage 공통 css -->
	<link rel="stylesheet" href="${resource}/css/common.css">
	<!-- security css -->
	<link rel="stylesheet" href="${resource}/css/account_security.css">
	<!-- header, footer css -->
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
	<!-- google font -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/mypage/include/top_bar.jsp" %>
	
	<!-- modal:pwd -->
	<div id="pwd_update_modal" class="modal_bg">
		<div class="modal_container">
			<div class="modal_content">
				<div class="item_title_wrapper">
					<div class="item_title">
						<span>사용자 이름 변경</span>
					</div>
					<div id="modal_close" class="content_update_wrapper">
						<button class="btn cancel">닫기</button>
					</div>
				</div>
				<div id="pwd_update_content">
					<form id="form_pwd_chk" action="./pwd_chk" method="POST">
						<input type="hidden" name="user_num" value="${user.user_num}">
					</form>
					<div>
						<div class="modal_content_title">
							<label class="modal_label" for="pwd_chk_input">기존 비밀번호 입력</label>
						</div>
						<input id="pwd_chk_input" name="user_pw" type="password" form="form_pwd_chk">
					</div>
					<div>
						<button id="modal_close_btn" class="btn cancel">취소</button>
						<button id="modal_comfirm_btn" type="submit" class="btn" form="form_pwd_chk">확인</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/mypage/include/side_bar.jsp" %>
			<div id="main_content">
				<h2 class="content_title">보안</h2>
				<div id="pwd_update" class="content_item">
					<div class="item_title_wrapper">
						<div class="item_title">
							<span>암호</span>
						</div>
						<div class="content_update_wrapper">
							<button id="pwd_modal_open_btn">변경</button>
						</div>
					</div> 
					<div id="password_content_wrapper">
						<div id="password_content">
							<div>
								<span class="pwd_dot"></span>
								<span class="pwd_dot"></span>
								<span class="pwd_dot"></span>
								<span class="pwd_dot"></span>
								<span class="pwd_dot"></span>
								<span class="pwd_dot"></span>
								<span class="pwd_dot"></span>
								<span class="pwd_dot"></span>
							</div>
						</div>
						<div id="password_result_div">
							<c:if test="${try_result eq 0}">
								<span id="result_wrong">비밀번호를 잘못 입력하셨습니다.</span>
							</c:if>
							<c:if test="${try_result eq 1}">
								<span id="result_confirm">비밀번호가 변경되었습니다.</span>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>
	<script src="${resource}/js/common.js"></script>
	<script src="${resource}/js/account_security.js"></script>
</body>
</html>