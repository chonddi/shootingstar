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
	function thisClose() {
		self.close();
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
    margin-top:55px;
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
			<div class="findPwdDiv">이메일 발송이 완료되었습니다. <br>이메일을 통해 비밀번호를 변경해주세요.</div>
			<div style="text-align: center;"><input type="button" id="memJoin" onclick="thisClose()" value="확인"></div>
	</div>
</body>
</html>

	
</body>
</html>