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
	<div class="center-content">
		
		<!-- 메인해더 -->
			<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
 		<!-- /메인해더 -->
		
		<form class="login-form" method="post" action="${pageContext.request.contextPath}/user/loginexecution">
      		<label>아이디</label> 
      		<input type="text" name="id">
      		
      		<label>패스워드</label> 
      		<input type="text" name="password">
      		
      		<p class="form-error">
				
			</p>
      		<input type="submit" value="로그인">
		</form>
		
	</div>
	<div id="dialog-message" title="" style="display:none">
  		<p></p>
	</div>
</body>
<script type="text/javascript">
var id;
var password;
$("[type=submit]").on("click",function(){
	event.preventDefault();
	
	id = $("[name=id]").val();
	password = $("[name=password]").val();
	
	console.log(id);
	console.log(password);
	
	conajax();
	
});

function conajax(){
	var userVo = {
			id: id,
			password: password
	}
	
	$.ajax({
		url : "${pageContext.request.contextPath }/user/api/login",
		type : "post",
		contentType : "application/json",
		data : JSON.stringify(userVo),
		
		dataType : "json",
		success : function(fail){
			/*성공시 처리해야될 코드 작성*/
			if(fail == 0){
				$(".form-error").text("잘못된 로그인 정보입니다.").css("color","red");
			}else{
				$(".login-form").trigger("submit")
			}
			
		},
		
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}

	});
};
</script>
</html>