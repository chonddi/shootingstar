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
.outBtnDiv{
	/* text-align:center; */
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
.memberList{
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
/* 		
		$('#outBtn').click(function(){
			if(confirm('탈퇴하시겠습니까?')){
				location.href="<c:url value='/admin/member/del.do'/>";
			}
		});  */
	});
</script>
<div class="memberList">
		<h1>고객회원 정보 수정</h1>
	<div class="selectedPage">
		<form name="frm" id="editFrm" method="post"
				action="<c:url value='/admin/member/memberEdit.do'/>">
			<table id="editTable">

				<tr>
					<td>아이디</td>
					<td>${memberVo.memberId }<input type="hidden" name="memberId" value="${memberVo.memberId }"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" class="valid" value="${memberVo.name }"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td>${memberVo.pwd }</td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="tel" class="valid" value="${memberVo.tel }"></td>
				</tr>
				<tr>
					<td>마일리지</td>
					<td><input type="text" name="mileage" class="valid" value="${memberVo.mileage }"></td>
				</tr>
				<tr>
					<td>가입일</td>
					<td>${memberVo.regdate }</td>
				</tr>
				<tr>
					<td>탈퇴일</td>
					<td>${memberVo.outdate }</td>
				</tr>
			</table><br>
			<div style="text-align: center;">
			<input type="submit" id="editSbm" class="btns" value="수정하기">
			</div>
		</form>
	</div>
	<div class="selectName">비밀번호 변경</div>
	<div class="selectedPage">
		<form method="post" id="changePwd" action="<c:url value='/admin/member/pwdEdit.do'/>">
			<div><input type="text" id="pwd" name="pwd" placeholder="새 비밀번호 (8~15자리)"></div>
			<div><input type="hidden" name="memberId" value="${memberVo.memberId }"></div>
			<div><input type="text" id="pwd2" placeholder="새 비밀번호 확인"></div>
			<div><input type="submit" id="changeBtn" class="btns" value="변경하기"></div>
		</form>
	</div>
</div>

<%@ include file="../../inc/bottom.jsp"%>