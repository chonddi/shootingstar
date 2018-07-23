<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>faqWrite</title>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">

</script>
</head>
<body>
	<form name="faqWrite" method="post"
	action="<c:url value='/faq/faqWrite.do'/>"
	onsubmit="return send(this)">
	<fieldset>
		<legend>스레드 작성</legend>
		<div>
			<label for="faqTitle">제목</label>
			<input type="text" id="faqTitle" name="faqTitle"/>
		</div>
		<div>
			<label for="category">카테고리</label><br>
			<select id="category" name="category">
				<option value="일반">일반</option>
				<option value="가입/탈퇴">가입/탈퇴</option>
				<option value="계정/로그인/인증">계정/로그인/인증</option>
				<option value="견적요청">견적요청</option>
				<option value="포트폴리오">포트폴리오</option>
				<option value="결제/환불">결제/환불</option>
				<option value="정산">정산</option>
			</select>
		</div>
		<div>
			<label for="faqContent">내용</label><br>
			<textarea id="faqContent" name="faqContent" rows="10" cols="50"></textarea>
		</div>
		<div>
		<input type="submit" value="작성하기"/>
		<input type="button" value="FAQ 목록"
		onclick="location.href='<c:url value="/faq/faqAdmin.do"/>'"/>
		</div>
	</fieldset>
	</form>
	
</body>
</html>