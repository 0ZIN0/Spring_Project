<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- common url settings 각자 디테일 페이지에 추가해야함 -->
<c:url value="/resources/games/css/detail_common.css" var="detail_common_css" />
<c:url value="/resources/games/js/detail_common.js" var="detail_common_js" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${game.game_name}</title>
<!-- header, footer css -->
<%@ include file="/WEB-INF/views/include/link/common.jsp"%>
<!-- common css 각자 디테일 페이지에 추가해야함 -->
<link rel="stylesheet" href="${detail_common_css}">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp"%>
	<main class="background_layer1">
		<div class="background_layer2">
			<div id="game_detail_div">
				<%@ include file="/WEB-INF/views/games/include/detail_top.jsp"%>
				<!-- 아래부터는 free layout -->
				<div></div>
			</div>
		</div>
	</main>

	<%@ include file="/WEB-INF/views/include/footer/footer.jsp"%>

	<!-- js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp"%>
	<script src="${detail_common_js}"></script>
</body>
</html>