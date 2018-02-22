<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="/jblog/assets/css/jblog.css">
</head>
<body>

	<div id="container">
		
		<!-- 블로그 해더 -->
		<div id="header">
			<h1 id="header-title"><a href="${pageContext.request.contextPath}/${authUser.id}">${blogVo.blogTitle}</a></h1>
			<ul>
				<c:choose>
					<c:when test="${authUser == null }">
					<!-- 로그인 전 메뉴 -->
					<li><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
					</c:when>
					<c:otherwise>	
					<!-- 로그인 후 메뉴 -->
					<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
					<li><a href="${pageContext.request.contextPath}/${authUser.id}/admin/basic">내블로그 관리</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- /블로그 해더 -->

		
		<div id="wrapper">
			<div id="content" class="full-screen">
				<ul class="admin-menu">
					<li><a href="${pageContext.request.contextPath}/${authUser.id}/admin/basic">기본설정</a></li>
					<li><a href="${pageContext.request.contextPath}/${authUser.id}/admin/category">카테고리</a></li>
					<li class="selected"><a href="${pageContext.request.contextPath}/${authUser.id}/admin/write">글작성</a></li>
				</ul>
				
				
				<form action="${pageContext.request.contextPath}/excution/admin/write" method="post">
			      	<table class="admin-cat-write">
			      		<tr>
			      			<td class="t">제목</td>
			      			<td>
			      				<input type="text" size="60" name="postTitle">
				      			<select name="category">
				      				<c:forEach items="${categoryList}" var="catelist">
				      					<option>${catelist.cateName}</option>
				      				</c:forEach>
				      			</select>
				      		</td>
			      		</tr>
			      		<tr>
			      			<td class="t">내용</td>
			      			<td><textarea name="postContent"></textarea></td>
			      		</tr>
			      		<tr>
			      			<td>&nbsp;</td>
			      			<td class="s"><input type="submit" value="포스트하기"></td>
			      		</tr>
			      	</table>
				</form>
			</div>
		</div>
		
		<!-- 푸터 -->
		<div id="footer">
			<p>
				<strong>Spring 이야기</strong> is powered by JBlog (c)2018
			</p>
		</div>
		<!-- 푸터 -->
		
	</div>
</body>
</html>