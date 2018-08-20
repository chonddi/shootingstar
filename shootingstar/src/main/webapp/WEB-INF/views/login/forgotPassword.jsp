<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
<link rel="stylesheet" href="<c:url value='/css/register.css'/>">
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript">
//이메일 인증 중복확인
function checkMail() {
	var memberId = document.getElementById("memberId").value;
	var userCode =  document.getElementById("userCode").value;
	if (memberId == "") {
		alert("메일을 입력해 주세요.")
		return false;
	}

	$.ajax({
		url : "<c:url value='/member/checkMail.do' />",
		type : "POST",
		data :'memberId=' + memberId + '&userCode='+userCode
		, //파라미터
		success : function(res) {
			if (res == "noId") {
				alert("가입하지 않은 아이디 입니다.");
				$('#memberId').focus();
			} else {
				sendToken(memberId, userCode);
			}
		},
		error : function(xhr, status, error) {
			alert('error:' + error + ", status: " + status)
		}

	});
}

//이메일 인증 메일 발송
function sendToken(memberId, userCode) {
	$.ajax({
		url : "<c:url value='/member/sendToken.do' />",
		type : "POST",
		data :'memberId=' + memberId + '&userCode='+userCode
		, //파라미터
		success : function(res) {
			if (res == true) {
				document.location.href="<c:url value='/login/forgotPasswordChk.do'/>";
			} else {
				alert("올바른 메일 형식이 아닙니다.");
			}
		},
		error : function(xhr, status, error) {
			alert('error:' + error + ", status: " + status)
		}

	});
	
}
</script>
<style type="text/css">
.h1{
	font-size:1.5em;
	background-color: rgba(30, 30, 30, 1);
	color:white;
	padding: 10px;
}
.findPwdDiv{
    font-weight: bold;
    margin-bottom: 20px;
    text-align: center;
    letter-spacing: -.5px;
}
#memJoin{
	width: 365px;
	background: #0e4699;
	margin-top:45px;
	font-weight: bold;
}
</style>
</head>
<body>
	<div style="width: 400px; margin:0 auto;">
		<h1 class="h1">비밀번호 찾기</h1>
			<div class="findPwdDiv">가입한 이메일로 비밀번호 변경 방법을 전달드립니다</div>
		<div class="findPwdDiv">
			<input type="text" placeholder="이메일" id="memberId" name="memberId"
				class="valid" size="48"><br>
			<input type="hidden" id="userCode" value="${param.userCode}">
			<input type="button" id="memJoin" value="확인" onclick="checkMail()" />
		</div>
	</div>
</body>
</html>