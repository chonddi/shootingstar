<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="mypageTop.jsp"%>

<style type="text/css">
#title{
	font-size:1.5em;
	margin-bottom: 40px;
}
#editTable tr>td:first-child {
	text-align: right;
	padding-bottom:20px;
}
#editTable tr>td:last-child {
	padding-left:20px;
}
</style>
<script type="text/javascript">
	$(function(){
		/* 유효성 */
		$('#editFrm').click(function(){
			var bool=true;
			$('.val').each(function(){
				if($(this).val()==''){
					alert($(this).parent().parent().find('td').eq(0).text()+"를 입력해주세요");
					$(this).focus();
					bool=false;
					return false;
				}
			});
			return bool;
		});
		
		$('#outBtn').click(function(){
			if(confirm('탈퇴하시겠습니까?')){
				location.href="<c:url value='/mypage/del.do'/>";
			}
		});
	});
</script>
<div id="title">
	<h1>회원정보 수정</h1>
</div>
	<form method="post" action="<c:url value='/mypage/memberEdit.do'/>">
		<table id="editTable">
			<tr>
				<td>아이디</td>
				<td>${memberVo.memberId }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>${memberVo.name}</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" class="val"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="tel" value="${memberVo.tel}" class="val"></td>
			</tr>
		</table>
		<br>
		<div style="text-align: center;">
			<input type="submit" id="editFrm" value="수정"> <input type="button" id="outBtn" value="회원탈퇴">
		</div>
	</form>
	</div>
</div>
</div>
<%@ include file="../inc/bottom.jsp"%>