<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- c:url settings -->
<c:url value="/resources/games/css/default.css" var="default_css" />
<c:url value="/resources/games/js/default.js" var="default_js" />
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
								<span class="starpoint" style="width: ${100 * game.game_grade / 5}%;" />
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
										<img id="game_img_${i}" class="game_img_dto" alt="" src="${game.banner_img_url}">
									</div>
								</c:forEach>
								<div class="img-arrow">
									<span class="material-symbols-outlined img-arrow-btn">arrow_forward_ios</span>
								</div>
							</div>
						</div>
						<div id="game_detail_right"></div>
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