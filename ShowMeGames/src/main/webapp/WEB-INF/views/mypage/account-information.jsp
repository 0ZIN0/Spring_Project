<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/mypage" var="resource" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>계정 정보</title>
	<!-- mypage 공통 css -->
	<link rel="stylesheet" href="${resource}/css/common.css">
	<!-- information css -->
	<link rel="stylesheet" href="${resource}/css/account_information.css">
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
				<div id="account_content">
					<h2 class="content_title">계정 정보</h2>
					<div id="public_profile" class="content_item">
						<div class="item_title">
							<span>공개 프로필</span>
						</div>
						<div id="profile_content_wrapper">
							<div id="profile_img">
								이미지
							</div>
							<div id="profile_content">
								<div>
									<span id="nickname">사용자 이름</span>
								</div>
								<div>
									<span id="user_nickname">닉네임&lt;변수&gt;</span>
									<span id="nick_update_icon" class="material-icons">edit</span>
								</div>
							</div>
						</div>
					</div>	
					<div id="personal_info" class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>개인 정보</span>
							</div>
							<div class="content_update_wrapper">
								<button>편집</button>
							</div>
						</div> 
						<div id="personal_info_wrapper">
							<div id="personal_info_content">
								<div>
									<div class="info_title">이메일 주소</div>
									<div class="info_content">내용</div>
								</div>
								<div>
									<div class="info_title">이름</div>
									<div class="info_content">내용</div>
								</div>
								<div>
									<div class="info_title">성별</div>
									<div class="info_content">내용</div>
								</div>
								<div>
									<div class="info_title">생년월일</div>
									<div class="info_content">내용</div>
								</div>
								<div>
									<div class="info_title">전화번호</div>
									<div class="info_content">내용</div>
								</div>
							</div>
						</div>
					</div>	
					<div id="withdrawal" class="content_item">
						<div class="item_title_wrapper">
							<div class="item_title">
								<span>회원 탈퇴</span>
							</div>
							<div class="content_update_wrapper">
								<button>탈퇴</button>
							</div>
						</div>
						<div id="withdrawal_content">
							<span>
							 	계정을 폐쇄하면 모든 쇼미게임즈 게임과 온라인 서비스에 접속할 수 없으며, 현재 쇼미게임즈에서 주문한 내역들도 취소됩니다. <br>
							</span>
						</div> 
					</div>	
				</div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>
	<script src="${resource}/js/common.js"></script>
</body>
</html>