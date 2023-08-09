<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<!-- c:url settings -->
<c:url value="/resources/img/games/rated/" var="rated_img" />
<c:url value="/resources/img/games" var="game_img" />
<div id="detail_top">
	<div id="game_title_div">
		<div id="game_name_div">${game.game_name}</div>
		<div id="game_grade_div">
			<div class="stararea">
				<span class="starpoint"
					style="width: ${100 * game.game_grade / 5}%;"></span>
			</div>
			<div id="game_grade_content">${game.game_grade}</div>
		</div>
	</div>
	<div id="game_detail_grid">
		<div id="game_detail_img">
			<c:forEach items="${images}" var="image" varStatus="status">
				<div class="imgSlides">
					<img id="game_img_selected" alt="${image.image_name}" src="${game_img}${image.image_url}">
				</div>
			</c:forEach>
			<div id="game_img_list">
				<div id="prev-btn" class="img-arrow" onclick="plusSlides(-1)">
					<span class="material-symbols-outlined img-arrow-btn">arrow_back_ios</span>
				</div>
				<c:forEach items="${images}" var="image" varStatus="status">
					<div>
						<img data-id="img_${image.image_id}" id="img_${image.image_id}"
							class="demo cursor game_img_dto" alt="${image.image_name}" src="${game_img}${image.image_url}"
							onclick="currentSlide(${status.index + 1})">
					</div>
				</c:forEach>
				<div id="next-btn" class="img-arrow" onclick="plusSlides(1)">
					<span class="material-symbols-outlined img-arrow-btn">arrow_forward_ios</span>
				</div>
			</div>
		</div>
		<div id="game_detail_right">
			<div id="game_detail_img_div">
				<img id="right_img" alt="${sub_banner.image_name}" src="${game_img}${sub_banner.image_url}">
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
						<img class="game_age_grade" alt="" src="${rated_img}${rated}.svg">
					</div>
				</c:forEach>
			</div>
			<div id="game_detail_btn_div" data-session="${user}"
				data-user="${user.user_num}" data-cart="${game.game_id}">
				<button id="checkoutBtn">지금 구매</button>
				<button id="cartBtn">장바구니에 담기</button>
			</div>
		</div>
	</div>
</div>