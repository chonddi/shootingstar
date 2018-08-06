<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../inc/adminTop.jsp"%>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){	
	$('#editSubmit').click(function(){	
	var bool=true;
		if($('#adminName').val()==""){
			alert('이름은 비워둘 수 없습니다');
			bool=false;
		}else if($('#pwd').val()==""){
			alert('현재 비밀번호를 입력해주세요');
			bool=false;
		}else if ($('#newPwd').val().length < 8 | $('#newPwd').val().length>15) {
			alert('비밀번호는 8~15자리여야 합니다.');
			$('#newPwd').focus();
			bool = false;
		}else if($('#newPwd').val()!==$('#newPwd2').val()){
			alert('새로운 비밀번호와 확인이 일치하지 않습니다');
			bool=false;
		}
	return bool;
	});
});

	
</script>
<style type="text/css">
.center{
padding-top:15px}
#comment{
font-size: 10px;
color:gray;
}
</style>
<article>
<div class="divForm">
<form name="frm1" method="post" 
	action="<c:url value='/admin/adminEdit.do'/>">
<fieldset>
	<legend>관리자 정보 수정</legend>
    <div>
        <label for="adminId">관리자ID</label>
        <span>${vo.adminId }</span>
        <input type="hidden" name="adminId" id="adminId" value=${vo.adminId }>
    </div>
    <div>        
        <label for="adminName">이름</label>
		<input type="text" name="adminName" id="adminName" value=${vo.adminName }>
    </div>
    <br>
	<hr>
    <br>
    <div>
        <label for="newPwd">수정 비밀번호</label>
        <input type="Password" name="newPwd" id="newPwd" placeholder="8~15자리">
    </div>
    <div>
        <label for="newPwd2">수정 비밀번호 확인 </label>
        <input type="Password" name="newPwd2" id="newPwd2">
    </div>
    <p id="comment">(비밀번호를 수정하지 않을 경우 비워두세요)</p>
    <br>
	<hr>
    <br>
    <div>
        <label for="pwd">* 비밀번호 확인</label>
        <br>
        <input type="Password" name="pwd" id="pwd">
    </div>
    <div class="center">
         <input type="submit" id="editSubmit" value="수정">
    </div>
</fieldset>
   
        
</form>
</div>
</article>


<%@ include file="../inc/adminBottom.jsp"%>











