<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<link rel="stylesheet" href="<c:url value='/css/register.css'/>">
<style type="text/css">
.regiAll{
	width:400px;
	height:500px;
	background: white;
}
.h1{
	font-size:1.5em;
	margin-bottom: 35px;
	font-weight: bold;
}
body{
	background: #eee
}
#memJoin{
	width: 350px;
	background: #0e4699;
	margin-top:20px;
	font-weight: bold;
}
.valid{
	margin-bottom: 10px;
}
footer{
    margin-top: 60px;
}
</style>
<script type="text/javascript">
	$(function(){
		$('#memJoin').click(function() {
			var bool = true;

			$('.valid').each(function(idx, item) {
				if ($(this).val().length < 1) {
					alert($(this).prop("placeholder") + "을/를 입력하세요");
					$(this).focus();

					bool = false; //submit() 이벤트 진행을 막는다
					return false; //each() 탈출
				}
			});
			
			if (bool) {
				if ($('#pwd').val().length < 8 | $('#pwd').val().length>15) {
					alert('비밀번호는 8~15자리 입니다.');
					$('#pwd').focus();
					bool = false;
				} else if ($('#pwd').val() != $('#pwd2').val()) {
					alert('비밀번호가 일치하지 않습니다.');
					$('#pwd2').focus();
					bool = false;
				} 
			}
			

			return bool;
		});
	});
</script>
<div class="regiAll">
	<h1 class="h1">새 비밀번호 설정</h1>
	<form method="post" action="<c:url value='/login/findPassword.do'/>">
	<div>새 비밀번호를 설정해주세요</div><br>
		<div>
			<input type="password" placeholder="비밀번호" id="pwd" name="pwd" class="valid" size="30"> 
			<span>8~15자리</span>
		</div>
		<div>
			<input type="password" placeholder="비밀번호 확인" id="pwd2" name="pwd2" class="valid" size="30">
		</div>
		<div id="submits">
			<input type="submit" id="memJoin" value="변경하기">
		</div>
 		<input type="hidden" name="userid" value="${userid }">
 		<input type="hidden" name="userCode" value="${param.userCode}">
	</form>
</div>
	
<%@ include file="../inc/bottom.jsp"%>