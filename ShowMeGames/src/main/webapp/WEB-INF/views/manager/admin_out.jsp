<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/manager" var="resource"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>관리자 세션 종료</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/admin_out.css">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp" %>
	
	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp" %>
			<div id="main_content">
				<div id="account_content">
					<h2 class="content_title">관리자 세션 종료</h2>
					<div id="admin_out_content" class="content_item">
						<div class="item_title">
							<span>종료 확인</span>
						</div>
						<div>
							<ul>
								<li>보안을 위해 모든 작업 완료 후 반드시 종료 버튼을 통해 세션을 종료해주시기 바랍니다.</li>
								<li>세션이 종료되면 메인페이지로 이동합니다.</li>
							</ul>
						</div>
						<div id="btn_div">
							<button id="out_btn" class="btn cancel">종료</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	
	<script src="${resource}/js/admin_out.js"></script>
</body>
</html>