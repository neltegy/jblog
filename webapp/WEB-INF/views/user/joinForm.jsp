<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="${pageContext.request.contextPath }/assets/css/jblog.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath }/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
	
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/bootstrap/js/bootstrap.min.js"></script>

<title>JBlog</title>
<link rel="stylesheet" href="/jblog/assets/css/jblog.css">
</head>
<body>
	<div class="center-content">
		
		<!-- 메인해더 -->
			<c:import url="/WEB-INF/views/includes/header.jsp"></c:import>
 		<!-- /메인해더 -->
 		
		<form class="join-form" id="join-form" method="post" action="${pageContext.request.contextPath}/user/joinexecution">
		
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
			<!-- <input type="button" value="가입하기" id="Btn_join"> -->
			<!-- <input type="button" value="가입하기" id="Btn_join"> -->

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
					<!-- <label>아이디</label> -->
					<h3 name="modalId" id="modalId"></h3><br>
					<!-- <input type="text" name="modalId" id="modalId"><br> -->	
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
var userName;
var password;
var agree;

$("[type=submit]").on("click",function(){ //가입하기 눌렀을때
	event.preventDefault();
	
	/* 메롱이닷 */
	
	/* $("#join-form").on("submit",function(){
		console.log("aaa");
	}); */
	id = $("[name=id]").val();
	userName = $("[name=userName]").val()
	password = $("[name=password]").val()
	agree = $("#agree-prov").is(":checked")
	console.log("id:"+id);
	console.log("userName:"+userName);
	console.log("password:"+password);
	console.log("agree:"+agree);
	
	if(!id || !userName || !password || !agree){
		console.log("하나이상 비어있습니다.");
		
		$("#possible").text("")
		$("#modalId").text("하나이상 비어있습니다.");
		$("#btn_use").css("display","none");
		
		$("#del-pop").modal();
	}else{
		console.log("꽉찼습니다.");
		
		console.log($("#join-form").trigger("submit"));
	}
	
	
});


$("#btn-checkid").on("click",function(){ // id 중복체크 눌렀을때
	id = $("[name=id]").val();
	
	if( id=="" || id==null || id==undefined || (id!=null && typeof id=="object" && !Object.keys(id).length)){
		$("#possible").text("")
		$("#modalId").text("아이디를 입력해주세요.");
		$("#btn_use").css("display","none");
		$("#del-pop").modal();
		
	}else{
		$("#modalId").text(id);
		$("#btn_use").css("display","inline");
		conajax();
		$("#del-pop").modal();
	}

});

$("#btn_use").on("click",function(){ //사용하기 버튼 눌렀을때
	$("#del-pop").modal("hide");
	
	$("#img-checkid").css("display","inline");
	
	$("[name=password]").selectRange(1,1);
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
			if(fail == 0){
				$("#possible").text("사용 가능한 아이디입니다.").css("color","blue");
			}else{
				$("#btn_use").css("display","none");
				$("#possible").text("사용 불가능한 아이디입니다.").css("color","red");
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


$.fn.selectRange = function(start, end) {
	return this.each(function() {
		if(this.setSelectionRange) {
			this.focus();
			this.setSelectionRange(start, end);
		}else if(this.createTextRange) {
			var range = this.createTextRange();
			range.collapse(true);
			range.moveEnd('character', end);
			range.moveStart('character', start);
			range.select();
		}
	});
};
</script>
</html>