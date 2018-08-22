<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 공지사항 작성</title>
<script type="text/javascript" src="<c:url value='/js/jquery-3.3.1.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#submit').click(function(event){
		if($("#nTitle").val()==""){
			alert('제목을 입력하세요');
			$("#nTitle").focus();
			event.preventDefault();
		}else if($("#nContent").val().length<1){
			alert('내용을 입력하세요');
			$("#nContent").focus();
			return false;
		}else if($("#nTitle").val().length > 60){
			alert("제목은 60자까지만 가능합니다.");
			$("#nTitle").focus();
			return false;
		}
	});	
});
</script>
</head>
<body>
	<form name="noticeWrite" method="post"
	action="<c:url value='/admin/notice/noticeWrite.do'/>"
	onsubmit="return send(this)">
	
	
	<div>
		<label for="nTitle">제목</label>
		<input type="text" id="nTitle" name="nTitle">
	</div>
 	<div>
	<input type="hidden" id="adminId" name="adminId" value='${adminId }'>
	</div> 
	<div>
		<label for="nContent">내용</label>
		<textarea id="nContent" name="nContent" cols="50" rows="10"></textarea>
	</div>
	
	<div>
		<input type="submit" id="submit" value="작성">
		<input type="button" value="취소" onclick="location.href='<c:url value="/admin/notice/noticeAdmin.do"/>'">
	</div>
	</form>
</body>
</html>