<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
	$(function(){
		//약관 전체동의
		$('#chkAll').click(function(){
			$('.chk').prop('checked', this.checked);
		});
		
		//이메일 인증 코드
		$('#codeBtn').click(function(){
			$.ajax({
				url:"<c:url value='/member/code.do' />",
				type:"GET",
				data:{code:$('#inputCode').val()},  //파라미터
				success:function(res){
					if(res==2){
						$('#idChk').val('Y');
						$('#sMemberId').prop('readonly','readonly');
						$("#joincode").css("display", "none");
						$('#idChkBtn').css("display", "none")
						$('#auth').css('display', '');
						$('#sName').focus();
					}else{
						alert('인증번호가 틀렸습니다.');
						$('#inputCode').val('');
					}
				},
				error:function(xhr, status, error){
					alert('error:'+error+", status: "+status)
				}
				
			});
		});
		
		//유효성 검사
		$('#memJoin').click(function(){			
			var bool=true;
			$('.valid').each(function(idx, item){
				if($(this).val().length<1){
					alert($(this).prop("placeholder")+"을/를 입력하세요");
					$(this).focus();
					
					bool=false;  //submit() 이벤트 진행을 막는다
					return false;  //each() 탈출
				}
			});
			if(bool){
				$('.chk').each(function(idx,item){
					if(!$(this).is(":checked")){
						alert('약관에 동의해주세요.');
						$(this).focus();
						bool=false;  //submit() 이벤트 진행을 막는다
						return false;  //each() 탈출
					}
				});
				if(bool){
					$('.valid2').each(function(idx, item){
						if($(this).val()==""){
						alert($(this).parent().prev().html()+"을 첨부해주세요");
						$(this).focus();
						
						bool=false;  //submit() 이벤트 진행을 막는다
						return false;  //each() 탈출
						}
					});
				
					if(bool){
						if ($('#sPwd').val().length < 8 | $('#sPwd').val().length>15) {
							alert('비밀번호는 8~15자리 입니다.');
							$('#sPwd').focus();
							bool= false;
						}else if($('#sPwd').val()!=$('#sPwd2').val()){
							alert('비밀번호가 일치하지 않습니다.');
							$('#sPwd2').focus();
							bool= false;
						}else if(!validate_phoneno($('#sTel').val())){
							alert('휴대폰 번호는 숫자만 가능합니다.');
							$('#sTel').focus();
							bool= false;
						}else if($('#idChk').val()!='Y'){
							alert('이메일 인증을 먼저 하세요.');
							$('#idChkBtn').focus();
							bool= false;			
						}
					}
				}
			}
			return bool;
		});
	
	});
	
	//이메일 인증 중복확인
	 function checkMail() {
        var memberId = document.getElementById("sMemberId").value;
 
        if (memberId == "") {
            alert("메일을 입력해 주세요.")
            return false;
        }
 
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4) {
                var data = JSON.parse(xhttp.responseText);
                if (data != null) {
                    alert("이미 가입한 메일 입니다.");
                    $("#joincode").css("display", "none");
                } else {
                    sendMail(memberId);
                    $("#joincode").css("display", "");
                }
            }
        }; 
        xhttp.open("POST", '<c:url value="/member/checkMail.do" />', true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        xhttp.send('memberId=' + memberId+"&userCode=2");
        return false;
    }
 
	//이메일 인증 메일 발송
    function sendMail(memberId) {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (xhttp.readyState == 4) {
                if (xhttp.status == 200)
                    alert("메일을 정상적으로 보냈습니다.");
                else
                    alert("올바른 메일 형식이 아닙니다.");
            }
        };
        xhttp.open("POST", '<c:url value="/member/sendMail.do" />', true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        xhttp.send('memberId=' + memberId);
        return false;
    }
       
</script>
<link rel="stylesheet" href="<c:url value='/css/register.css'/>">
<style type="text/css">
.regiAll {
	width: 460px;
}
#memJoin{
	width: 400px;
	background: #2c8e06;
}
.addr{
	font-size: 0.8em;
}
.valid2{
	padding-left: 20px;
}
#fileTbl td{
	font-size:0.9em;
	padding-top: 20px;
}
#codeBtn{
	width:70px;
}
</style>
<div class="regiAll">

	<div id="frmAll">
		<form name="frm" method="post"
			action="<c:url value='/sMember/sRegister.do'/>" enctype="multipart/form-data">
			<fieldset class="formDiv">
				<legend>전문가 회원가입</legend>
				<div>
					<input type="text" placeholder="이메일" id="sMemberId" name="sMemberId"
						class="valid">
					<input type="button" id="idChkBtn" value="이메일 인증" onclick="checkMail()" />
					<span id="auth" style="color: green; font-size: 0.9em; display: none;">인증되었습니다</span>
				</div>
				<div id="joincode" style="display: none">
					<input type='number' name="inputCode" id="inputCode" placeholder="인증번호">
					<input type="button" id="codeBtn" value="확인" />
				</div>
				<div>
					<input type="text" placeholder="이름" id="sName" name="sName"
						class="valid">
				</div>
				<div>
					<input type="password" placeholder="비밀번호" id="sPwd" name="sPwd" class="valid"> 
					<span>8~15자리</span>
				</div>
				<div>
					<input type="password" placeholder="비밀번호 확인" id="sPwd2" name="sPwd2"
						class="valid">
				</div>
				<div>
					<input type="text" placeholder="휴대폰 번호" id="sTel" name="sTel"
						class="valid"> <span>(-없이)</span>
				</div>
				<input type="hidden" id="idChk" name="idChk" value="N">
				
				<div><textarea name="pr" rows="10" cols="45" placeholder="회원님의 소개를 간략하게 입력해주세요		  (포트폴리오의 전문가소개로 활용됩니다.)" class="valid"></textarea></div>
				
				<div><input type="text" placeholder="우편번호" id="zipcode" name="zipcode" size="7" class="valid addr" readonly="readonly">  
				<input type="button" id="btnZipcode" value="우편번호 검색"></div>
				<div><input type="text" placeholder="주소" id="address1" name="address1" size="60" readonly="readonly" class="addr"> </div>
				<div><input type="text" placeholder="상세주소" id="address2" name="address2" size="60" class="valid addr"></div>
				<div><table id="fileTbl">
					<tr>
						<td>신분증 사본</td>
						<td><input type="file" id="identifi" name="identi" class="valid2" style="display: inline-block;"></td>
					</tr>
					<tr style="margin-top: 10px">
						<td>계좌 사본</td>
						<td><input type="file" id="account" name="account" class="valid2" style="display: inline-block;"></td>
					</tr>
				</table></div> 
			</fieldset>
			<br> 
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
						</tr>
						<tr>
							<td><input type="checkbox" id="chk2" class="chk" value="chk" style="margin-top: 0px;"></td>
							<td class="second"><label for="chk2"> 서비스 약관동의(필수)</label></td>
							<td class="third"><a href="<c:url value='/etc/policy.do'/>" target="_blank">상세보기</a></td>
						</tr>
						<tr>
							<td><input type="checkbox" id="chk3" class="chk" value="chk" style="margin-top: 0px;"></td>
							<td class="second"><label for="chk3"> 개인정보 수집 ·이용에 대한 동의(필수)</label></td>
							<td class="third"><a href="<c:url value='/etc/privatei.do'/>" target="_blank">상세보기</a></td>
						</tr>
					</table>
				</fieldset>
			</div><br> <br>
			<div id="submits">
				<input type="submit" id="memJoin" value="회원가입">
			</div>
		</form>
	</div>
</div>
		
		

<%@ include file="../inc/bottom.jsp"%>