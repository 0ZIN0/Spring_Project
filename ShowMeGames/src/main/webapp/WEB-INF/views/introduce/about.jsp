<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/introduce/css/about.css" var="about_css"/>
<c:url value="/resources/img/introduce/about" var="img"/>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>쇼미게임즈 - 회사소개</title>
	<!-- css -->
	<link rel="stylesheet" href="${about_css}">
	<!-- header, footer css -->
	<%@ include file="/WEB-INF/views/include/link/common.jsp" %>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/header/header.jsp" %>
	
    <div id="main">
        <div>
            <div>
                <div class="about-img">
                    <img src="${img}/about01.jpg" alt="사진">
                </div>
                <div class="about-text">
                    <h2>게임 퍼블리싱과 글로벌 유통</h2>
                    <span>전 세계에 최고의 타이틀 제공을 목표로 다양한 장르의 PC 및 콘솔 인기 타이틀을 지속적으로 퍼블리싱하고 있습니다. 스팀, 아마존, GOG 등의 글로벌 유통 플랫폼을 통해 다양한 PC 게임 콘텐츠를 공급함은 물론, PlayStation 스토어, 닌텐도 e숍 등의 디지털 스토어를 통해 콘솔 게임 콘텐츠를 공급하고 있습니다. 앞으로도 게임 퍼블리싱 분야의 리더로서 H2INT는 계속해서 글로벌 파트너들과의 새로운 협력 체제를 구축하고 유저들에게 항상 새로운 엔터테인먼트의 체험을 전달할 수 있도록 발전해가겠습니다.</span>
                </div>
            </div>
            <div>
                <div class="about-text">
                    <h2>신규 플랫폼 사업 및 게임 개발 지원</h2> 
                    <span>ESD(Electronic Software Distribution) 서비스와 연계한 한국 최초의 디지털 유통 채널 쇼미게임즈 운영과 클라우드 플랫폼을 통해 PC, IPTV, Mobile과 같은 다양한 디바이스에 게임 콘텐츠를 공급하는 등 퍼블리싱 사업 다각화에 앞장서고 있습니다. 또한, 국내 PC 및 콘솔 게임 산업의 동력을 확보할 수 있도록 경쟁력 있는 인디 개발자들을 발굴 및 지원함은 물론, 해외 게임 시장 진출을 적극 타진하여 수출 역량을 강화하고 있습니다. H2INT는 지속적인 연구개발 투자와 적극적인 시장 개척을 통해 사회적 기업으로 발돋움하고 세계적인 기업으로 성장하겠습니다.</span>
                </div>
                <div class="about-img">
                    <img src="${img}/about02.jpg" alt="사진">
                </div>
            </div>
        </div>
    </div>
	
	<%@ include file="/WEB-INF/views/include/footer/footer.jsp" %>
	
	<!-- header, footer js -->
	<%@ include file="/WEB-INF/views/include/link/js/js_common.jsp" %>
</body>
</html>