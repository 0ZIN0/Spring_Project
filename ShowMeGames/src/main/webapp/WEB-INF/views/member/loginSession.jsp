<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>세션 페이지</h2>
	
	<% String id = (String)session.getAttribute("user_id"); %>
	
	<%=id %> 로그인 중 
	
	<br />
	
	<a href = "./sessionLogout">로그아웃 </a>

</body>
</html>