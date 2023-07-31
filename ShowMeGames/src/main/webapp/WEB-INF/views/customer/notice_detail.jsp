<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:url value="/resources/customer/notice_detail/notice_detail.css" var="notice_detail_css"/>
<c:url value="/resources/customer/notice_detail/notice_detail.js" var="notice_detail.js"/>
<c:url value="/resources/img/customer/notice/" var="notice_img"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="${notice_detail_css}"/>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<%@ include file="/WEB-INF/views/include/link/common.jsp" %>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	
	<div id="notice_container">
		<div class="detail_header">
			<div id="detail_notice"><h1 style="font-size:50px; text-align:left;">공지사항</h1></div>
			<div class="board">
				<a href="../notice">
					<span style="font-size:60px; color:black;" class="material-symbols-outlined">
					menu
					</span>
				</a>
			</div>
		</div>
		<div id="notice_title" style="height:70px;">${detail.notice_title}</div>
		<div class="top_icon" >
			<div>
				<i style="font-size:12px;" class="fa-solid fa-calendar-days">  <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${detail.write_date}"/></i>	
			</div>
		</div>
		<br>
		<div>
			<img class="img" src="/smg/resources/img/customer/notice/${detail.banner_url}" alt="공지사항 이미지" />
		</div>
		<br>
		<br>
		<div class="notice_content">
			${detail.notice_content}
		</div>
				
	</div>
		
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>

	<script src="${notice_detail_js}"></script>
</body>
</html>