<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<span>코드넘버: ${manager_token}</span>
				</div>
				<div>
					<span>관리자님</span>
				</div>
			</div>
		</div>
	</div>