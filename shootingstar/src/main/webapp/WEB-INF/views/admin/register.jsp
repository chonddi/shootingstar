
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../inc/adminTop.jsp"%>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
	$(function() {
		
		//유효성 검사
		$('#adminJoin').click(function() {
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
				}
			}

		return bool;

		});
			

	$('#adminId').keyup(function(){
		if(validate_adminId($(this).val()) && $(this).val().length>=3){
			$.ajax({
				url:"<c:url value='/admin/ajaxCheckId.do'/>",
				type:"get",
				data:{adminId:$(this).val()},
				error:function(xhr,error,status){
					alert("error="+error);
				},
				success:function(res){
					//true 사용가능 / false 불가능
					if(res){
						$('.message').html("사용 가능 아이디!!");
						$('.message').show();
						$('#chkId').val('Y');
					}else{
						$('.message').html("사용 불가 아이디!!");
						$('.message').show();
						$('#chkId').val('N');
					}
				}
			});
						
			$('.message').hide();
		}else{
			$('.message').html("아이디는 3자리 이상!!");
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

<!-- 
					<input type="button" id="idChkBtn" value="이메일 인증" onclick="checkMail()" />
					<span id="auth" style="color: green; font-size: 0.9em; display: none;">인증되었습니다</span> 
					
				</div>
				<div id="joincode" style="display: none">
					<input type='number' name="inputCode" id="inputCode" placeholder="인증번호">
					<input type="button" id="codeBtn" value="확인" />
-->
				</div>
				<div>
					<input type="text" placeholder="이름" id="adminName" name="adminName"
						class="valid">
				</div>
				<div>
					<input type="password" placeholder="비밀번호" id="pwd" name="pwd" class="valid"> 
					<span>8~15자리</span>
				</div>
<!-- 
				<div>
					<input type="password" placeholder="비밀번호 확인" id="pwd2" name="pwd2"
						class="valid">
				</div>
				<div>
					<input type="text" placeholder="휴대폰 번호" id="tel" name="tel"
						class="valid"> <span>(-없이)</span>
				</div>
 -->
				<input type="text" id="chkId" name="chkId">
			</fieldset>
			<br> 
<!--
			<div id="agreement">
				<fieldset>
					<legend style="font-size:0.9em;">이용약관 동의</legend>
					<table style="margin: 0 auto;">
						<tr>
							<td style="padding-bottom: 14px;"><input type="checkbox" id="chkAll" value="chkAll" style="margin-top: 0px;"></td>
							<td class="second"><label for="chkAll"> 전체동의</label></td>
						</tr>
						<tr>
							<td><input type="checkbox" id="chk1" class="chk" value="chk" style="margin-top: 0px;"></td>
							<td class="second"><label for="chk1"> 만 14세 이상입니다.(필수)</label></td>
							<td class="third"><a href="#">상세보기</a></td>
						</tr>
						<tr>
							<td><input type="checkbox" id="chk2" class="chk" value="chk" style="margin-top: 0px;"></td>
							<td class="second"><label for="chk2"> 서비스 약관동의(필수)</label></td>
							<td class="third"><a href="#">상세보기</a></td>
						</tr>
						<tr>
							<td><input type="checkbox" id="chk3" class="chk" value="chk" style="margin-top: 0px;"></td>
							<td class="second"><label for="chk3"> 개인정보 수집 ·이용에 대한 동의(필수)</label></td>
							<td class="third"><a href="#">상세보기</a></td>
						</tr>
					</table>
				</fieldset>
			</div>
  -->			
			<br> <br>
			<div id="submits">
				<input type="submit" id="adminJoin" value="회원가입">
			</div>

		</form>
	</div>

</div>
<%@ include file="../inc/adminBottom.jsp"%>