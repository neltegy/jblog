<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%-- <link href="${pageContext.request.contextPath }/assets/css/guestbook.css" rel="stylesheet" type="text/css"> --%>
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.min.js"></script>

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
			<li><a href="">회원가입</a></li>
		
			<!-- 로그인 후 메뉴 -->
			<!-- <li><a href="">로그아웃</a></li>
			<li><a href="">내블로그</a></li> -->
				
 		</ul>
 		<!-- /메인해더 -->
 		
		<form class="join-form" id="join-form" method="post" action="${pageContext.request.contextPath}/user/join">
			<label class="block-label" for="name">이름</label>
			<input type="text" name="userName"  value="" />
			
			<label class="block-label" for="id">아이디</label>
			<input type="text" name="id"  value="" />
			<input id="btn-checkid" type="button" value="id 중복체크">
			<img id="img-checkid" style="display: none;" src="${pageContext.request.contextPath}/assets/images/check.png">
			<p class="form-error">
			</p>

			<label class="block-label" for="password">패스워드</label>
			<input type="password" name="password"  value="" />

			<fieldset>
				<legend>약관동의</legend>
				<input id="agree-prov" type="checkbox" name="agreeProv" value="y">
				<label class="l-float">서비스 약관에 동의합니다.</label>
			</fieldset>

			<input type="submit" value="가입하기">

		</form>
	</div>

<!-- 삭제팝업(모달)창 -->
	<div class="modal fade" id="del-pop">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<!-- <h4 class="modal-title">방명록삭제</h4> -->
				</div>
				<div class="modal-body">
					<h4 id="possible"></h4>
					<label>아이디</label>
					<input type="text" name="modalId" id="modalId"><br>	
					<!-- <h1 id="login_process"></h1> -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal" id="btn_cancel">취소</button>
					<button type="button" class="btn btn-danger" id="btn_use">사용하기</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->


</body>
<script type="text/javascript">
var id;

$("#btn-checkid").on("click",function(){
	id = $("[name=id]").val();
	console.log("id:"+id);
	$("#modalId").val(id);
	
	conajax();
	
	
	
	/* #possible 사용 가능한 아이디입니다. */
	
	$("#del-pop").modal();
});

function conajax(){
	$.ajax({
		url : "${pageContext.request.contextPath }/user/api/join",
		type : "post",
		/* contentType : "application/json",
		data : JSON.stringify(guestbookVo), */
		data : {id: id},
		
		dataType : "json",
		success : function(fail){
			/*성공시 처리해야될 코드 작성*/
			console.log(fail);
			console.log("success");
			
			if(fail == 0){
				$("#possible").text("사용 가능한 아이디입니다.").css("color","blue");
			}
			
			/* for(var i = 0 ; i < guestbooklist.length; i++){
				render(guestbooklist[i],"down");
			} */
		},
		
		error : function(XHR, status, error) {
			console.error(status + " : " + error);
		}

	});
};

</script>
</html>