
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../inc/adminTop.jsp"%>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		//유효성 검사
		$('#adminJoin').click(function() {
			var bool = true;

			$('.valid').each(function(idx, item) {
				if ($(this).val().length < 1) {
					alert($(this).prop("placeholder") + "를/을 입력하세요");
					$(this).focus();

					bool = false; //submit() 이벤트 진행을 막는다
					return false; //each() 탈출
				}
			});
		 if (bool) {
				if($('#chkId').val()=='N'){
					alert('사용가능한 아이디를 입력해주세요');
					bool=false;
				}else if ($('#pwd').val().length < 8 | $('#pwd').val().length>15) {
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
	
	$('#adminId').keyup(function(){		
		if(($(this).val()) && $(this).val().length>=3){
			$.ajax({
				url:"<c:url value='/admin/ajaxAdminCheckId.do'/>",
				type:"get",
				async:false,
				data:{adminId:$(this).val()},
				success:function(res){
					//true, false
					if(res){  //true => 사용가능
						$('.message').html("사용가능한 아이디");
						$('.message').show();	
						$('#chkId').val('Y');
					}else{
						$('.message').html("이미 존재하는 아이디");
						$('.message').show();						
						$('#chkId').val('N');
					}
				},
				error:function(xhr, status, error){
					alert("error:"+error);
				}
			});
		}else{
			$('.message').html("아이디는 3자리 이상!");
			$('.message').show();
			$('#chkId').val('N');
		}
		
	});  
		
	});

</script>
<style type="text/css">
.formDiv>div, fieldset>div {
	margin: 10px;
}

.regiAll {
	width: 430px;
	margin: 0 auto;
	border:1px solid #d9d9d9;
	padding:30px;
}

input[type=text], input[type=password] {
	height: 35px;
	border: none;
	border-bottom: 1px solid #d9d9d9;
}

legend {
	font-size: 1.2em;
	font-weight: bold;
	margin-bottom: 10px;
}
span{
	font-size: 0.8em;
}
#submits{
	text-align:center;
}
#adminJoin{
	width: 350px;
	height: 35px;
	background: #0e4699;
	color:white;
	border: none;
	font-size: 0.9em;
}

#idChkBtn{	
    border:  none;
    width: 100px;
    height: 30px;
    font-size: 0.8em;
    background: #9b9b9b;
    color: white;
    border-radius: 5px 5px;
}
.second{
	padding-left: 10px;
	padding-top: 16px;
	font-size: 0.9em;
}
.third{
	padding-left: 20px;
	font-size: 0.8em;
}
</style>
<div class="regiAll">

	<div id="frmAll">
		<form name="frm" method="post"
			action="<c:url value='/admin/register.do'/>">
			<fieldset class="formDiv">
				<legend>관리자 회원가입</legend>
				<div>
					<input type="text" placeholder="아이디" id="adminId" name="adminId" class="valid">
					<span class="message"></span>

				</div>
				<div>
					<input type="text" placeholder="이름" id="adminName" name="adminName"
						class="valid">
				</div>
				<div>
					<input type="password" placeholder="비밀번호" id="pwd" name="pwd" class="valid"> 
					<span>8~15자리</span>
				</div>
 
				<div>
					<input type="password" placeholder="비밀번호 확인" id="pwd2" name="pwd2"
						class="valid">
				</div>
				
				<input type="hidden" id="chkId" name="chkId" placeholder="chkid">
			</fieldset>
			<br> 

			<br> <br>
			<div id="submits">
				<input type="submit" id="adminJoin" value="회원가입">
			</div>

		</form>
	</div>

</div>
<%@ include file="../inc/adminBottom.jsp"%>