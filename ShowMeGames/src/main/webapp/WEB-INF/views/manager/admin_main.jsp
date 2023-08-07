<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/common/css/common.css" var="common_css" />
<c:url value="/resources/manager" var="resource"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>메인페이지</title>
	<!-- background css -->
	<link rel="stylesheet" href="${common_css}">
	<!-- manager css -->
	<link rel="stylesheet" href="${resource}/css/common.css">
	<link rel="stylesheet" href="${resource}/css/admin_main.css">
</head>
<body>
	<main class="background_layer1">
		<div id="main_wrapper" class="background_layer2">
			<div id="content_wrapper">
				<h2 class="content_title">환영합니다. 등록번호 ${manager_token}번 관리자님</h2>
				<div id="content">
					
				</div>
			</div>
		</div>
	</main>	
</body>
</html>