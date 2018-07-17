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
	function send(form){
		if(form.title.value=""){
			alert("제목을 입력하세요");
			form.title.focus();
			return false();
		}else if(!form.content.value){
			alert("내용을 입력하세요");
			form.title.focus();
			return false();
		}
	}
</script>
</head>
<body>
	<form name="noticeWrite" method="post"
	action="<c:url value='/notice/noticeWrite.do'/>"
	onsubmit="return send(this)">
	
	
	<div>
		<label for="title">제목</label>
		<input type="text" id="title" name="title">
	</div>
	<div>
	<label for="adminId">아이디</label>
	
	</div>
	<div>
		<label for="content">내용</label>
		<textarea cols="50" rows="10"></textarea>
	</div>
	
	<div>
		<input type="submit" value="작성">
		<input type="button" value="취소" onclick="location.href='<c:url value="/notice/noticeAdmin.do"/>'">
	</div>
	</form>
</body>
</html>