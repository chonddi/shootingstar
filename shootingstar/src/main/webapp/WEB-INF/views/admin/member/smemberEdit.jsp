<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../../inc/adminTop.jsp"%>

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
.smemberList{
width:1200px;
margin: 50px auto;
}
</style>
<script type="text/javascript">
	$(function(){
		/* 유효성 */
	$('#editSbm').click(function(){
			var bool = true;
			$('.valid').each(function(idx, item) {
				if($(this).val().length < 1) {
					alert($(this).parent().prev().html() + "는 비워들 수 없습니다");
					$(this).focus();

					bool = false; 
					return false; 
				}
			});
			return bool;
			
		});
	
		$('#changeBtn').click(function(){
			var bool=true;
			if ($('#pwd').val().length < 8 | $('#pwd').val().length>15) {
				alert('비밀번호는 8~15자리 입니다.');
				$('#pwd').focus();
				bool = false;
			} else if ($('#pwd').val() != $('#pwd2').val()) {
				alert('새 비밀번호가 일치하지 않습니다.');
				$('#pwd2').focus();
				bool = false;
			}
			return bool;
		});

	});
</script>
<div class="smemberList">
		<h1>전문가회원 정보 수정</h1>

	<div class="selectedPage">
		<form name="frm" id="editFrm" method="post"
				action="<c:url value='/admin/member/smemberEdit.do'/>">
			<table id="editTable">

				<tr>
					<td>아이디</td>
					<td>${smemberVo.sMemberId }<input type="hidden" name="sMemberId" value="${smemberVo.sMemberId }"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="sName" class="valid" value="${smemberVo.sName }"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>${smemberVo.sPwd }</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="sTel" class="valid" value="${smemberVo.sTel }"></td>
				</tr>
				<tr>
					<td>자기소개</td>
					<td><textarea name="pr" rows="10" cols="45" class="valid">${smemberVo.pr }</textarea></td>
				</tr>
				<tr>
					<td>우편번호</td>
					<td><input type="text" id="zipcode" name="zipcode" size="7" class="valid addr"  value="${smemberVo.zipcode }" >  
					<input type="button" id="btnZipcode" value="우편번호검색"></td>
				</tr>
				<tr>
				<td>주소</td>
				<td>
				<input type="text" id="address1" name="address1"  class="addr"  value="${smemberVo.address1 }">
				</td>
				</tr>
				<tr>
				<td>상세주소</td>
				<td>
				<input type="text" id="address2" name="address2"  class="valid addr" value="${smemberVo.address2 }">
				</td>
				</tr>

				<tr>
					<td>가입일</td>
					<td>${smemberVo.regdate }</td>
				</tr>
				<tr>
					<td>탈퇴일</td>
					<td>${smemberVo.outdate }</td>
				</tr>
		</table><br>
			<div style="text-align: center;">
			<input type="submit" id="editSbm" class="btns" value="수정하기">
			</div>
		</form>

	<div class="selectName">비밀번호 변경</div>
	<div class="selectedPage">
		<form method="post" id="changePwd" action="<c:url value='/admin/member/pwdSEdit.do'/>">
			<div><input type="text" id="pwd" name="pwd" placeholder="새 비밀번호 (8~15자리)"></div>
			<div><input type="hidden" name="sMemberId" value="${smemberVo.sMemberId }"></div>
			<div><input type="text" id="pwd2" placeholder="새 비밀번호 확인"></div>
			<div><input type="submit" id="changeBtn" class="btns" value="변경하기"></div>
		</form>
	</div>
</div>
</div>
<%@ include file="../../inc/bottom.jsp"%>