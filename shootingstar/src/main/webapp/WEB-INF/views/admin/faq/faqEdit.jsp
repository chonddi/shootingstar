<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 faq 수정</title>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('form[name=faqEdit]').submit(function(event){
		if($("#faqTitle").val()==""){
			alert('제목을 입력하세요');
			$("#faqTitle").focus();
			event.preventDefault();
		}else if($("#faqContent").val().length<1){
			alert('내용을 입력하세요');
			$("#faqContent").focus();
			return false;
		}
	});	
	$("#category").val("${vo.category}");
});
</script>
</head>
<body>
	<form name="faqEdit" method="post" 
	action="<c:url value='/admin/faq/faqEdit.do'/>"
	onsubmit="return send(this)">
	
	<input type="hidden" name="faqNo"  value="${param.faqNo}" />
	<div>
			<label for="category">카테고리</label><br>
			<select id="category" name="category" >
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
		<label for="faqTitle">제목</label>
		<input type="text" id="faqTitle" name="faqTitle" value="${vo.faqTitle }">
	</div>
	<div>
	<label for="adminId">아이디</label>
	${vo.adminId }
	</div>
	<div>
		<label for="faqContent">내용</label>
		<textarea name="faqContent" id="faqContent" cols="50" rows="10" >${vo.faqContent}</textarea>
	</div>
	
	<div>
		<input type="submit" value="수정">
		<input type="button" value="취소" onclick="location.href='<c:url value="/admin/faq/faqAll.do"/>'">
	</div>
	</form>
</body>
</html>