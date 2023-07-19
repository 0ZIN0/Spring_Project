<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>존재하지 않는 페이지</title>
	<!-- header, footer css -->
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
    <style>
        #main {
            width: 50%;
            border: 1px solid black;
            border-radius: 5px;
            text-align: center;
            margin: auto;
            margin-top: 100px;
            margin-bottom: 100px;
            padding: 200px 10px 200px 10px;
            white-space: nowrap;
            overflow: hidden;
        }
    </style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp" %>
	
    <div id="main">
        <h2>존재하지 않는 페이지입니다.</h2>
        <h3>ErrorCode: 404</h3>
        <button onclick="location.href='${pageContext.request.contextPath}/';">홈으로</button>
    </div>
    
    <%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
    
    <!-- header, footer js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp" %>    
</body>
</html>