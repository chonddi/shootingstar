<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 공지사항 수정</title>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('form[name=noticeEdit]').submit(function(event){
		if($("#nTitle").val()==""){
			alert('제목을 입력하세요');
			$("#nTitle").focus();
			event.preventDefault();
		}else if($("#nContent").val().length<1){
			alert('내용을 입력하세요');
			$("#nContent").focus();
			return false;
		}
	});	
});
</script>
</head>
<body>
	<form name="noticeEdit" method="post" 
	action="<c:url value='/notice/noticeEdit.do'/>"
	onsubmit="return send(this)">
	
	<input type="hidden" name="nNo"  value="${param.nNo}" />
	
	<div>
		<label for="title">제목</label>
		<input type="text" id="nTitle" name="nTitle" value="${vo.nTitle }">
	</div>
	<div>
	<label for="adminId">아이디</label>
	${vo.adminId }
	</div>
	<div>
		<label for="nContent">내용</label>
		<textarea name="nContent" id="nContent" cols="50" rows="10" >${vo.nContent}</textarea>
	</div>
	
	<div>
		<input type="submit" value="수정">
		<input type="button" value="취소" onclick="location.href='<c:url value="/notice/noticeAdmin.do"/>'">
	</div>
	</form>
</body>
</html>