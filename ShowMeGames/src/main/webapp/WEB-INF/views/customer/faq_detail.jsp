<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/customer/faq_detail/faq_detail.css" var="faq_detail_css" />
<c:url value="/resources/img/customer/faq" var="faq_img" />
<!DOCTYPE html>
<html>
<head lang="ko">
	<meta charset="UTF-8">
	<title>${qna.qna_title}</title>
	<link rel="stylesheet" href="${faq_detail_css}">
	<!-- header, footer css -->
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp" %>

	<div id="main">
	
        <%@ include file="/WEB-INF/views/include/customer/main_header.jsp" %>
        
        <div class="qna_blank">
            <button id="toList" onclick="location.href='../faq#main-category';" >목록</button>
        </div>

        <div id="main-body">
            <div id="main-content">
                <h1>[${qna.qna_topic}] ${qna.qna_title}</h1>
                <div class="main-content-text">
                    ${qna.qna_content}
                </div>
                <div>
                    <h3>글 번호</h3>
                    <span class="content-num">${qna.qna_id}</span>
                </div>
            </div>
        </div>
        
		<%@ include file="/WEB-INF/views/include/customer/faq_qnadiv.jsp" %>
        
	</div>


	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>

	<!-- header, footer js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp" %>
</body>
</html>