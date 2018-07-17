<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
	$(function(){
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
		
		
	});
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
			<input type="text" placeholder="이메일" name="memberId">
		</div>
		<div>
			<input type="text" placeholder="이름" name="name">
		</div>
		<div>
			<input type="text" placeholder="비밀번호" name="pwd">
		</div>
		<div>
			<input type="text" placeholder="비밀번호 확인" name="pwd2">
		</div>
		<div>
			<input type="text" placeholder="휴대폰 번호" name="tel">
		</div>
		<div>
			<input type="radio" id="radio1" name="radioChk" value="1" checked="checked">
			<label for="radio1"> 고객회원</label>
			<input type="radio" id="radio2" name="radioChk" value="2"> 
			<label for="radio2"> 전문가회원</label>
		</div><br>
		<div class="studio" style="display: none;"><textarea name="pr" rows="10" cols="50" placeholder="자기소개"></textarea></div>
		<div class="studio" style="display: none;"><input type="text" placeholder="우편번호" name="zipcode">  <input type="button" id="btnZipcode" value="우편번호 검색"></div>
		<div class="studio" style="display: none;"><input type="text" placeholder="주소" name="address1"> </div>
		<div class="studio" style="display: none;"><input type="text" placeholder="상세주소" name="address2"></div>
		<div class="studio" style="display: none;">신분증 사본 <input type="file" name="identification"></div>
		<div class="studio" style="display: none;">계좌 사본 <input type="file" name="accountCopy"></div>
		<input type="text" name="code" value="1">
		
	</fieldset>
	<br><br>
		<input type="submit" value="회원가입">  <input type="button" id="btn" value="결제">
</form>
</div>
<%@ include file="../inc/bottom.jsp"%>