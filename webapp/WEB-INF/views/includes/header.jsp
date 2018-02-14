<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		
<a href="${pageContext.request.contextPath}">
	<img class="logo" src="/jblog/assets/images/logo.jpg">
</a>
<ul class="menu">
	<c:choose>
		<c:when test="${authUser == null }">			
		<!-- 로그인 전 메뉴 -->
		<li><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
		<li><a href="${pageContext.request.contextPath}/user/join">회원가입</a></li>
		</c:when>
		<c:otherwise>
		<!-- 로그인 후 메뉴 -->
		<li><a href="">로그아웃</a></li>
		<li><a href="">내블로그</a></li>
		</c:otherwise>
	</c:choose>
</ul>