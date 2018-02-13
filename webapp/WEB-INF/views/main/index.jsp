<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="/jblog/assets/css/jblog.css">
</head>
<body>
	<div class="center-content">
		
		<!-- 메인해더 -->
		<a href="">
			<img class="logo" src="/jblog/assets/images/logo.jpg">
		</a>
		<ul class="menu">
			
			<!-- 로그인 전 메뉴 -->
			<li><a href="">로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/user/join">회원가입</a></li>
		
			<!-- 로그인 후 메뉴 -->
			<!-- <li><a href="">로그아웃</a></li>
			<li><a href="">내블로그</a></li> -->
				
 		</ul>
 		<!-- /메인해더 -->
		
		<form class="search-form">
			<fieldset>
				<input type="text" name="keyword" />
				<input type="submit" value="검색" />
			</fieldset>
			<fieldset>
				<input type="radio" name="which" value="blog-title"> <label>블로그 제목</label>
				<input type="radio" name="which" value="blog-user"> <label>블로거</label>
			</fieldset>
		</form>
	</div>
</body>
</html>