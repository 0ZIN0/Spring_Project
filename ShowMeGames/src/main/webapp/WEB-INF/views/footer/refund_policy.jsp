<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>환불정책</title>
	<jsp:include page="/WEB-INF/views/include/link/common.jsp"/>
	<jsp:include page="/WEB-INF/views/include/link/footer_css.jsp"/>
	<style>
		
	</style>
</head>
<body>
 	<div id="main">
		<div class="page-header">
				<h1 id="example-colors">쇼미게임즈 환불정책</h1>
		</div>
		<div id="content">
			<div class="row example-row example-type">
				<div class="col-lg-12">
					<p class="lead">
						쇼미게임즈에서는 다음과 같은 방법과 정책에 따라 취소/환불 요청을 하실 수 있습니다.<br />취소/환불에
						대한 궁금한 사항에 대해서는 고객지원 - 문의하기를 이용해주시기 바랍니다.
					</p>
				<div class="section">
					<h5>■ 취소/환불 요청 방법</h5>
					<p>
						1. 마이페이지 - 주문내역 탭에서 취소 요청할 주문의 `상세보기` 클릭합니다.<br />2. 주문
						상세페이지에서 비고란에 `주문취소` 클릭합니다.<br />3. 팝업창에 계좌정보를 입력하고 `취소요청`
						클릭하면, 요청이 완료됩니다.<br />※ 다이렉트 게임즈에서는 활성화(수신)되지 않은 제품 키에 한하여 구입
						후 7일 이내에 주문 취소가 가능합니다.<br />※ 이미 활성화가 완료되어 `주문취소` 버튼 없는 경우에는,
						고객지원 - 문의하기를 통해 요청해주시기 바랍니다.
					</p>
				</div>
				<div class="section">
					<h5>■ 취소/환불 절차</h5>
					<p>취소/환불 요청 &rarr; 고객센터에서 요청 건 접수 &rarr; 환불 가능 여부 확인 &rarr;
						결제 취소 또는 환불 금액 입금</p>
					<p>
						※ 취소/환불 요청 건은 영업일 기준 요청한 다음 날 고객센터 운영 시간에 순차적으로 처리됩니다.<br />※
						PG사 승인 절차로 인하여 환불 완료 시까지 공휴일을 제외한 영업일 기준 3~5일 정도의 기간이 소요될 수
						있습니다.<br />※ 결제 수단별로 환불 방법과 정책이 상이하며, 하단에 결제 수단별 환불정책을 확인해주시기
						바랍니다.
					</p>
				</div>
				<div class="section">
					<h5>■ 취소/환불이 불가능한 경우</h5>
					<p>
						&bull; 제품 코드(키) 활성화, 수신 또는 계정 동기화가 완료된 경우<br />&bull; 구입일로부터
						7일이 경과한 경우(단, 예약 판매 상품의 경우 제품 코드(키) 발송일로부터 7일)<br />&bull;
						플랫폼, 시스템 사양 및 지역 제한 등의 정보 미확인, 보유한 상품 중복 구매, 가격 변동 등 구매자의 실수 및
						부주의로 인해 문제가 발생의 경우<br />※ 제품 코드(키)에 문제가 발생한 경우에는, 고객지원 - 문의하기를
		 				통해 요청해주시기 바랍니다.
					</p>
				</div>
				<div class="section">
					<h5>■ 취소/환불이 가능한 경우</h5>
					<p>
						&bull; 구입일로부터 7일이 경과하지 않고, 제품 코드(키) 활성화(수신)를 진행하지 않은 경우<br />&bull;
						상품 정보 기입의 오류로 등록 및 게임 플레이에 문제가 발생한 경우
					</p>
				</div>
				<div class="section">
					<h5>■ 결제 수단별 환불정책</h5>
					
					<table style="border:solid 1px white">
						<thead style="border:solid 1px white">
							<tr>
								<th>결제수단</th>
								<th>환불정책</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>네이버페이</td>
								<td>&bull; 각 결제수단의 결제 취소로 환불</td>
							</tr>
							<tr>
								<td>페이코</td>
								<td>&bull; 간편계좌: 구매자가 기재한 계좌 정보로 환불 금액 입금<br />&bull;
									신용/체크카드, 페이코 쿠폰/포인트: 각 결제수단의 결제 취소로 환불
								</td>
							</tr>
							<tr>
								<td>계좌이체, 가상계좌</td>
								<td>&bull; 구매자가 기재한 계좌 정보로 환불 금액 입금</td>
							</tr>
							<tr>
								<td>휴대폰</td>
								<td>&bull; 부분취소: 쇼미게임즈 포인트로 환불<br />&bull; *당월 전체취소:
									결제수단의 결제 취소로 환불<br />&bull; 익월 전체취소: 쇼미게임즈 포인트로 환불
								</td>
							</tr>
						</tbody>
					</table>
					<p>* 매달 말일은 고객센터 운영시간을 기준으로 합니다. (고객센터 운영시간: 월~목 10:00~17:00
						(점심시간: 12:30~14:00) / 금 10:00~12:00 / 토, 일, 공휴일 휴무)</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%></body>
</html>