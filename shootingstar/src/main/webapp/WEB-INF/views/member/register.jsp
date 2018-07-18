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
		
		/* 결제~~~~~~~~~~~~~~~~~~~~복붙용
		$('#btn').click(function(){
			window.open('<c:url value="/member/hpin.do"/>', 'hp', 
			'width=830,height=600,left=400,top=300,location=yes,resizable=yes');
		});// */
		
		//이메일 인증 코드
		$('#codeBtn').click(function(){
			$.ajax({
				url:"<c:url value='/member/code.do' />",
				type:"GET",
				data:{code:$('#inputCode').val()},  //파라미터
				success:function(res){
					if(res==2){
						alert('인증되었습니다.');
						$('#idChk').val('Y');
						$('#memberId').prop('readonly','readonly');
						$("#joincode").css("display", "none");
						$('#idChkBtn').css("display", "none")
						$('#auth').css('display', '');
						$('#name').focus();
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
			
			$('.chk').each(function(idx,item){
				if(!$(this).is(":checked")){
					alert('약관에 동의해주세요.');
					$(this).focus();
					bool=false;  //submit() 이벤트 진행을 막는다
					return false;  //each() 탈출
				}
			})
			if(bool){
				$('.valid').each(function(idx, item){
					if($(this).val().length<1){
						alert($(this).prop("placeholder")+"을/를 입력하세요");
						$(this).focus();
						
						bool=false;  //submit() 이벤트 진행을 막는다
						return false;  //each() 탈출
					}
				});
				if(bool){
					if($('#pwd').val().length<8){
						alert('비밀번호는 8자리 이상입니다.');
						$('#pwd1').focus();
						bool= false;
					}else if($('#pwd').val()!=$('#pwd2').val()){
						alert('비밀번호가 일치하지 않습니다.');
						$('#pwd2').focus();
						bool= false;
					}else if(!validate_phoneno($('#tel').val())){
						alert('휴대폰 번호는 숫자만 가능합니다.');
						$('#tel').focus();
						bool= false;
					}else if($('#idChk').val()!='Y'){
						alert('이메일 인증을 먼저 하세요.');
						$('#idChkBtn').focus();
						bool= false;			
					}
				}
			}
						
			return bool;
		});
		
	});
	
	//이메일 인증 중복확인
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
        xhttp.send('memberId=' + memberId+"&userCode=1");
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
			<input type="text" placeholder="이메일" id="memberId" name="memberId" class="valid">  
			<input type="button" id="idChkBtn" value="이메일 인증" onclick="checkMail()" />
			<span id="auth" style="color:green; font-size:0.9em; display:none;">인증되었습니다</span>
		</div>
		<div id="joincode" style="display: none">
			<input type='number' name="inputCode" id="inputCode" placeholder="인증번호" >   <input type="button" id="codeBtn" value="확인" />
		</div>
		<div>
			<input type="text" placeholder="이름" id="name" name="name" class="valid">
		</div>
		<div>
			<input type="password" placeholder="비밀번호" id="pwd" name="pwd" class="valid"> <span>비밀번호는 8자리 이상</span>
		</div>
		<div>
			<input type="password" placeholder="비밀번호 확인" id="pwd2" name="pwd2" class="valid">
		</div>
		<div>
			<input type="text" placeholder="휴대폰 번호" id="tel" name="tel" class="valid"> <span>(-없이)</span>
		</div>
		
		<input type="text" id="idChk" name="idChk" value="N">
	</fieldset>
	<br><br>
		<input type="submit" id="memJoin" value="회원가입">
</form>
<br><br>
</div>
<%@ include file="../inc/bottom.jsp"%>