<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="resources/index/css/index.css" var="css1" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Show Me Games</title>
	<link rel="stylesheet" href="${css1}">
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
</head>
<body>
	
	<h2>Main Page 입니다.</h2>
	
	<a href="./detail?id=1">게임1로 가기</a>
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
</body>
</html>