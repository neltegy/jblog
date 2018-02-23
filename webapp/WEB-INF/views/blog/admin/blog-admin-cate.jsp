<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JBlog</title>
<link rel="stylesheet" href="/jblog/assets/css/jblog.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
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
					<li class="selected"><a href="${pageContext.request.contextPath}/${authUser.id}/admin/category">카테고리</a></li>
					<li><a href="${pageContext.request.contextPath}/${authUser.id}/admin/write">글작성</a></li>
				</ul>
				
		      	<table class="admin-cat">
		      		<tr>
		      			<th>번호</th>
		      			<th>카테고리명</th>
		      			<th>포스트 수</th>
		      			<th>설명</th>
		      			<th>삭제</th>      			
		      		</tr>
					
				</table>
      			
      			<h4 class="n-c">새로운 카테고리 추가</h4>
		      	<table id="admin-cat-add">
		      		<tr>
		      			<td class="t">카테고리명</td>
		      			<td><input type="text" name="name"></td>
		      		</tr>
		      		<tr>
		      			<td class="t">설명</td>
		      			<td><input type="text" name="desc"></td>
		      		</tr>
		      		<tr>
		      			<td class="s">&nbsp;</td>
		      			<td><input type="submit" value="카테고리 추가"></td>
		      		</tr>      		      		
		      	</table>
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
<script type="text/javascript">
var page = 1;
$(document).ready(function(){
	
	conajax();
});

function conajax(){
	$.ajax({
		url : "${pageContext.request.contextPath }/excutionList/admin/category",
		type : "post",
		/* contentType : "application/json",
		data : JSON.stringify(cate), */
		data : {page: page},
		
		dataType : "json",
		success : function(cateList){
			/*성공시 처리해야될 코드 작성*/
			console.log(cateList);
			
			for(var i = 0 ; i < cateList.length; i++){
				render(cateList[i],"down");
			}
			
		},
		
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}

	});
};

function render(cateVo , updown){
	var str = "";
	
	str += "<tr id='"+cateVo.cateNo+"'>";
	str +=	"<td>"+cateVo.cateNo+"</td>";
	str +=	"<td>"+cateVo.cateName+"</td>";
	str +=	"<td>"+cateVo.count+"</td>";
	str +=	"<td>"+cateVo.description+"</td>";
	str +=	"<td><input class='delete_test' type='image' src='/jblog/assets/images/delete.jpg' data-count="+cateVo.count+" data-cateno="+cateVo.cateNo+"></td>";
	str += "</tr>";
	
	if(updown == "up"){
		$(".admin-cat").prepend(str);
	}else if(updown == "down"){
		$(".admin-cat").append(str);
	}else{
		console.log("updown 오류");
	}
	
};

$(".admin-cat").on("click",".delete_test",function(){
	var count = $(this).data("count");
	var cateno = $(this).data("cateno");
	
	if(count != 0){
		alert('글이 있어서 삭제할수 없습니다.');
	}else{
		/* 태그 remove() */
		$("#"+cateno).remove(); 
		/* 아작스로  실제 db삭제 */
		$.ajax({
			url : "${pageContext.request.contextPath }/delete/admin/category",
			type : "post",
			/* contentType : "application/json",
			data : JSON.stringify(cate), */
			data : {cateno: cateno},
			
			dataType : "json",
			success : function(str){
				/*성공시 처리해야될 코드 작성*/
				console.log(str);
				
			},
			
			error : function(XHR, status, error) {
				console.error(status + " : " + error);
			}

		});
	}
	
});

$("[type=submit]").on("click",function(){
	//ajax로 방금 보낸데이터로 받아서 up으로해서 추가한다.
	var cateName = $("[name=name]").val();
	var description = $("[name=desc]").val();
	
	$("[name=name]").val("");
	$("[name=desc]").val("");
	
	var cateVo = {
		cateName: cateName,
		description: description,
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath }/excutionAdd/admin/category",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(cateVo),
		
		dataType : "json",
		success : function(return_categoryvo){
			/*성공시 처리해야될 코드 작성*/
			render(return_categoryvo,"down");
		},
		
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}

	});
});
</script>
</html>