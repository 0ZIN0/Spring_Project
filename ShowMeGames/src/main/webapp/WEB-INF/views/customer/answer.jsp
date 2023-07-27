<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	file: ${inquiries.file_name}<br/>
	

	<form action="download" method="post">
		<input type="hidden" name="name" value="${inquiries.file_name }" />
		<input type="submit" value="download" />
	</form>
</body>
</html>