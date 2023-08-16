<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="prePage" value="${paging.currPage - 1}" scope="page" />
<c:set var="largePrePage" value="${paging.currPage - 5}" scope="page" />
<c:set var="nextPage" value="${paging.currPage + 1}" scope="page" />
<c:set var="largeNextPage" value="${paging.currPage + 5}" scope="page" />
    
<div id="pageDiv">
	<c:choose>
		<c:when test="${paging.currPage == 1}">
			<button class="navi_btn" disabled>&laquo;</button>
		</c:when>
		<c:when test="${largePrePage < 1}">
			<button type="button" class="navi_btn" data-page="1">&laquo;</button>
		</c:when>
		<c:otherwise>
			<button type="button" class="navi_btn" data-page="${prePage}">&laquo;</button>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${prePage >= paging.firstPage}">
			<button type="button" id="prePageBtn" class="navi_btn" data-page="${prePage}">&#9664;</button> 
		</c:when>
		<c:otherwise>
			<button id="prePageBtn" class="navi_btn" disabled>&#9664;</button> 
		</c:otherwise>
	</c:choose>		
	<c:forEach items="${paging.pageList}" var="pageNum">
		<c:choose>
			<c:when test="${pageNum == paging.currPage}">
				<button type="button" id="now-page" class="page_btn" data-page="${pageNum}">${pageNum}</button> 
			</c:when>
			<c:otherwise>
				<button type="button" class="page_btn" data-page="${pageNum}">${pageNum}</button>
			</c:otherwise>
		</c:choose>		
	</c:forEach>
	<c:choose>
		<c:when test="${nextPage <= paging.lastPage}">
			<button type="button" id="nextPageBtn" class="navi_btn" data-page="${nextPage}">&#9654;</button>
		</c:when>
		<c:otherwise>
			<button type="button" id="nextPageBtn" class="navi_btn" disabled>&#9654;</button> 
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${paging.currPage == paging.lastPage}">
			<button type="button" class="navi_btn" disabled>&raquo;</button>
		</c:when>
		<c:when test="${largeNextPage > paging.lastPage}">
			<button type="button" class="navi_btn" data-page="${paging.lastPage}">&raquo;</button>
		</c:when>
		<c:otherwise>
			<button type="button" class="navi_btn" data-page="${largeNextPage}">&raquo;</button>
		</c:otherwise>
	</c:choose>
</div>