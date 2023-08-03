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
	<link rel="stylesheet" href="${resource}/css/account_update_pw.css">
	<!-- header, footer css -->
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
	<!-- google font -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/mypage/include/top_bar.jsp" %>
	
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
					</div> 
					<div id="password_content_wrapper">
						<div id="password_content">
							<div>
								<span>비밀번호 변경</span>
								<input id="pw_input" name="user_pw" type="password" required/>
								<span id="pw_span" class="chk_span">메세지</span>
							</div>
							<div>
								<span>비밀번호 변경 확인</span>
								<input id="pw_chk_input" type="password"/>
								<span id="pw_chk_span" class="chk_span">메세지</span>
							</div>
						</div>
						<div id="password_rule">
							<div class="modal_content_title">비밀번호 관련 규정</div>
							<div>
			                    <ul>	
			                       <li>반드시8~16자 이내여야 함</li>
			                       <li>최소 소문자 1개 포함</li>
			                       <li>최소 대문자 1개 포함</li>
			                       <li>최소 숫자 1개 포함</li>
			                       <li>최소 특수문자 1개 포함</li>
			                       <li>사용자 이름 포함하지 말 것</li>
		    	                </ul>
							</div>
						</div>
						<div>
							<button id="pw_update_cancel_btn" class="btn cancel">취소</button>
							<button id="pw_update_btn" class="btn">변경</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>
	<script src="${resource}/js/common.js"></script>
	<script src="${resource}/js/account_update_pw.js"></script>
</body>
</html>