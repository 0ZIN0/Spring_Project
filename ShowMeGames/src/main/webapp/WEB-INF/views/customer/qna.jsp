<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/img/customer/faq" var="faq_img" />
<c:url value="/resources/customer/qna/qna.css" var="qna_css"/>
<c:url value="/resources/customer/qna/qna.js" var="qna_js"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의하기</title>
	<link rel="stylesheet" href="${qna_css}" />
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>

</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp" %>
	<%@ include file="/WEB-INF/views/include/customer/main_header.jsp" %>
	<div id='qna-container'>
		<div id='top-massage'>
			<p>※ 다이렉트 게임즈 고객센터 운영시간: 월~금 10:00~17:00 (점심시간: 12:00~14:00)/ 토, 일, 공휴일 휴무</p>
			<p>※ 운영시간 외에 문의하신 사항은 홈페이지, 전화, 메일의 대응이 모두 불가하며, 영업일 기준 다음 운영시간에 순차적으로 처리됩니다.</p>
			<p>※ 문의 사항의 내용과 고객센터 사정에 따라 응답이 다소 지연될 수 있습니다.</p>
		</div>
		<div class='qna-input'>
			<div><h2>문의하기</h2></div>
			<form id="form" method="POST" action="${pageContext.request.contextPath}/customer/inquiries" enctype="multipart/form-data" name="form">
			<div>
				<table class='qna-table'>
					<tr>
						<td class='qna-text'>문의구분</td>
						<td>
							<select id="title-select" name="inquiry_subject">
								<option value="select" selected>::선택::</option>
								<option value="All">모든 주제</option>
								<option value="이용방법">이용방법</option>
								<option value="계정">계정</option>
								<option value="주문">주문</option>
								<option value="환불">환불</option>
								<option value="등록">등록</option>
								<option value="설치">설치</option>
								<option value="상품">상품</option>
								<option value="기타">기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class='qna-text'>제목</td>
						<td>
							<input id="textbox" type="text" value="제목을 입력해주세요" name="inquiry_title" maxlength="100" style="width: 863px; height: 35px;"/>
						</td>					
					</tr>
					<tr>
						<td class='qna-text textarea'>내용</td>
						<td>
							<textarea id="textarea" name="inquiry_content" cols="100" rows="28" maxlength="1000" placeholder="내용을 입력해 주세요." style="resize: none;"></textarea>
						</td>				
					</tr>
					<tr>
						<td class='qna-text'>첨부파일</td>
						<td><input type="file" name="imgFile" accept="image/jpeg image/png image/gif"/></td>
					</tr>
					<tr>
						<td></td>
						<td>첨부파일은 최대 2MB입니다. (사용가능 파일 형식 - jpg / gif / png )</td>
					</tr>					
					<tr>
						<td class='btn' colspan='2'>
							<button class='submit-btn' type="submit">확인</button>
							<button class='close'>취소</button>						
						</td>
					</tr>	
				</table>
				
				
			</div>
			</form>
	</div>	
	</div>
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp" %>
	<script src="${qna_js}"></script>
</body>
</html>