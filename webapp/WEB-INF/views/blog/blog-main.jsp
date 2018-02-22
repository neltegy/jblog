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
			<h1><a href="${pageContext.request.contextPath}/${authUser.id}">${blogVo.blogTitle}</a></h1><!-- blogTitle -->
			<ul>
				<c:choose>
					<c:when test="${authUser == null }">
						<!-- 로그인 전 메뉴 -->
						<li><a href="${pageContext.request.contextPath}/user/login">로그인</a></li>
					</c:when>
					<c:when test="${authUser.userNo == blogVo.userNo }">
						<!-- 로그인 전 메뉴 -->
						<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
						<li><a href="${pageContext.request.contextPath}/${authUser.id}/admin/basic">내블로그 관리</a></li>
					</c:when>
					<c:otherwise>
						<!-- 로그인 후 메뉴 -->
						<li><a href="${pageContext.request.contextPath}/user/logout">로그아웃</a></li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
		<!-- /블로그 해더 -->
		
		<div id="wrapper">
			<div id="content">
				<div class="blog-content">
					<h4>
						<c:choose>
							<c:when test="${WriteVo == null }">
								${listOfWriteVo[0].postTitle }
							</c:when>
							<c:otherwise>
								${WriteVo.postTitle }
							</c:otherwise>
						</c:choose>
					</h4>
					<p>
						<c:choose>
							<c:when test="${WriteVo == null }">
								${listOfWriteVo[0].postContent }
							</c:when>
							<c:otherwise>
								${WriteVo.postContent }
							</c:otherwise>
						</c:choose>
					<p>
				</div>
				<ul class="blog-list">
					<c:forEach items="${listOfWriteVo }" var="list">
						<li><a href="${pageContext.request.contextPath}/${id}?postNo=${list.postNo }&cateNo=${list.cateNo}">${list.postTitle }</a> <span>${list.regDate }</span>	</li>
					</c:forEach>
				</ul>
			</div>
		</div>

		<div id="extra">
			<div class="blog-logo">
				<img src="${blogVo.logoFile}"> <!-- logoFile -->
			</div>
		</div>
		
		<div id="navigation">
			<h2><a href="${pageContext.request.contextPath}/${id}?cateNo=-1&index=0">카테고리</a></h2>
			<ul>
				<c:forEach items="${categoryVoList}" var="catelist">
					<li><a href="${pageContext.request.contextPath}/${id}?cateNo=${catelist.cateNo}&index=1">${catelist.cateName} </a></li>
				</c:forEach>
			</ul>
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