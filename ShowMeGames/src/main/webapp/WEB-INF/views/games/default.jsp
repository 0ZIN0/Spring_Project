<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- c:url settings -->
<c:url value="/resources/games/css/default.css" var="default_css" />
<c:url value="/resources/games/js/default.js" var="default_js" />
<c:url value="/resources/img/games/" var="img" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${game.game_name}</title>
<!-- header, footer css -->
<%@ include file="/WEB-INF/views/include/link/common.jsp"%>
<!-- css -->
<link rel="stylesheet" href="${default_css}">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>

	<main class="background_layer1">
		<div class="background_layer2">
			<div id="game_detail_div">
				<div id="detail_top">
					<div id="game_title_div">
						<div id="game_name_div">${game.game_name}</div>
						<div id="game_grade_div">
							<div class="stararea">
								<span class="starpoint"
									style="width: ${100 * game.game_grade / 5}%;" />
							</div>
							<div id="game_grade_content">${game.game_grade}</div>
						</div>
					</div>
					<div id="game_detail_grid">
						<div id="game_detail_img">
							<img id="game_img_selected" alt="" src="${game.banner_img_url}">
							<div id="game_img_list">
								<div class="img-arrow">
									<span class="material-symbols-outlined img-arrow-btn">arrow_back_ios</span>
								</div>
								<c:forEach begin="1" end="5" var="i">
									<div>
										<img id="game_img_${i}" class="game_img_dto" alt=""
											src="${game.banner_img_url}">
									</div>
								</c:forEach>
								<div class="img-arrow">
									<span class="material-symbols-outlined img-arrow-btn">arrow_forward_ios</span>
								</div>
							</div>
						</div>
						<div id="game_detail_right">
							<div id="game_detail_img_div">
								<img id="right_img" alt="" src="${game.banner_img_url}">
							</div>
							<c:choose>
								<c:when test="${game.discount > 0}">
									<div id="right-price-div" class="game_price_div">
										<div class="right-price-title">정상가</div>
										<div id="game_price">
											₩
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${game.game_price}" />
										</div>
										<div id="game_discount">-${game.discount}%</div>
									</div>
								</c:when>
								<c:otherwise>
									<div id="none-price-div" class="game_price_div"></div>
								</c:otherwise>
							</c:choose>
							<div id="right-discount-price-div" class="game_price_div">
								<div class="right-price-title">판매가</div>
								<div id="game_discounted_price">
									₩
									<fmt:formatNumber type="number" maxFractionDigits="3"
										value="${game.discounted_price}" />
								</div>
							</div>
							<div id="game_detail_point_div">
								<div id="point_title">쇼미 리워드</div>
								<div id="add_point">
									<c:choose>
										<c:when test="${user.user_grade eq 'S'}">
											5% 적립
										</c:when>
										<c:when test="${user.user_grade eq 'A'}">
											4% 적립
										</c:when>
										<c:when test="${user.user_grade eq 'B'}">
											3% 적립
										</c:when>
										<c:when test="${user.user_grade eq 'C'}">
											2% 적립
										</c:when>
										<c:otherwise>
											1% 적립
										</c:otherwise>
									</c:choose>
								</div>
							</div>
							<div id="game_age_grade_div">
								<c:forEach items="${rateds}" var="rated">
									<div class="game_age_grade_content">
										<c:choose>
											<c:when test="${rated eq '12'}">
												<img class="game_age_grade" alt="" src="${img}age12.svg">
											</c:when>
											<c:when test="${rated eq '15'}">
												<img class="game_age_grade" alt="" src="${img}age15.svg">
											</c:when>
											<c:when test="${rated eq '18'}">
												<img class="game_age_grade" alt="" src="${img}age18.svg">
											</c:when>
											<c:when test="${rated eq '0'}">
												<img class="game_age_grade" alt="" src="${img}ageAll.svg">
											</c:when>
											<c:when test="${rated eq 'cr'}">
												<img class="game_age_grade" alt="" src="${img}crime.svg">
											</c:when>
											<c:when test="${rated eq 'dr'}">
												<img class="game_age_grade" alt="" src="${img}drug.svg">
											</c:when>
											<c:when test="${rated eq 'fe'}">
												<img class="game_age_grade" alt="" src="${img}fear.svg">
											</c:when>
											<c:when test="${rated eq 'ga'}">
												<img class="game_age_grade" alt="" src="${img}gambling.svg">
											</c:when>
											<c:when test="${rated eq 'se'}">
												<img class="game_age_grade" alt="" src="${img}sensuality.svg">
											</c:when>
											<c:when test="${rated eq 'vi'}">
												<img class="game_age_grade" alt="" src="${img}violent.svg">
											</c:when>
											<c:when test="${rated eq 'wr'}">
												<img class="game_age_grade" alt="" src="${img}wrongword.svg">
											</c:when>
										</c:choose>
									</div>
								</c:forEach>
							</div>
							<div id="game_detail_btn_div">
								<button id="checkoutBtn">지금 구매</button>
								<button id="cartBtn">장바구니에 담기</button>
							</div>
						</div>
					</div>
				</div>

				<!-- 아래부터는 free layout -->
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	<script src="${default_js}"></script>
</body>
</html>