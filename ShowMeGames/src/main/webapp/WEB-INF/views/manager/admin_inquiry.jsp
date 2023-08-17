<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/manager" var="resource"/>
<c:url value="/resources/img/customer/inquiries/" var="inquiries_img"/>
<c:url value="/resources/manager/js/admin_inquiry.js" var="admin_inquiry"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>문의사항 관리</title>
	<%@ include file="/WEB-INF/views/manager/include/head_common.jsp" %>
	<!-- page css -->
	<link rel="stylesheet" href="${resource}/css/admin_inquiry.css">
</head>
<body>
	<!-- top_bar -->
	<%@ include file="/WEB-INF/views/manager/include/top_bar.jsp" %>
	
	<main class="background_layer1">
		<div id="main_content_wrapper" class="background_layer2">
			<!-- side_bar -->
			<%@ include file="/WEB-INF/views/manager/include/side_bar.jsp" %>
			<div id="main_content">
				<div id="account_content">
					<h2 class="content_title">문의사항 관리</h2>
					<div id="public_profile" class="content_item">
						<div class="item_title">
							<span>문의사항 리스트</span>
						</div>
						
							<div id="board_content">
								<div id="board_content_title">
									<div>글 번호</div>
									<div>문의구분</div>
									<div>제목</div>
									<div>글쓴이</div>
									<div>문의현황</div>
								</div>
								<div id="board_main">								
									<c:forEach items="${contents}" var="content">
										<div id="board" class="board">
											<div class="board_id board_header" >${content.inquiry_id}</div>
											<div class="board_subject board_header">${content.inquiry_subject}</div>
											<div class="board_title board_header">${content.inquiry_title}</div>
											<div class="board_writer board_header">${content.nick_name}</div>
											<div class="board_answer board_header">
												<c:if test="${empty content.inquiry_answer}">
													<button class="answer">답변하기</button>
												</c:if>
												<c:if test="${not empty content.inquiry_answer}">
													<button class="answer_edit">답변수정</button>
												</c:if>
											</div>															
											<div class="board_detail">
												<div class="board_content">
													<div class="detail_first">
														내용  
													</div>
													<div class="detail_last">
														${content.inquiry_content}
													</div>
												</div>
												<form method="POST" action="./admin_inquiry" id="form">
													<c:if test="${not empty content.inquiry_answer}">
														<div class="admin_answer" style="max-height:100vh">
															<div class="detail_first">답변</div>
															<div class="detail_last answer_detail">${content.inquiry_answer}</div>
														</div>
														<div class="admin_edit">
															<div class="detail_first">답변</div>
															<input type="hidden" name="inquiry_id" value="${content.inquiry_id}"/>
															<div class="detail_last edit_detail">
																<textarea name="inquiry_answer" class="textarea"rows="10" cols="121" maxlength="1000"  placeholder="${content.inquiry_answer}" style="resize: none;"></textarea>
															</div>
															<div class="save_btn edit_detail">
																<button class="save_btn" type="submit">수정</button>
															</div>
															<div class="edit_cancle edit_detail">
																<button type="reset"class="cancle">취소</button>
															</div>													
														</div>
													</c:if>
													<c:if test="${empty content.inquiry_answer}">
														<div class="admin_answer ">
															<div class="detail_first">답변</div>
															<input type="hidden" name="inquiry_id" value="${content.inquiry_id}"/>
															<div class="detail_last">
																<textarea name="inquiry_answer" class="textarea"rows="10" cols="121" maxlength="1000"  placeholder="내용을 입력해 주세요." style="resize: none;"></textarea>
															</div>
															<div class="save_btn">
																<button class="save_btn" type="submit">저장</button>
															</div>
															<div class="cancle_btn">
																<button type="reset"class="cancle_btn">취소</button>
															</div>													
														</div>
													</c:if>
												</form>
												<div class="board_attachment">
													<div class="detail_first">첨부파일</div>
													<div class="board_img detail_last">
														<img class="myImg"src="${inquiries_img}${content.attachment}" alt="첨부파일" />
													</div>
													<div id="myModal" class="modal">
													  <!-- The Close Button -->
													  <span class="close">&times;</span>										
													  <!-- Modal Content (The Image) -->
													  <img class="modal-content" id="img01" src="${inquiries_img}${content.attachment}"/>										
													</div>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
						</div> 
						<div id="pagingDiv" data-id="admin_inquiry"></div>
						<%@ include file="/WEB-INF/views/manager/include/paging.jsp" %>		
					</div>
				</div>
			</div>
		</div>
	</main>
	<script src="${admin_inquiry}"></script>
	<script src="${resource}/js/paging.js"></script>
</body>
</html>