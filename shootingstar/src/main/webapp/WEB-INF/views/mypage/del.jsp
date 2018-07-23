<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../inc/top.jsp"%>

<script type="text/javascript">
	$(function(){
		$('#cancel').click(function(){
			location.href="<c:url value='/mypage/memberEdit.do'/>"
		});
	});
</script>
<style type="text/css">
#frmDiv{
	margin:0 auto;
	text-align: center;
	margin-bottom: 200px;
	padding-top:50px;
}
</style>
<div id="delDiv">
	<form method="post" action="<c:url value='/mypage/del.do'/>">
		<div id="frmDiv"><span style="font-weight: bold">비밀번호 확인</span>  &nbsp;<input type="password" name="chkPwd" size="10">
		<br><br><br>
		<input type="submit" id="pwd" value="탈퇴"> <input type="button" id="cancel" value="취소">	
		</div>
	</form>
</div>

<%@ include file="../inc/bottom.jsp"%>