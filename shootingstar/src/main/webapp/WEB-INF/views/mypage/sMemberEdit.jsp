<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mypageTop.jsp"%>
    
<script type="text/javascript">
	$(function(){
		/* 유효성 */
		$('#editSbm').click(function(){
			var bool = true;
			$('.valid').each(function(idx, item) {
				if($(this).val().length < 1) {
					alert($(this).parent().prev().html() + "를 입력하세요");
					$(this).focus();
	
					bool = false; //submit() 이벤트 진행을 막는다
					return false; //each() 탈출
				}
			});
			return bool;
		});
		
		$('#changeBtn').click(function(){
			var bool=true;
			if($('#oldPwd').val().length<1){
				alert('현재 비밀번호를 입력해주세요');
				$('#oldPwd').focus();
				bool=false;
			}else if ($('#sPwd').val().length < 8 | $('#sPwd').val().length>15) {
				alert('비밀번호는 8~15자리 입니다.');
				$('#sPwd').focus();
				bool = false;
			} else if ($('#sPwd').val() != $('#sPwd2').val()) {
				alert('새 비밀번호가 일치하지 않습니다.');
				$('#sPwd2').focus();
				bool = false;
			}
			return bool;
		});
		
		$('#outBtn').click(function(){
			if(confirm('탈퇴하시겠습니까?')){
				location.href="<c:url value='/mypage/del.do'/>";
			}
		});
	});
</script>
<style type="text/css">
#title{
	font-size:1.5em;
	margin-bottom: 40px;
}
#edit{
	color:#1f1f1f;
	font-weight:700;
	border-bottom:3px solid #e46c0a;
}
.selectedPage{
	width:40%;
}
.selectName{
	width:40%;
}
#editTable{
	margin: 0 auto;
}
#editTable tr>td:first-child{
	font-weight: bold;
}
#editTable tr>td:last-child{
	padding-bottom: 20px;
	padding-left: 30px;
}
#changePwd div{
	text-align: center;
	margin-top:15px;
}
.btns{
	border: none;
	height: 32px;
	width: 85px;
	background: #345f93;
	color:white;
	border-radius:2px;
}
.outBtnDiv{
	text-align:center;
	margin-top:20px;
}
.outBtn{
	border:1px solid #d81d1a;
	background: white;
	color:#d81d1a;
	border-radius:2px;
}
.outBtn:hover{
	background: #d81d1a;
	color:white;
	font-weight: bold;
}
.spanFont{
	font-size: 0.9em;
}
</style>
			회원정보 수정
	</div>
	<div class="selectedPage">
		<form name="frm" id="editFrm" method="post"
				action="<c:url value='/mypage/sMemberEdit.do'/>" enctype="multipart/form-data">
			<table id="editTable">
				<tr>
					<td>아이디</td>
					<td style="padding-top: 20px;">${sessionScope.sMemberId }</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>${sMemberVo.sName }</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="sPwd" class="valid"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="sTel" class="valid" value="${sMemberVo.sTel }"></td>
				</tr>
				<tr>
					<td>자기소개</td>
					<td><textarea name="pr" rows="10" cols="45" placeholder="회원님의 소개를 간략하게 입력해주세요" class="valid">${sMemberVo.pr }</textarea></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" placeholder="우편번호" id="zipcode" name="zipcode" size="7" class="valid addr" readonly="readonly" value="${sMemberVo.zipcode }"> <input type="button" id="btnZipcode" value="우편번호 검색"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" placeholder="주소" id="address1" name="address1" size="60" readonly="readonly" class="addr" value="${sMemberVo.address1 }"></td>
				</tr>
				<tr>
					<td>상세주소</td>
					<td><input type="text" placeholder="상세주소" id="address2" name="address2" size="60" class="valid addr" value="${sMemberVo.address2}"></td>
				</tr>
				<tr>
					<td>신분증 사본</td>
					<td style="padding-bottom: 10px;"><input type="file" id="identifi" name="identi" class="valid2">
						<c:set var="cut" value="${fn:indexOf(sMemberVo.identification,'.')}"/>
						<c:set var="identi" value="${fn:substring(sMemberVo.identification,0,cut-17)}" />
						<c:set var="ext" value="${fn:substringAfter(sMemberVo.identification,'.')}" />
						<span class="spanFont"> 기존 파일명: ${identi}.${ext}</span>
						<input type="hidden" name="oldIdenti" value="${sMemberVo.identification}">
					</td>
				</tr>
				<tr>
					<td>계좌사본</td>
					<td style="padding-bottom: 10px;"><input type="file" id="account" name="account" class="valid2">
						<c:set var="cut" value="${fn:indexOf(sMemberVo.accountCopy,'.')}"/>
						<c:set var="ant" value="${fn:substring(sMemberVo.accountCopy,0,cut-17)}" />
						<c:set var="ext" value="${fn:substringAfter(sMemberVo.accountCopy,'.')}" />
						<span class="spanFont"> 기존 파일명: ${ant}.${ext}</span>
						<input type="hidden" name="oldAnt" value="${sMemberVo.accountCopy}">
					</td>
				</tr>
			</table><br>
			<div style="text-align: center;">
			<input type="submit" id="editSbm" class="btns" value="수정하기">
			</div>
		</form>
	</div>
	<div class="selectName">비밀번호 변경</div>
	<div class="selectedPage">
		<form method="post" id="changePwd" action="<c:url value='/mypage/passwordEdit.do'/>">
			<div><input type="password" id="oldPwd" placeholder="현재 비밀번호"> </div>
			<div><input type="password" id="sPwd" placeholder="새 비밀번호 (8~15자리)"></div>
			<div><input type="password" id="sPwd2" placeholder="새 비밀번호 확인"></div>
			<div><input type="submit" id="changeBtn" class="btns" value="변경하기"></div>
		</form>
	</div>
	<div class="outBtnDiv"><input type="button" id="outBtn" class="btns outBtn" value="탈퇴하기"></div>
</div>
<%@ include file="../inc/bottom.jsp"%>
