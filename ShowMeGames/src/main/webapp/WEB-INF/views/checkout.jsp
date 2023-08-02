<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- c:url settings -->
<c:url value="/resources/checkout/checkout.css" var="checkout_css" />
<c:url value="/resources/checkout/checkout.js" var="checkout_js" />
<c:url value="/resources/img/checkout/" var="img" />
<c:url value="/resources/common/css/common.css" var="common_css" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체크 아웃</title>
<script src="https://kit.fontawesome.com/c48a5ad62b.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<!-- css -->
<link rel="stylesheet" href="${checkout_css}">
<link rel="stylesheet" href="${common_css}">
<!-- payment port one api -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js"
	integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
	crossorigin="anonymous"></script>
</head>
<body>
	<div id="refund-popup" class="refund-none">
		<div id="refund-content">
			<div id="refund-top">
				<i id="refund-big-icon" class="fa-solid fa-rotate">&nbsp;</i> <span
					id="refund-close-btn" class="material-symbols-outlined">close</span>
			</div>
			<div id="refund-bottom">
				<div>PC 게임 구매에 대한 환불</div>
				<div class="refund_innder">
					<p>게임 플레이 시간이 2시간 미만이라면, 구매일로부터 14일 이내에 PC 게임의 환불을 요청할 수 있습니다.</p>
					<p>Show me games의 주문 내역 페이지에서 PC 게임 환불 요청을 신청할 수 있습니다.</p>
					<p>*다음의 제품을 구매하는 경우, 구매자는 콘텐츠를 즉시 이용할 수 있으며, 철회권을 포기한다는 점에
						동의하게됩니다. 그에 따라 다음 상품의 구매는 최종적이며 환불 대상이 아닙니다. 소모품, 디지털 콘솔 키 다운로드
						가능한 콘텐츠(예: 확장팩), 게임 내 화폐, 게임 내 상점에서 이루어진 구매</p>
				</div>
			</div>
		</div>
	</div>
	<header id="checkout-header">
		<div id="header-top">
			<a id="logo-btn" href="./">로고</a>
			<div id="unit-info">
				<i class="fa-brands fa-bitcoin"></i> ${user.user_point}
			</div>
		</div>
		<div id="header-bottom">
			<div>
				<a id="back-link-btn" href="./cart">
					<div>
						<span class="material-symbols-outlined">arrow_back</span>
					</div>
					<div>뒤로</div>
				</a>
				<div id="header-checkout-info">
					<a id="cart-link-btn" class="header-bottom-info" href="./cart">
						<div>
							<span class="material-symbols-outlined header-info">check_circle</span>
						</div>
						<div>장바구니</div>
					</a>
					<div>
						<span class="material-symbols-outlined header-info-arrow">arrow_forward_ios</span>
					</div>
					<div class="header-bottom-info">
						<div>
							<span class="material-symbols-outlined header-info">counter_2</span>
						</div>
						<div>결제</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<main id="checkout-main">
		<div id="checkout-content">
			<div id="checkout-main-content">
				<div>
					<h3 id="checkout-title">&nbsp;결제</h3>
					<span class="material-symbols-outlined">credit_score</span>
					<div>안전거래</div>
				</div>
				<div id="checkout-form">
					<div>
						<label for="name">이름 *</label> <input
							class="input-ok checkout-input-form" id="first-name" type="text"
							value="" />
						<p id="first-name-p" class="input-p">다음 정보가 필요합니다.</p>
					</div>
					<div>
						<label for="name">성 *</label> <input
							class="input-ok checkout-input-form" id="last-name" type="text"
							value="" />
						<p id="last-name-p" class="input-p">다음 정보가 필요합니다.</p>
					</div>
					<div>
						<label for="name">주소 *</label> <input
							class="input-ok checkout-input-form" id="address" type="text"
							value="" />
						<p id="address-p" class="input-p">다음 정보가 필요합니다.</p>
					</div>
					<div>
						<label for="name">우편번호 *</label> <input
							class="input-ok checkout-input-form" id="post-num" type="text"
							value="" />
						<p id="post-num-p" class="input-p">다음 정보가 필요합니다.</p>
						<p id="post-num-regex" class="input-p">올바른 우편번호를 입력해주세요. (예:
							12345)</p>
					</div>
					<div>
						<h4 id="unit-title">바이트(Byte) 사용</h4>
						<div id="unit-form">
							<div>
								<label class="unit-label" for="have-unit">보유</label> <input
									class="unit-input" id="have-unit" type="text"
									value="${user.user_point}" data-haveunit="${user.user_point}"
									readonly /> Byte
								<div id="point-use-info">1000 Byte 이상부터 사용 가능합니다.</div>
							</div>
							<div>
								<label class="unit-label" for="have-unit">사용</label> <input
									class="unit-input" id="use-unit" type="text" placeholder="0"
									oninput="inputNumberOnly(this)" /> <span id="unit">Byte</span>
								<button class="button-ok" id="all-unit-btn" type="button">전액사용</button>
							</div>
						</div>
					</div>
					<div>
						<button id="check-out-btn">결제하기</button>
					</div>
				</div>
				<p id="checkout-main-content-info">Show me games는 상품 구매 목적을 위해
					사용자의 개인정보를 처리합니다. 개인정보 처리 및 권리 행사에 대한 자세한 정보는 Show me games 개인정보
					보호정책을 확인하세요.</p>
			</div>
			<div id="nav-bar">
				<div id="nav-top">
					<div>
						<h3>&nbsp;고객님의 장바구니</h3>
						<a id="cart-change-btn" href="./cart">수정</a>
					</div>
					<div id="top-cart-list">
						<div id="checkout-cart-top">
							<div>${cart_len} 항목</div>
							<div id="banner-list-div">
								<c:forEach items="${cart_list}" var="game">
									<img class="game_banner_img" alt=""
										src="${game.banner_img_url}">
								</c:forEach>
							</div>
						</div>
						<div class="display-none" id="checkout-cart-mid"
							data-orderid="${order_id}" data-gamecnt="${cart_len}"
							data-price="${total_price}" data-name="${cart_list[0].game_name}"
							data-email="${user.user_id}" data-phonenum="${user.phone_number}">
							<c:forEach items="${cart_list}" var="game" varStatus="status">
								<div class="game-detail-grid" id="game-detail-${game.game_id}">
									<img class="game_detail_banner_img" alt=""
										src="${game.banner_img_url}">
									<div class="game_detail_content-grid">
										<div class="detail-game-name">${game.game_name}</div>
										<div class="detail-game-platform">플랫폼:
											${platforms[status.index]}</div>
										<div class="detail-game-price">
											<c:choose>
												<c:when test="${game.discounted_price > 0}">
													₩ <fmt:formatNumber type="number" maxFractionDigits="3"
														value="${game.discounted_price}" />
												</c:when>
												<c:otherwise>
													무료
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
						<div id="checkout-cart-bottom">
							<div>장바구니 상세정보</div>
							<span class="material-symbols-outlined expand_more">expand_more</span>
						</div>
					</div>
				</div>
				<div>
					<h3>&nbsp;요약</h3>
					<div id="nav-grid">
						<div id="summary-grid">
							<div>
								<div>소계 (${cart_len} 항목)</div>
								<div class="price" id="lower-order">
									₩
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${total_price}" />
								</div>
							</div>
							<div>
								<div>합계</div>
								<div>부가세 포함</div>
								<div></div>
								<div class="price" id="total-order" data-totalprice="${total_price}">
									₩
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${total_price}" />
								</div>
							</div>
							<div>
								<div id="add-point" data-addpoint="${unit}">해당 구매로 획득하는 바이트</div>
								<div class="price">
									<i class="fa-brands fa-bitcoin"></i> ${unit}
								</div>
							</div>
						</div>
						<div>
							<a id="refund-btn"> <i id="refund-icon"
								class="fa-solid fa-rotate">&nbsp;</i>구매 확정 혹은 환불
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<footer id="checkout-footer"> </footer>

	<!-- js -->
	<script>
		const usePoint = $('#use-unit');
		const allUnitBtn = $('#all-unit-btn');
		const totalOrder = $('#total-order');
		let havePointVal = $('#have-unit').data('haveunit');
		let totalPrice = totalOrder.data('totalprice');
		
		usePoint.on("propertychange change keyup paste input", function() {
			let usePointVal = $(this).val();
			if (usePointVal == havePointVal) {
				allUnitBtn.removeClass('button-ok');
				allUnitBtn.addClass('button-none');
			} else {
				allUnitBtn.addClass('button-ok');
				allUnitBtn.removeClass('button-none');
			}

			if (usePointVal > havePointVal) {
				allUnitBtn.removeClass('button-ok');
				allUnitBtn.addClass('button-none');
				alert("보유한 Byte보다 큰 값입니다.");
				usePoint.val(havePointVal);
				totalPrice = totalOrder.data('totalprice') - havePointVal;
				totalOrder.text('₩ ' + addComma(totalPrice));
				console.log("point:", usePoint.val());
			} else {
				totalPrice = totalOrder.data('totalprice') - usePointVal;
				totalOrder.text('₩ ' + addComma(totalPrice));
			}
		});

		allUnitBtn.click(function(e) {
			if (havePointVal < 1000) {
				alert("1000Byte 이상 보유 시 사용 가능합니다.");
				return;
			}
			if (allUnitBtn.hasClass('button-ok')) {
				allUnitBtn.removeClass('button-ok');
				allUnitBtn.addClass('button-none');
				usePoint.val(havePointVal);
				totalPrice = totalOrder.data('totalprice') - havePointVal;
				totalOrder.text('₩ ' + addComma(totalPrice));
			} else {
				allUnitBtn.addClass('button-ok');
				allUnitBtn.removeClass('button-none');
				usePoint.val(0);
				totalPrice = totalOrder.data('totalprice');
				totalOrder.text('₩ ' + addComma(totalPrice));
			}
		});

		function addComma(value) {
			return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		}
		
		// checkout api
		$("#check-out-btn").click(function (e) {

		    const data = $('#checkout-cart-mid');
		    const gameCnt = data.data('gamecnt');
		    let game_name = data.data('name');
		    const user_name = last_name.val() + first_name.val();
		    const email = data.data('email');
		    const phoneNum = data.data('phonenum');
		    const price = totalPrice;
		    const order_id = data.data('orderid') + 1;
		    const addPoint = $('#add-point').data('addpoint');
		    console.log(addPoint);
		    if (gameCnt > 1) {
		        game_name += " 외 " + (gameCnt - 1);
		    }

		    if (price <= 0) {
		        return;
		    }

		    console.log(gameCnt, user_name);

		    if (first_name.val() == "" || last_name.val() == "" || address.val() == "" || post_num.val() == "" || !is_post_ok) {
		        return;
		    } else {
		        IMP.init('imp10327314');

		        IMP.request_pay({
		            pg: "html5_inicis",
		            pay_method: "card",
		            merchant_uid: order_id,   // 주문번호
		            name: game_name,   // 상품명
		            amount: 1,  // 숫자 타입 (가격)
		            buyer_email: email, // 회원 아이디
		            buyer_name: user_name, // 회원 실제 이름
		            buyer_tel: phoneNum, // 전화번호
		            buyer_addr: address.val(),
		            buyer_postcode: post_num.val()
		        }, function (rsp) { // callback
		            if (rsp.success) {
		                var msg = '결제가 완료되었습니다';
		                var result = {
		                    "order_id": rsp.merchant_uid,
		                    "imp_uid": rsp.imp_uid,
		                    "buyer_name": rsp.buyer_name,
		                    "buyer_email": email,
		                    "order_date": new Date().getTime(),
		                    "order_price": rsp.paid_amount,
		                    "order_status": rsp.status,
		                    "pay_method": rsp.pay_method,
		                    "use_point": totalOrder.data('totalprice') - price,
		                    "add_point": addPoint,
		                    "address": rsp.buyer_addr
		                }
		                console.log("결제성공 " + msg);
		                $.ajax({
		                    url: './checkout-success',
		                    type: 'POST',
		                    data: JSON.stringify(result,
		                        ['order_id', 'imp_uid', 'buyer_email',
		                            'order_date', 'order_price', 'order_status', 'pay_method', 'use_point', 'add_point', 'buyer_name', 'address']),
		                    contentType: 'application/json;charset=utf-8',
		                    dataType: 'json', //서버에서 보내줄 데이터 타입
		                    success: function (res) {
		                        if (res == 1) {
		                            location.href = `./orderfin?order_id=${rsp.merchant_uid}`;
		                        } else {
		                            console.log("Insert Fail!!!");
		                        }
		                    },
		                    error: function () {
		                        console.log("Insert ajax 통신 실패!!!");
		                    }
		                }) //ajax
		            } else {
		                alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
		            }
		        });
		    }
		});
	</script>
	<script src="${checkout_js}"></script>

</body>
</html>