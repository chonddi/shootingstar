<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ include file="../inc/adminTop.jsp"%>
<style type="text/css">
@import
	url('https://fonts.googleapis.com/css?family=Do+Hyeon&subset=korean');

.mytitle{
	font-family: 'Do Hyeon', sans-serif;
	font-weight:lighter;
	font-size: 35px;
}	
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
</style>
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
		
		}
		else if ($('#newPwd').val().length < 8 | $('#newPwd').val().length>15) {
			if($('#newPwd').val()==""){
			bool=true;
			}
			else{
			alert('비밀번호는 8~15자리여야 합니다.');
			$('#newPwd').focus();
			bool = false;
			}
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
	<legend class="mytitle">관리자 정보 수정</legend>
 	<table id='adminEditTable'>
	<tr>
		<td><label for="adminId">관리자ID</label></td>
		<td><span>${vo.adminId }</span></td>
		<td><input type="hidden" name="adminId" id="adminId" value=${vo.adminId }></td>
	</tr>
	<tr>
		<td><label for="adminName">이름</label></td>
		<td><input type="text" name="adminName" id="adminName" value=${vo.adminName }></td>
	</tr>
	<tr>
		<td><label for="newPwd">수정 비밀번호</label></td>
		<td><input type="Password" name="newPwd" id="newPwd" placeholder="8~15자리"></td>
	</tr>
	<tr>
		<td><label for="newPwd2">수정 비밀번호 확인 </label></td>
		<td><input type="Password" name="newPwd2" id="newPwd2"></td>
	</tr>
	<tr>		<td id="comment">(비밀번호를 수정하지 않을 경우 비워두세요)</td></tr>
	</table> 

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
