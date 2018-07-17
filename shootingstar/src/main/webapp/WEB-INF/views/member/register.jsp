<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
	$(function(){
//		var code = "${session.joinCode}";
		$('#chkAll').click(function(){
			$('.chk').prop('checked', this.checked);
		});
		$('input[name=radioChk]').click(function(){
			if($('#radio1').is(":checked")){
				$('input[name=code]').val('1');
				$('.studio').css('display', 'none');
			}else{
				$('input[name=code]').val('2');
				$('.studio').css('display', 'block');
			}
		});
		/* 결제~~~~~~~~~~~~~~~~~~~~복붙용
		$('#btn').click(function(){
			window.open('<c:url value="/member/hpin.do"/>', 'hp', 
			'width=830,height=600,left=400,top=300,location=yes,resizable=yes');
		});// */
		$('#codeBtn').click(function(){
			$.ajax({
				url:"<c:url value='/member/code.do' />",
				type:"GET",
				data:{code:$('#inputCode').val()},  //파라미터
				success:function(res){
					if(res==2){
						alert('인증되었습니다.');
						$('#idChk').val('Y');
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
				if(!validate_userid($('#userid').val())){
					alert('아이디는 알파벳이나 숫자 또는 특수기호인 _ 만 가능합니다.');
					$('#userid').focus();
					bool= false;
				}else if($('#pwd').val()!=$('#pwd2').val()){
					alert('비밀번호가 일치하지 않습니다.');
					$('#pwd2').focus();
					bool= false;
				}else if(!validate_phoneno($('#hp2').val()) || 
						!validate_phoneno($('#hp3').val())){
					alert('휴대폰 번호는 숫자만 가능합니다.');
					$('#hp2').focus();
					bool= false;
				}else if($('#chkId').val()!='Y'){
					alert('중복확인을 먼저 하세요.');
					$('#btnChkId').focus();
					bool= false;			
				}
			}
			
			return bool;
		});
			
		
	});
	
	 function checkMail() {
        var memberId = document.getElementById("memberId").value;
 
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
        xhttp.open("POST", 'checkMail.do', true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        xhttp.send('memberId=' + memberId);
        return false;
    }
 
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
        xhttp.open("POST", 'sendMail.do', true);
        xhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
        xhttp.send('memberId=' + memberId);
        return false;
    }
       
</script>
<style type="text/css">
.formDiv>div, fieldset>div{
	margin:10px;
}
</style>
<title>회원가입</title>
<div>
<fieldset>
	<legend>이용약관 동의</legend>
	<div>	
		<input type="checkbox" id="chkAll" value="chkAll">
		<label for="chkAll"> 전체동의</label>
	</div>
	<hr>
	<div>
		<input type="checkbox" id="chk1" class="chk" value="chk"> 
		<label for="chk1"> 만 14세 이상입니다.(필수)</label>
	</div>
	<div>
		<input type="checkbox" id="chk2" class="chk" value="chk"> 
		<label for="chk2"> 서비스약관동의(필수)</label>
	</div>
	<div>
		<input type="checkbox" id="chk3" class="chk" value="chk"> 
		<label for="chk3"> 개인정보 수집 ·이용에 대한 동의(필수)</label>
	</div>
	 
</fieldset><br>
<form name="frm" method="post"  action="<c:url value='/member/register.do'/>">
	<fieldset class="formDiv">
		<legend>회원가입</legend>
		<div>
			<input type="text" placeholder="이메일" id="memberId" name="memberId" class="valid">  <input type="button" value="이메일 인증" onclick="checkMail()" />
		</div>
		<div id="joincode" style="display: none">
			<input type='number' name="inputCode" id="inputCode" placeholder="인증번호" >   <input type="button" id="codeBtn" value="확인" />
		</div>
		<div>
			<input type="text" placeholder="이름" name="name" class="valid">
		</div>
		<div>
			<input type="text" placeholder="비밀번호" name="pwd" class="valid">
		</div>
		<div>
			<input type="text" placeholder="비밀번호 확인" name="pwd2" class="valid">
		</div>
		<div>
			<input type="text" placeholder="휴대폰 번호" name="tel" class="valid"> <span>(-없이)</span>
		</div>
		<div>
			<input type="radio" id="radio1" name="radioChk" value="1" checked="checked">
			<label for="radio1"> 고객회원</label>
			<input type="radio" id="radio2" name="radioChk" value="2"> 
			<label for="radio2"> 전문가회원</label>
		</div><br>
		<div class="studio" style="display: none;"><textarea name="pr" rows="10" cols="50" placeholder="자기소개" class="valid2"></textarea></div>
		<div class="studio" style="display: none;"><input type="text" placeholder="우편번호" name="zipcode" class="valid2">  <input type="button" id="btnZipcode" value="우편번호 검색"></div>
		<div class="studio" style="display: none;"><input type="text" placeholder="주소" name="address1"> </div>
		<div class="studio" style="display: none;"><input type="text" placeholder="상세주소" name="address2" class="valid2"></div>
		<div class="studio" style="display: none;">신분증 사본 <input type="file" name="identification" class="valid2"></div>
		<div class="studio" style="display: none;">계좌 사본 <input type="file" name="accountCopy" class="valid2"></div>
		<input type="text" name="userCode" value="1">
		<input type="text" id="idChk" name="idChk" value="N">
		
	</fieldset>
	<br><br>
		<input type="submit" id="" value="회원가입">  <input type="button" id="btn" value="결제">
</form>
</div>
<%@ include file="../inc/bottom.jsp"%>