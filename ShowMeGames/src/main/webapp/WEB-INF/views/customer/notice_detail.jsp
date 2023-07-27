<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/customer/notice/notice_detail.css" var="notice_detail_css"/>
<c:url value="/resources/customer/notice/notice_detail.js" var="notice_detail.js"/>
<c:url value="/resources/img/customer/notice/" var="notice_img"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${notice_detail.css}" />
<%@ include file="/WEB-INF/views/include/link/common.jsp" %>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>

	<script src="${notice_detail_js}"></script>
</body>
</html>