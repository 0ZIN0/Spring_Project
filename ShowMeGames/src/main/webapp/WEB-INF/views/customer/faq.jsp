<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="resources/customer/faq/faq.css" var="css1" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>자주 묻는 질문</title>
	<!-- css -->
	<link rel="stylesheet" href="${css1}">
	<!-- icons -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
	<!-- header, footer css -->
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp" %>


	
    <div id="main">

        
    </div>



	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
	
	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp" %>
</body>
</html>