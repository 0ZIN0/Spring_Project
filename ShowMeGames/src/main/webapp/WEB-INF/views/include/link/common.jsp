<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/index/css/header.css" var="header_css" />    
<c:url value="/resources/index/css/footer.css" var="footer_css" />
<c:url value="/resources/common/css/common.css" var="common_css" />
<c:url value="/resources/img/favicon" var="favicon"/>

<!-- icons -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    
<link rel="stylesheet" href="${header_css}">
<link rel="stylesheet" href="${footer_css}">
<link rel="stylesheet" href="${common_css}">

<!-- favicon -->
<link rel="apple-touch-icon" sizes="180x180" href="${favicon}/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${favicon}/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${favicon}/favicon-16x16.png">
<link rel="manifest" href="${favicon}/site.webmanifest">