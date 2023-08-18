<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- common url settings 각자 디테일 페이지에 추가해야함 -->
<c:url value="/resources/games/css/detail_common.css"
	var="detail_common_css" />
<c:url value="/resources/games/js/detail_common.js"
	var="detail_common_js" />
<c:url value="/resources/layout/kcw/layout_kcw.css"
	var="layout_kcw_css" />
<c:url value="/resources/layout/kcw/layout_kcw.js"
	var="layout_kcw_js" />
<c:url value="/resources/img/games/layout/kcw/" var="img" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${game.game_name}</title>
<!-- header, footer css -->
<%@ include file="/WEB-INF/views/include/link/common.jsp"%>
<!-- common css 각자 디테일 페이지에 추가해야함 -->
<link rel="stylesheet" href="${detail_common_css}">
<link rel="stylesheet" href="${layout_kcw_css }" />
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	<main class="background_layer1">
		<div class="background_layer2">
			<div id="game_detail_div">
				<%@ include file="/WEB-INF/views/games/include/detail_top.jsp"%>
			</div>
			<hr />
		<div class="detail_div">
			<div class="content_div first">
				<img src="${img }${game.game_id }/img0.jpg" alt="" />
			</div>
			<div class="overflow second">
				<img src="${img }${game.game_id}/img1.jpg" alt="" />
				<div class="detail_text">
					<p>
						・자극으로 가득한 드넓은 세계<br>
						다채로운 시추에이션을 지닌 탁 트인 필드와 복잡하면서 입체적으로 짜인 거대한 던전이 경계선 없이 이어지는 드넓은 세계. <br>
						탐색 끝에는 미지의 것들을 발견했다는 기쁨과 높은 성취감으로 이어지는 압도적인 위협이 플레이어를 기다립니다.
					</p>
				</div>
			</div>
			<div class="overflow third">
				<img src="${img }${game.game_id}/img2.jpg" alt="" />
				<div class="detail_text">
					<p>
						・나만의 캐릭터<br>
플레이어 캐릭터는 겉모습의 커스터마이즈뿐만 아니라 지니는 무기와 방어구, 마법을 자유롭게 조합할 수 있습니다.<br>
근력을 높여 강인한 전사가 되거나 마술의 극치에 다다르는 등, 각자의 플레이 스타일에 맞춰 캐릭터를 성장시킬 수 있습니다.
					</p>
				</div>
			</div>
			<div class="overflow forth">
				<img src="${img }${game.game_id}/img3.jpg" alt="" />
				<div class="detail_text">
					<p>
						・나만의 캐릭터<br>
플레이어 캐릭터는 겉모습의 커스터마이즈뿐만 아니라 지니는 무기와 방어구, 마법을 자유롭게 조합할 수 있습니다.<br>
근력을 높여 강인한 전사가 되거나 마술의 극치에 다다르는 등, 각자의 플레이 스타일에 맞춰 캐릭터를 성장시킬 수 있습니다.
					</p>
				</div>
			</div>		
		</div>
		<div>
		hihi
		</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	<script src="${detail_common_js}"></script>
	<script src="${layout_kcw_js }"></script>
</body>
</html>