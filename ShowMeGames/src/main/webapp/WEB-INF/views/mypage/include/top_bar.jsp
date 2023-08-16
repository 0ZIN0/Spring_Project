<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="${user.profile_url}" var="profile_img"/>
<c:url value="/" var="toMain"/>
<c:url value="/resources/img/logo" var="logo_img" />
	<div id="top_bar">
		<div id="top_bar_logo">
			<a href="${toMain}">
				<img src="${logo_img }/smg_mainLogo.png" alt="메인로고" />
			</a>
		</div>
		<div></div>
		<div>
			<div id="top_bar_account">
				<div>
					<img src="${profile_img}" alt="프로필사진">
				</div>
				<div>
					<span>${user.nick_name}</span>
				</div>
				<div>
		            <svg id="arrow_icon" role="presentation" class="icon--arrow" width="40" height="40" viewBox="0 0 40 40" fill="none"
	                	xmlns="http://www.w3.org/2000/svg">
		            	<path d="M24 17H15L19.6957 23L24 17Z" fill="#767676" />
		            </svg>
				</div>
			</div>
			<div id="logout_button">
				<a href="${pageContext.request.contextPath}/member/sessionLogout">
					<span class="material-icons">logout</span>
					<span>로그아웃</span>
				</a> 
			</div>
		</div>
	</div>