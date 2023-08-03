<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- c:url settings -->
<c:url value="/resources/checkout/orderfin.css" var="orderfin_css" />
<c:url value="/resources/checkout/orderfin.js" var="orderfin_js" />
<c:url value="/resources/img/checkout/" var="img" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 완료</title>
<!-- header, footer css -->
<%@ include file="/WEB-INF/views/include/link/common.jsp"%>
<!-- css -->
<link rel="stylesheet" href="${orderfin_css}">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	<main id="orderfin-main">
		<div id="orderfin-title">&nbsp;결제 완료</div>
		<div id="orderfin-grid">
			<div id="orderfin-grid-top">
				<span id="orderfin-grid-title">결제가 정상적으로 완료</span>되었습니다.
			</div>
			<div id="orderfin-grid-bottom">
				<div id="orderfin-info-grid">
					<div class="orderfin-info-h3">결제 정보</div>
					<div class="orderfin-detail-div">
						<div class="orderfin-info-h4">주문번호</div>
						<div id="order-imp-uid">${order.imp_uid}</div>
					</div>
					<div class="orderfin-detail-div">
						<div class="orderfin-info-h4">주문자 명</div>
						<div class="orderfin-info-default">${order.buyer_name}</div>
					</div>
					<div class="orderfin-detail-div">
						<div class="orderfin-info-h4">배송지 정보</div>
						<div class="orderfin-info-default">${order.address}</div>
					</div>
					<div id="orderfin-point-info">
						<div id="orderfin-point-info-title">Byte 적립 현황</div>
						<div id="orderfin-point-info-grid">
							<div class="point-grid-div">
								<div class="orderfin-info-h4">적립된 Byte</div>
								<div class="orderfin-info-default">${order.add_point}</div>
							</div>
							<div class="point-grid-div">
								<div class="orderfin-info-h4">사용한 Byte</div>
								<div class="orderfin-info-default">${order.use_point}</div>
							</div>
							<div class="point-grid-div">
								<div class="orderfin-info-h4">총 보유한 Byte</div>
								<div id="orderfin-user-point">${user_point}</div>
							</div>
						</div>
					</div>
				</div>
				<div id="orderfin-payment-grid">
					<div class="orderfin-info-h3">결제 내역</div>
					<div id="orderfin-payment-detail">
						<div class="orderfin-detail-div">
							<div class="orderfin-info-h4">결제 금액</div>
							<div id="orderfin-order-price">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${order.order_price}" /> 원
								</div>
						</div>
						<div class="orderfin-detail-div">
							<div class="orderfin-info-h4">결제일시</div>
							<div class="orderfin-info-default">
								<fmt:formatDate  var="date" value="${order.order_date}" type="DATE" pattern="yyyy.MM.dd HH:mm"/>${date}
							</div>
						</div>
					</div>					
				</div>
			</div>
		</div>
	</main>
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	<script src="${orderfin_js}"></script>

</body>
</html>