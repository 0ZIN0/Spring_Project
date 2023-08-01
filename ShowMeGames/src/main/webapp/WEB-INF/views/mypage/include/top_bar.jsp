<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<div id="top_bar">
		<div id="top_bar_logo">로고</div>
		<div></div>
		<div>
			<div id="top_bar_account">
				<div>
					<img src="${pageContext.request.contextPath}/resources/img/member/basic_member_img.png" alt="기본이미지">
				</div>
				<div>
					<span>아이디</span>
				</div>
				<div>
		            <svg id="arrow_icon" role="presentation" class="icon--arrow" width="40" height="40" viewBox="0 0 40 40" fill="none"
	                	xmlns="http://www.w3.org/2000/svg">
		            	<path d="M24 17H15L19.6957 23L24 17Z" fill="#767676" />
		            </svg>
				</div>
			</div>
			<div id="logout_button">
				<span class="material-icons">logout</span>
				<span>로그아웃</span> 
			</div>
		</div>
	</div>