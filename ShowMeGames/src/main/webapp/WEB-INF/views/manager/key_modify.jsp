<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:choose>
		<c:when test="${modifyKey != 1 }">
			<script>window.alert("올바르지 않은 키 양식입니다");
			window.location.href = './admin_key';
			</script>
		</c:when>
		<c:when test="${modifyAccount != 1 }">
			<script>window.alert("존재하지 않은 닉네임입니다");
			window.location.href = './admin_key';
			</script>
		</c:when>
		<c:otherwise>
			<script>window.alert("수정되었습니다!");
			window.location.href = './admin_key';
			</script>
		</c:otherwise>

	</c:choose>


</body>
</html>