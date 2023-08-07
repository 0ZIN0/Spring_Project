<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/manager" var="resource"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>관리자 인증</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/certification.css">
</head>
<body>
	
	<main class="background_layer1">
		<div id="main_wrapper" class="background_layer2">
			<div id="form_wrapper_div">
				<div class="item_title">
					<span>관리자 로그인</span>
				</div>
				<form action="${pageContext.request.contextPath}/admin/confirm" method="POST">
					<div id="form_content_div">		
						<div class="input_title_div">
							<label for="mng_id">
								<span class="material-icons">manage_accounts</span>
								관리자ID
							</label>
						</div>
						<div class="input_div">
							<input id="mng_id" name="mng_id" type="text" autocomplete="off">
						</div>
						<div class="input_title_div">
							<label for="mng_pw">
								<span class="material-icons">password</span>
								비밀번호
							</label>
						</div>
						<div class="input_div">
							<input id="mng_pw" name="mng_pw" type="password">
						</div>
					</div>
					<div id="btn_div">
						<button type="submit" id="submit_btn" class="btn">인증하기</button>
					</div>
				</form>
			</div>
		</div>
	</main>
	
</body>
</html>