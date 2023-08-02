<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
	<!-- modal:profile_img -->
	<div id="img_update_modal" class="modal_bg">
		<div class="modal_container">
			<div class="modal_content">
				<div class="item_title_wrapper">
					<div class="item_title">
						<span>프로필 사진 변경</span>
					</div>
					<div id="img_modal_close" class="content_update_wrapper">
						<button class="btn cancel">닫기</button>
					</div>
				</div>
				<div id="img_update_content">
					<form id="form_img_update" action="./profile_img_update" method="post" enctype="multipart/form-data">
						<input type="hidden" name="user_num" value="${user.user_num}"/>
					</form>
					<div>
						<div class="modal_content_title">
							프로필 사진 선택
						</div>
						<div id="img_select_div">
							<div>
								<div id="img_select_div_inner">
									<img id="img_preview" src="${profile_img}" alt="프로필사진">
								</div>
							</div>
							<div>
								<div class="filebox">
								    <label for="img_file">파일찾기</label> 
								    <input id="img_file_name" class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
								    <input type="file" id="img_file" name="img_file" accept="image/jpg, image/jpeg, image/png" form="form_img_update">
								</div>
							</div>
						</div>
					</div>
					<div>
						<div class="modal_content_title">프로필 사진 관련 규정</div>
						<div>
		                    <ul>	
		                        <li>jpg, png, jpeg 파일만 가능합니다.</li>
		                        <li>프로필 사진은 가로, 세로 110px에 최적화되어 있습니다.</li>
		                        <li>파일명에 언더바(_)를 제외한 특수문자가 포함되면 안됩니다.</li>
	    	                </ul>
						</div>
					</div>
					<div>
						<button id="img_modal_close_btn" class="btn cancel">취소</button>
						<button id="img_modal_comfirm_btn" type="submit" class="btn" form="form_img_update">변경</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- modal:nickname -->
	<div id="nickname_update_modal" class="modal_bg">
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
				<div id="nickname_update_content">
					<form id="form_nickname_update" action="./nickname_update">
						<input type="hidden" name="user_num" value="${user.user_num}">
					</form>
					<div>
						<div class="modal_content_title">
							<label class="modal_label" for="username">사용자 이름</label>
						</div>
						<input id="username" name="username" type="text" spellcheck="false" value="${user.nick_name}" form="form_nickname_update">
					</div>
					<div>
						<div class="modal_content_title">사용자 이름 관련 규정</div>
						<div>
		                    <ul>	
		                        <li>3~15자 사이로 작성해야 합니다.</li>
		                        <li>숫자, 영어, 한글, 대시(-), 밑줄(_)만 입력 가능합니다</li>
		                        <li>남들에게 보여지는 이름입니다</li>
	    	                </ul>
						</div>
					</div>
					<div>
						<button id="modal_close_btn" class="btn cancel">취소</button>
						<button id="modal_comfirm_btn" type="submit" class="btn" form="form_nickname_update">변경</button>
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
				<div id="account_content">
					<h2 class="content_title">계정 정보</h2>
					<div id="public_profile" class="content_item">
						<div class="item_title">
							<span>공개 프로필</span>
						</div>
						<div id="profile_content_wrapper">
							<div id="profile_img">
								<img src="${profile_img}" alt="프로필사진">
								<div id="profile_update_div">
									<span id="profile_update_icon" class="material-icons">edit</span>
								</div>
							</div>
							<div id="profile_content">
								<div>
									<span id="nickname">사용자 이름</span>
								</div>
								<div>
									<span id="user_nickname">${user.nick_name}</span>
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
									<div class="info_content">${user.user_id}</div>
								</div>
								<div>
									<div class="info_title">이름</div>
									<div class="info_content">${user.user_name}</div>
								</div>
								<div>
									<div class="info_title">성별</div>
									<div class="info_content">
										<c:choose>
											<c:when test="${user.gender == 1}">남</c:when>
											<c:when test="${user.gender == 2}">여</c:when>
											<c:otherwise>미정</c:otherwise>
										</c:choose>
									</div>
								</div>
								<div>
									<div class="info_title">생년월일</div>
									<div class="info_content">
										<fmt:formatDate value="${user.birth_date}" pattern="yyyy년 MM월 dd일"/>
									</div>
								</div>
								<div>
									<div class="info_title">전화번호</div>
									<div class="info_content">${user.phone_number}</div>
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
	<script src="${resource}/js/account_information.js"></script>
</body>
</html>