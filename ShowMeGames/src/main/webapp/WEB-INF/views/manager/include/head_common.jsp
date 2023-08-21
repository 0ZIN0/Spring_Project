<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url value="/resources/common/css/common.css" var="common_css" />    
<c:url value="/resources/manager/css/common.css" var="manager_common"/>
<c:url value="/resources/img/favicon" var="favicon"/>

<!-- JQuery -->
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<!-- google_icons -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!-- background css -->
<link rel="stylesheet" href="${common_css}">
<!-- manager common css -->
<link rel="stylesheet" href="${manager_common}">

<!-- favicon -->
<link rel="apple-touch-icon" sizes="180x180" href="${favicon}/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32" href="${favicon}/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16" href="${favicon}/favicon-16x16.png">
<link rel="manifest" href="${favicon}/site.webmanifest">