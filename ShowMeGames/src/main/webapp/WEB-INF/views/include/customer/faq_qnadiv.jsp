<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
        <div class="qna_blank"></div>

        <div id="qnaDiv">
            <h1>찾으시는 정보가 없습니까?</h1>
            <div></div>
           	<c:if test="${not empty sessionScope.isLoggedIn}">
            	<button style="height: 50px; width: 90px;" onclick="location.href='${pageContext.request.contextPath}/customer/qna';">문의</button>
           	</c:if>           	
           	<c:if test="${empty sessionScope.isLoggedIn}">
           		<button style=" height: 50px; width: 250px;" onclick="openLoginPopup()">로그인 후 이용해주세요</button>
           	</c:if>
        </div>

        <div class="qna_blank"></div>